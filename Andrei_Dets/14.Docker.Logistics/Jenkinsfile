pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                    deleteDir()
                    git(
                                       url: 'git@github.com:Minedy/minedyapp.git',
                                       credentialsId: 'Github_my',
                                       branch: "master"
                        )
            }
        }
        stage('Build Image') {
            steps {
                    sh """
                    docker build -t minedy/test . 
                    docker push minedy/test
                    """
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
