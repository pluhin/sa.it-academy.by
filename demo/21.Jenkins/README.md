## Example 01

```groovy
pipeline {
    agent any
    triggers {
        cron('H */1 * * *')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
    }
    stages {
        stage('Clone repository') {
            steps {
                git url: 'https://github.com/pluhin/docker-icinga2', branch: 'master'
            }
        }
        stage('Checking repository'){
            steps {
                sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh """
                tar -zcvf /tmp/package.tar.gz  ./
                date
                """
                deleteDir()
                sh "mv /tmp/package.tar.gz  ./"
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
## Example 2

```groovy
pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('parallel') {
            parallel {
                stage('Clone repository 01') {
                    steps {
                        dir('01') {
                            git url: 'https://github.com/pluhin/docker-icinga2', branch: 'master'
                            sh """
                                tar -zcvf /tmp/package_01.tar.gz  ./
                                ls -l
                            """
                            deleteDir()
                            sh "mv /tmp/package_01.tar.gz  ./"
                        }
                    }
                }
                stage('Clone repository 02') {
                    steps {
                        dir('02') {
                            git url: 'https://github.com/pluhin/jenkins_ci.git'
                            sh """
                                tar -zcvf /tmp/package_02.tar.gz  ./
                                ls -l
                            """
                            deleteDir()
                            sh "mv /tmp/package_02.tar.gz  ./"
                        }
                    }
                }
            }
        }
        stage('Packing test') {
            steps {
                sh """
                ls -l ./01
                echo "#####################################################"
                ls -l ./02
                """
            }
        }
    }
}
```
## Example 03

```groovy
pipeline {
    agent { label 'master' }
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    parameters {
        choice(name: 'repository_branch', choices: ['master', 'new_branch'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'https://github.com/pluhin/docker-icinga2.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean old one package?')
    }
    stages {
        stage('Clone repository') {
            steps {
                    git branch: "${params.repository_branch}", url: "${params.repository_url}"
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
## Pipeline 04

```groovy
pipeline {
    agent any
    environment {
        NEW_BRANCH = "new_branch"
    }
    stages {
        stage('Clone repository') {
            steps {
                    deleteDir()
                    git url: 'https://github.com/pluhin/docker-icinga2.git', credentialsId: "some_randome"
            }
        }
        stage('Create branch') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh """
                        git checkout -b $NEW_BRANCH
                        git branch
                        git push https://${USER}:${encodedPass}@github.com/pluhin/docker-icinga2.git $NEW_BRANCH
                        sleep 60s
                    """
                }
            }
        }
        stage('Delete branch') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh 'git checkout master && git branch -D $NEW_BRANCH'
                    sh 'git push https://${USER}:${encodedPass}@github.com/pluhin/docker-icinga2.git --delete $NEW_BRANCH'
                }
            }
        }
        stage('Test') {
            steps {
                    sh """
                    echo "Remote branches are:"
                    git branch -r
                    echo "Local branches are:"
                    git branch
                    """
            }
        }
    }
    post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
                // mail to: 'pluhin@gmail.com',
                // subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                // body: "Something is wrong with ${env.BUILD_URL}"
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    }
}
```

https://github.com/pluhin/multibranches

## Example 05

Please add jenkins user into docker group, we need to provide permission for its

```bash
sudo usermod -aG docker jenkins
sudo service jenkins restart
```

```groovy
pipeline {
    agent {
            docker {
                    image 'jfrog.it-academy.by/public/curl:spishchyk'
                    label 'master'
                }
            }
    stages {
        stage('Test curl') {
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

https://github.com/pluhin/docker_multi/blob/master/Jenkinsfile

https://github.com/pluhin/docker-icinga2/blob/master/Jenkinsfile

## Example 06

```groovy

pipeline {
  environment {
    //registry = "pluhin31/test"
    //registryCredential = 'dockerhub'
    registry = "jfrog.it-academy.by/public/test"
    registryCredential = 'jfrog_sa'
  }
  agent { label 'master'}
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/pluhin/docker_build.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER" , "."
          //dockerImage = docker.build registry + ":$BUILD_NUMBER" , "--network host ."
        }
      }
    }
    stage('Push Image') {
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