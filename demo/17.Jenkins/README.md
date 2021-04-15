## Example 1

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

## Example 3

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
                    git url: 'https://github.com/pluhin/sa.it-academy.by.git',
                    credentialsId: "github-ssh"
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

http://localhost:8080/env-vars.html/

## Example 4

```groovy
pipeline {
    agent { label 'master' }
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    parameters {
        choice(name: 'repository_branch', choices: ['master', 'md-sa2-16-21', 'jenkins'], description: 'Pick the branch')
        string(name: 'repository_url', defaultValue: 'git@github.com:pluhin/sa.it-academy.by.git', description: 'Github repository url')
        booleanParam(name: 'do_clean', defaultValue: true, description: 'Do we need clean old one package?')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    git branch: "${params.repository_branch}", url: "${params.repository_url}",
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