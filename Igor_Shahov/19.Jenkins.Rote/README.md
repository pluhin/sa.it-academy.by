### 19. Jenkins. Routine

```
Started by user admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/projeck
[projeck] $ /bin/bash /tmp/jenkins3369960003582787626.sh
```
## Check connection to the host

```
PING 192.168.56.10 (192.168.56.10) 56(84) bytes of data.
64 bytes from 192.168.56.10: icmp_seq=1 ttl=63 time=1.04 ms
64 bytes from 192.168.56.10: icmp_seq=2 ttl=63 time=0.839 ms
64 bytes from 192.168.56.10: icmp_seq=3 ttl=63 time=0.848 ms
64 bytes from 192.168.56.10: icmp_seq=4 ttl=63 time=0.940 ms
64 bytes from 192.168.56.10: icmp_seq=5 ttl=63 time=1.87 ms

--- 192.168.56.10 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4036ms
rtt min/avg/max/mdev = 0.839/1.107/1.873/0.389 ms
```


## Install Nmap
```
Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,662 kB of archives.
After this operation, 4,499 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu focal/universe amd64 nmap amd64 7.80+dfsg1-2build1 [1,662 kB]
debconf: unable to initialize frontend: Dialog
debconf: (Dialog frontend will not work on a dumb terminal, an emacs shell buffer, or without a controlling terminal.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1,662 kB in 4s (409 kB/s)
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
(Reading database ... 51382 files and directories currently installed.)
Preparing to unpack .../nmap_7.80+dfsg1-2build1_amd64.deb ...
Unpacking nmap (7.80+dfsg1-2build1) ...
Setting up nmap (7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.9.1-1) ...
Starting Nmap 7.80 ( https://nmap.org ) at 2022-10-04 12:23 UTC
```
## Checks all online hosts
```
Nmap scan report for 192.168.56.2
Host is up (0.0018s latency).
Nmap scan report for 192.168.56.5
Host is up (0.0016s latency).
Nmap scan report for 192.168.56.10
Host is up (0.0017s latency).
Nmap scan report for 192.168.56.103
Host is up (0.0021s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 3.30 seconds
```

## Remove nmap
```
Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas3 liblinear4 liblua5.3-0 lua-lpeg nmap-common
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 4,499 kB disk space will be freed.
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
(Reading database ... 51411 files and directories currently installed.)
Removing nmap (7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.9.1-1) ...
Finished: SUCCESS
```
## Print list of collected/online hosts
```
Nmap scan report for 192.168.56.2
Host is up (0.0018s latency).
Nmap scan report for 192.168.56.5
Host is up (0.0016s latency).
Nmap scan report for 192.168.56.10
Host is up (0.0017s latency).
Nmap scan report for 192.168.56.103
Host is up (0.0021s latency).
Nmap done: 256 IP addresses (4 hosts up) scanned in 3.30 seconds
```