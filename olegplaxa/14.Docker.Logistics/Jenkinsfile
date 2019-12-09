pipeline {
  environment {
    registry = 'olegarh/docker'
    registryCredential = 'Dockerhub'
  }
  parameters {
        string(name: 'repository_branch', defaultValue: 'docker', description: 'Docker branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:OlegPlaxa/github_repository.git', description: 'Github repository url')
    }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: "${params.repository_branch}", url: "${params.repository_url}"
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
    /* stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    } */
  }
}