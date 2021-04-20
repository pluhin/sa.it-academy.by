## Pipeline
```
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
               git url: 'git@github.com:arkadzit/test_github.git',
                credentialsId: "ssh_githab"
            }
        }
        stage('run nmap & speedtest') {
            steps {
                sh """
                nmap -sn 192.168.1.1/24 > nmap_and_speedtest.txt
                wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
                chmod +x speedtest-cli
                ./speedtest-cli >> nmap_and_speedtest.txt
                """
            }
        }
        stage('git add & push') {
            steps {
                sh """
                git add nmap_and_speedtest.txt
                git commit -m "add nmap & speedtest report"
                git push --set-upstream origin master
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
## Console Output
```
Started by user admin
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline

[Pipeline] node
Running on node_01 in /var/lib/jenkins/workspace/17. Jenkins. As code
[Pipeline] {
[Pipeline] stage
[Pipeline] { (git clone)
[Pipeline] git

The recommended git tool is: NONE

using credential ssh_githab
Cloning the remote Git repository
Cloning repository git@github.com:arkadzit/test_github.git

 > git init /var/lib/jenkins/workspace/17. Jenkins. As code # timeout=10
Fetching upstream changes from git@github.com:arkadzit/test_github.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials 
[INFO] Currently running in a labeled security context
[INFO] Currently SELinux is 'enforcing' on the host
 > git /usr/bin/chcon --type=ssh_home_t /var/lib/jenkins/workspace/17. Jenkins. As code@tmp/jenkins-gitclient-ssh1484861496375709761.key
 > git fetch --tags --progress git@github.com:arkadzit/test_github.git +refs/heads/*:refs/remotes/origin/* # timeout=10

Avoid second fetch
Checking out Revision adcf32df143a79888fd6b0c7ee772286515b4280 (refs/remotes/origin/master)

 > git config remote.origin.url git@github.com:arkadzit/test_github.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f adcf32df143a79888fd6b0c7ee772286515b4280 # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git checkout -b master adcf32df143a79888fd6b0c7ee772286515b4280 # timeout=10

Commit message: "Added Jenkinsfile"
First time build. Skipping changelog.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (run nmap & speedtest)
[Pipeline] sh
+ nmap -sn 192.168.1.1/24

+ wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
--2021-04-19 15:38:13--  https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.109.133, 185.199.110.133, 185.199.111.133, ...
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.109.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 65123 (64K) [text/plain]
Saving to: ‘speedtest-cli’

     0K .......... .......... .......... .......... .......... 78%  551K 0s
    50K .......... ...                                        100%  937K=0.1s

2021-04-19 15:38:14 (604 KB/s) - ‘speedtest-cli’ saved [65123/65123]

+ chmod +x speedtest-cli
+ ./speedtest-cli

[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (git add & push)
[Pipeline] sh

+ git add nmap_and_speedtest.txt
+ git commit -m 'add nmap & speedtest report'
[master 3ca8727] add nmap & speedtest report
 1 file changed, 22 insertions(+)
 create mode 100644 nmap_and_speedtest.txt
+ git push --set-upstream origin master

To git@github.com:arkadzit/test_github.git
   adcf32d..3ca8727  master -> master
Branch master set up to track remote branch master from origin.
[Pipeline] }
[Pipeline] // stage

[Pipeline] stage
[Pipeline] { (Declarative: Post Actions)
[Pipeline] deleteDir
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```