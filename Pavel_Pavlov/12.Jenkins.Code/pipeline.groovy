pipeline {
    agent { label 'node1' }
    triggers {
        cron('H */1 * * *')
    }
    stages {
        stage('Update system') {
            when {
                equals expected: "yes", actual: "${params.UPDATE_SYSTEM}"
            }
            steps {
                sh """
                sudo apt-get update
                sudo apt-get upgrade -y
                """
            }
        }
        stage('Install nmap') {
            when {
                equals expected: "yes", actual: "${params.INSTALL_NMAP}"
            }
            steps {
                sh "sudo apt-get install -y nmap"
            }
        }
        stage('Scan network') {
            steps {
                sh """
                date >> scan.log
                nmap -sn -PS ${params.SCAN_TO} | grep "Nmap done" >> scan.log
                echo "\n" >> scan.log
                """
            }
        }
        stage('Speedtest-cli install') {
            when {
                equals expected: "yes", actual: "${params.INSTALL_ST}"
            }
            steps {
                sh """
                sudo apt-get install gnupg1 apt-transport-https dirmngr
                sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
                echo "deb https://ookla.bintray.com/debian buster main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
                sudo apt-get update
                sudo apt-get install speedtest
                """
            }
        }
        stage('Test internet connection speed') {
            when {
                equals expected: "yes", actual: "${params.ICS_TEST}"
            }
            steps {
                sh """
                date >> speedtest.log
                speedtest --accept-license --accept-gdpr | grep -E "(Latency|Download|Upload)" >> speedtest.log
                echo "\n" >> speedtest.log
                """
            }
        }
        stage('Show results') {
            steps {
                echo "Scan results"
                sh """
                cat scan.log                
                cat speedtest.log
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