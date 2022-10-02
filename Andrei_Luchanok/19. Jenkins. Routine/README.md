# 19. Jenkins. Routine

## History. Command in Jenkins server:
```bash
sudo -i
su jenkins
cd ~
ssh-copy-id -i ~/.ssh/id_rsa.pub jump_sa@178.124.206.53
nano .ssh/config
```
add:
```bash 
Host ansib
     HostName 192.168.202.20
     User root
     ProxyCommand ssh -W %h:%p jump_sa@178.124.206.53
```
then:
```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.202.20
```

## Bash script in Jenkins job - execute shell:
```bash
#!/bin/bash
ssh jump_sa@178.124.206.53 "nc -vnz 192.168.202.20 22"
if [ $? -eq 0 ]; then 
echo "Host ON"
ssh ansib "apt -y update \
           && echo '###############install nmap###############' \
           && apt -y install nmap \
           && echo '###############start scanning lan###############' \
           && nmap -sP 192.168.202.0/24 192.168.203.0/24 \
           && echo '###############remove nmap###############'  \
           && apt -y autoremove nmap"
else
echo "Host OFF - build not start"
fi
```

### Execute job:
```bash
Started by user admin
Running as SYSTEM
Building on the built-in node in workspace /var/lib/jenkins/workspace/t1
[t1] $ /bin/bash /tmp/jenkins2779864280531919462.sh
Connection to 192.168.202.20 22 port [tcp/*] succeeded!
Host ON

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://archive.ubuntu.com/ubuntu focal InRelease
Hit:2 http://archive.ubuntu.com/ubuntu focal-updates InRelease
Hit:3 http://archive.ubuntu.com/ubuntu focal-security InRelease
Get:5 https://dlm.mariadb.com/repo/mariadb-server/10.6/repo/ubuntu focal InRelease [7767 B]
Hit:4 https://downloads.mariadb.com/Tools/ubuntu focal InRelease
Get:6 https://dlm.mariadb.com/repo/maxscale/latest/apt focal InRelease [9350 B]
Fetched 17.1 kB in 1s (15.9 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
38 packages can be upgraded. Run 'apt list --upgradable' to see them.
###############install nmap###############

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libblas3 liblinear4 liblua5.3-0 lua-lpeg nmap-common
Suggested packages:
  liblinear-tools liblinear-dev ncat ndiff zenmap
The following NEW packages will be installed:
  libblas3 liblinear4 liblua5.3-0 lua-lpeg nmap nmap-common
0 upgraded, 6 newly installed, 0 to remove and 38 not upgraded.
Need to get 5669 kB of archives.
After this operation, 26.8 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu focal/main amd64 libblas3 amd64 3.9.0-1build1 [142 kB]
Get:2 http://archive.ubuntu.com/ubuntu focal/universe amd64 liblinear4 amd64 2.3.0+dfsg-3build1 [41.7 kB]
Get:3 http://archive.ubuntu.com/ubuntu focal/main amd64 liblua5.3-0 amd64 5.3.3-1.1ubuntu2 [116 kB]
Get:4 http://archive.ubuntu.com/ubuntu focal/universe amd64 lua-lpeg amd64 1.0.2-1 [31.4 kB]
Get:5 http://archive.ubuntu.com/ubuntu focal/universe amd64 nmap-common all 7.80+dfsg1-2build1 [3676 kB]
Get:6 http://archive.ubuntu.com/ubuntu focal/universe amd64 nmap amd64 7.80+dfsg1-2build1 [1662 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 5669 kB in 1s (4121 kB/s)
Selecting previously unselected package libblas3:amd64.
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
Preparing to unpack .../0-libblas3_3.9.0-1build1_amd64.deb ...
Unpacking libblas3:amd64 (3.9.0-1build1) ...
Selecting previously unselected package liblinear4:amd64.
Preparing to unpack .../1-liblinear4_2.3.0+dfsg-3build1_amd64.deb ...
Unpacking liblinear4:amd64 (2.3.0+dfsg-3build1) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../2-liblua5.3-0_5.3.3-1.1ubuntu2_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.3-1.1ubuntu2) ...
Selecting previously unselected package lua-lpeg:amd64.
Preparing to unpack .../3-lua-lpeg_1.0.2-1_amd64.deb ...
Unpacking lua-lpeg:amd64 (1.0.2-1) ...
Selecting previously unselected package nmap-common.
Preparing to unpack .../4-nmap-common_7.80+dfsg1-2build1_all.deb ...
Unpacking nmap-common (7.80+dfsg1-2build1) ...
Selecting previously unselected package nmap.
Preparing to unpack .../5-nmap_7.80+dfsg1-2build1_amd64.deb ...
Unpacking nmap (7.80+dfsg1-2build1) ...
Setting up lua-lpeg:amd64 (1.0.2-1) ...
Setting up libblas3:amd64 (3.9.0-1build1) ...
update-alternatives: using /usr/lib/x86_64-linux-gnu/blas/libblas.so.3 to provide /usr/lib/x86_64-linux-gnu/libblas.so.3 (libblas.so.3-x86_64-linux-gnu) in auto mode
Setting up nmap-common (7.80+dfsg1-2build1) ...
Setting up liblua5.3-0:amd64 (5.3.3-1.1ubuntu2) ...
Setting up liblinear4:amd64 (2.3.0+dfsg-3build1) ...
Setting up nmap (7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.9) ...
###############start scanning lan###############
Starting Nmap 7.80 ( https://nmap.org ) at 2022-09-29 17:48 UTC
Nmap scan report for 192.168.202.1
Host is up (0.00046s latency).
MAC Address: A2:66:35:59:41:93 (Unknown)
Nmap scan report for 192.168.202.2
Host is up (0.00034s latency).
MAC Address: 9A:18:AF:E1:12:12 (Unknown)
Nmap scan report for 192.168.202.3
Host is up (0.00034s latency).
MAC Address: DA:61:71:65:98:3D (Unknown)
Nmap scan report for 192.168.202.4
Host is up (0.00033s latency).
MAC Address: 0E:80:33:9D:53:77 (Unknown)
Nmap scan report for 192.168.202.5
Host is up (0.00033s latency).
MAC Address: B2:7A:6E:5F:3A:E3 (Unknown)
Nmap scan report for 192.168.202.6
Host is up (0.00033s latency).
MAC Address: 4A:8B:21:C1:E0:2E (Unknown)
Nmap scan report for 192.168.202.7
Host is up (0.00036s latency).
MAC Address: 22:98:D3:B5:BF:8F (Unknown)
Nmap scan report for 192.168.202.8
Host is up (0.00033s latency).
MAC Address: DA:AA:85:E3:44:28 (Unknown)
Nmap scan report for 192.168.202.9
Host is up (0.00031s latency).
MAC Address: BA:B5:0C:22:B2:DE (Unknown)
Nmap scan report for 192.168.202.10
Host is up (0.00034s latency).
MAC Address: 06:8C:C3:14:DA:2C (Unknown)
Nmap scan report for 192.168.202.11
Host is up (0.00032s latency).
MAC Address: D2:04:FE:B0:E7:66 (Unknown)
Nmap scan report for 192.168.202.12
Host is up (0.00031s latency).
MAC Address: 92:81:42:E4:DA:6A (Unknown)
Nmap scan report for 192.168.202.13
Host is up (0.00035s latency).
MAC Address: E6:BF:4D:90:42:FC (Unknown)
Nmap scan report for 192.168.202.14
Host is up (0.00032s latency).
MAC Address: 0A:A7:C5:A4:16:74 (Unknown)
Nmap scan report for 192.168.202.15
Host is up (0.00036s latency).
MAC Address: 0A:2D:1D:17:86:A9 (Unknown)
Nmap scan report for 192.168.202.16
Host is up (0.00033s latency).
MAC Address: D6:4C:C0:FA:A9:FF (Unknown)
Nmap scan report for 192.168.202.17
Host is up (0.00038s latency).
MAC Address: 5A:E5:D1:9D:39:74 (Unknown)
Nmap scan report for 192.168.202.18
Host is up (0.00035s latency).
MAC Address: 56:CE:93:35:CC:C1 (Unknown)
Nmap scan report for local-cent.site (192.168.202.19)
Host is up (0.00031s latency).
MAC Address: FE:E8:78:4C:CA:3F (Unknown)
Nmap scan report for 192.168.202.21
Host is up (0.00031s latency).
MAC Address: A2:B4:D1:CD:FF:30 (Unknown)
Nmap scan report for 192.168.202.22
Host is up (0.00029s latency).
MAC Address: E6:77:58:C2:C9:E4 (Unknown)
Nmap scan report for 192.168.202.23
Host is up (0.00034s latency).
MAC Address: C6:AA:95:E4:99:A2 (Unknown)
Nmap scan report for 192.168.202.24
Host is up (0.00031s latency).
MAC Address: A6:51:18:61:28:E1 (Unknown)
Nmap scan report for 192.168.202.25
Host is up (0.00031s latency).
MAC Address: 26:8E:65:6C:D2:A4 (Unknown)
Nmap scan report for 192.168.202.26
Host is up (0.00031s latency).
MAC Address: 7E:65:6D:E9:B4:5E (Unknown)
Nmap scan report for 192.168.202.27
Host is up (0.00031s latency).
MAC Address: F6:58:40:B7:B5:C3 (Unknown)
Nmap scan report for 192.168.202.28
Host is up (0.00029s latency).
MAC Address: AA:3D:4D:E5:D0:C0 (Unknown)
Nmap scan report for 192.168.202.29
Host is up (0.00034s latency).
MAC Address: 66:4E:00:04:BA:9C (Unknown)
Nmap scan report for 192.168.202.30
Host is up (0.00032s latency).
MAC Address: BA:34:62:F9:CF:60 (Unknown)
Nmap scan report for 192.168.202.31
Host is up (0.00034s latency).
MAC Address: D2:1F:05:3D:6C:D6 (Unknown)
Nmap scan report for 192.168.202.32
Host is up (0.00030s latency).
MAC Address: 32:92:59:02:8D:88 (Unknown)
Nmap scan report for 192.168.202.33
Host is up (0.00032s latency).
MAC Address: C6:A7:6E:CD:BD:36 (Unknown)
Nmap scan report for 192.168.202.34
Host is up (0.00034s latency).
MAC Address: EE:5C:3C:43:57:E7 (Unknown)
Nmap scan report for 192.168.202.35
Host is up (0.00050s latency).
MAC Address: 86:3F:EA:B9:B1:18 (Unknown)
Nmap scan report for 192.168.202.36
Host is up (0.00042s latency).
MAC Address: EE:D5:EB:EA:87:0E (Unknown)
Nmap scan report for 192.168.202.37
Host is up (0.00036s latency).
MAC Address: 9A:B3:0D:96:A2:CA (Unknown)
Nmap scan report for 192.168.202.38
Host is up (0.00031s latency).
MAC Address: C6:4C:2D:4F:5C:47 (Unknown)
Nmap scan report for 192.168.203.1
Host is up (0.00016s latency).
MAC Address: B2:8F:6F:1C:11:3A (Unknown)
Nmap scan report for 192.168.203.2
Host is up (0.00014s latency).
MAC Address: 3A:15:3A:04:E1:FB (Unknown)
Nmap scan report for 192.168.203.3
Host is up (0.00035s latency).
MAC Address: 2A:1E:1C:03:9D:E2 (Unknown)
Nmap scan report for 192.168.203.4
Host is up (0.00038s latency).
MAC Address: C2:51:0B:17:8B:CC (Unknown)
Nmap scan report for 192.168.203.5
Host is up (0.00052s latency).
MAC Address: BA:47:50:FF:7B:0E (Unknown)
Nmap scan report for 192.168.203.6
Host is up (0.00048s latency).
MAC Address: 96:15:F6:97:A2:AB (Unknown)
Nmap scan report for 192.168.203.7
Host is up (0.00035s latency).
MAC Address: E2:31:0A:BA:87:3D (Unknown)
Nmap scan report for 192.168.203.8
Host is up (0.00036s latency).
MAC Address: 82:23:06:BA:51:A8 (Unknown)
Nmap scan report for 192.168.203.9
Host is up (0.00034s latency).
MAC Address: 72:8E:9A:5B:19:CF (Unknown)
Nmap scan report for 192.168.203.10
Host is up (0.00034s latency).
MAC Address: 8A:36:AD:C1:63:AE (Unknown)
Nmap scan report for 192.168.203.11
Host is up (0.00043s latency).
MAC Address: AE:2B:1D:3E:CB:20 (Unknown)
Nmap scan report for 192.168.203.12
Host is up (0.00035s latency).
MAC Address: 0A:72:9A:C5:19:20 (Unknown)
Nmap scan report for 192.168.203.13
Host is up (0.00041s latency).
MAC Address: 82:1A:EE:F1:36:E5 (Unknown)
Nmap scan report for 192.168.203.14
Host is up (0.00045s latency).
MAC Address: E6:11:77:48:89:12 (Unknown)
Nmap scan report for 192.168.203.15
Host is up (0.00041s latency).
MAC Address: CE:1C:2E:8F:12:2D (Unknown)
Nmap scan report for 192.168.203.16
Host is up (0.00040s latency).
MAC Address: E6:82:84:A2:FF:B3 (Unknown)
Nmap scan report for 192.168.203.17
Host is up (0.00045s latency).
MAC Address: 8E:06:1B:F7:67:E9 (Unknown)
Nmap scan report for 192.168.203.18
Host is up (0.00038s latency).
MAC Address: B2:AC:6B:B1:17:9E (Unknown)
Nmap scan report for 192.168.203.19
Host is up (0.00028s latency).
MAC Address: 42:3D:10:D7:EC:2C (Unknown)
Nmap scan report for 192.168.203.20
Host is up (0.00032s latency).
MAC Address: 2A:32:07:36:EE:90 (Unknown)
Nmap scan report for 192.168.203.21
Host is up (0.00027s latency).
MAC Address: AE:00:B9:BE:04:A0 (Unknown)
Nmap scan report for 192.168.203.22
Host is up (0.00026s latency).
MAC Address: 92:F9:6E:6F:72:BB (Unknown)
Nmap scan report for 192.168.203.23
Host is up (0.00028s latency).
MAC Address: D2:FC:8D:BC:2F:55 (Unknown)
Nmap scan report for 192.168.203.24
Host is up (0.00036s latency).
MAC Address: 52:87:BA:B6:30:88 (Unknown)
Nmap scan report for 192.168.203.25
Host is up (0.00026s latency).
MAC Address: C6:5A:07:67:E3:BF (Unknown)
Nmap scan report for 192.168.203.26
Host is up (0.00025s latency).
MAC Address: BA:FD:CE:85:1E:11 (Unknown)
Nmap scan report for 192.168.203.29
Host is up (0.00022s latency).
MAC Address: E6:26:4B:66:2C:0C (Unknown)
Nmap scan report for 192.168.203.30
Host is up (0.00019s latency).
MAC Address: F2:1B:0B:E7:F7:38 (Unknown)
Nmap scan report for 192.168.203.31
Host is up (0.00015s latency).
MAC Address: 46:15:16:B2:14:4A (Unknown)
Nmap scan report for 192.168.203.32
Host is up (0.00020s latency).
MAC Address: A2:C0:03:EA:F6:3A (Unknown)
Nmap scan report for 192.168.203.33
Host is up (0.00036s latency).
MAC Address: 0E:31:79:30:7D:04 (Unknown)
Nmap scan report for 192.168.203.34
Host is up (0.00041s latency).
MAC Address: 76:67:22:A3:09:EE (Unknown)
Nmap scan report for 192.168.203.35
Host is up (0.00023s latency).
MAC Address: 2E:FF:9E:B9:4A:B9 (Unknown)
Nmap scan report for 192.168.203.36
Host is up (0.00019s latency).
MAC Address: E2:5F:96:1D:F9:10 (Unknown)
Nmap scan report for 192.168.203.37
Host is up (0.00017s latency).
MAC Address: BE:CC:C5:3C:B1:7C (Unknown)
Nmap scan report for 192.168.203.38
Host is up (0.00015s latency).
MAC Address: AE:F9:F0:33:87:32 (Unknown)
Nmap scan report for local-deb.site (192.168.202.20)
Host is up.
Nmap done: 512 IP addresses (74 hosts up) scanned in 5.59 seconds
###############remove nmap###############

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages will be REMOVED:
  libblas3 liblinear4 liblua5.3-0 lua-lpeg nmap nmap-common
0 upgraded, 0 newly installed, 6 to remove and 38 not upgraded.
After this operation, 26.8 MB disk space will be freed.
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
(Reading database ... 26132 files and directories currently installed.)
Removing nmap (7.80+dfsg1-2build1) ...
Removing liblinear4:amd64 (2.3.0+dfsg-3build1) ...
Removing libblas3:amd64 (3.9.0-1build1) ...
Removing liblua5.3-0:amd64 (5.3.3-1.1ubuntu2) ...
Removing lua-lpeg:amd64 (1.0.2-1) ...
Removing nmap-common (7.80+dfsg1-2build1) ...
Processing triggers for man-db (2.9.1-1) ...
Processing triggers for libc-bin (2.31-0ubuntu9.9) ...
Finished: SUCCESS
```