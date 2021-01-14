```groovy
pipeline {
    agent { label 'master' }
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    parameters {
        choice(name: 'repository_branch', choices: ['master', 'm-sa2-15-20', 'jenkins'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:pluhin/sa.it-academy.by.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean old one package?')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    git branch: "${params.repository_branch}", 
                        url: "${params.repository_url}",
                        credentialsId: "github-ssh"

            }
        }
        stage('Checking repository'){
            steps { 
                    sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh '''
                    tar -zcvf /tmp/$BUILD.tar.gz  ./
                '''
                deleteDir()
                sh 'cp /tmp/$BUILD.tar.gz  ./'
            }
        }
        stage('Clean old one') {
            when {
                expression {params.do_clean}
            }
            steps {
                sh 'rm -f /tmp/$BUILD.tar.gz'
            }
        }
        stage('Packing test') {
            steps {
                sh "ls -l"
            }
        }
    }
}
```
---
```groovy
def ansibleVaultCredId = 'ansible_vault_sa'

pipeline {
    agent {
        docker { 
            image 'pluhin31/ansible:latest' 
            args "--network=host"
        }
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    parameters {
        choice(name: 'tags', choices: ['create', 'create,start,install','start','stop,remove','remove','install','restart'], description: 'What do need to do?')
        string(name: 'startNumber', defaultValue: '1', description: 'Start number of host')
        string(name: 'finishNumber', defaultValue: '1', description: 'Finish number of host')
    }
    stages {
        stage('LXC') {
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/inv/inventory.yaml",
                    playbook:           "${WORKSPACE}/sa.env.for.group.yaml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    tags:               "${params.tags}",
                    colorized:          true,
                    extraVars: [
                        start_from_jenkins:     "${startNumber}",
                        finish_from_jenkins:    "${finishNumber}",
                    ]
                )
            }
        }
    }
    post {
         success {
            slackSend (
                color: '#00FF00', 
                message: "OK. LXC task is done: '${env.JOB_NAME}'"
            )
        }
        failure {
            slackSend (
                color: '#FF0000', 
                message: "FAILED: LXC task is failed: '${env.JOB_NAME}'"
            )
        }
    }
}
```
---
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
## Build images and push 01

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
---
## Build images and push 02

[https://github.com/pluhin/build_sa.git](https://github.com/pluhin/build_sa.git)

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
---

```groovy
node('master') {
  def version = "latest"
  def name = "sa_build"
  def dockerRegistry = "jfrog.it-academy.by/public"
  def registryCredential = "jfrog-sa"
  def image

  stage ("Checkout") {
    checkout scm
  }

  stage ("Docker: Build") {
      image = docker.build(
              "${dockerRegistry}/${name}:${version}",
              "--network=host .",
      )
  }

  stage ("Docker: Push") {
        docker.withRegistry('https://jfrog.it-academy.by', registryCredential) {
          image.push "${version}"
          echo "Docker Image pushed: ${dockerRegistry}/${name}:${version}"
        }
  }
}
```
---

## Rin in pod

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
---

## Yum downloader

[https://github.com/pluhin/docker_multi.git](https://github.com/pluhin/docker_multi.git)

```groovy
pipeline {
    agent any
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
                    args '-u root -v /tmp/nagios:/download:rw'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
                    ls -l /download
                """
            }}
	        stage('Centos_6') {
            agent {
                dockerfile {
                    label 'master'
                    filename 'Cent.6.Dockerfile'
		            additionalBuildArgs '--network=host'
                    args '-u root -v /tmp/nagios:/download:rw'
                }
            }
            steps {
                sh """
                    yum install -y --downloadonly --downloaddir=/download nagios-plugins-all
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

