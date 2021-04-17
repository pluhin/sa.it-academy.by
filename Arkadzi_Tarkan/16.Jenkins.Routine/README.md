## Console Output

```
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/16.Jenkins.Routine
[16.Jenkins.Routine] $ /bin/bash /tmp/jenkins3586819289985422854.sh
10.233.96.29 
root

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 26 not upgraded.
Need to get 1,895 kB of archives.
After this operation, 4,622 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian buster/main amd64 nmap amd64 7.70+dfsg1-6+deb10u1 [1,895 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 1,895 kB in 0s (4,555 kB/s)
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
(Reading database ... 25245 files and directories currently installed.)
Preparing to unpack .../nmap_7.70+dfsg1-6+deb10u1_amd64.deb ...
Unpacking nmap (7.70+dfsg1-6+deb10u1) ...
Setting up nmap (7.70+dfsg1-6+deb10u1) ...
Starting Nmap 7.70 ( https://nmap.org ) at 2021-04-17 19:47 UTC

Nmap done: 256 IP addresses (0 hosts up) scanned in 206.27 seconds

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...

Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas3 libgfortran5 liblinear3 liblua5.3-0 libpcap0.8 nmap-common
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 26 not upgraded.
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
(Reading database ... 25296 files and directories currently installed.)
Removing nmap (7.70+dfsg1-6+deb10u1) ...
# Nmap 7.70 scan initiated Sat Apr 17 19:47:43 2021 as: nmap -sP -oN out_nmap 10.0.0.0/24
# Nmap done at Sat Apr 17 19:51:09 2021 -- 256 IP addresses (0 hosts up) scanned in 206.27 seconds
Finished: SUCCESS
```