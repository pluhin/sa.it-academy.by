```sh
Started by user admin
Running as SYSTEM
Building on master in workspace /var/lib/jenkins/workspace/test
[test] $ /bin/bash /tmp/jenkins4657721539789727982.sh
IP 192.168.56.9 credential:jenkins
PING 192.168.56.9 (192.168.56.9) 56(84) bytes of data.
64 bytes from 192.168.56.9: icmp_seq=1 ttl=64 time=0.163 ms
64 bytes from 192.168.56.9: icmp_seq=2 ttl=64 time=0.084 ms
64 bytes from 192.168.56.9: icmp_seq=3 ttl=64 time=0.072 ms

--- 192.168.56.9 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2000ms
rtt min/avg/max/mdev = 0.072/0.106/0.163/0.041 ms
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.vsys.host
 * epel: mirror.logol.ru
 * extras: mirror.vsys.host
 * updates: mirror.vsys.host
Resolving Dependencies
--> Running transaction check
---> Package nmap.x86_64 2:6.40-19.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package        Arch             Version                   Repository      Size
================================================================================
Installing:
 nmap           x86_64           2:6.40-19.el7             base           3.9 M

Transaction Summary
================================================================================
Install  1 Package

Total download size: 3.9 M
Installed size: 16 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : 2:nmap-6.40-19.el7.x86_64                                    1/1 
  Verifying  : 2:nmap-6.40-19.el7.x86_64                                    1/1 

Installed:
  nmap.x86_64 2:6.40-19.el7                                                     

Complete!
Loaded plugins: fastestmirror
Resolving Dependencies
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

Starting Nmap 6.40 ( http://nmap.org ) at 2021-04-13 13:48 EDT
Nmap scan report for 192.168.56.1
Host is up (0.0010s latency).
Nmap scan report for 192.168.56.6
Host is up (0.0010s latency).
Nmap scan report for 192.168.56.9
Host is up (0.00029s latency).
Nmap done: 256 IP addresses (3 hosts up) scanned in 2.62 seconds
Finished: SUCCESS
```
