### Implement the following Pipeline:

    *Parameters: host IP and credentials
    *Check connection to the host
    *Install/upgrade nmap
    *Checks all online hosts
    *Remove nmap
    *Print list of collected/online hosts

#### Output:
```bash
Started by upstream project "test/31.CheckIP" build number 40
originally caused by:
 Started by user 123
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/test/32.PostbuildFrom31
[32.PostbuildFrom31] $ sshpass ******** ansible all -i /tmp/inventory9437013699377413603.ini -m shell -a "apt update 
apt install nmap 
nmap -sP 10.50.28.0/24 >> ip
apt remove -y nmap
cat ip | sed '/MAC/d'" -f 5 -u ubuntu -k
10.50.28.204 | SUCCESS | rc=0 >>
Reading package lists...

Starting Nmap 7.60 ( https://nmap.org ) at 2020-02-05 13:32 UTC
Nmap scan report for 10.50.28.5
Host is up (0.00045s latency).
Nmap scan report for 10.50.28.9
Host is up (0.00061s latency).
Nmap scan report for 10.50.28.10
Host is up (0.00048s latency).
Nmap scan report for 10.50.28.11
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.12
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.15
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.24
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.25
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.26
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.33
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.35
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.36
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.40
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.41
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.43
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.58
Host is up (0.00019s latency).
Nmap scan report for 10.50.28.59
Host is up (0.00060s latency).
Nmap scan report for 10.50.28.60
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.61
Host is up (-0.100s latency).
Nmap scan report for _gateway (10.50.28.62)
Host is up (0.0011s latency).
Nmap scan report for 10.50.28.63
Host is up (0.00065s latency).
Nmap scan report for 10.50.28.70
Host is up (0.00033s latency).
Nmap scan report for 10.50.28.72
Host is up (0.00056s latency).
Nmap scan report for 10.50.28.74
Host is up (0.00038s latency).
Nmap scan report for 10.50.28.75
Host is up (0.00035s latency).
Nmap scan report for 10.50.28.76
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.77
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.78
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.80
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.81
Host is up (0.00089s latency).
Nmap scan report for 10.50.28.83
Host is up (0.00094s latency).
Nmap scan report for 10.50.28.87
Host is up (0.00080s latency).
Nmap scan report for 10.50.28.104
Host is up (0.00050s latency).
Nmap scan report for 10.50.28.105
Host is up (0.00048s latency).
Nmap scan report for 10.50.28.109
Host is up (-0.100s latency).
Nmap scan report for 10.50.28.114
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.117
Host is up (0.00052s latency).
Nmap scan report for 10.50.28.118
Host is up (0.00052s latency).
Nmap scan report for 10.50.28.120
Host is up (-0.10s latency).
Nmap scan report for 10.50.28.123
Host is up (0.0039s latency).
Nmap scan report for 10.50.28.124
Host is up (-0.096s latency).
Nmap scan report for 10.50.28.125
Host is up (-0.088s latency).
Nmap scan report for 10.50.28.126
Host is up (-0.099s latency).
Nmap scan report for 10.50.28.131
Host is up (0.00079s latency).
Nmap scan report for 10.50.28.135
Host is up (0.00031s latency).
Nmap scan report for 10.50.28.136
Host is up (0.00026s latency).
Nmap scan report for 10.50.28.137
Host is up (0.00032s latency).
Nmap scan report for 10.50.28.140
Host is up (0.00042s latency).
Nmap scan report for 10.50.28.150
Host is up (0.00031s latency).
Nmap scan report for 10.50.28.165
Host is up (0.00054s latency).
Nmap scan report for 10.50.28.180
Host is up (0.00040s latency).
Nmap scan report for 10.50.28.203
Host is up (0.00024s latency).
Nmap scan report for 10.50.28.208
Host is up (0.00020s latency).
Nmap scan report for 10.50.28.209
Host is up (0.00058s latency).
Nmap scan report for 10.50.28.210
Host is up (0.00043s latency).
Nmap scan report for 10.50.28.211
Host is up (0.00055s latency).
Nmap scan report for 10.50.28.212
Host is up (0.00044s latency).
Nmap scan report for 10.50.28.217
Host is up (0.00051s latency).
Nmap scan report for 10.50.28.241
Host is up (0.0011s latency).
Nmap scan report for 10.50.28.245
Host is up (0.00017s latency).
Nmap scan report for msKdQGr2I9ziT (10.50.28.204)
Host is up.
Nmap done: 256 IP addresses (61 hosts up) scanned in 3.83 seconds
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/
W: Problem unlinking the file /var/cache/apt/pkgcache.bin - RemoveCaches (13: Permission denied)
W: Problem unlinking the file /var/cache/apt/srcpkgcache.bin - RemoveCaches (13: Permission denied)

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
/bin/sh: 3: nmap: not found

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
Finished: SUCCESS
```
