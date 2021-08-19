## Jenkins + Docker

https://plugins.jenkins.io/docker-plugin/

``bash
docker build -t jfrog.it-academy.by/public/curl:spishchyk --network=host .
```

```Dockerfile 
FROM openjdk:8-alpine
RUN apk update && apk add curl bash --no-cache && rm -f /var/cache/apk/*
```
---

For next need to install https://plugins.jenkins.io/docker-workflow/

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

## Build image

```groovy
pipeline {
  environment {
    registry = "pluhin31/test"
    registryCredential = 'dockerhub'
    // registry = "jfrog.it-academy.by/public/curl"
    // registryCredential = 'jfrog-it'
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
          docker.withRegistry( '', registryCredential ) {
//          docker.withRegistry( 'https://jfrog.it-academy.by/', registryCredential ) {

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

https://github.com/pluhin/build_sa.git


## Build parallel 

https://github.com/pluhin/docker_multi


## K8s pods

```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'curl-test'
        image 'jfrog.it-academy.by/public/curl:spishchyk'
        ttyEnabled true
        command 'watch date'
        }
    }
  }
  stages {
    stage('Test') {
      steps {
        container('curl-test') {
          sh """#!/bin/sh
            curl --version
                curl https://onliner.by
                wget -O - https://onliner.by | egrep "https://[0-9a-z]+[.]onliner[.]by" -o | sort -u > tmp.out
                cat tmp.out
                curl \$(cat tmp.out) -I | egrep HTTP
          """
        }
      }
    }
  }
}
```