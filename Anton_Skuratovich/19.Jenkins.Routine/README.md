# Jenkins Routine
```bash
Started by user admin
Running as SYSTEM
Building on the built-in node in workspace /var/lib/jenkins/workspace/19.Jenkins.Routine
[19.Jenkins.Routine] $ /bin/bash /tmp/jenkins9009336622097754130.sh
---------------------------Check availability 192.168.31.203:--------------------------------
PING 192.168.31.203 (192.168.31.203) 56(84) bytes of data.
64 bytes from 192.168.31.203: icmp_seq=1 ttl=64 time=0.959 ms
64 bytes from 192.168.31.203: icmp_seq=2 ttl=64 time=1.33 ms
64 bytes from 192.168.31.203: icmp_seq=3 ttl=64 time=0.679 ms

--- 192.168.31.203 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2008ms
rtt min/avg/max/mdev = 0.679/0.989/1.331/0.267 ms
---------------------------Connect SSH vagrant@192.168.31.203:-----------------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.0-30-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Sep 29 10:26:44 AM UTC 2022

  System load:  0.00244140625      Processes:             105
  Usage of /:   12.5% of 30.34GB   Users logged in:       0
  Memory usage: 22%                IPv4 address for eth0: 10.0.2.15
  Swap usage:   0%                 IPv4 address for eth1: 192.168.31.203


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
------------------------------Update packages---------------------------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://in.archive.ubuntu.com/ubuntu jammy InRelease
Hit:2 http://in.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://in.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists...
Building dependency tree...
Reading state information...
110 packages can be upgraded. Run 'apt list --upgradable' to see them.
--------------------------------Install nmap----------------------------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 110 not upgraded.
Need to get 1,731 kB of archives.
After this operation, 4,341 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu jammy/universe amd64 nmap amd64 7.91+dfsg1+really7.80+dfsg1-2build1 [1,731 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1,731 kB in 18s (96.1 kB/s)
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
(Reading database ... 44429 files and directories currently installed.)
Preparing to unpack .../nmap_7.91+dfsg1+really7.80+dfsg1-2build1_amd64.deb ...
Unpacking nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Setting up nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.10.2-1) ...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
---------------------------------Checks all online hosts----------------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.
Starting Nmap 7.80 ( https://nmap.org ) at 2022-09-29 10:27 UTC
Nmap scan report for XiaoQiang (192.168.31.1)
Host is up (0.0028s latency).
Nmap scan report for S10-pol-zovatela-Elena (192.168.31.71)
Host is up (0.0083s latency).
Nmap scan report for yeelink-light-strip1_miio81031899 (192.168.31.163)
Host is up (0.015s latency).
Nmap scan report for 192.168.31.192
Host is up (0.030s latency).
Nmap scan report for 192.168.31.201
Host is up (0.0069s latency).
Nmap scan report for vagrant (192.168.31.203)
Host is up (0.0063s latency).
Nmap done: 256 IP addresses (6 hosts up) scanned in 3.61 seconds
---------------------------------Remove nmap----------------------------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas3 liblinear4 liblua5.3-0 lua-lpeg nmap-common
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 110 not upgraded.
After this operation, 4,341 kB disk space will be freed.
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
(Reading database ... 44456 files and directories currently installed.)
Removing nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.10.2-1) ...
-------------------------Print list of collected/online hosts-----------------------
Pseudo-terminal will not be allocated because stdin is not a terminal.
# Nmap 7.80 scan initiated Thu Sep 29 10:27:07 2022 as: nmap -sn -oG nmap.log 192.168.31.203/24
Host: 192.168.31.1 (XiaoQiang)	Status: Up
Host: 192.168.31.71 (S10-pol-zovatela-Elena)	Status: Up
Host: 192.168.31.163 (yeelink-light-strip1_miio81031899)	Status: Up
Host: 192.168.31.192 ()	Status: Up
Host: 192.168.31.201 ()	Status: Up
Host: 192.168.31.203 (vagrant)	Status: Up
# Nmap done at Thu Sep 29 10:27:11 2022 -- 256 IP addresses (6 hosts up) scanned in 3.61 seconds
Finished: SUCCESS
```
### Execute shell
```bash
#!/bin/bash
echo "---------------------------Check availability $host:--------------------------------" 
ping -c 3 $host
echo "---------------------------Connect SSH $username@$host:-----------------------------"
ssh $username@$host -oStrictHostKeyChecking=no
echo "------------------------------Update packages---------------------------------------"
ssh -t $username@$host 'sudo apt update'
echo "--------------------------------Install nmap----------------------------------------"
ssh -t $username@$host 'sudo apt install nmap -y'
echo "---------------------------------Checks all online hosts----------------------------"
ssh -t $username@$host nmap -sn $host/24 -oG nmap.log
echo "---------------------------------Remove nmap----------------------------------------"
ssh -t $username@$host 'sudo apt remove nmap -y'
echo "-------------------------Print list of collected/online hosts-----------------------"
ssh -t $username@$host 'cat nmap.log'
```