pipeline { 
    agent any
    triggers { 
          cron('H */1 * * *')
        }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:pluhin/sa.it-academy.by.git'
            }
        }
        stage('Checking repository'){
            steps { 
                sh "ls -l"
            }
        }
        stage('Packing project') {
            steps {
                sh """
                tar -zcvf /tmp/package.tar.gz  ./
                """
                deleteDir()
                sh "mv /tmp/package.tar.gz  ./"
            }
        }
        stage('Packing test') {
            steps {
                sh "ls -l"
            }
        }
    
    }
}