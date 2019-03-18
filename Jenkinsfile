pipeline {
    agent { node { label 'coreos' } }
    parameters { choice(name: 'NEW_BRANCH', choices: ['ansible', 'terraform', 'vagrant'], description: 'create branch') } 
   stages {
        stage('Clone repository') { 
            steps { 
                    deleteDir()
                    git url: "git@github.com:ifanui/sa.it-academy.by.git"
            }
        }
        stage('Create branch') { 
            steps { 
                    sh 'git checkout -b $NEW_BRANCH'
                    sh 'git branch'
                    sh 'git push origin $NEW_BRANCH'
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
                    sh 'echo "Remote branches are:"'
                    sh 'git branch -r'
                    sh 'echo "Local branches are:"'
                    sh 'git branch'
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
