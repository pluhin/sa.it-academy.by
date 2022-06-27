# 20.Jenkins_as_code_Muzhichenko_Alex

---

## Git repository

https://github.com/amuzhichenko/jenkins_as_code

## Pipeline console output

![jenkins_jac](output_jac.JPG)

---

```bash

Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on node01 in /home/jenkins/workspace/20.Jenkins.as.code
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Install_nmap)
[Pipeline] sh
+ sudo apt-get install nmap -y
Reading package lists...
Building dependency tree...
Reading state information...
nmap is already the newest version (7.80+dfsg1-2build1).
The following package was automatically installed and is no longer required:
  libfwupdplugin1
Use 'sudo apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 9 not upgraded.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (NMAPpining)
[Pipeline] sh
+ nmap -sP 192.168.2.1/24 -oN report.log
Starting Nmap 7.80 ( https://nmap.org ) at 2022-06-27 13:02 UTC
Nmap scan report for 192.168.2.101
Host is up (0.00034s latency).
Nmap scan report for 192.168.2.201
Host is up (0.00014s latency).
Nmap done: 256 IP addresses (2 hosts up) scanned in 19.63 seconds
+ echo 


[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Install_speedtest)
[Pipeline] sh
+ sudo apt-get install python3-pip -y
Reading package lists...
Building dependency tree...
Reading state information...
python3-pip is already the newest version (20.0.2-5ubuntu1.6).
The following package was automatically installed and is no longer required:
  libfwupdplugin1
Use 'sudo apt autoremove' to remove it.
0 upgraded, 0 newly installed, 0 to remove and 9 not upgraded.
[Pipeline] sh
+ sudo pip3 install speedtest-cli
Requirement already satisfied: speedtest-cli in /usr/local/lib/python3.8/dist-packages (2.1.3)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test speed)
[Pipeline] sh
+ speedtest-cli
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clone_git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ [ -d jenkins_as_code]
/home/jenkins/workspace/20.Jenkins.as.code@tmp/durable-4ce3bd7c/script.sh: 1: [: missing ]
+ git clone https://amuzhichenko:****@github.com/amuzhichenko/jenkins_as_code.git
Cloning into 'jenkins_as_code'...
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push_git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ date +%T; %D
+ DATE_TEST=13:03:25; 06/27/22
+ cp report.log jenkins_as_code/report.log
+ cd jenkins_as_code
+ git config user.email muzhichenko@alex.sa
+ git config user.name Jenkins
+ git add --all
+ git commit -m 13:03:25; 06/27/22
[main fde7024] 13:03:25; 06/27/22
 1 file changed, 8 insertions(+), 8 deletions(-)
+ git push https://amuzhichenko:****@github.com/amuzhichenko/jenkins_as_code.git
To https://github.com/amuzhichenko/jenkins_as_code.git
   1e81c54..fde7024  main -> main
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS


```

## Jenkinsfile

```bash

pipeline {
    agent { node { label 'slave' } }
    triggers {
        cron('H 02 * * 7')
    }
    stages {
		stage('Install_nmap') {
            steps {
				sh 'sudo apt-get install nmap -y'
            }
        }
        stage('NMAPpining') {
            steps {
                sh 'nmap -sP 192.168.2.1/24 -oN report.log && echo "\n\n" >> report.log'
            }
        }
		stage('Install_speedtest') {
            steps {
				sh 'sudo apt-get install python3-pip -y'
				sh 'sudo pip3 install speedtest-cli'
            }
        }
        stage('Test speed') {
            steps {
                sh 'speedtest-cli >> report.log'
            }
        }
        stage('Clone_git') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh 'if [ -d  jenkins_as_code]; then rm -R jenkins_as_code; fi && git clone https://${USER}:${encodedPass}@github.com/amuzhichenko/jenkins_as_code.git'
                }
            }
        }
        stage('Push_git') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh 'DATE_TEST="$(date +"%T; %D")" && cp report.log jenkins_as_code/report.log && cd jenkins_as_code && git config user.email "muzhichenko@alex.sa" && git config user.name "Jenkins" && git add --all && git commit -m "$DATE_TEST" && git push https://${USER}:${encodedPass}@github.com/amuzhichenko/jenkins_as_code.git'
                }
            }
        }
    }
} 


```
