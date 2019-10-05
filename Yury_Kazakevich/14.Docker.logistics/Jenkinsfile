pipeline {
  environment {
    registry = "wh1test/test-1"
    registryCredential = 'github1-wh1test'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/wh1test/docker1.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
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
  }
}

