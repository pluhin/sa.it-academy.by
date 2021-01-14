# 17.Jenkins.As_code

## pipeline script

```
pipeline {
    agent { label 'node_01' }
    triggers { 
        cron('H 02 * * 7')
    }
    options {
        buildDiscarder(logRotator(numToKeepStr:'5'))
        ansiColor('xterm')
    }
    stages {
        stage('01.Node_interfaces') {
            steps {
                echo 'Node_interfaces..'
                sh """
                ip a
                """
            }
        }
        stage('02.Installing nmap, scaning') {
            steps {
                echo 'installing nmap & scaning..'
                sh """
                sudo apt install nmap -y
                date > report.txt
                echo -e "\\n" >> report.txt
                nmap -sP 192.168.201.0/24 >> report.txt
                echo -e "\\n" >> report.txt
                cat report.txt
                """
            }
        }
        stage('03.Removing nmap') {
            steps {
                echo 'removing nmap..'
                sh """
                sudo apt remove nmap -y
                """
            }
        }
        stage('04.Installing speedtest') {
            steps {
                echo 'installing speedtest..'
                sh """
                sudo apt install speedtest-cli -y
                """
            }
        }
        stage('05.Speed testing') {
            steps {
                echo 'Testing..'
                sh """
                speedtest | tee -a report.txt
                """
            }
        }
        stage('06.Removing speedtest') {
            steps {
                echo 'removing speedtest..'
                sh """
                apt remove speedtest-cli -y
                """
            }
        }
        stage('07.Add, Commit & Push report.txt to the GitHub') { 
            steps { 
                echo 'pushing the new report.txt..'
                sh """
                mkdir /var/lib/jenkins/report
                cp report.txt /var/lib/jenkins/report/
                cd /var/lib/jenkins/report/
                git init
                git add report.txt
                git remote add origin git@github.com:CHESTER-ART/jenkins.git
                git commit -m "report.txt from node_01"
                git branch -M main
                git push -u origin main
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
```

## output jenkins

