pipeline {
  environment {
    registry = "pluhin31/temp_sa"
    registryCredential = 'dockerhub'
  }
  agent { label 'master'}
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/pluhin/build_sa.git'
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