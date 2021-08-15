# 18.Jenkins as Code

## Jenkinsfile

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
```
## Report.txt

```bash
Starting Nmap 6.40 ( http://nmap.org ) at 2021-08-12 19:41 UTC
Nmap scan report for jenkins.local (192.168.1.110)
Host is up.
Nmap scan report for 192.168.1.111 (192.168.1.111)
Host is up (0.00077s latency).
MAC Address: 08:00:27:AE:EC:CE (Cadmus Computer Systems)
Nmap done: 2 IP addresses (2 hosts up) scanned in 1.05 seconds
Retrieving speedtest.net configuration...
Testing from Beltelecom (37.212.80.181)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Telekomunikacja Podlasie sp. z o.o. (Bialystok) [77.14 km]: 153.141 ms
Testing download speed................................................................................
Download: 5.82 Mbit/s
Testing upload speed................................................................................................
Upload: 1.26 Mbit/s
```

---

## Git repo - https://github.com/WESTnik/Speed_test