```
Started by user unknown or anonymous
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Node_01 in /var/lib/jenkins/workspace/Pipeline_01
[Pipeline] {
[Pipeline] ansiColor
[Pipeline] {

[Pipeline] stage
[Pipeline] { (01.Node_interfaces)
[Pipeline] echo
Node_interfaces..
[Pipeline] sh
+ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
82: eth0@if83: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 12:94:14:26:d9:b8 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.201.7/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::1094:14ff:fe26:d9b8/64 scope link 
       valid_lft forever preferred_lft forever
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (02.Installing nmap, scaning)
[Pipeline] echo
installing nmap & scaning..
[Pipeline] sh
+ sudo apt install nmap -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 147 not upgraded.
Need to get 4638 kB of archives.
After this operation, 21.3 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/main amd64 nmap amd64 7.01-2ubuntu2 [4638 kB]
dpkg-preconfigure: unable to re-open stdin: No such file or directory
Fetched 4638 kB in 0s (10.1 MB/s)
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
(Reading database ... 54496 files and directories currently installed.)
Preparing to unpack .../nmap_7.01-2ubuntu2_amd64.deb ...
Unpacking nmap (7.01-2ubuntu2) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up nmap (7.01-2ubuntu2) ...
+ date
+ echo -e '\n'
+ nmap -sP 192.168.201.0/24
+ echo -e '\n'
+ cat report.txt
Wed Jan 13 21:38:03 UTC 2021



Starting Nmap 7.01 ( https://nmap.org ) at 2021-01-13 21:38 UTC
Nmap scan report for 192.168.201.1
Host is up (0.00063s latency).
MAC Address: 7E:19:50:CD:16:53 (Unknown)
Nmap scan report for 192.168.201.2
Host is up (0.00024s latency).
MAC Address: 2A:F0:3E:D7:77:76 (Unknown)
Nmap scan report for 192.168.201.3
Host is up (0.00026s latency).
MAC Address: A6:E9:11:0D:33:7C (Unknown)
Nmap scan report for 192.168.201.4
Host is up (0.00023s latency).
MAC Address: 6E:09:5C:E9:6C:1C (Unknown)
Nmap scan report for 192.168.201.5
Host is up (0.00020s latency).
MAC Address: 06:C1:A8:A5:12:58 (Unknown)
Nmap scan report for 192.168.201.6
Host is up (0.00020s latency).
MAC Address: FE:BE:57:1F:E7:7D (Unknown)
Nmap scan report for 192.168.201.8
Host is up (0.00019s latency).
MAC Address: 62:D2:82:42:D4:DE (Unknown)
Nmap scan report for 192.168.201.9
Host is up (0.00021s latency).
MAC Address: A2:ED:03:12:EB:C7 (Unknown)
Nmap scan report for 192.168.201.10
Host is up (0.00020s latency).
MAC Address: D2:5C:89:9F:55:F3 (Unknown)
Nmap scan report for 192.168.201.11
Host is up (0.00019s latency).
MAC Address: 4E:3C:97:4A:24:ED (Unknown)
Nmap scan report for 192.168.201.12
Host is up (0.00028s latency).
MAC Address: 72:25:80:D4:BA:8C (Unknown)
Nmap scan report for ws-7.it-academy.local (192.168.201.7)
Host is up.
Nmap done: 256 IP addresses (12 hosts up) scanned in 4.01 seconds


[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (03.Removing nmap)
[Pipeline] echo
removing nmap..
[Pipeline] sh
+ sudo apt remove nmap -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas-common libblas3 liblinear3 liblua5.2-0 libxslt1.1 lua-lpeg ndiff
  python-bs4 python-chardet python-html5lib python-lxml python-pkg-resources
  python-six
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 147 not upgraded.
After this operation, 21.3 MB disk space will be freed.
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
(Reading database ... 55227 files and directories currently installed.)
Removing nmap (7.01-2ubuntu2) ...
Processing triggers for man-db (2.7.5-1) ...
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (04.Installing speedtest)
[Pipeline] echo
installing speedtest..
[Pipeline] sh
+ sudo apt install speedtest-cli -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas-common libblas3 liblinear3 liblua5.2-0 libxslt1.1 lua-lpeg ndiff
  python-bs4 python-chardet python-html5lib python-lxml python-six
Use 'sudo apt autoremove' to remove them.
The following NEW packages will be installed:
  speedtest-cli
0 upgraded, 1 newly installed, 0 to remove and 147 not upgraded.
Need to get 13.1 kB of archives.
After this operation, 64.5 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial/universe amd64 speedtest-cli all 0.3.4-1 [13.1 kB]
dpkg-preconfigure: unable to re-open stdin: No such file or directory
Fetched 13.1 kB in 0s (93.0 kB/s)
Selecting previously unselected package speedtest-cli.
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
(Reading database ... 54496 files and directories currently installed.)
Preparing to unpack .../speedtest-cli_0.3.4-1_all.deb ...
Unpacking speedtest-cli (0.3.4-1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up speedtest-cli (0.3.4-1) ...
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (05.Speed testing)
[Pipeline] echo
Testing..
[Pipeline] sh
+ speedtest
+ tee -a report.txt
Retrieving speedtest.net configuration...
Retrieving speedtest.net server list...
Testing from COSMOS Telecom (178.172.195.18)...
Selecting best server based on latency...
Hosted by Mobile TeleSystems JLLC (Minsk) [0.00 km]: 14.318 ms
Testing download speed........................................
Download: 812.17 Mbit/s
Testing upload speed..................................................
Upload: 238.07 Mbit/s
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (06.Removing speedtest)
[Pipeline] echo
removing speedtest..
[Pipeline] sh
+ apt remove speedtest-cli -y

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas-common libblas3 liblinear3 liblua5.2-0 libxslt1.1 lua-lpeg ndiff
  python-bs4 python-chardet python-html5lib python-lxml python-pkg-resources
  python-six
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  speedtest-cli
0 upgraded, 0 newly installed, 1 to remove and 147 not upgraded.
After this operation, 64.5 kB disk space will be freed.
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
(Reading database ... 54510 files and directories currently installed.)
Removing speedtest-cli (0.3.4-1) ...
Processing triggers for man-db (2.7.5-1) ...
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (07.Add, Commit & Push report.txt to the GitHub)
[Pipeline] echo
pushing the new report.txt..
[Pipeline] sh
+ mkdir /var/lib/jenkins/report
+ cp report.txt /var/lib/jenkins/report/
+ cd /var/lib/jenkins/report/
+ git init
Initialized empty Git repository in /var/lib/jenkins/report/.git/
+ git add report.txt
+ git remote add origin git@github.com:CHESTER-ART/jenkins.git
+ git commit -m 'report.txt from node_01'
[master (root-commit) 1ee5eb2] report.txt from node_01
 Committer: root <root@ws-7.it-academy.local>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 1 file changed, 52 insertions(+)
 create mode 100644 report.txt
+ git branch -M main
+ git push -u origin main
To git@github.com:CHESTER-ART/jenkins.git
 * [new branch]      main -> main
Branch main set up to track remote branch main from origin.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Done message)
[Pipeline] echo
Done....
[Pipeline] }
[Pipeline] // stage
[Pipeline] }

[Pipeline] // ansiColor
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```

