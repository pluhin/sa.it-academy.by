# 05 Ansible start

## Setup existing local user to run SUDO apt/yum upgrade without password

```bash
echo "vagrant ALL=(ALL) NOPASSWD: /usr/bin/apt update, /usr/bin/apt upgrade" | sudo tee -a /etc/sudoers
```

## Using ansible add-hoc upgrade localhost

```bash
ansible -m shell -a 'sudo apt update -yq && sudo apt upgrade -yq' localhost
localhost | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Fetched 252 kB in 1s (232 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
1 package can be upgraded. Run 'apt list --upgradable' to see it.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages will be upgraded:
  cloud-init
1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 474 kB of archives.
After this operation, 117 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 cloud-init all 21.3-1-g6803368d-0ubuntu1~18.04.3 [474 kB]
Preconfiguring packages ...
Fetched 474 kB in 0s (984 kB/s)
(Reading database ... 66644 files and directories currently installed.)
Preparing to unpack .../cloud-init_21.3-1-g6803368d-0ubuntu1~18.04.3_all.deb ...
Unpacking cloud-init (21.3-1-g6803368d-0ubuntu1~18.04.3) over (21.2-3-g899bfaa9-0ubuntu2~18.04.1) ...
Setting up cloud-init (21.3-1-g6803368d-0ubuntu1~18.04.3) ...
Installing new version of config file /etc/cloud/cloud.cfg ...
Installing new version of config file /etc/cloud/templates/resolv.conf.tmpl ...
Created symlink /etc/systemd/system/cloud-init.target.wants/cloud-init-hotplugd.socket → /lib/systemd/system/cloud-init-hotplugd.socket.
Processing triggers for rsyslog (8.32.0-1ubuntu4) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

```

## Using Vagrant deploy two hosts
I used provided *202.7-8 hosts

## Congigure ansible.cfg and hosts

```bash
#ansible.cfg
[defaults]
inventory      = /etc/ansible/hosts
host_key_checking = False
deprecation_warnings = False
callback_whitelist = profile_tasks, timer
[inventory]
[privilege_escalation]
[paramiko_connection]
[ssh_connection]
[persistent_connection]
[accelerate]
[selinux]
[colors]
[diff]

#hosts
[jump_sa]
178.124.206.53 ansible_user=jump_sa

[work_sa]
machine7 ansible_host=192.168.202.7 ansible_user=root
machine8 ansible_host=192.168.202.8 ansible_user=root
[work_sa:vars]
ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
```

## Setup hosts for connection without password (ssh by key) using any speared "jump" server (used provided jump)

```bash
ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all --ask-pass
```

## Allow ansible user to do all without SUDO pass

```bash
ansible -m shell -a 'echo "ansible ALL=(ALL) NOPASSWD: ALL" | tee -a /etc/sudoers' work_sa
```

## Ad-hocs

```bash
# Connect to the hosts
ansible -m shell -a 'ping -c 5 google.com' work_sa
machine8 | CHANGED | rc=0 >>
PING google.com (108.177.119.102) 56(84) bytes of data.
64 bytes from ei-in-f102.1e100.net (108.177.119.102): icmp_seq=1 ttl=105 time=29.1 ms
64 bytes from ei-in-f102.1e100.net (108.177.119.102): icmp_seq=2 ttl=105 time=29.1 ms
64 bytes from ei-in-f102.1e100.net (108.177.119.102): icmp_seq=3 ttl=105 time=29.3 ms
64 bytes from ei-in-f102.1e100.net (108.177.119.102): icmp_seq=4 ttl=105 time=29.3 ms
64 bytes from ei-in-f102.1e100.net (108.177.119.102): icmp_seq=5 ttl=105 time=29.1 ms

--- google.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4004ms
rtt min/avg/max/mdev = 29.105/29.223/29.384/0.191 ms
machine7 | CHANGED | rc=0 >>
PING google.com (108.177.119.139) 56(84) bytes of data.
64 bytes from ei-in-f139.1e100.net (108.177.119.139): icmp_seq=1 ttl=105 time=31.8 ms
64 bytes from ei-in-f139.1e100.net (108.177.119.139): icmp_seq=2 ttl=105 time=31.4 ms
64 bytes from ei-in-f139.1e100.net (108.177.119.139): icmp_seq=3 ttl=105 time=31.3 ms
64 bytes from ei-in-f139.1e100.net (108.177.119.139): icmp_seq=4 ttl=105 time=31.2 ms
64 bytes from ei-in-f139.1e100.net (108.177.119.139): icmp_seq=5 ttl=105 time=31.7 ms

--- google.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 8064ms
rtt min/avg/max/mdev = 31.299/31.538/31.876/0.268 ms

# Print out host names and IP
ansible -m shell -a 'hostname && ip a' work_sa
machine8 | CHANGED | rc=0 >>
sa-ubuntu-8
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
116: eth0@if117: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 36:06:5c:cf:99:8b brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.202.8/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::3406:5cff:fecf:998b/64 scope link
       valid_lft forever preferred_lft forever
machine7 | CHANGED | rc=0 >>
sa-centos-7
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
114: eth0@if115: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether fe:3d:44:c1:d5:95 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.202.7/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::fc3d:44ff:fec1:d595/64 scope link
       valid_lft forever preferred_lft forever

# Upgrade packages
ansible -m shell -a 'yum -yq update && yum -yq upgrade' machine7
machine7 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
No packages marked for update
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
No packages marked for updateIgnored option -q, -v, -d or -e (probably due to merging: -yq != -y -q)
Ignored option -q, -v, -d or -e (probably due to merging: -yq != -y -q)

ansible -m shell -a 'sudo apt -yq update && sudo apt -yq upgrade' machine8
machine8 | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 177 kB in 0s (452 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

## Create own inventory with all variables and hierarchy

/etc/ansible/hosts