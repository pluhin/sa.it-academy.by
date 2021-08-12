pipeline {
    agent {
        node {
            label "node_01"
        }
    }
    triggers { 
        cron('H 2 * * 7')
    }
    stages {
        stage('git clone') {
            steps {
               git url: 'https://github.com/WESTnik/Speed_test.git',
               credentialsId: "my_git"
            }
        }
            stage('Install nmap and speedtest-cli') {
            steps {
                sh """
                sudo yum install nmap -y
                echo "####################"
                sudo nmap -sn 192.168.1.110 192.168.1.111 > report.txt
                curl -Lo speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
                sudo chmod +x speedtest-cli
                ./speedtest-cli >> report.txt
                cat report.txt
                """
            }
        }
        stage('git push') {
            steps {
                sh """
                git add report.txt
                git config --global user.email "lisenok.p@gmail.ru"
                git config --global user.name "Pavel Lysianok"
                git commit -m "Report commit"
                git push git@github.com:WESTnik/Speed_test.git
                """
                
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}
