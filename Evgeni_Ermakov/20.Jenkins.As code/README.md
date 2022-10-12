## 19. Jenkins. Routine

### Task

* Count all online hosts (you can use your things from previous home work)
* Measure internet access speed
* Your report (count of hosts and speed) publish to your repository
* Schedule tasks (each Sunday night at 02:00 AM)

### Result

*  [Result file](result.log)
*  [GitHub](https://github.com/EvgeniErmakov/yes-i-still-love-you)

### Script

``` bash
pipeline {
    agent { node { label 'ubuntu22' } }
    triggers {
        cron('H 02 * * 7')
    }
    stages {
		stage('1. Install nmap') {
            steps {
				sh 'sudo apt-get install nmap -y'
            }
        }
        stage('2. Use Nmap') {
            steps {
                sh 'nmap -sP 192.168.31.* -oN result.log;'
            }
        }
		stage('3. Install speedtest') {
            steps {
				sh 'curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash'
				sh 'sudo apt-get install speedtest'
            }
        }
        stage('4. Use testspeed') {
            steps {
                sh 'speedtest >> result.log'
            }
        }
        stage('5. clone git') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh 'pwd'
                    sh 'if [ -d yes-i-still-love-you]; then rm -R -f ./yes-i-still-love-you; fi && git clone https://${USER}:${encodedPass}@github.com/EvgeniErmakov/yes-i-still-love-you.git'
                }
            }
        }
        stage('6. Push git') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'some_randome', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    script {
                        env.encodedPass=URLEncoder.encode(PASS, "UTF-8")
                    }
                    sh 'DATE_TEST="$(date +"%T %D")" && cp result.log yes-i-still-love-you/result.log && cd yes-i-still-love-you && git config user.email "evgeniermakov1994@gmail.com" && git config user.name "Jenkins" && git add --all && git commit -m "$DATE_TEST" && git push https://${USER}:${encodedPass}@github.com/EvgeniErmakov/yes-i-still-love-you.git'
                }
            }
        }
    }
} 
```

### Console STDOUT

```bash
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on ubuntu22 in /home/evgeni/jenkins/workspace/20
[Pipeline] {
[Pipeline] stage
[Pipeline] { (1. Install nmap)
[Pipeline] sh
+ sudo apt-get install nmap -y
Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed
  nmap
0 to upgrade, 1 to newly install, 0 to remove and 128 not to upgrade.
debconf: Unable to initialise frontend: Dialog
debconf: (Dialogue frontend will not work on a dumb terminal, an Emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: Unable to initialise frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: Unable to re-open stdin: 
Need to get 0 B/1,731 kB of archives.
After this operation, 4,341 kB of additional disk space will be used.
Selecting previously unselected package nmap.
(Reading database ... 
(Reading database ... 5%
(Reading database ... 10%
(Reading database ... 15%
(Reading database ... 20%
(Reading database ... 25%
(Reading database ... 30%
(Reading database ... 35%
(Reading database ... 40%
(Reading database ... 45%
(Reading database ... 50%
(Reading database ... 55%
(Reading database ... 60%
(Reading database ... 65%
(Reading database ... 70%
(Reading database ... 75%
(Reading database ... 80%
(Reading database ... 85%
(Reading database ... 90%
(Reading database ... 95%
(Reading database ... 100%
(Reading database ... 252986 files and directories currently installed.)
Preparing to unpack .../nmap_7.91+dfsg1+really7.80+dfsg1-2build1_amd64.deb ...
Unpacking nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Setting up nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.10.2-1) ...
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (2. Use Nmap)
[Pipeline] sh
+ nmap -sP 192.168.31.* -oN result.log
Starting Nmap 7.80 ( https://nmap.org ) at 2022-10-08 19:33 +03
Nmap scan report for XiaoQiang (192.168.31.1)
Host is up (0.00094s latency).
Nmap scan report for legion (192.168.31.122)
Host is up (0.00023s latency).
Nmap scan report for jenkins.9.sa (192.168.31.130)
Host is up (0.00015s latency).
Nmap scan report for legion (192.168.31.222)
Host is up (0.00013s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 3.01 seconds
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (3. Install speedtest)
[Pipeline] sh
+ curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh
+ sudo bash
Detected operating system as Ubuntu/jammy.
Checking for curl...
Detected curl...
Checking for gpg...
Detected gpg...
Detected apt version as 2.4.7
Running apt-get update... done.
Installing apt-transport-https... done.
Installing /etc/apt/sources.list.d/ookla_speedtest-cli.list...done.
Importing packagecloud gpg key... Packagecloud gpg key imported to /etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg
done.
Running apt-get update... done.

The repository is setup! You can now install packages.
[Pipeline] sh
+ sudo apt-get install speedtest
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed
  speedtest
0 to upgrade, 1 to newly install, 0 to remove and 128 not to upgrade.
debconf: Unable to initialise frontend: Dialog
debconf: (Dialogue frontend will not work on a dumb terminal, an Emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: Unable to initialise frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: Unable to re-open stdin: 
Need to get 0 B/1,106 kB of archives.
After this operation, 2,628 kB of additional disk space will be used.
Selecting previously unselected package speedtest.
(Reading database ... 
(Reading database ... 5%
(Reading database ... 10%
(Reading database ... 15%
(Reading database ... 20%
(Reading database ... 25%
(Reading database ... 30%
(Reading database ... 35%
(Reading database ... 40%
(Reading database ... 45%
(Reading database ... 50%
(Reading database ... 55%
(Reading database ... 60%
(Reading database ... 65%
(Reading database ... 70%
(Reading database ... 75%
(Reading database ... 80%
(Reading database ... 85%
(Reading database ... 90%
(Reading database ... 95%
(Reading database ... 100%
(Reading database ... 253019 files and directories currently installed.)
Preparing to unpack .../speedtest_1.2.0.84-1.ea6b6773cf_amd64.deb ...
Unpacking speedtest (1.2.0.84-1.ea6b6773cf) ...
Setting up speedtest (1.2.0.84-1.ea6b6773cf) ...
Processing triggers for man-db (2.10.2-1) ...
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (4. Use testspeed)
[Pipeline] sh
+ speedtest
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (5. clone git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ pwd
/home/evgeni/jenkins/workspace/20
[Pipeline] sh
+ [ -d yes-i-still-love-you]
/home/evgeni/jenkins/workspace/20@tmp/durable-30c2baba/script.sh: 1: [: missing ]
+ git clone https://EvgeniErmakov:****@github.com/EvgeniErmakov/yes-i-still-love-you.git
Cloning into 'yes-i-still-love-you'...
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (6. Push git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ date +%T %D
+ DATE_TEST=19:34:17 10/08/22
+ cp result.log yes-i-still-love-you/result.log
+ cd yes-i-still-love-you
+ git config user.email evgeniermakov1994@gmail.com
+ git config user.name Jenkins
+ git add --all
+ git commit -m 19:34:17 10/08/22
[master 7cf6aef] 19:34:17 10/08/22
 1 file changed, 22 insertions(+), 22 deletions(-)
 rewrite result.log (67%)
+ git push https://EvgeniErmakov:****@github.com/EvgeniErmakov/yes-i-still-love-you.git
To https://github.com/EvgeniErmakov/yes-i-still-love-you.git
   c3776db..7cf6aef  master -> master
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
