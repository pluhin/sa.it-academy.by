pipeline {
    agent none
    triggers {
        cron('0 21 * * *')
    }
    stages {
        stage('Deploy') {
            agent {label 'master'}
            steps {
                ansiblePlaybook(
                    inventory: '/etc/ansible/inv.yaml',
                    playbook: '/etc/ansible/processwire.yaml'
                )
            }
        }
        stage('Unit test') {
            agent {label 'master'}
            steps {
                ansiblePlaybook(
                    inventory: '/etc/ansible/inv.yaml',
                    playbook: '/etc/ansible/test.yaml'
                )
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
