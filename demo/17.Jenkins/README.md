# Jenkins as code 

## Example 01

```groovy
pipeline { 
    agent any
    triggers { 
        cron('H */1 * * *')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:pluhin/sa.it-academy.by.git',
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
                sh """
                tar -zcvf /tmp/package.tar.gz  ./
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
                            git url: 'https://github.com/pluhin/sa.it-academy.by.git'
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
                    git url: 'https://github.com/pluhin/sa.it-academy.by.git'
            }
        }
        stage('Create branch') { 
            steps { 
                    sh """
                        git checkout -b $NEW_BRANCH
                        git branch
                        git push origin $NEW_BRANCH
                    """
            }
        }
        stage('Delete branch') { 
            steps { 
                    sh 'git checkout master && git branch -D $NEW_BRANCH'
                    sh 'git push origin --delete $NEW_BRANCH'
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

Multibranch

https://github.com/pluhin/multibranches.git

```bash
10522  vim docker-compose.yaml
10523  mkdir jenkins/{casc_configs,init.groovy.d} -p
10524  ls -l
10525  ls -l jenkins
10526  vim jenkins/init.groovy.d/basic-security.groovy
10527  vim docker-compose.yaml
10528  vim jenkins/casc_configs/jenkins.yaml
10529  home_connect_local
10530  docker-compose up
10531  docker-compose exec jenkins bash
10532* docker-compose up
10533  top
10534  docker-compose exec jenkins bash
10535* docker-compose up
10536  vim jenkins/jobs/test/config.xml
10537  docker-compose exec jenkins bash
10538  export API_AUTH_HEADER='admin:1192a5dd6066b08e4ff09201a8294db7d3'
10539  curl -X POST -u ${API_AUTH_HEADER} http://localhost:8080/job/test/build
10540  curl -X GET -u ${API_AUTH_HEADER}  http://localhost:8080/job/test/config.xml -o task.xml
10541  vim task.xml
10542  curl -X POST -u ${API_AUTH_HEADER}  http://localhost:8080/job/test/config.xml --data-binary "@task.xml"
10543  curl -X POST -u ${API_AUTH_HEADER}  http://localhost:8080/job/test/config.xml --data-binary "@task.xml" -H "Content-Type:text/xml"
10544  curl -X POST -u ${API_AUTH_HEADER}  "http://localhost:8080/createItem?name=test2" --data-binary "@task.xml" -H "Content-Type:text/xml"

```
