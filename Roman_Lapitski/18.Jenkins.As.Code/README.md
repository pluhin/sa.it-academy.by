# 18. Jenkins. As code

[GitHub Repository](https://github.com/romalap/jenkins_test)

## Jenkins file

``` groovy
pipeline {
    agent {
        node {
            label 'slave'
        }
    }
    triggers { 
        cron('00 02 * * 7')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
    }
    stages {
        stage('Clone repository') { 
            steps { 
                sh "rm -rf *"
                git url: 'git@github.com:romalap/jenkins_test.git',
                credentialsId: "jenkins_test"
              }
            }
        stage('network check') {
            steps {
                sh """
                nmap -sn 192.168.97.50-150 > Report.txt
                speedtest --accept-license >> Report.txt
                cat Report.txt
                """
            }
        }
        stage('git push') {
            steps {
                sshagent (credentials: ['jenkins_test']) {
                sh("git add Report.txt")
                sh("git commit -m 'Jenkins_report'")
                sh('git push --set-upstream git@github.com:romalap/jenkins_test.git master')
               }
            }
        }
    }
}    

```