## report.txt

```
root@ws-7:/var/lib/jenkins/report# cat report.txt
Wed Jan 13 21:38:03 UTC 2021



Starting Nmap 7.01 ( https://nmap.org ) at 2021-01-13 21:38 UTC
Nmap scan report for 192.168.201.1
Host is up (0.00063s latency).
MAC Address: 7E:19:50:CD:16:53 (Unknown)
Nmap scan report for 192.168.201.2
Host is up (0.00024s latency).
MAC Address: 2A:F0:3E:D7:77:76 (Unknown)
Nmap scan report for 192.168.201.3
Host is up (0.00026s latency).
MAC Address: A6:E9:11:0D:33:7C (Unknown)
Nmap scan report for 192.168.201.4
Host is up (0.00023s latency).
MAC Address: 6E:09:5C:E9:6C:1C (Unknown)
Nmap scan report for 192.168.201.5
Host is up (0.00020s latency).
MAC Address: 06:C1:A8:A5:12:58 (Unknown)
Nmap scan report for 192.168.201.6
Host is up (0.00020s latency).
MAC Address: FE:BE:57:1F:E7:7D (Unknown)
Nmap scan report for 192.168.201.8
Host is up (0.00019s latency).
MAC Address: 62:D2:82:42:D4:DE (Unknown)
Nmap scan report for 192.168.201.9
Host is up (0.00021s latency).
MAC Address: A2:ED:03:12:EB:C7 (Unknown)
Nmap scan report for 192.168.201.10
Host is up (0.00020s latency).
MAC Address: D2:5C:89:9F:55:F3 (Unknown)
Nmap scan report for 192.168.201.11
Host is up (0.00019s latency).
MAC Address: 4E:3C:97:4A:24:ED (Unknown)
Nmap scan report for 192.168.201.12
Host is up (0.00028s latency).
MAC Address: 72:25:80:D4:BA:8C (Unknown)
Nmap scan report for ws-7.it-academy.local (192.168.201.7)
Host is up.
Nmap done: 256 IP addresses (12 hosts up) scanned in 4.01 seconds


Retrieving speedtest.net configuration...
Retrieving speedtest.net server list...
Testing from COSMOS Telecom (178.172.195.18)...
Selecting best server based on latency...
Hosted by Mobile TeleSystems JLLC (Minsk) [0.00 km]: 14.318 ms
Testing download speed........................................
Download: 812.17 Mbit/s
Testing upload speed..................................................
Upload: 238.07 Mbit/s
root@ws-7:/var/lib/jenkins/report#
```
