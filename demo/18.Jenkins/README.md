## Connect to the nodes use command, example

```bash 
ssh -i ~/.ssh/id_rsa jenkins@192.168.203.42 "cd /home/jenkins && curl -O https://pluhin.ddns.net/jnlpJars/agent.jar && java -jar ~/agent.jar"
```

## Run pipeline inside docker container


```groovy
pipeline {
    agent none
    stages {
        stage('Test curl') {
            agent {
                docker { 
                    image 'pluhin31/wget_curl:latest' 
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


## Build image 1

```groovy

pipeline {
  environment {
    registry = "pluhin31/test"
    registryCredential = 'dockerhub'
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
```

## Docker build 2

https://github.com/pluhin/build_sa


## Docker yum

https://github.com/pluhin/docker_multi/blob/master/Jenkinsfile


## Pod

```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'curl-test'
        image 'pluhin31/wget_curl:latest'
        ttyEnabled true
        command 'cat'
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