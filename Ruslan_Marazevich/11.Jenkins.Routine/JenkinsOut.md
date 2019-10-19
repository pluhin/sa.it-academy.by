##Step1-Check-host-connectivity

```code
Started by user Jenkins John
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/sa.it-academy.by/Step1-Check-host-connectivity
[Step1-Check-host-connectivity] $ /bin/bash /tmp/jenkins13191108866863537062.sh
PING 192.168.56.50 (192.168.56.50) 56(84) bytes of data.
64 bytes from 192.168.56.50: icmp_seq=1 ttl=64 time=0.690 ms
64 bytes from 192.168.56.50: icmp_seq=2 ttl=64 time=0.206 ms
64 bytes from 192.168.56.50: icmp_seq=3 ttl=64 time=0.241 ms
64 bytes from 192.168.56.50: icmp_seq=4 ttl=64 time=0.237 ms
64 bytes from 192.168.56.50: icmp_seq=5 ttl=64 time=0.261 ms

--- 192.168.56.50 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4079ms
rtt min/avg/max/mdev = 0.206/0.327/0.690/0.182 ms
Triggering a new build of sa.it-academy.by » Step2-Nmap-Installation
Triggering a new build of sa.it-academy.by » Step2-Nmap-Installation
Finished: SUCCESS
```

##Step2-Nmap-Installation

```code
Started by upstream project "sa.it-academy.by/Step1-Check-host-connectivity" build number 25
originally caused by:
 Started by user Jenkins John
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/sa.it-academy.by/Step2-Nmap-Installation
[Step2-Nmap-Installation] $ /bin/bash /tmp/jenkins11332361774235570735.sh
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * epel: ftp.icm.edu.pl
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Package 2:nmap-6.40-19.el7.x86_64 already installed and latest version
Nothing to do
Connection to 192.168.56.50 closed.
Triggering a new build of sa.it-academy.by » Step3-Nmap-Scan
Finished: SUCCESS
```

##Step3-Nmap-Scan

```code
Started by upstream project "sa.it-academy.by/Step2-Nmap-Installation" build number 48
originally caused by:
 Started by upstream project "sa.it-academy.by/Step1-Check-host-connectivity" build number 25
 originally caused by:
  Started by user Jenkins John
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/sa.it-academy.by/Step3-Nmap-Scan
[Step3-Nmap-Scan] $ /bin/bash /tmp/jenkins4635740676149386448.sh

Starting Nmap 6.40 ( http://nmap.org ) at 2019-10-18 10:22 UTC
Nmap scan report for 192.168.56.101
Host is up (0.0017s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
8080/tcp open  http-proxy

Nmap scan report for 192.168.56.103
Host is up (0.0017s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 2 IP addresses (2 hosts up) scanned in 0.24 seconds
Connection to 192.168.56.50 closed.
Triggering a new build of sa.it-academy.by » Step4-Nmap-Uninstall
Finished: SUCCESS
```

##Step4-Nmap-Uninstall

```code
Started by upstream project "sa.it-academy.by/Step3-Nmap-Scan" build number 62
originally caused by:
 Started by upstream project "sa.it-academy.by/Step2-Nmap-Installation" build number 48
 originally caused by:
  Started by upstream project "sa.it-academy.by/Step1-Check-host-connectivity" build number 25
  originally caused by:
   Started by user Jenkins John
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/sa.it-academy.by/Step4-Nmap-Uninstall
[Step4-Nmap-Uninstall] $ /bin/bash /tmp/jenkins16073106554651236895.sh
Loaded plugins: fastestmirror
Resolving Dependencies
There are unfinished transactions remaining. You might consider running yum-complete-transaction, or "yum-complete-transaction --cleanup-only" and "yum history redo last", first to finish them. If those don't work you'll have to try removing/installing packages by hand (maybe package-cleanup can help).
--> Running transaction check
---> Package nmap.x86_64 2:6.40-19.el7 will be erased
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package        Arch             Version                  Repository       Size
================================================================================
Removing:
 nmap           x86_64           2:6.40-19.el7            @base            16 M

Transaction Summary
================================================================================
Remove  1 Package

Installed size: 16 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction

  Erasing    : 2:nmap-6.40-19.el7.x86_64                                    1/1 

  Verifying  : 2:nmap-6.40-19.el7.x86_64                                    1/1 

Removed:
  nmap.x86_64 2:6.40-19.el7                                                     

Complete!
Connection to 192.168.56.50 closed.
Finished: SUCCESS
```
