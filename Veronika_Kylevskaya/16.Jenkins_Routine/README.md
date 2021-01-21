## Check connection to the host
```bash
Started by user unknown or anonymous
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/test02
[Checks API] No suitable checks publisher found.
SSH: Connecting from host [jenkins-54d947fd66-t6mfz]
SSH: Connecting with configuration [203.12] ...
SSH: Creating session: username [root], hostname [192.168.203.12], port [22]
SSH: Connecting session ...
SSH: Connected
SSH: Opening SFTP channel ...
SSH: SFTP channel open
SSH: Connecting SFTP channel ...
SSH: Connected
SSH: Remote root is not absolute, getting absolute directory from PWD
SSH: Opening exec channel ...
SSH: EXEC: channel open
SSH: EXEC: STDOUT/STDERR from command [ip a] ...
SSH: EXEC: connected
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens18: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 1a:9f:37:cd:f5:53 brd ff:ff:ff:ff:ff:ff
    inet 192.168.203.12/16 brd 192.168.255.255 scope global ens18
       valid_lft forever preferred_lft forever
    inet6 fe80::189f:37ff:fecd:f553/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:2c:a5:dd:ce brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
4: nodelocaldns: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default 
    link/ether 4e:da:3d:06:56:84 brd ff:ff:ff:ff:ff:ff
    inet 169.254.25.10/32 brd 169.254.25.10 scope global nodelocaldns
       valid_lft forever preferred_lft forever
5: kube-ipvs0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default 
    link/ether f2:61:47:35:da:c3 brd ff:ff:ff:ff:ff:ff
    inet 10.233.0.3/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.30.93/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.27.224/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.27.138/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.53.147/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.49.71/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.13.235/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.19.131/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.57.70/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.1.193/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.54.17/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
    inet 10.233.0.1/32 scope global kube-ipvs0
       valid_lft forever preferred_lft forever
6: calief920b2144b@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
7: cali9567862e0a4@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 1
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
8: cali5d63b71bf76@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 2
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
9: tunl0@NONE: <NOARP,UP,LOWER_UP> mtu 1440 qdisc noqueue state UNKNOWN group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
    inet 10.233.96.0/32 brd 10.233.96.0 scope global tunl0
       valid_lft forever preferred_lft forever
10: cali34f679847ef@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 3
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
13: calia50c0aa4086@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 4
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
14: cali43b1a4ff374@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 5
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
15: califc2c4b132fd@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default 
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netnsid 6
    inet6 fe80::ecee:eeff:feee:eeee/64 scope link 
       valid_lft forever preferred_lft forever
SSH: EXEC: completed after 200 ms
```
## Install nmap
```bash
SSH: Opening exec channel ...
SSH: EXEC: channel open
SSH: EXEC: STDOUT/STDERR from command [apt install nmap -y] ...
SSH: EXEC: connected

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 35 not upgraded.
Need to get 1,895 kB of archives.
After this operation, 4,622 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian buster/main amd64 nmap amd64 7.70+dfsg1-6+deb10u1 [1,895 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1,895 kB in 10s (183 kB/s)
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
(Reading database ... 60632 files and directories currently installed.)
Preparing to unpack .../nmap_7.70+dfsg1-6+deb10u1_amd64.deb ...
Unpacking nmap (7.70+dfsg1-6+deb10u1) ...
Setting up nmap (7.70+dfsg1-6+deb10u1) ...
Processing triggers for man-db (2.8.5-2) ...
SSH: EXEC: completed after 12,006 ms
```
## Checks all online hosts
```bash
SSH: Opening exec channel ...
SSH: EXEC: channel open
SSH: EXEC: STDOUT/STDERR from command [nmap -sP 192.168.203.1-10] ...
SSH: EXEC: connected
Starting Nmap 7.70 ( https://nmap.org ) at 2021-01-25 12:13 EST
Nmap scan report for 192.168.203.1
Host is up (0.0026s latency).
MAC Address: 5E:61:61:19:EB:84 (Unknown)
Nmap scan report for 192.168.203.2
Host is up (0.0026s latency).
MAC Address: 8E:70:3B:20:27:DA (Unknown)
Nmap scan report for 192.168.203.3
Host is up (0.0025s latency).
MAC Address: D2:FD:A2:21:A2:F4 (Unknown)
Nmap scan report for 192.168.203.4
Host is up (0.0025s latency).
MAC Address: DA:EE:7B:4E:B4:5A (Unknown)
Nmap scan report for 192.168.203.5
Host is up (0.0025s latency).
MAC Address: 3A:68:31:90:65:E4 (Unknown)
Nmap scan report for 192.168.203.6
Host is up (0.0025s latency).
MAC Address: 9E:90:02:63:3C:3D (Unknown)
Nmap scan report for 192.168.203.7
Host is up (0.0025s latency).
MAC Address: 4A:56:FD:6F:BD:0D (Unknown)
Nmap scan report for 192.168.203.8
Host is up (0.0025s latency).
MAC Address: 12:4A:41:37:85:A6 (Unknown)
Nmap scan report for 192.168.203.9
Host is up (0.0025s latency).
MAC Address: EE:75:9A:7D:00:A4 (Unknown)
Nmap scan report for 192.168.203.10
Host is up (0.0025s latency).
MAC Address: 9E:0B:2A:F8:C8:88 (Unknown)
Nmap done: 10 IP addresses (10 hosts up) scanned in 5.83 seconds
SSH: EXEC: completed after 6,003 ms
```
## Remove nmap
```bash
SSH: Opening exec channel ...
SSH: EXEC: channel open
SSH: EXEC: STDOUT/STDERR from command [apt remove nmap -y ] ...
SSH: EXEC: connected

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  libblas3 libgfortran5 liblinear3 liblua5.3-0 libpcap0.8 nmap-common
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 35 not upgraded.
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
(Reading database ... 60662 files and directories currently installed.)
Removing nmap (7.70+dfsg1-6+deb10u1) ...
Processing triggers for man-db (2.8.5-2) ...
SSH: EXEC: completed after 1,401 ms
SSH: Disconnecting configuration [203.12] ...
SSH: Transferred 0 ( 0 + 0 + 0 + 0 ) file(s)
Build step 'Send files or execute commands over SSH' changed build result to SUCCESS
[Checks API] No suitable checks publisher found.
Finished: SUCCESS
```