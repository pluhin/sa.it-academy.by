# 16.Jenkins.Routine



## On local jenkins master

vagrant ssh\
sudo -i\
su - jenkins
# Console Output


```
 Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/16.Jenkins.Routine/hw
[hw] $ /bin/sh /tmp/jenkins557670657883232829.sh
PING 192.168.100.200(192.168.100.200) 56(84) bytes of data.
64 bytes from 192.168.100.200: icmp_seq=1 ttl=64 time=0.109 ms
64 bytes from 192.168.100.200: icmp_seq=2 ttl=64 time=0.103 ms
64 bytes from 192.168.100.200: icmp_seq=3 ttl=64 time=0.097 ms

--- 192.168.100.200 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 50ms
rtt min/avg/max/mdev = 0.097/0.103/0.109/0.005 ms
[hw] $ /bin/bash /tmp/jenkins571424443393226110.sh

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://deb.debian.org/debian buster InRelease
Hit:2 http://deb.debian.org/debian buster-updates InRelease
Hit:3 http://security.debian.org/debian-security buster/updates InRelease
Hit:4 https://download.docker.com/linux/debian buster InRelease
Hit:5 https://packagecloud.io/github/git-lfs/debian buster InRelease
Reading package lists...
Building dependency tree...
Reading state information...
4 packages can be upgraded. Run 'apt list --upgradable' to see them.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libblas3 libgfortran5 liblinear3 liblua5.3-0 libpcap0.8 nmap-common
Suggested packages:
  liblinear-tools liblinear-dev ncat ndiff zenmap
The following NEW packages will be installed:
  libblas3 libgfortran5 liblinear3 liblua5.3-0 libpcap0.8 nmap nmap-common
0 upgraded, 7 newly installed, 0 to remove and 4 not upgraded.
Need to get 6,822 kB of archives.
After this operation, 29.7 MB of additional disk space will be used.
Get:1 http://deb.debian.org/debian buster/main amd64 libgfortran5 amd64 8.3.0-6 [581 kB]
Get:2 http://deb.debian.org/debian buster/main amd64 libblas3 amd64 3.8.0-2 [148 kB]
Get:3 http://deb.debian.org/debian buster/main amd64 liblinear3 amd64 2.1.0+dfsg-4 [41.2 kB]
Get:4 http://deb.debian.org/debian buster/main amd64 liblua5.3-0 amd64 5.3.3-1.1 [120 kB]
Get:5 http://deb.debian.org/debian buster/main amd64 libpcap0.8 amd64 1.8.1-6 [139 kB]
Get:6 http://deb.debian.org/debian buster/main amd64 nmap-common all 7.70+dfsg1-6+deb10u1 [3,898 kB]
Get:7 http://deb.debian.org/debian buster/main amd64 nmap amd64 7.70+dfsg1-6+deb10u1 [1,895 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 6,822 kB in 1s (11.2 MB/s)
Selecting previously unselected package libgfortran5:amd64.
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
(Reading database ... 24407 files and directories currently installed.)
Preparing to unpack .../0-libgfortran5_8.3.0-6_amd64.deb ...
Unpacking libgfortran5:amd64 (8.3.0-6) ...
Selecting previously unselected package libblas3:amd64.
Preparing to unpack .../1-libblas3_3.8.0-2_amd64.deb ...
Unpacking libblas3:amd64 (3.8.0-2) ...
Selecting previously unselected package liblinear3:amd64.
Preparing to unpack .../2-liblinear3_2.1.0+dfsg-4_amd64.deb ...
Unpacking liblinear3:amd64 (2.1.0+dfsg-4) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../3-liblua5.3-0_5.3.3-1.1_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.3-1.1) ...
Selecting previously unselected package libpcap0.8:amd64.
Preparing to unpack .../4-libpcap0.8_1.8.1-6_amd64.deb ...
Unpacking libpcap0.8:amd64 (1.8.1-6) ...
Selecting previously unselected package nmap-common.
Preparing to unpack .../5-nmap-common_7.70+dfsg1-6+deb10u1_all.deb ...
Unpacking nmap-common (7.70+dfsg1-6+deb10u1) ...
Selecting previously unselected package nmap.
Preparing to unpack .../6-nmap_7.70+dfsg1-6+deb10u1_amd64.deb ...
Unpacking nmap (7.70+dfsg1-6+deb10u1) ...
Setting up libpcap0.8:amd64 (1.8.1-6) ...
Setting up libgfortran5:amd64 (8.3.0-6) ...
Setting up nmap-common (7.70+dfsg1-6+deb10u1) ...
Setting up liblua5.3-0:amd64 (5.3.3-1.1) ...
Setting up libblas3:amd64 (3.8.0-2) ...
update-alternatives: using /usr/lib/x86_64-linux-gnu/blas/libblas.so.3 to provide /usr/lib/x86_64-linux-gnu/libblas.so.3 (libblas.so.3-x86_64-linux-gnu) in auto mode
Setting up liblinear3:amd64 (2.1.0+dfsg-4) ...
Setting up nmap (7.70+dfsg1-6+deb10u1) ...
Processing triggers for libc-bin (2.28-10) ...
Starting Nmap 7.70 ( https://nmap.org ) at 2021-04-19 13:46 UTC
Nmap scan report for 192.168.100.1
Host is up (0.00040s latency).
Nmap scan report for 192.168.100.2
Host is up (0.00032s latency).
Nmap scan report for 192.168.100.3
Host is up (0.00027s latency).
Nmap scan report for 192.168.100.4
Host is up (0.00024s latency).
Nmap scan report for 192.168.100.5
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.6
Host is up (0.00022s latency).
Nmap scan report for 192.168.100.7
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.8
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.9
Host is up (0.00022s latency).
Nmap scan report for 192.168.100.10
Host is up (0.00031s latency).
Nmap scan report for 192.168.100-11
Host is up (0.000069s latency).
Nmap scan report for 192.168.100.12
Host is up (0.018s latency).
Nmap scan report for 192.168.100.13
Host is up (0.00049s latency).
Nmap scan report for 192.168.100.14
Host is up (0.00035s latency).
Nmap scan report for 192.168.100.15
Host is up (0.0011s latency).
Nmap scan report for 192.168.100.16
Host is up (0.0010s latency).
Nmap scan report for 192.168.100.17
Host is up (0.00100s latency).
Nmap scan report for 192.168.100.18
Host is up (0.00097s latency).
Nmap scan report for 192.168.100.19
Host is up (0.00094s latency).
Nmap scan report for 192.168.100.20
Host is up (0.00092s latency).
Nmap scan report for 192.168.100.21
Host is up (0.00089s latency).
Nmap scan report for 192.168.100.22
Host is up (0.00086s latency).
Nmap scan report for 192.168.100.24
Host is up (0.0025s latency).
Nmap done: 256 IP addresses (23 hosts up) scanned in 16.51 seconds
[hw] $ /bin/bash /tmp/jenkins5906311417594473772.sh

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages will be REMOVED:
  libblas3* libgfortran5* liblinear3* liblua5.3-0* libpcap0.8* nmap*
  nmap-common*
0 upgraded, 0 newly installed, 7 to remove and 4 not upgraded.
After this operation, 29.7 MB disk space will be freed.
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
(Reading database ... 25296 files and directories currently installed.)
Removing nmap (7.70+dfsg1-6+deb10u1) ...
Removing liblinear3:amd64 (2.1.0+dfsg-4) ...
Removing libblas3:amd64 (3.8.0-2) ...
Removing libgfortran5:amd64 (8.3.0-6) ...
Removing liblua5.3-0:amd64 (5.3.3-1.1) ...
Removing libpcap0.8:amd64 (1.8.1-6) ...
Removing nmap-common (7.70+dfsg1-6+deb10u1) ...
Processing triggers for libc-bin (2.28-10) ...
[hw] $ /bin/bash /tmp/jenkins1646911835015000627.sh
########HOSTS ONLINE#############
# Nmap 7.70 scan initiated Thu Apr 29 13:46:43 2021 as: nmap -sP -o output.xml 192.168.100.0/24
Nmap scan report for 192.168.100.1
Host is up (0.00040s latency).
Nmap scan report for 192.168.100.2
Host is up (0.00032s latency).
Nmap scan report for 192.168.100.3
Host is up (0.00027s latency).
Nmap scan report for 192.168.100.4
Host is up (0.00024s latency).
Nmap scan report for 192.168.100.5
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.6
Host is up (0.00022s latency).
Nmap scan report for 192.168.100.7
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.8
Host is up (0.00020s latency).
Nmap scan report for 192.168.100.9
Host is up (0.00022s latency).
Nmap scan report for 192.168.100.10
Host is up (0.00031s latency).
Nmap scan report for 192-168-100-11.
Host is up (0.000069s latency).
Nmap scan report for 192.168.100.12
Host is up (0.018s latency).
Nmap scan report for 192.168.100.13
Host is up (0.00049s latency).
Nmap scan report for 192.168.100.14
Host is up (0.00035s latency).
Nmap scan report for 192.168.100.15
Host is up (0.0011s latency).
Nmap scan report for 192.168.100.16
Host is up (0.0010s latency).
Nmap scan report for 192.168.100.17
Host is up (0.00100s latency).
Nmap scan report for 192.168.100.18
Host is up (0.00097s latency).
Nmap scan report for 192.168.100.19
Host is up (0.00094s latency).
Nmap scan report for 192.168.100.20
Host is up (0.00092s latency).
Nmap scan report for 192.168.100.21
Host is up (0.00089s latency).
Nmap scan report for 192.168.100.22
Host is up (0.00086s latency).
Nmap scan report for 192.168.100.24
Host is up (0.0025s latency).
# Nmap done at Thu Apr 29 13:46:59 2021 -- 256 IP addresses (23 hosts up) scanned in 26.51 seconds
Finished: SUCCESS
```