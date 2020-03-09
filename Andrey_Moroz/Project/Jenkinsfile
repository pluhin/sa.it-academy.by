pipeline {
    agent {
    	label 'node3'
    }
        
    stages {

        stage('Stop and Remove old VM') { 
            steps { 
                    sh """
                    cd /var/lib/jenkins/VM/
                    vagrant halt
                    vagrant destroy -f
                    rm -rf *
                    """
            }
        }

        stage('Clone repository') { 
            steps { 
                    deleteDir()
                    git url: 'git@github.com:morozandralek/project_cicd.git'
                    sh """
                    cp -r * /var/lib/jenkins/VM/
                    """
            }
        }

        stage('Run VM'){
        	steps {
                    sh """
                    cd /var/lib/jenkins/VM/
                    vagrant up
                    """
        	}
        }

        stage('Deploy Nginx and Proxy'){
            steps {
                    sh """
                    cd /var/lib/jenkins/VM/
                    ansible-playbook -i inventory.yaml playbook-proxy.yaml
                    """
            }
        }

        stage('UP docker-compose mysql and wordpress'){
            steps {
                    sh """
                    cd /var/lib/jenkins/VM/
                    ansible-playbook -i inventory.yaml playbook-wordpress.yaml
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
