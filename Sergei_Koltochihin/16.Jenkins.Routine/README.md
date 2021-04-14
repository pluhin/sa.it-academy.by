### Jenkins job output
```sh
Started by user sergei
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.Jenkins
[16.Jenkins] $ /bin/bash /tmp/jenkins7262561957781151913.sh
##### hostname:  192.168.100.99
##### creds:  jenkins
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.030 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.043 ms

--- 127.0.0.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 0.030/0.036/0.043/0.008 ms
##### install/update nmap
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * epel: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
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
##### scanning network...
##### scannng done. output will be at the end of job
##### remove nmap
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
##### list of scanned devices: 
 Starting Nmap 6.40 ( http://nmap.org ) at 2021-04-13 14:14 UTC Nmap scan report for 192.168.100.1 Host is up (0.0042s latency). Nmap scan report for 192.168.100.10 Host is up (0.00029s latency). Nmap scan report for 192.168.100.14 Host is up (0.0035s latency). Nmap scan report for 192.168.100.28 Host is up (0.0032s latency). Nmap scan report for 192.168.100.99 Host is up (0.00026s latency). Nmap done: 256 IP addresses (5 hosts up) scanned in 2.33 seconds
Finished: SUCCESS
```