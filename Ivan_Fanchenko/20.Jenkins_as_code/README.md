# 20. Jenkins_as_code

## Screenshot of stages

![jks_as_code](jks_as_code.png)

## Github repo

https://github.com/voyager1122/20.jks.git

## Console Output

```log
Started by user admin admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on node01 in /home/jenkins/workspace/70.nmcli_cron
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Install_nmap)
[Pipeline] sh
+ sudo apt-get install nmap -y
Reading package lists...
Building dependency tree...
Reading state information...
nmap is already the newest version (7.80+dfsg1-2build1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (NMAPpining)
[Pipeline] sh
+ nmap -sP 192.168.1.1/24 -oN report.log
Starting Nmap 7.80 ( https://nmap.org ) at 2022-06-27 10:15 UTC
Nmap scan report for _gateway (192.168.1.1)
Host is up (0.0029s latency).
Nmap scan report for tst (192.168.1.14)
Host is up (0.00034s latency).
Nmap scan report for 192.168.1.87
Host is up (0.0039s latency).
Nmap scan report for jenkins.my (192.168.1.150)
Host is up (0.0014s latency).
Nmap scan report for vagrant (192.168.1.151)
Host is up (0.00040s latency).
Nmap scan report for 192.168.1.244
Host is up (0.0066s latency).
Nmap done: 256 IP addresses (6 hosts up) scanned in 2.77 seconds
+ echo 


[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Install_speedtest)
[Pipeline] sh
+ sudo apt-get install python3-pip -y
Reading package lists...
Building dependency tree...
Reading state information...
python3-pip is already the newest version (20.0.2-5ubuntu1.6).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
[Pipeline] sh
+ sudo pip3 install speedtest-cli
Requirement already satisfied: speedtest-cli in /usr/local/lib/python3.8/dist-packages (2.1.3)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test speed)
[Pipeline] sh
+ speedtest-cli
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Clone_git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ [ -d 20.jks ]
+ rm -R 20.jks
+ git clone https://voyager1122:****@github.com/voyager1122/20.jks.git
Cloning into '20.jks'...
warning: You appear to have cloned an empty repository.
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Push_git)
[Pipeline] withCredentials
Masking supported pattern matches of $PASS
[Pipeline] {
[Pipeline] script
[Pipeline] {
[Pipeline] }
[Pipeline] // script
[Pipeline] sh
+ date +%T; %D
+ STAMP=10:16:34; 06/27/22
+ cp report.log 20.jks/report.log
+ cd 20.jks
+ git config user.email test@test.sa
+ git config user.name Jenkins Slave
+ git add --all
+ git commit -m 10:16:34; 06/27/22
[master (root-commit) c9f27b5] 10:16:34; 06/27/22
 1 file changed, 26 insertions(+)
 create mode 100644 report.log
+ git push https://voyager1122:****@github.com/voyager1122/20.jks.git
To https://github.com/voyager1122/20.jks.git
 * [new branch]      master -> master
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```