pipeline { 
    agent any 
    stages {
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:OlegPlaxa/github_repository.git'
            }
        }
        stage('Checking repository'){
            steps { 
                sh "ls -la"
            }
        }
        stage('Testing role via molecule') {
            steps {
                sh '''
					cd $(ls|grep 08)/roles/check_role
					molecule lint > /tmp/test.log || exit 0 
                '''
            }
        }
        stage('Output test') {
            steps {
                sh "cat /tmp/test.log"
            }
        }
		stage('Delete folder') {
            steps {
                deleteDir()
            }
        }
    }
}