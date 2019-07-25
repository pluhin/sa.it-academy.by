```
pipeline { 
    agent any 
    environment {
        BUILD = "${env.BUILD_ID}"
    }
    stages {
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:verkhovodko/jenkins_pipeline.git'
            }
        }
        stage('View branches') { 
            steps { 
                    sh 'echo "Remote branches are:"'
                    sh 'git branch -r'
                    sh 'echo "Local branches are:"'
                    sh 'git branch'
            }
        }
        stage('Checking repository'){
            steps { 
                sh "ls -l"
            }
        }
        stage('Test'){
            steps { 
                sh "test -f README.md"
            }
        }
        stage('Build'){
            steps { 
                sh "echo version=$BUILD > build_info.ini"
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                tar -zcvf /tmp/$BUILD.tar.gz  ./
                '''
                sh "ls -l /tmp/*.tar.gz"
            }
        }
        stage('Clean') {
            steps {
                sh '''
                rm /tmp/$BUILD.tar.gz
                '''
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