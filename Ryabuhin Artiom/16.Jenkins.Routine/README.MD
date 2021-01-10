# 16.Jenkins.Routine

### console output

##### test jobs

```
PATH=/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
JENKINS_VERSION=2.272
KUBERNETES_SERVICE_HOST=10.233.0.1
JENKINS_PORT_50000_TCP_ADDR=10.233.36.23
JENKINS_SERVICE_PORT=8080
JENKINS_SERVER_COOKIE=81cb907a0b3faf54
_=/usr/bin/env
Fri Jan  8 11:42:44 UTC 2021
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: tunl0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
4: eth0@if15: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether e6:3b:35:08:52:69 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.233.96.77/32 brd 10.233.96.77 scope global eth0
       valid_lft forever preferred_lft forever
Triggering a new build of 2
Finished: SUCCESS
```

```
Started by upstream project "1" build number 2
originally caused by:
 Started by user unknown or anonymous
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/2
The recommended git tool is: NONE
using credential chester_user_github
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/chester-art/sa.it-academy.by # timeout=10
Fetching upstream changes from https://github.com/chester-art/sa.it-academy.by
 > git --version # timeout=10
 > git --version # 'git version 2.11.0'
using GIT_ASKPASS to set credentials chester_user_github
 > git fetch --tags --progress -- https://github.com/chester-art/sa.it-academy.by +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse origin/master^{commit} # timeout=10
Checking out Revision c7fe392fd8b7d4161bd5a0ea94dca70e3dc6f478 (origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f c7fe392fd8b7d4161bd5a0ea94dca70e3dc6f478 # timeout=10
Commit message: "something went wrong (("
 > git rev-list --no-walk c7fe392fd8b7d4161bd5a0ea94dca70e3dc6f478 # timeout=10
[2] $ /bin/bash /tmp/jenkins3977580855899805283.sh
total 44
drwxr-xr-x 5 root root 4096 Jan  8 11:42 .
drwxr-xr-x 5 root root 4096 Jan  8 10:30 ..
drwxr-xr-x 8 root root 4096 Jan  8 11:42 .git
-rw-r--r-- 1 root root   91 Jan  8 10:30 .gitignore
drwxr-xr-x 2 root root 4096 Jan  8 11:42 01.CI.CD
drwxr-xr-x 2 root root 4096 Jan  8 11:42 02.GIT.Local
-rw-r--r-- 1 root root   25 Jan  8 11:42 2.txt
-rw-r--r-- 1 root root  769 Jan  8 11:42 README.md
-rw-r--r-- 1 root root   32 Jan  8 11:42 do_one.txt
-rw-r--r-- 1 root root   18 Jan  8 11:42 t1_dev.txt
-rw-r--r-- 1 root root   27 Jan  8 11:42 t2_dev.txt
Finished: SUCCESS
```

##### Check connection to the host

```
Started by user unknown or anonymous
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/Check_connection
[Check_connection] $ /bin/bash /tmp/jenkins3650265310622085394.sh
PING 192.168.202.14 (192.168.202.14) 56(84) bytes of data.
64 bytes from 192.168.202.14: icmp_seq=1 ttl=63 time=0.191 ms
64 bytes from 192.168.202.14: icmp_seq=2 ttl=63 time=0.181 ms
64 bytes from 192.168.202.14: icmp_seq=3 ttl=63 time=0.124 ms
64 bytes from 192.168.202.14: icmp_seq=4 ttl=63 time=0.198 ms
64 bytes from 192.168.202.14: icmp_seq=5 ttl=63 time=0.206 ms

--- 192.168.202.14 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4072ms
rtt min/avg/max/mdev = 0.124/0.180/0.206/0.029 ms
Triggering a new build of Install
Finished: SUCCESS
```

##### install nmap uninstall

