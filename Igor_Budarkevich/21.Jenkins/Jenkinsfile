pipeline {
	environment {
		registry = "budarkevichigor/build_docker"
		registryCredential = 'dockerhub'
    }
    agent {label 'master'}
    stages {
		stage('Cloning Git') {
			steps {
				git url: 'https://github.com/igortank/build-docker.git', branch: 'main'
				sh 'ls -l'
			}
		}
		stage ("Lint dockerfile") {
			agent {
				docker {
					image 'hadolint/hadolint:latest-debian'
					label 'master'
				}
			}
			steps {
				sh 'hadolint Dockerfile | tee -a hadolint_lint.txt'
			}
			post {
				always {
					archiveArtifacts 'hadolint_lint.txt'
				}
			}
		}
		stage('Building image') {
			steps{ 
				script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER" , "."
					//dockerImage = docker.build registry + ":$BUILD_NUMBER" , "--network host ."
				}
			}
		}
		stage('Test image') {
			steps{
				sh "docker run -d -p 8081:8080 --name image-$BUILD_NUMBER -t $registry:$BUILD_NUMBER"
				sh" sed -i 's/latest/$BUILD_NUMBER/' deploy.yaml"
				sh "sleep 5"
				sh 'curl http://localhost:8081'
				sh "docker kill image-$BUILD_NUMBER"
			}
		}
		stage('Push Image to repo') {
			steps{
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
		stage('Remove Unused docker image') {
			steps{
				sh "docker rmi $registry:$BUILD_NUMBER"
			}
		}
		stage('Deploy in pre-prod') {
			steps{
			    withKubeConfig([credentialsId: 'kubeconfig']) {
				    sh "kubectl get pods --namespace=pre-prod"
				    sh "kubectl apply -f deploy.yaml --namespace=pre-prod"
				    sleep 4
				    sh "kubectl get pods --namespace=pre-prod"
			    }
			}
		}
		stage('Deploy in prod') {
			steps{
				script {
					catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
						def depl = true
						try{
							input("Deploy in prod?")
						}
						catch(err){
							depl = false
						}
						try{
							if(depl){
							    withKubeConfig([credentialsId: 'kubeconfig']) {
								    sh "kubectl apply -f deploy.yaml --namespace=prod"
								    sleep 4
								    sh "kubectl get pods --namespace=prod"
								    sh "kubectl delete -f deploy.yaml --namespace=pre-prod"
							    }
							}
						}
						catch(Exception err){
							error "Deployment failed"
						}
					}
				}
			}
		}
	}
	post {
		success {
			slackSend (color: '#00FF00', message: "\1 Deployment was successfuly done:\1 \n\n Job name --> ${env.JOB_NAME} \n Build number --> ${env.BUILD_NUMBER}    (${env.BUILD_URL})")
		}
		failure {
			slackSend (color: '#FF0000', message: "Deployment was failed: \n\n Job name --> ${env.JOB_NAME} \n Build number --> ${env.BUILD_NUMBER}    (${env.BUILD_URL})")
		}
	}
}