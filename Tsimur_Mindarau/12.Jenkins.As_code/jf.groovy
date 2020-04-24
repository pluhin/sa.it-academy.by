pipeline {
    agent any
    stages {
        stage('Git configuring') {
            steps {
                sh """
			    git config user.email "2494035@gmail.com"
                git config user.name "Tsimur Mindarau"
                """
            }
        }
        stage('Clone repository') {
            steps {
                git url: 'git@github.com:tsimur/12.Jenkins.As_code.git'
            }
        }
        stage('Checkout to branch') {
            steps {
                sh """
                git config --global push.default simple
                """            }
        }
        stage('Install nmap') {
            steps {
                sh """
                ansible -i /var/lib/jenkins/inv.ini all -m yum -a "name=nmap state=present" -u root
                """
            }
        }
        stage('Install speedtest-cli') {
            steps {
                sh """
                ansible -i /var/lib/jenkins/inv.ini all -m yum -a "name=speedtest-cli state=present" -u root
                """
            }
        }
        stage('Check online hosts'){
            steps{
                sh """
                ansible -i /var/lib/jenkins/inv.ini all -m shell -a "nmap -n -sn 192.168.203.0-64 -oG -" -u root > online_hosts.txt
                """
            }
        }
        stage('Test Speed'){
            steps{
                sh """
                ansible -i /var/lib/jenkins/inv.ini all -m shell -a "speedtest-cli" -u root >> online_hosts.txt
                """
            }
        }
        stage('git_push') {
            steps {
                sh """
                git add --all
                git commit -m "reports"
                git push -u -f origin master
                """
            }
        }
    }
}
