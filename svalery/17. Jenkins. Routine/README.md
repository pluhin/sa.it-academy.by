```bash
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/Routine
[Routine] $ /bin/bash -xe /tmp/jenkins9120088334241281674.sh
+ sshpass -p XXXXXX ssh -o StrictHostKeyChecking=no root@192.168.202.29
Pseudo-terminal will not be allocated because stdin is not a terminal.
Warning: Permanently added '192.168.202.29' (ECDSA) to the list of known hosts.
Last failed login: Mon Aug 16 14:51:15 UTC 2021 from 192.168.203.29 on ssh:notty
There were 2 failed login attempts since the last successful login.
+ apt-get update
Hit:1 http://deb.debian.org/debian buster InRelease
Hit:2 https://download.docker.com/linux/debian buster InRelease
Hit:3 http://deb.debian.org/debian buster-updates InRelease
Hit:4 http://security.debian.org/debian-security buster/updates InRelease
Reading package lists...
+ apt-get -y install nmap
Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 3 not upgraded.
Need to get 1,894 kB of archives.
After this operation, 4,622 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian buster/main amd64 nmap amd64 7.70+dfsg1-6+deb10u2 [1,894 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 1,894 kB in 0s (5,888 kB/s)
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
(Reading database ... 25213 files and directories currently installed.)
Preparing to unpack .../nmap_7.70+dfsg1-6+deb10u2_amd64.deb ...
Unpacking nmap (7.70+dfsg1-6+deb10u2) ...
Setting up nmap (7.70+dfsg1-6+deb10u2) ...
+ nmap -sP 192.168.202.25-30
Starting Nmap 7.70 ( https://nmap.org ) at 2021-08-16 17:32 UTC
Nmap scan report for 192.168.202.25
Host is up (0.0025s latency).
Nmap scan report for 192.168.202.26
Host is up (0.0029s latency).
Nmap scan report for 192.168.202.27
Host is up (0.0027s latency).
Nmap scan report for 192.168.202.28
Host is up (0.0027s latency).
Nmap scan report for 192.168.202.29
Host is up (0.0025s latency).
Nmap scan report for 192.168.202.30
Host is up (0.0025s latency).
Nmap done: 6 IP addresses (6 hosts up) scanned in 0.30 seconds
+ apt-get -y remove nmap
Reading package lists...
Building dependency tree...
Reading state information...

The following packages were automatically installed and are no longer required:
  libblas3 libgfortran5 liblinear3 liblua5.3-0 libpcap0.8 nmap-common
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 3 not upgraded.
After this operation, 4,622 kB disk space will be freed.
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
(Reading database ... 25264 files and directories currently installed.)
Removing nmap (7.70+dfsg1-6+deb10u2) ...
Finished: SUCCESS
```