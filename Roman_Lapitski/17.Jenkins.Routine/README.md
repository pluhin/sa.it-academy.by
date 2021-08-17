# Jenkins task output

``` bash
Started by user admin
Running as SYSTEM
Building remotely on node01 (slave) in workspace /var/lib/jenkins/workspace/new-test
[new-test] $ /bin/bash /tmp/jenkins5370495797860258961.sh
PING 192.168.97.201 (192.168.97.201) 56(84) bytes of data.
64 bytes from 192.168.97.201: icmp_seq=1 ttl=64 time=0.039 ms
64 bytes from 192.168.97.201: icmp_seq=2 ttl=64 time=0.070 ms
64 bytes from 192.168.97.201: icmp_seq=3 ttl=64 time=0.066 ms

--- 192.168.97.201 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 1998ms
rtt min/avg/max/mdev = 0.039/0.058/0.070/0.015 ms
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Package 2:nmap-6.40-19.el7.x86_64 already installed and latest version
Nothing to do
RTTVAR has grown to over 2.3 seconds, decreasing to 2.0
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

Starting Nmap 6.40 ( http://nmap.org ) at 2021-08-15 18:27 UTC
Nmap scan report for router.lan (192.168.97.1)
Host is up (0.0010s latency).
Nmap scan report for 192.168.97.79
Host is up (0.0067s latency).
Nmap scan report for Vetton-pc (192.168.97.101)
Host is up (0.00071s latency).
Nmap scan report for 192.168.97.200
Host is up (0.0012s latency).
Nmap scan report for 192.168.97.201
Host is up (0.0021s latency).
Nmap done: 250 IP addresses (5 hosts up) scanned in 29.10 seconds
Finished: SUCCESS

```
