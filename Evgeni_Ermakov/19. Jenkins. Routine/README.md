## 19. Jenkins. Routine

### Task

* Parameters: host IP and credentials
* Check connection to the host
* Install/upgrade nmap
* Checks all online hosts
* Remove nmap
* Print list of collected/online hosts

### Console STDOUT

```bash
Started by user Evgeni
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/hw_19
[hw_19] $ /bin/bash /tmp/jenkins15039284861861287820.sh
--- PING ---
PING 192.168.31.119 (192.168.31.119) 56(84) bytes of data.
64 bytes from 192.168.31.119: icmp_seq=1 ttl=64 time=0.180 ms
64 bytes from 192.168.31.119: icmp_seq=2 ttl=64 time=0.242 ms
64 bytes from 192.168.31.119: icmp_seq=3 ttl=64 time=0.184 ms
64 bytes from 192.168.31.119: icmp_seq=4 ttl=64 time=0.185 ms
64 bytes from 192.168.31.119: icmp_seq=5 ttl=64 time=0.226 ms
64 bytes from 192.168.31.119: icmp_seq=6 ttl=64 time=0.227 ms
64 bytes from 192.168.31.119: icmp_seq=7 ttl=64 time=0.199 ms

--- 192.168.31.119 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6134ms
rtt min/avg/max/mdev = 0.180/0.206/0.242/0.023 ms

--- INSTALL NMAP ---

Reading package lists... 0%

Reading package lists... 100%

Reading package lists... Done



Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 50%

Building dependency tree... 50%

Building dependency tree... Done



Reading state information... 0% 

Reading state information... 0%

Reading state information... Done


Suggested packages:

  ncat ndiff zenmap

The following NEW packages will be installed

  nmap

0 to upgrade, 1 to newly install, 0 to remove and 118 not to upgrade.

Need to get 1,731 kB of archives.

After this operation, 4,341 kB of additional disk space will be used.

0% [Working][0m[33m
0% [Connecting to mirror.linux-ia64.org][0m
                                        
Get:1 https://mirror.linux-ia64.org/ubuntu jammy/universe amd64 nmap amd64 7.91+dfsg1+really7.80+dfsg1-2build1 [1,731 kB]

35% [1 nmap 758 kB/1,731 kB 44%][0m[33m
                                
100% [Working][0m
              
Fetched 1,731 kB in 11s (156 kB/s)

debconf: Unable to initialise frontend: Dialog

debconf: (Dialogue frontend will not work on a dumb terminal, an Emacs shell buffer, or without a controlling terminal.)

debconf: falling back to frontend: Readline

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
(Reading database ... 243517 files and directories currently installed.)


Preparing to unpack .../nmap_7.91+dfsg1+really7.80+dfsg1-2build1_amd64.deb ...


Unpacking nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...


Setting up nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...


Processing triggers for man-db (2.10.2-1) ...


--- Scanning ---
Starting Nmap 7.80 ( https://nmap.org ) at 2022-10-02 10:36 +03
Nmap scan report for XiaoQiang (192.168.31.1)
Host is up (0.0014s latency).
Nmap scan report for ngin.k8s-10.sa (192.168.31.119)
Host is up (0.000050s latency).
Nmap scan report for jenkins.9.sa (192.168.31.130)
Host is up (0.00083s latency).
Nmap scan report for legion (192.168.31.217)
Host is up (0.00013s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 2.71 seconds

--- REMOVE NMAP ---

Reading package lists... 0%

Reading package lists... 100%

Reading package lists... Done



Building dependency tree... 0%

Building dependency tree... 0%

Building dependency tree... 50%

Building dependency tree... 50%

Building dependency tree... Done



Reading state information... 0% 

Reading state information... 0%

Reading state information... Done


The following packages were automatically installed and are no longer required:

  libblas3 liblinear4 lua-lpeg nmap-common

Use 'sudo apt autoremove' to remove them.

The following packages will be REMOVED

  nmap

0 to upgrade, 0 to newly install, 1 to remove and 118 not to upgrade.

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
(Reading database ... 243549 files and directories currently installed.)


Removing nmap (7.91+dfsg1+really7.80+dfsg1-2build1) ...


Processing triggers for man-db (2.10.2-1) ...


--- NMAP RESULTS ---
# Nmap 7.80 scan initiated Sun Oct  2 10:36:12 2022 as: nmap -sP -oN log.log 192.168.31.*
Nmap scan report for XiaoQiang (192.168.31.1)
Host is up (0.0014s latency).
Nmap scan report for ngin.k8s-10.sa (192.168.31.119)
Host is up (0.000050s latency).
Nmap scan report for jenkins.9.sa (192.168.31.130)
Host is up (0.00083s latency).
Nmap scan report for legion (192.168.31.217)
Host is up (0.00013s latency).
# Nmap done at Sun Oct  2 10:36:14 2022 -- 256 IP addresses (4 hosts up) scanned in 2.71 seconds
Connection to 192.168.31.119 closed.
Finished: SUCCESS
```
