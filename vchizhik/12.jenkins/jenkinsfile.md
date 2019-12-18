## Jenkinsfile

```
pipeline {
    agent any
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    git branch: "m-sa2-10-19", url:  "git@github.com:Vchizhik/proba1.git"           }
        }
        stage('Checking repo'){
            steps { 
                    sh "ls -l"
            }
        }
        stage('Add file') {
            steps {
                sh '''
                    touch proba.txt
                    date >> proba.txt
                '''
            }
        }
        stage('Push') { 
            steps {
                  sh 'git config --global user.name "victor chizhik"'
                  sh 'git config --global user.email vchizhik@bankdabrabyt.by'
                  sh 'git add --all'
                  sh '''
                     git commit -m "Add file"
                     '''
                  sh 'git push -f origin'
                }
        }
        stage('Test files') {
            steps {
                sh "ls -l"
            }
        }
    }
    post {
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
}
```
