### report
```

Starting Nmap 7.80 ( https://nmap.org ) at 2021-04-30 16:52 MSK
Nmap scan report for 192.168.100.1
Host is up (0.0038s latency).
Nmap scan report for 192.168.100.10
Host is up (0.0054s latency).
Nmap scan report for 192.168.100.14
Host is up (0.0041s latency).
Nmap done: 256 IP addresses (3 hosts up) scanned in 3.15 seconds

   Speedtest by Ookla

     Server: MGTS - Minsk (id = 1119)
        ISP: Beltelecom
    Latency:     3.74 ms   (0.36 ms jitter)

   Download:   245.32 Mbps (data used: 275.7 MB)                               

     Upload:   190.22 Mbps (data used: 170.2 MB)                               
Packet Loss:     0.0%
 Result URL: https://www.speedtest.net/result/c/75d31f45-0f97-4f01-909f-66fb5e63f1d6
```
### jenkinsfile
```groovy
pipeline {
    agent {
        node {
            label "slave1"
        }
    }
    triggers { 
        cron('H 2 * * 7')
    }
    stages {
        stage('Clone') { 
            steps { 
                git url: 'git@github.com:sergeikoltochihin/hw17.git',
                credentialsId: "github-ssh"
            }
        }
        stage('Test') {
            steps {
                sh """
                nmap -sn 192.168.100.0/24 > report.txt
                speedtest --accept-license >> report.txt
                """
            }
        }
        stage('Push') {
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
