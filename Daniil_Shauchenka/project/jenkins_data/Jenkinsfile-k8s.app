def telegram

pipeline {
    agent any

    environment {
        IMAGE_NAME = "192.168.200.121:5000/leasing-app"
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {

        stage('Start') {
            steps {
                script {
                    telegram = load 'jenkins/telegram.groovy'
                    withBuildUser {
                        telegram.notifyStart(env.BUILD_USER)
                    }
                }
            }
        }

        stage('Check Kubernetes access') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    sh '''
                      export KUBECONFIG=$KUBECONFIG
                      kubectl get nodes
                    '''
                }
            }
        }

        stage('Build app') {
            steps {
                sh '''
                  chmod +x gradlew
                  ./gradlew clean :modules:web:bootJar --no-daemon
                '''
            }
        }

        stage('Run unit tests') {
            steps {
                sh '''
                  echo "== Running unit tests =="
                  chmod +x gradlew
                  ./gradlew test --no-daemon
                '''
            }
            post {
                always {
                    junit '**/build/test-results/test/*.xml'
                }
            }
        }

        stage('Build & Push image') {
            steps {
                sh '''
                  docker build -t leasing-app:${IMAGE_TAG} .
                  docker tag leasing-app:${IMAGE_TAG} ${IMAGE_NAME}:${IMAGE_TAG}
                  docker push ${IMAGE_NAME}:${IMAGE_TAG}
                '''
            }
        }

        stage('Detect active color') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    script {
                        def active = sh(
                            script: '''
                              export KUBECONFIG=$KUBECONFIG
                              kubectl get svc leasing-app -n leasing-test \
                                -o jsonpath='{.spec.selector.color}'
                            ''',
                            returnStdout: true
                        ).trim()

                        env.ACTIVE_COLOR = active
                        env.INACTIVE_COLOR = (active == 'blue') ? 'green' : 'blue'

                        echo "ACTIVE_COLOR=${env.ACTIVE_COLOR}"
                        echo "INACTIVE_COLOR=${env.INACTIVE_COLOR}"
                    }
                }
            }
        }

        stage('Deploy inactive color') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    sh '''
                      export KUBECONFIG=$KUBECONFIG

                      echo "Deploying ${INACTIVE_COLOR} with image ${IMAGE_TAG}"

                      kubectl set image deployment/leasing-app-${INACTIVE_COLOR} \
                        leasing-app=${IMAGE_NAME}:${IMAGE_TAG} \
                        -n leasing-test

                      kubectl rollout status deployment/leasing-app-${INACTIVE_COLOR} \
                        -n leasing-test
                    '''
                }
            }
        }




        stage('Health check inactive') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    sh '''

                      export KUBECONFIG=$KUBECONFIG
                      echo "Health check ${INACTIVE_COLOR}"


                        for i in $(seq 1 10); do
                          POD=$(kubectl get pods -n leasing-test \
                            -l app=leasing-app,color=green \
                            --sort-by=.status.startTime \
                            -o jsonpath='{.items[-1].metadata.name}')

                          echo "Checking pod: $POD"

                          if kubectl exec -n leasing-test "$POD" -- \
                               curl -sf http://127.0.0.1:8080/actuator/health; then
                            echo "Health OK"
                            exit 0
                          fi

                          sleep 5
                        done

                        echo "Health FAILED"
                        exit 1
                    '''
                }
            }
        }


        stage('Switch traffic') {
            steps {
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    sh """
                      export KUBECONFIG=$KUBECONFIG

                      echo "Switching traffic to ${INACTIVE_COLOR}"

                      kubectl patch svc leasing-app -n leasing-test \
                        -p '{\"spec\":{\"selector\":{\"app\":\"leasing-app\",\"color\":\"${INACTIVE_COLOR}\"}}}'
                    """
                }
            }
        }
    }

        post {
            success {
                script {
                    telegram.deleteStartMessage()
                    withBuildUser {
                        telegram.notifyFinish("✅ SUCCESS", env.BUILD_USER, currentBuild.duration)
                    }
                }
            }
            failure {
                script {
                    telegram.deleteStartMessage()
                    withBuildUser {
                        telegram.notifyFinish("❌ FAILURE", env.BUILD_USER, currentBuild.duration)
                    }
                }
                withCredentials([file(credentialsId: 'kubeconfig-test', variable: 'KUBECONFIG')]) {
                    sh """
                      export KUBECONFIG=$KUBECONFIG
                      echo "ROLLBACK to ${ACTIVE_COLOR}"

                      kubectl patch svc leasing-app -n leasing-test \
                        -p '{\"spec\":{\"selector\":{\"app\":\"leasing-app\",\"color\":\"${ACTIVE_COLOR}\"}}}'
                    """
                }
            }
        }



}
