# 17.Jenkins.As code

## Here is the final generated [report.txt](https://github.com/Logy777/reports/blob/main/report.txt)


 The report.txt generated via Jenkinsfile, named [17_hw.groovy](17_hw.groovy). 
 This file dowloads to the jenkins master from the remote [repo](https://github.com/Logy777/gitter/settings) but executes on the remote node.
 
## Here is it's pipeline Console output:

```bash
Started by user Dzianis_Z
Obtained 17_hw.groovy from git git@github.com:Logy777/gitter.git
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on local_vagrant_node in /var/lib/jenkins/workspace/17_hw.groovy
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Declarative: Checkout SCM)
[Pipeline] checkout
Selected Git installation does not exist. Using Default
The recommended git tool is: NONE
using credential j_deb_dock_github
Fetching changes from the remote Git repository
 > git rev-parse --is-inside-work-tree # timeout=10
 > git config remote.origin.url git@github.com:Logy777/gitter.git # timeout=10
Fetching upstream changes from git@github.com:Logy777/gitter.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials j_deb_dock_github
 > git fetch --tags --progress git@github.com:Logy777/gitter.git +refs/heads/*:refs/remotes/origin/* # timeout=10
Checking out Revision d0e8b30dbcde533ff652390d1bfb2f0780e91b0d (refs/remotes/origin/master)
Commit message: "add cron and number of builds to store"
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git config core.sparsecheckout # timeout=10
 > git checkout -f d0e8b30dbcde533ff652390d1bfb2f0780e91b0d # timeout=10
 > git rev-list --no-walk 895a283d7d1c0f5b53895332a60d7e6a8ad70508 # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] withEnv
[Pipeline] {
[Pipeline] ansiColor
[Pipeline] {
[Pipeline] stage
[Pipeline] { (01.Check_connection)
[Pipeline] echo
pinging tut.by..
[Pipeline] sh
+ ping tut.by -c 3
PING tut.by (178.172.160.2) 56(84) bytes of data.
64 bytes from 178-172-160-2.hosterby.com (178.172.160.2): icmp_seq=1 ttl=63 time=3.96 ms
64 bytes from 178-172-160-2.hosterby.com (178.172.160.2): icmp_seq=2 ttl=63 time=4.63 ms
64 bytes from 178-172-160-2.hosterby.com (178.172.160.2): icmp_seq=3 ttl=63 time=4.53 ms

--- tut.by ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 3.964/4.378/4.632/0.300 ms
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (02.Show_interfaces)
[Pipeline] echo
show_interfaces..
[Pipeline] sh
+ /usr/sbin/ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 52:54:00:4d:77:d3 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global noprefixroute dynamic eth0
       valid_lft 51746sec preferred_lft 51746sec
    inet6 fe80::5054:ff:fe4d:77d3/64 scope link 
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
    link/ether 02:42:16:77:30:e6 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:16ff:fe77:30e6/64 scope link 
       valid_lft forever preferred_lft forever
4: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:ee:a3:dc brd ff:ff:ff:ff:ff:ff
    inet 192.168.100.41/24 brd 192.168.100.255 scope global noprefixroute eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:feee:a3dc/64 scope link 
       valid_lft forever preferred_lft forever
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (03.Installing nmap, scaning)
[Pipeline] echo
installing nmap & scaning..
[Pipeline] sh
+ sudo /bin/yum install nmap -y
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.byfly.by
 * extras: ftp.byfly.by
 * updates: ftp.byfly.by
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
+ date
+ echo -e '\n'
+ nmap -sP 192.168.100.1/24
+ grep -E '([0-9]{1,3}[\.]){3}[0-9]{1,3}|done'
+ echo -e '\n'
+ cat report.txt
Sun Nov 15 21:12:31 +03 2020


Nmap scan report for 192.168.100.1
Nmap scan report for 192.168.100.13
Nmap scan report for 192.168.100.14
Nmap scan report for 192.168.100.18
Nmap scan report for 192.168.100.26
Nmap scan report for 192.168.100.41
Nmap scan report for 192.168.100.254
Nmap done: 256 IP addresses (7 hosts up) scanned in 2.83 seconds


[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (04.Removing nmap)
[Pipeline] echo
removing nmap..
[Pipeline] sh
+ sudo /bin/yum remove nmap -y
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
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (05.Installing speedtest)
[Pipeline] echo
installing speedtest..
[Pipeline] sh
+ wget https://bintray.com/ookla/rhel/rpm -O bintray-ookla-rhel.repo
--2020-11-15 21:12:41--  https://bintray.com/ookla/rhel/rpm
Resolving bintray.com (bintray.com)... 108.168.194.93
Connecting to bintray.com (bintray.com)|108.168.194.93|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/plain]
Saving to: 'bintray-ookla-rhel.repo'

     0K                                                        10.0M=0s

2020-11-15 21:12:42 (10.0 MB/s) - 'bintray-ookla-rhel.repo' saved [172]

+ sudo mv bintray-ookla-rhel.repo /etc/yum.repos.d/
+ sudo /bin/yum install speedtest -y
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.byfly.by
 * extras: ftp.byfly.by
 * updates: ftp.byfly.by
Resolving Dependencies
--> Running transaction check
---> Package speedtest.x86_64 0:1.0.0.2_1.5ae238b-1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package       Arch       Version                 Repository               Size
================================================================================
Installing:
 speedtest     x86_64     1.0.0.2_1.5ae238b-1     bintray--ookla-rhel     910 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 910 k
Installed size: 2.2 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : speedtest-1.0.0.2_1.5ae238b-1.x86_64                         1/1 
  Verifying  : speedtest-1.0.0.2_1.5ae238b-1.x86_64                         1/1 

Installed:
  speedtest.x86_64 0:1.0.0.2_1.5ae238b-1                                        

Complete!
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (06.Speed testing)
[Pipeline] echo
Testing..
[Pipeline] sh
+ speedtest --accept-license
+ tail -n 9
+ tee -a report.txt
   Speedtest by Ookla

     Server: Beltelecom Minsk branch - Minsk (id = 30453)
        ISP: Beltelecom
    Latency:     2.85 ms   (0.34 ms jitter)

   Download:    15.68 Mbps (data used: 19.3 MB)                               

     Upload:    26.04 Mbps (data used: 44.3 MB)                               
Packet Loss:     0.5%
 Result URL: https://www.speedtest.net/result/c/23e5ec07-31ca-4041-ab01-199d10980ed3
+ cat report.txt
Sun Nov 15 21:12:31 +03 2020


Nmap scan report for 192.168.100.1
Nmap scan report for 192.168.100.13
Nmap scan report for 192.168.100.14
Nmap scan report for 192.168.100.18
Nmap scan report for 192.168.100.26
Nmap scan report for 192.168.100.41
Nmap scan report for 192.168.100.254
Nmap done: 256 IP addresses (7 hosts up) scanned in 2.83 seconds


   Speedtest by Ookla

     Server: Beltelecom Minsk branch - Minsk (id = 30453)
        ISP: Beltelecom
    Latency:     2.85 ms   (0.34 ms jitter)

   Download:    15.68 Mbps (data used: 19.3 MB)                               

     Upload:    26.04 Mbps (data used: 44.3 MB)                               
Packet Loss:     0.5%
 Result URL: https://www.speedtest.net/result/c/23e5ec07-31ca-4041-ab01-199d10980ed3
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (07.Removing speedtest)
[Pipeline] echo
removing speedtest..
[Pipeline] sh
+ rpm -qa
+ grep speedtest
+ xargs -I '{}' sudo /bin/yum -y remove '{}'
Loaded plugins: fastestmirror
Resolving Dependencies
--> Running transaction check
---> Package speedtest.x86_64 0:1.0.0.2_1.5ae238b-1 will be erased
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package      Arch      Version                   Repository               Size
================================================================================
Removing:
 speedtest    x86_64    1.0.0.2_1.5ae238b-1       @bintray--ookla-rhel    2.2 M

Transaction Summary
================================================================================
Remove  1 Package

Installed size: 2.2 M
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Erasing    : speedtest-1.0.0.2_1.5ae238b-1.x86_64                         1/1 
  Verifying  : speedtest-1.0.0.2_1.5ae238b-1.x86_64                         1/1 

Removed:
  speedtest.x86_64 0:1.0.0.2_1.5ae238b-1                                        

Complete!
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (08.Add, Commit & Push report.txt to the GitHub repo)
[Pipeline] echo
pushing the new report.txt..
[Pipeline] sh
+ cp report.txt /var/lib/jenkins/reports
+ cd /var/lib/jenkins/reports
+ git add report.txt
+ git commit -m 'report.txt uploaded'
[main e895589] report.txt uploaded
 1 file changed, 7 insertions(+), 9 deletions(-)
+ git push origin main
To git@github.com:Logy777/reports.git
   e900697..e895589  main -> main
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Done message)
[Pipeline] echo
Done....
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // ansiColor
[Pipeline] }
[Pipeline] // withEnv
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS

```
