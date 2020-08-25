pipeline {
    agent { label 'master' }
    environment {
        NEW_BRANCH = "new_branch"
    }
    stages {
        stage('Clone repository') { 
            steps { 
                    deleteDir()
                    git url: 'git@github.com:pluhin/sa.it-academy.by.git'
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
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
}