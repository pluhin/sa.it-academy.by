## Example 1

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
---
## Example 2

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
          dockerImage = docker.build registry + ":$BUILD_NUMBER" , "--network host ."
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
## Example 3
https://github.com/pluhin/build_sa.git

```groovy
node('master') {
  def version = "jenkins"
  def name = "pluhin31/test_sa"
///  def dockerRegistry = "https://docker.io"
  def registryCredential = "dockerhub"
  def image

  stage ("Checkout") {
    checkout scm
  }

  stage ("Docker: Build") {
      image = docker.build(
              "${name}:${version}",
              "--network=host .",
              //"-f ./Dockerfiles/i2_web.Dockerfile ./Dockerfiles"
      )
  }

  stage ("Docker: Push") {
        docker.withRegistry('', registryCredential) {
          image.push "${version}"
          echo "Docker Image pushed: ${name}:${version}"
        }
  }
}
```
## Example 4

https://github.com/pluhin/docker_multi

```groovy
pipeline {
    agent {
      label 'master'
    }
    stages {
	stage ('Create dir') {
		steps {
		sh """
		   mkdir /tmp/nagios || echo "Dir exists"
		"""
		}
	}
	
        stage('Download') {
	parallel {
            stage('Centos_7') {
            agent {
                dockerfile { 
		    filename 'Cent.7.Dockerfile'
                    label 'master'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/nagios:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
                    ls -l /download
                """
            }}
	    stage('Centos_8') {
            agent {
                dockerfile {
                    label 'master'
                    filename 'Cent.8.Dockerfile'
		    additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/nagios:/download:rw --network=host'
                }
            }
            steps {
                sh """
                    cd /download
		    dnf download nagios-plugins-all --resolve
                    ls -l /download
                """
            }}

        }}
	stage ('Checking') {
		agent {
			label 'master'
		}
		steps {
		sh """
			ls -l /tmp/nagios/	
		"""
		}
	}
    }
}
```
## Example 5

```groovy
pipeline {
  agent {
    kubernetes {
        containerTemplate {
        name 'curl-test'
        image 'pluhin31/wget_curl:latest'
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