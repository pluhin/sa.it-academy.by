For next need to install jenkins plugin https://plugins.jenkins.io/docker-workflow/
```groovy
pipeline {
    agent none
    stages {
        stage('Test curl') {
            agent {
                docker { 
                    image 'jfrog.it-academy.by/public/curl:spishchyk' 
                    args "--network=host"
                }
            }
            steps {
                sh """#!/bin/sh
                curl --version
                wget -O - https://onliner.by | egrep "https://[0-9a-z]+[.]onliner[.]by" -o | sort -u > tmp.out
                cat tmp.out
                curl \$(cat tmp.out) -I | egrep HTTP
                """
            }
        }
    }
}
```

```groovy
pipeline {
  environment {
    //registry = "pluhin31/test"
    //registryCredential = 'dockerhub'
    registry = "jfrog.it-academy.by/public/test"
    registryCredential = 'jfrog-sa'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/pluhin/test_build.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER" , "--network host ."
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
//          docker.withRegistry( '', registryCredential ) {
          docker.withRegistry( 'https://jfrog.it-academy.by/', registryCredential ) {
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
```
## Build scripted pipeline

https://github.com/pluhin/build_sa

## Build parallel

https://github.com/pluhin/docker_multi