```
Started by user unknown or anonymous
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/Install
[Install] $ /bin/bash -xe /tmp/jenkins8912902481827703374.sh
+ ssh 192.168.202.14 'sudo apt install nmap -y'
Warning: Permanently added '192.168.202.14' (ECDSA) to the list of known hosts.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ndiff
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 5174 kB of archives.
After this operation, 24.0 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 nmap amd64 7.60-1ubuntu5 [5174 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 5174 kB in 1s (9160 kB/s)
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
(Reading database ... 22111 files and directories currently installed.)
Preparing to unpack .../nmap_7.60-1ubuntu5_amd64.deb ...
Unpacking nmap (7.60-1ubuntu5) ...
Setting up nmap (7.60-1ubuntu5) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
+ nohup ssh 192.168.202.14 'nmap -sP 192.168.202.0/24'
Warning: Permanently added '192.168.202.14' (ECDSA) to the list of known hosts.

Starting Nmap 7.60 ( https://nmap.org ) at 2021-01-08 16:00 UTC
Nmap scan report for 192.168.202.1
Host is up (0.00067s latency).
MAC Address: 26:CD:31:95:53:E6 (Unknown)
Nmap scan report for 192.168.202.2
Host is up (0.00023s latency).
MAC Address: 3E:50:29:30:9E:E8 (Unknown)
Nmap scan report for 192.168.202.3
Host is up (0.00021s latency).
MAC Address: E2:08:FE:DD:3A:A4 (Unknown)
Nmap scan report for 192.168.202.4
Host is up (0.00023s latency).
MAC Address: 2A:35:69:11:2B:73 (Unknown)
Nmap scan report for 192.168.202.5
Host is up (0.00022s latency).
MAC Address: 4E:C7:1C:F0:26:E7 (Unknown)
Nmap scan report for 192.168.202.6
Host is up (0.00020s latency).
MAC Address: 2A:2F:2F:A0:B6:52 (Unknown)
Nmap scan report for 192.168.202.7
Host is up (0.00020s latency).
MAC Address: CA:DB:FD:93:BF:B4 (Unknown)
Nmap scan report for 192.168.202.8
Host is up (0.00020s latency).
MAC Address: 76:EF:CB:09:0D:53 (Unknown)
Nmap scan report for 192.168.202.9
Host is up (0.00020s latency).
MAC Address: 12:D6:57:29:B9:AD (Unknown)
Nmap scan report for 192.168.202.10
Host is up (0.00020s latency).
MAC Address: AA:06:BE:4C:59:C8 (Unknown)
Nmap scan report for 192.168.202.11
Host is up (0.00030s latency).
MAC Address: 5E:3D:75:BD:AB:32 (Unknown)
Nmap scan report for 192.168.202.12
Host is up (0.00049s latency).
MAC Address: 66:78:D2:E3:DD:AE (Unknown)
Nmap scan report for 192.168.202.13
Host is up (0.00068s latency).
MAC Address: 2E:82:17:C8:9D:48 (Unknown)
Nmap scan report for 192.168.202.15
Host is up (0.00031s latency).
MAC Address: 32:71:8D:CB:5D:22 (Unknown)
Nmap scan report for 192.168.202.16
Host is up (-0.10s latency).
MAC Address: CE:8A:BD:EB:32:E4 (Unknown)
Nmap scan report for 192.168.202.17
Host is up (-0.10s latency).
MAC Address: 6E:48:C0:0E:A2:23 (Unknown)
Nmap scan report for 192.168.202.18
Host is up (-0.10s latency).
MAC Address: B2:7B:C8:6F:FD:74 (Unknown)
Nmap scan report for 192.168.202.19
Host is up (-0.10s latency).
MAC Address: D2:B7:3D:FF:2C:78 (Unknown)
Nmap scan report for 192.168.202.20
Host is up (-0.10s latency).
MAC Address: D2:0F:48:C5:38:0C (Unknown)
Nmap scan report for 192.168.202.21
Host is up (-0.10s latency).
MAC Address: 6E:75:99:7C:CB:5F (Unknown)
Nmap scan report for 192.168.202.22
Host is up (-0.10s latency).
MAC Address: 8A:9F:BE:1D:EF:6F (Unknown)
Nmap scan report for 192.168.202.23
Host is up (-0.10s latency).
MAC Address: 5A:D7:22:AA:80:1B (Unknown)
Nmap scan report for 192.168.202.24
Host is up (-0.10s latency).
MAC Address: 3A:25:2B:C9:54:C4 (Unknown)
Nmap scan report for sa-ubuntu-14.it-academy.local (192.168.202.14)
Host is up.
Nmap done: 256 IP addresses (24 hosts up) scanned in 5.07 seconds
+ ssh 192.168.202.14 'sudo apt remove nmap -y'
Warning: Permanently added '192.168.202.14' (ECDSA) to the list of known hosts.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas3 liblinear3 liblua5.3-0
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 24.0 MB disk space will be freed.
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
(Reading database ... 22921 files and directories currently installed.)
Removing nmap (7.60-1ubuntu5) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Finished: SUCCESS
```

