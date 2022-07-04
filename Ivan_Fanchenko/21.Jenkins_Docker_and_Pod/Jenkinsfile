def stagestatus = [:]

pipeline {
  environment {
    imagename = "voyager1122/jks21"
    registry = "registry.hub.docker.com"
  }
  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/voyager1122/09.Docker.git', branch:'main'
      }
    }
    
    stage("Test Dockerfile with linter") {
      steps {
        script {
          try {
          echo "Linting Dockerfile..."
          sh 'hadolint --ignore DL3018 --ignore DL3013 --ignore DL3019 --ignore DL4003 Dockerfile > lint_report.txt'
          archiveArtifacts artifacts: 'lint_report.txt'
          } catch (Exception err) {
            stagestatus.dockerfile_lint = "Linting failure"
            error "Something wrong with Dockerfile"
          }
        }
      }
    }

    stage("Build image") {
      steps {
        script {
          try {
            myapp = docker.build("$imagename:latest")
            stagestatus.Docker_BUILD = "Success"
          } catch (Exception err) {
            stagestatus.Docker_BUILD = "Failure"
            error "Docker image build failure"
          }
        }
      }
    }

    stage('Test image') {
          when { expression { stagestatus.find{ it.key == "Docker_BUILD" }?.value == "Success" } }
          steps {
            script {
              myapp.inside ("--entrypoint=''"){sh './test.sh > image.log'}
              archiveArtifacts artifacts: 'image.log'
              catchError (buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                try {
                  sh 'grep Company image.log'
                  stagestatus.Docker_TEST = "Success"
                } catch (Exception err) {
                  stagestatus.Docker_TEST = "Failure"
                  error "Image test failed"
                }
              }
            }
          }
        }


    stage("Push image") {
      when { expression { stagestatus.find{ it.key == "Docker_TEST" }?.value == "Success" } }
      steps {
        script {
          catchError (buildResult: 'SUCCESS', stageResult: 'FAILURE') {
            try {
              docker.withRegistry('', 'docker_hub') {
              myapp.push("latest")
              }
              stagestatus.Docker_PUSH = "Success"
            } catch (Exception err) {
              stagestatus.Docker_PUSH = "Failure"
              error "Image pushing error"
              }
          }
        }
      }
    }
    
    
    
    stage('Deploy in pre-prod') {
        when { 
          allOf {
            expression { stagestatus.find{ it.key == "Docker_PUSH" }?.value == "Success" }
          }
        }  
        steps {
          script {
            catchError (buildResult: 'SUCCESS', stageResult: 'FAILURE') {
              try { 
                  sh "kubectl apply -f ./jks21.yaml --namespace=pre-prod"
              sleep 5
              timeout(3) {
                waitUntil {
                  script {
                    def status = sh(returnStdout: true, script: "kubectl get pods --namespace pre-prod --no-headers -o custom-columns=':status.phase'")
                    if ( status =~ "Running") { return true }
                    else { return false }
                  }
                }
              }    
              stagestatus.pre_prod = "Success"                
              } catch (Exception err) {
                stagestatus.pre_prod = "Failure"
                error "Deployment failed"
              }
            }
          }
        }
      }
      
    stage('Deploy in Prod') {
        when { 
          allOf {
            expression { stagestatus.find{ it.key == "pre_prod" }?.value == "Success" }
          }
        }
        steps {
          script {
            catchError (buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                  def proceed = true
                  try { 
		                input('Continue to Deploy in PROD?') 
                  } 
                  catch (err) { 
                    proceed = false 
                  }  
              try {
                if(proceed) {
                println "===== Start deploy in PROD ====="
                sh "kubectl apply -f ./jks21.yaml --namespace=prod"
                sleep 5
                timeout(3) {
                  waitUntil {
                    script {
                      def status = sh(returnStdout: true, script: "kubectl get pods --namespace prod --no-headers -o custom-columns=':status.phase'")
                      if ( status =~ "Running") { return true }
                      else { return false }
                    }
                  }
                }
                sh "kubectl delete -f ./jks21.yaml --namespace=pre-prod"
              }
              else {println "==== Deploy in prod aborted ===="}
              stagestatus.Deploy = "Success"               
              } catch (Exception err) {
                stagestatus.Deploy = "Failure"
                error "Deployment failed"
              }
            }
          }
        }
      }
      

  }
  
    post {
            success {
                slackSend (color: '#00FF00', message: "Deployment success: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'")
            }
            failure {
                slackSend (color: '#FF0000', message: "Deployment failed: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'")
            }
    }  
  
}