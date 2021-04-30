## 1. Parameters: host IP and credentials
```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task1
[task1] $ ansible localhost -a "hostname -i  " -f 5
localhost | CHANGED | rc=0 >>
fe80::422f:a23f:f70f:8c38%eth0 fe80::42:46ff:fe66:b799%br-a546266da9ae fe80::50e4:cbff:fe05:e24b%veth033432e fe80::6c6b:ccff:fe9a:2003%veth8f49ff0 fe80::d8ea:89ff:fe3f:ca76%vethbd9c0c9 10.1.1.104 172.17.0.1 172.19.0.1 172.24.0.1 172.20.0.1 172.18.0.1
Finished: SUCCESS
```
-----------------
```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task1-1
[task1-1] $ ansible localhost -a whoami -f 5
localhost | CHANGED | rc=0 >>
jenkins
Finished: SUCCESS
```
## 2. Check connection to the host

```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task2
[task2] $ ansible localhost -m ping
localhost | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
Finished: SUCCESS
```
## 3. Install/upgrade nmap
```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task3
[task3] $ /bin/sh /tmp/jenkins6024437696970701037.sh
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-
              : manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * centos-sclo-rh: mirror.datacenter.by
 * centos-sclo-sclo: mirror.datacenter.by
 * epel: mirror.yandex.ru
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
https://mirror.datacenter.by/pub/fedoraproject.org/epel/7/x86_64/repodata/4ff8fcc825c1fbd43cf4074655dde6703a1caa7e2525b92a7e9a3277b7596196-primary.sqlite.bz2: [Errno 14] HTTPS Error 404 - Not Found
Trying other mirror.
To address this issue please refer to the below wiki article 

https://wiki.centos.org/yum-errors

If above article doesn't help to resolve this issue please use https://bugs.centos.org/.

Resolving Dependencies
--> Running transaction check
---> Package nmap.x86_64 2:6.40-19.el7 will be installed
--> Processing Dependency: nmap-ncat = 2:6.40-19.el7 for package: 2:nmap-6.40-19.el7.x86_64
--> Processing Dependency: libpcap.so.1()(64bit) for package: 2:nmap-6.40-19.el7.x86_64
--> Running transaction check
---> Package libpcap.x86_64 14:1.5.3-12.el7 will be installed
---> Package nmap-ncat.x86_64 2:6.40-19.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package           Arch           Version                    Repository    Size
================================================================================
Installing:
 nmap              x86_64         2:6.40-19.el7              base         3.9 M
Installing for dependencies:
 libpcap           x86_64         14:1.5.3-12.el7            base         139 k
 nmap-ncat         x86_64         2:6.40-19.el7              base         206 k

Transaction Summary
================================================================================
Install  1 Package (+2 Dependent packages)

Total download size: 4.3 M
Installed size: 17 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                               17 MB/s | 4.3 MB  00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : 14:libpcap-1.5.3-12.el7.x86_64                               1/3 
  Installing : 2:nmap-ncat-6.40-19.el7.x86_64                               2/3 
  Installing : 2:nmap-6.40-19.el7.x86_64                                    3/3 
  Verifying  : 2:nmap-ncat-6.40-19.el7.x86_64                               1/3 
  Verifying  : 14:libpcap-1.5.3-12.el7.x86_64                               2/3 
  Verifying  : 2:nmap-6.40-19.el7.x86_64                                    3/3 

Installed:
  nmap.x86_64 2:6.40-19.el7                                                     

Dependency Installed:
  libpcap.x86_64 14:1.5.3-12.el7         nmap-ncat.x86_64 2:6.40-19.el7        

Complete!
Finished: SUCCESS
```
## 4. Checks and print online hosts
```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task4
[task4] $ /bin/sh /tmp/jenkins3210897800838998798.sh

Starting Nmap 6.40 ( http://nmap.org ) at 2021-04-29 03:58 EDT
Nmap scan report for 10.1.1.104
Host is up (0.0011s latency).
Not shown: 996 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
80/tcp   open  http
82/tcp   open  xfer
8080/tcp open  http-proxy

Nmap scan report for 10.1.1.224
Host is up (0.71s latency).
Not shown: 997 filtered ports
PORT    STATE SERVICE
22/tcp  open  ssh
80/tcp  open  http
443/tcp open  https

Nmap scan report for 10.1.1.66
Host is up (0.0043s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
3306/tcp open  mysql

Nmap done: 3 IP addresses (3 hosts up) scanned in 52.84 seconds
Finished: SUCCESS
```
## 5. Remove nmap
```
Started by user Admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/16.jenkins.routine/task5
[task5] $ /bin/sh /tmp/jenkins7249894052958451371.sh
Loaded plugins: fastestmirror, product-id, search-disabled-repos, subscription-
              : manager

This system is not registered with an entitlement server. You can use subscription-manager to register.

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
Finished: SUCCESS
```





