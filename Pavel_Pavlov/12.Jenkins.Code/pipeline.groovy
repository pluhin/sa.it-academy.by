pipeline {
    agent { label 'node1' }
    triggers {
        cron('*/5 * * * *')
    }
    stages {
        stage('Update system') {
            steps {
                sh """
                sudo apt-get update
                sudo apt-get upgrade -y
                """
            }
        }
        stage('Install nmap') {
            steps {
                sh "sudo apt-get install -y nmap"
            }
        }
        stage('Scan network') {
            steps {
                sh "nmap -sn -PS ${params.SCAN_TO} > scan.log"
            }
        }
        stage('Speedtest-cli install') {
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
            steps {
                sh "speedtest --accept-license --accept-gdpr > speedtest.log"
            }
        }
        stage('Show results') {
            steps {
                sh """
                echo "Counted active hosts"
                cat scan.log | grep "Nmap done"
                echo "Internet connection speed"
                cat speedtest.log | grep -E "(Latency|Download|Upload)"
                """
            }
        }
    }
}