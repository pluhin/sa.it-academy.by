# 20. Jenkins. As code

## Jenkinsfile, text report and of stages

Attached

## screenshot
![Homework-20](https://user-images.githubusercontent.com/49452234/193447948-a29c64f3-c69d-41a2-bd9b-2ff5375dff52.jpg)

## Git repository of this task

https://github.com/S-Stepanenko/jenkins_as_code.git

## Console Output

```bash
Started by user admin
[Pipeline] Start of Pipeline
[Pipeline] node
Running on node in /var/lib/jenkins/workspace/Homework-20
[Pipeline] {
[Pipeline] stage
[Pipeline] { (Install_nmap)
[Pipeline] sh
+ sudo apt-get install nmap -y
Reading package lists...
Building dependency tree...
Reading state information...
nmap is already the newest version (7.80+dfsg1-2build1).
0 upgraded, 0 newly installed, 0 to remove and 11 not upgraded.
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (NMAPpining)
[Pipeline] sh
+ nmap -sP 192.168.1.1/24 -oN report.log
Starting Nmap 7.80 ( https://nmap.org ) at 2022-10-02 09:26 UTC
Nmap scan report for 192.168.1.1
Host is up (0.0045s latency).
Nmap scan report for 277429c212042e433e262687.keenetic.io (192.168.1.2)
Host is up (0.0041s latency).
Nmap scan report for 192.168.1.30
Host is up (0.0014s latency).
Nmap scan report for 192.168.1.53
Host is up (0.089s latency).
Nmap scan report for 192.168.1.65
Host is up (0.030s latency).
Nmap scan report for 192.168.1.66
Host is up (0.0092s latency).
Nmap scan report for 192.168.1.68
Host is up (0.0035s latency).
Nmap scan report for 192.168.1.69
Host is up (0.060s latency).
Nmap scan report for 192.168.1.74
Host is up (0.0078s latency).
Nmap scan report for 192.168.1.80
Host is up (0.0017s latency).
Nmap scan report for 192.168.1.82
Host is up (0.0086s latency).
Nmap scan report for 192.168.1.84
Host is up (0.0072s latency).
Nmap scan report for 192.168.1.85
Host is up (0.0070s latency).
Nmap scan report for 192.168.1.86
Host is up (0.14s latency).
Nmap scan report for 192.168.1.87
Host is up (0.0060s latency).
Nmap scan report for 192.168.1.95
Host is up (0.12s latency).
Nmap scan report for 192.168.1.100
Host is up (0.0014s latency).
Nmap scan report for 192.168.1.107
Host is up (0.10s latency).
Nmap scan report for 192.168.1.115
Host is up (0.010s latency).
Nmap scan report for 192.168.1.130
Host is up (0.0026s latency).
Nmap scan report for vagrant (192.168.1.131)
Host is up (0.0022s latency).
Nmap scan report for 192.168.1.151
Host is up (0.083s latency).
Nmap scan report for 192.168.1.200
Host is up (0.0073s latency).
Nmap scan report for 192.168.1.201
Host is up (0.0067s latency).
Nmap done: 256 IP addresses (24 hosts up) scanned in 9.48 seconds
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
0 upgraded, 0 newly installed, 0 to remove and 11 not upgraded.
[Pipeline] sh
+ sudo pip3 install speedtest-cli
Requirement already satisfied: speedtest-cli in /usr/local/lib/python3.8/dist-packages (2.1.3)
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (Test speed)
[Pipeline] sh
+ speedtest-cli --secure
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
+ [ -d jenkins_as_code]
/var/lib/jenkins/workspace/Homework-20@tmp/durable-162a5076/script.sh: 1: [: missing ]
+ git clone https://S-Stepanenko:****@github.com/S-Stepanenko/jenkins_as_code.git
Cloning into 'jenkins_as_code'...
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
+ DATE_TEST=09:27:31; 10/02/22
+ cp report.log jenkins_as_code/report.log
+ cd jenkins_as_code
+ git config user.email carex83@gmail.com
+ git config user.name Jenkins
+ git add --all
+ git commit -m 09:27:31; 10/02/22
[main d4a0976] 09:27:31; 10/02/22
 1 file changed, 62 insertions(+)
 create mode 100644 report.log
+ git push https://S-Stepanenko:****@github.com/S-Stepanenko/jenkins_as_code.git
To https://github.com/S-Stepanenko/jenkins_as_code.git
   5cd84ee..d4a0976  main -> main
[Pipeline] }
[Pipeline] // withCredentials
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```
