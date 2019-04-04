# Jenkins.Routine
##### Pipeline view:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/pipeline_view.png?raw=true)
##### Check connection to the host:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/job_1.png?raw=true)
##### Install/upgrade nmap:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/job_2.png?raw=true)
##### Checks all online hosts:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/job_3.png?raw=true)
##### Remove nmap:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/job_4.png?raw=true)
##### Print list of collected online hosts:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_09/pics/job_5.png?raw=true)
#### ALL available hosts:
```
Started by upstream project "delete_nmap" build number 3
originally caused by:
 Started by upstream project "check_online_hosts" build number 8
 originally caused by:
  Started by upstream project "install nmap" build number 15
  originally caused by:
   Started by upstream project "ping_remote_host" build number 16
   originally caused by:
    Started by user admin
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/print_online_hosts
[print_online_hosts] $ /bin/bash /tmp/jenkins6278803136807754415.sh

Starting Nmap 7.01 ( https://nmap.org ) at 2019-03-14 14:00 +03
Nmap scan report for 192.168.253.1
Host is up (0.0012s latency).
MAC Address: 66:6E:8F:B9:7F:36 (Unknown)
Nmap scan report for 192.168.253.2
Host is up (0.0011s latency).
MAC Address: 32:B6:64:2D:38:6A (Unknown)
Nmap scan report for 192.168.253.3
Host is up (0.0011s latency).
MAC Address: 42:23:CD:A2:E7:CB (Unknown)
Nmap scan report for 192.168.253.4
Host is up (0.0011s latency).
MAC Address: 3A:64:EC:09:6B:8D (Unknown)
Nmap scan report for 192.168.253.5
Host is up (0.0011s latency).
MAC Address: CA:21:21:2B:C3:20 (Unknown)
Nmap scan report for 192.168.253.6
Host is up (0.0011s latency).
MAC Address: 3A:40:95:88:F9:FA (Unknown)
Nmap scan report for 192.168.253.7
Host is up (0.0011s latency).
MAC Address: 8E:EA:1A:9B:F4:7D (Unknown)
Nmap scan report for 192.168.253.8
Host is up (0.0011s latency).
MAC Address: BA:33:8A:F3:C9:A4 (Unknown)
Nmap scan report for 192.168.253.9
Host is up (0.0011s latency).
MAC Address: 76:B9:2B:63:05:9F (Unknown)
Nmap scan report for 192.168.253.10
Host is up (0.0011s latency).
MAC Address: E2:1A:79:44:82:BC (Unknown)
Nmap scan report for 192.168.253.11
Host is up (-0.099s latency).
MAC Address: 52:D4:F1:3B:AB:AF (Unknown)
Nmap scan report for 192.168.253.19
Host is up (0.010s latency).
MAC Address: 40:A3:CC:B4:DE:CB (Unknown)
Nmap scan report for 192.168.253.45
Host is up (-0.099s latency).
MAC Address: 20:89:84:E5:A4:3F (Compal Information (kunshan))
Nmap scan report for 192.168.253.46
Host is up (0.012s latency).
MAC Address: 68:17:29:34:87:BC (Intel Corporate)
Nmap scan report for 192.168.253.49
Host is up (-0.100s latency).
MAC Address: 96:72:7F:65:59:00 (Unknown)
Nmap scan report for 192.168.253.57
Host is up (-0.100s latency).
MAC Address: 82:1D:6B:48:FF:D1 (Unknown)
Nmap scan report for 192.168.253.60
Host is up (-0.100s latency).
MAC Address: 36:89:E5:D1:AC:73 (Unknown)
Nmap scan report for 192.168.253.61
Host is up (-0.100s latency).
MAC Address: 96:69:60:F5:DB:0F (Unknown)
Nmap scan report for 192.168.253.62
Host is up (-0.100s latency).
MAC Address: A6:AD:CE:B4:DB:F2 (Unknown)
Nmap scan report for 192.168.253.107
Host is up (0.010s latency).
MAC Address: 80:C5:F2:88:11:D1 (Unknown)
Nmap scan report for 192.168.253.117
Host is up (-0.100s latency).
MAC Address: BE:EA:82:63:B9:06 (Unknown)
Nmap scan report for 192.168.253.120
Host is up (0.060s latency).
MAC Address: 40:A3:CC:B4:DE:CB (Unknown)
Nmap scan report for 192.168.253.125
Host is up (0.012s latency).
MAC Address: 40:A3:CC:B4:DE:CB (Unknown)
Nmap scan report for 192.168.253.209
Host is up (0.0015s latency).
MAC Address: 58:00:E3:27:22:CC (Unknown)
Nmap scan report for 192.168.253.231
Host is up (-0.097s latency).
MAC Address: B4:FB:E4:73:2D:B5 (Unknown)
Nmap scan report for 192.168.253.237
Host is up (0.010s latency).
MAC Address: 00:EC:0A:CB:49:DD (Unknown)
Nmap scan report for 192.168.253.58
Host is up.
Nmap done: 256 IP addresses (27 hosts up) scanned in 6.52 secondsFinished: SUCCESS
```
