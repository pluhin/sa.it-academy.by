pipeline {
    agent { label 'local_vagrant_node' }
    triggers { 
        cron('0 02 * * 7')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('01.Check_connection') {
            steps {
                echo 'pinging tut.by..'
                sh """
                ping tut.by -c 3
                """
            }
        }    
        stage('02.Show_interfaces') {
            steps {
                echo 'show_interfaces..'
                sh """
                /usr/sbin/ip a
                """
            }
        }
        stage('03.Installing nmap, scaning') {
            steps {
                echo 'installing nmap & scaning..'
                sh """
                sudo /bin/yum install nmap -y
                date > report.txt
                echo -e "\\n" >> report.txt
                nmap -sP 192.168.100.1/24 | grep -E "([0-9]{1,3}[\\.]){3}[0-9]{1,3}|done" >> report.txt
                echo -e "\\n" >> report.txt
                cat report.txt
                """
            }
        }
        stage('04.Removing nmap') {
            steps {
                echo 'removing nmap..'
                sh """
                sudo /bin/yum remove nmap -y
                """
            }
        }
        stage('05.Installing speedtest') {
            steps {
                echo 'installing speedtest..'
                sh """
                wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
                sudo mv bintray-ookla-rhel.repo /etc/yum.repos.d/
                sudo /bin/yum install speedtest -y
                """
            }
        }
        stage('06.Speed testing') {
            steps {
                echo 'Testing..'
                sh """
                speedtest --accept-license | tail -n 9 | tee -a report.txt
                cat report.txt
                """
            }
        }
        stage('07.Removing speedtest') {
            steps {
                echo 'removing speedtest..'
                sh """
                rpm -qa | grep speedtest | xargs -I {} sudo /bin/yum -y remove {}
                """
            }
        }
        stage('08.Add, Commit & Push report.txt to the GitHub repo') { 
            steps { 
                echo 'pushing the new report.txt..'
                sh """
                cp report.txt /var/lib/jenkins/reports
                cd /var/lib/jenkins/reports
                git add report.txt
                git commit -m "report.txt uploaded"
                git push origin main
                """
            }
        }
        stage('Done message') {
            steps {
                echo 'Done....'
            }
        }
    }
}