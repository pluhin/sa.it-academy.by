# Hometask 09. Jenkins. Routine

### Here is some results of Jenkins Jobs:

#### First results of nmap install (CUTED)

```bash

Started by user Dmitry Alekseichik
Building on master in workspace /var/lib/jenkins/workspace/mytest01/job02.ssh_connect
[job02.ssh_connect] $ /bin/bash /tmp/jenkins7383304146118019292.sh
jenkins
user@192.168.253.10
Pseudo-terminal will not be allocated because stdin is not a terminal.
Welcome to Ubuntu 16.04.6 LTS (GNU/Linux 4.4.0-142-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

88 packages can be updated.
57 updates are security updates.

New release '18.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

These commands will be run on: Linux u16 4.4.0-142-generic #168-Ubuntu SMP Wed Jan 16 21:00:45 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
They are executed by: user


Updating/Installing NMAP

Reading package lists...
Building dependency tree...

After this operation, 27.6 MB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 libblas-common amd64 3.6.0-2ubuntu2 [5,342 B]


#BLAH BLAH BLAH...

Setting up ndiff (7.01-2ubuntu2) ...
Setting up nmap (7.01-2ubuntu2) ...
Processing triggers for libc-bin (2.23-0ubuntu11) ...

# AT LAST!!!
Starting Nmap 7.01 ( https://nmap.org ) at 2019-05-15 22:38 +03

Finished: SUCCESS
```

#### Samples of Jenkins Jobs bash commands and nmap scan output:

##### nmap APT setup-remove part

```bash
#!/bin/bash
whoami
#Sending 'pipeline' STIN var
ssh $TARGET_SSH_HOST <<'STIN' 
echo "These commands will be run on: $( uname -a )"
echo "They are executed by: $( whoami )"
echo Updating/Installing NMAP
sudo apt install nmap -y

STIN
exit
```

##### IP SCAN part - it-academy local network


```bash
#!/bin/bash
#Sending 'pipeline' STIN var
ssh $TARGET_SSH_HOST <<'STIN' 
whoami
nmap -sP $(hostname -I | awk '{print $1}')/24
STIN
```

##### Remove NMAP

```bash
#!/bin/bash
whoami
#Sending 'pipeline' STIN var
ssh $TARGET_SSH_HOST <<'STIN' 
echo "These commands will be run on: $( uname -a )"
echo "They are executed by: $( whoami )"
echo Removing NMAP
sudo apt remove nmap -y
STIN

```


##### Results of local area IP range scan (not CUTTED)

```bash

Nmap scan report for 192.168.253.10
Host is up (0.000097s latency).
Nmap scan report for 192.168.253.81
Host is up (0.00047s latency).
Nmap scan report for 192.168.253.117
Host is up (0.0029s latency).
Nmap scan report for 192.168.253.130
Host is up (0.0010s latency).
Nmap scan report for 192.168.253.131
Host is up (0.0010s latency).
Nmap scan report for 192.168.253.132
Host is up (0.0010s latency).
Nmap scan report for 192.168.253.133
Host is up (0.0026s latency).
Nmap scan report for 192.168.253.134
Host is up (0.0026s latency).
Nmap scan report for 192.168.253.135
Host is up (0.00089s latency).
Nmap scan report for 192.168.253.137
Host is up (0.0026s latency).
Nmap scan report for 192.168.253.138
Host is up (0.0026s latency).
Nmap scan report for 192.168.253.139
Host is up (0.00079s latency).
Nmap scan report for 192.168.253.140
Host is up (0.00077s latency).
Nmap scan report for 192.168.253.141
Host is up (0.0026s latency).
Nmap scan report for 192.168.253.142
Host is up (0.0025s latency).
Nmap scan report for 192.168.253.143
Host is up (0.0060s latency).
Nmap scan report for 192.168.253.144
Host is up (0.0060s latency).
Nmap scan report for 192.168.253.145
Host is up (0.0059s latency).
Nmap scan report for 192.168.253.160
Host is up (0.0056s latency).
Nmap scan report for 192.168.253.162
Host is up (0.0059s latency).
Nmap scan report for 192.168.253.165
Host is up (0.0055s latency).
Nmap scan report for 192.168.253.180
Host is up (0.0051s latency).
Nmap scan report for 192.168.253.231
Host is up (0.0013s latency).
Nmap done: 256 IP addresses (23 hosts up) scanned in 7.75 seconds

```