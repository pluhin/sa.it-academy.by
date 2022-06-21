# 19. Jenkins. Routine

## Console Output

```bash
Started by user Admin


Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/19TaskJob
[19TaskJob] $ /bin/bash /tmp/jenkins6612735410261806407.sh
Pinging
PING 192.168.153.186 (192.168.153.186) 56(84) bytes of data.
64 bytes from 192.168.153.186: icmp_seq=1 ttl=64 time=0.765 ms
64 bytes from 192.168.153.186: icmp_seq=2 ttl=64 time=1.15 ms
64 bytes from 192.168.153.186: icmp_seq=3 ttl=64 time=0.306 ms
64 bytes from 192.168.153.186: icmp_seq=4 ttl=64 time=17.1 ms

--- 192.168.153.186 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3002ms
rtt min/avg/max/mdev = 0.306/4.854/17.187/7.126 ms
[19TaskJob] $ /bin/bash /tmp/jenkins6302424747682897479.sh
NMAPpining

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Hit:1 http://security.debian.org/debian-security bullseye-security InRelease
Hit:2 http://deb.debian.org/debian bullseye InRelease
Hit:3 http://download.virtualbox.org/virtualbox/debian bullseye InRelease
Hit:4 http://deb.debian.org/debian bullseye-updates InRelease
Hit:5 https://download.docker.com/linux/debian bullseye InRelease
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
  liblinear4 libpcap0.8 lua-lpeg nmap-common
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Reading package lists...
Building dependency tree...
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


Reading state information...
Suggested packages:
  ncat ndiff zenmap
The following NEW packages will be installed:
  nmap
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,899 kB of archives.
After this operation, 4,617 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bullseye/main amd64 nmap amd64 7.91+dfsg1+really7.80+dfsg1-2 [1,899 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1,899 kB in 3s (713 kB/s)
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
(Reading database ... 111965 files and directories currently installed.)
Preparing to unpack .../nmap_7.91+dfsg1+really7.80+dfsg1-2_amd64.deb ...
Unpacking nmap (7.91+dfsg1+really7.80+dfsg1-2) ...
Setting up nmap (7.91+dfsg1+really7.80+dfsg1-2) ...
Processing triggers for man-db (2.9.4-2) ...
[19TaskJob] $ /bin/bash /tmp/jenkins15257752289712148231.sh
Reportpulling
[19TaskJob] $ /bin/bash /tmp/jenkins10595535502744705750.sh
NMAPcleaning

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

Reading package lists...
Building dependency tree...
Reading state information...
The following packages were automatically installed and are no longer required:
  liblinear4 libpcap0.8 lua-lpeg nmap-common
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  nmap
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
After this operation, 4,617 kB disk space will be freed.
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
(Reading database ... 111993 files and directories currently installed.)
Removing nmap (7.91+dfsg1+really7.80+dfsg1-2) ...
Processing triggers for man-db (2.9.4-2) ...
[19TaskJob] $ /bin/bash /tmp/jenkins17822291960351784168.sh
Reporting
Starting Nmap 7.80 ( https://nmap.org ) at 2022-06-21 14:10 +03
Nmap scan report for 192.168.153.128
Host is up (0.051s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 5.3 (protocol 2.0)
MAC Address: 00:0C:29:47:B3:E2 (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.9
Network Distance: 1 hop

Nmap scan report for 192.168.153.132
Host is up (0.044s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.2 (protocol 2.0)
MAC Address: 00:0C:29:7B:7D:1C (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.9
Network Distance: 1 hop

Nmap scan report for 192.168.153.147
Host is up (0.0020s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.4 (protocol 2.0)
MAC Address: 00:0C:29:CA:4F:AC (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.10 - 4.11, Linux 3.2 - 4.9
Network Distance: 1 hop

Nmap scan report for 192.168.153.156
Host is up (0.00076s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
MAC Address: 00:0C:29:66:06:27 (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose|storage-misc|specialized|media device|phone
Running (JUST GUESSING): Linux 2.6.X|3.X|4.X (94%), Netgear RAIDiator 4.X (94%), Crestron 2-Series (90%), Amazon embedded (88%), Asus embedded (88%), Google Android 4.X (88%), CyanogenMod 11.X|12.X (88%)
OS CPE: cpe:/o:linux:linux_kernel:2.6.32 cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4 cpe:/o:netgear:raidiator:4.2.24 cpe:/o:crestron:2_series cpe:/o:google:android:4.4.2 cpe:/o:cyanogenmod:cyanogenmod:11 cpe:/o:cyanogenmod:cyanogenmod:12
Aggressive OS guesses: Linux 2.6.32 (94%), Linux 3.10 - 4.11 (94%), Linux 3.2 - 4.9 (94%), Netgear ReadyNAS 2100 (RAIDiator 4.2.24) (94%), Linux 2.6.32 - 3.10 (93%), Linux 2.6.32 - 3.13 (93%), Linux 2.6.22 - 2.6.36 (91%), Linux 2.6.32 - 2.6.39 (91%), Linux 2.6.37 (91%), Linux 2.6.39 (91%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 1 hop
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 192.168.153.189
Host is up (0.00040s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 6.7p1 Debian 5+deb8u3 (protocol 2.0)
MAC Address: 00:0C:29:6B:C1:5B (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Aggressive OS guesses: Linux 3.12 - 4.10 (96%), Linux 3.16 (96%), ASUS RT-N56U WAP (Linux 3.4) (95%), Linux 2.6.32 (93%), Linux 3.10 (93%), Western Digital My Cloud DL4100 NAS (Linux 3.10) (93%), Linux 3.1 (93%), Linux 3.2 (93%), AXIS 210A or 211 Network Camera (Linux 2.6.17) (92%), Linux 3.10 - 4.1 (92%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 1 hop
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 192.168.153.190
Host is up (0.00090s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 5.3 (protocol 2.0)
MAC Address: 00:0C:29:3F:3F:85 (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 2.6.X|3.X
OS CPE: cpe:/o:linux:linux_kernel:2.6 cpe:/o:linux:linux_kernel:3
OS details: Linux 2.6.32 - 3.10
Network Distance: 1 hop

Nmap scan report for 192.168.153.186
Host is up (0.00051s latency).

PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.4p1 Debian 5 (protocol 2.0)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running: Linux 2.6.X
OS CPE: cpe:/o:linux:linux_kernel:2.6.32
OS details: Linux 2.6.32
Network Distance: 0 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 64 IP addresses (7 hosts up) scanned in 88.79 seconds
[19TaskJob] $ /bin/bash /tmp/jenkins2049621085745404928.sh
Reportcleaning
Finished: SUCCESS
```
