# Jenkins

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

## Example 02

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
## Example 04

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
                    git branch: "${params.repository_branch}", url: "${params.repository_url}",
                    credentialsId: "some_randome"
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
## Example 05

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
        buildDiscarder(logRotator(numToKeepStr:'4'))
        ansiColor('xterm')
    }
    parameters {
        choice(name: 'tags', choices: ['create', 'create,start,install','start','stop,remove','remove','restart','===========', 'add_nginx', 'remove_nginx'], description: 'What do need to do?')
        string(name: 'startNumber', defaultValue: '1', description: 'Start number of host')
        string(name: 'finishNumber', defaultValue: '1', description: 'Finish number of host')
        string(name: 'parent_host', defaultValue: '702', description: 'Finish number of host')
        booleanParam(name: 'rebuild', defaultValue: false, description: 'Rebuild host?')
    }
    stages {
        stage('K8s') {
            when {
                expression {params.rebuild == false }
            }
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/inv/inventory.yaml",
                    playbook:           "${WORKSPACE}/sa.k8s.nodes.yaml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    tags:               "${params.tags}",
                    colorized:          true,
                    extraVars: [
                        start_from_jenkins:     "${startNumber}",
                        finish_from_jenkins:    "${finishNumber}",
                        parent_host:            "${parent_host}",
                    ]
                )
            }
        }
        stage('Rebuild host') {
            when {
                expression {params.rebuild == true }
            }
            steps {
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/inv/inventory.yaml",
                    playbook:           "${WORKSPACE}/sa.k8s.nodes.yaml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    tags:               "stop,remove",
                    colorized:          true,
                    extraVars: [
                        start_from_jenkins:     "${startNumber}",
                        finish_from_jenkins:    "${finishNumber}",
                        parent_host:            "${parent_host}",
                    ]
                )
                ansiblePlaybook(
                    inventory:          "${WORKSPACE}/inv/inventory.yaml",
                    playbook:           "${WORKSPACE}/sa.k8s.nodes.yaml",
                    vaultCredentialsId: "${ansibleVaultCredId}",
                    tags:               "create,start,install",
                    colorized:          true,
                    extraVars: [
                        start_from_jenkins:     "${startNumber}",
                        finish_from_jenkins:    "${finishNumber}",
                        parent_host:            "${parent_host}",
                    ]
                )
            }
        }
    }
    post {
         success {
            slackSend (
                color: '#00FF00',
                message: "OK. k8s task is done: '${env.JOB_NAME}'"
            )
        }
        failure {
            slackSend (
                color: '#FF0000',
                message: "FAILED: k8s task is failed: '${env.JOB_NAME}'"
            )
        }
    }
}
```


https://github.com/pluhin/multibranches/blob/master/Jenkinsfile

---
## Example 06

```groovy
pipeline {
    agent { label 'master'}
    stages {
        stage('Test curl') {
            agent {
                docker {
                    image 'jfrog.it-academy.by/public/curl:spishchyk'
                    label 'master'
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

## Example 07

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

https://github.com/pluhin/build_sa

https://github.com/pluhin/docker_multi