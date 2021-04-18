### [report](https://github.com/AleksandMur/test/blob/master/report.txt ) 

### Jenkinsfile
```groovy
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
        stage('Clone repository') { 
            steps { 
                git url: 'git@github.com:AleksandMur/test.git',
                credentialsId: "github-ssh"
            }
        }
        stage('Test') {
            steps {
                sh """
                nmap -sn 192.168.56.1/24 > report.txt
                speedtest >> report.txt
                """
            }
        }
        stage('Git') {
            steps {
                sh """
                git add report.txt
                git commit -m "report"
                git push
                """
            }
        }
    }    
    post {
        always {
            archiveArtifacts artifacts: 'report.txt', onlyIfSuccessful: true
            deleteDir()
        }
    }
}
```
