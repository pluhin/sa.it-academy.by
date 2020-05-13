pipeline {
    environment {
        registry = "ppavlov28/py_test"
        registryCredential = 'a7b649f1-4558-47ec-b8dd-37dba9bfe362'
    }
    agent {label 'master'}
    stages {
        stage('Clone Git Repo') {
            steps {
                git credentialsId: 'b2922652-0478-4a1d-8072-7083a8ef79f8', url: 'https://github.com/ppavlov28/13.docker'
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy image') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Remove docker image') {
            steps {
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}