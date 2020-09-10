pipeline {
  environment {
    registry = "rysnik/build_test"
    registryCredential = 'dockerhub_id'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/RysnikM/build_test.git'
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
        sh "docker rmi -f $registry:$BUILD_NUMBER"
      }
    }
  }
}