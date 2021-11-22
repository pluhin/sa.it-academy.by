pipeline {
    agent { label 'slave' }
    triggers { 
        cron('H 2 * * 7')
    }
    environment {
                  network = "192.168.202.0/24"
        
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
    }
    stages {
        stage('Clone repository') {
            steps {
                    git url: 'https://github.com/snegboris/jenkins_as_code.git', branch:'master'
            }
        }

        stage('Scan hosts') {
            steps {
                   sh """
                       sudo apt update -yq
                       sudo apt install nmap -yq
                       if [ ! -d reports ]; then mkdir reports;fi
                       nmap $network -n -sP | grep report | awk '{print \$5}' > reports/report_${env.BUILD_ID}.txt
                     
                    """
            }
        }

        stage('SpeedTest') {
            steps {
                   sh """
                       wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
                       chmod +x speedtest-cli
                       echo "##########################" >> reports/report_${env.BUILD_ID}.txt
                       ./speedtest-cli >> reports/report_${env.BUILD_ID}.txt

                   """
            }
        }

        stage('Push report') {
            steps {
                withCredentials([string(credentialsId: 'github_token', variable: 'token')]) {
                    
                     sh 'git add reports/'
                     sh 'git commit -m "Add report_$BUILD_ID"'
                     sh 'git push https://$token@github.com/snegboris/jenkins_as_code.git'
                    
                }
            }
        }

    }
    post {
            always {
                deleteDir()
            }
            success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
            failure {
                slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    }
}

