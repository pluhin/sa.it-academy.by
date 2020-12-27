# 11.Ansible.

## hosts

```
[ec_all:children]
ec_ws

[ec_all:vars]
data=1

[jump]
jump_sa ansible_host=178.124.206.53



[ec]
#192.168.200.221

[lh]
192.168.100.221

[ec_ws]
192.168.202.13
192.168.202.14
```
## invetary

```
/etc/ansible/group_vars
ansible-inventory --graph
@all:
  |--@ec:
  |--@ec_all:
  |  |--@ec_ws:
  |  |  |--192.168.202.13
  |  |  |--192.168.202.14
  |--@jump:
  |  |--jump_sa
  |--@lh:
  |  |--192.168.100.221
  |--@ungrouped:

```


```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible lh -m ping -u user --ask-pass
SSH password:
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host 192.168.100.221 should use
/usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible
releases. A future Ansible release will default to using the discovered platform python for this
host. See https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for
more information. This feature will be removed in version 2.12. Deprecation warnings can be disabled
 by setting deprecation_warnings=False in ansible.cfg.
192.168.100.221 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
```

```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible lh -u user --ask-pass -m shell -a "sudo apt update"
SSH password:
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host 192.168.100.221 should use /usr/bin/python3,
but is using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible
release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more
information. This feature will be removed in version 2.12. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
192.168.100.221 | CHANGED | rc=0 >>
Hit:1 http://ppa.launchpad.net/ansible/ansible/ubuntu bionic InRelease
Hit:2 http://by.archive.ubuntu.com/ubuntu bionic InRelease
Get:3 http://by.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://by.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:5 http://by.archive.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Hit:6 https://packages.cloud.google.com/apt kubernetes-xenial InRelease
Fetched 252 kB in 1s (248 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
11 packages can be upgraded. Run 'apt list --upgradable' to see them.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$
```


### adding ssh key
```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible lh -m shell -a "sudo apt update"                 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host 192.168.100.221 should use /usr/bin/python3,
but is using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible
release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more
information. This feature will be removed in version 2.12. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
192.168.100.221 | CHANGED | rc=0 >>
Hit:1 http://by.archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://by.archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://by.archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://by.archive.ubuntu.com/ubuntu bionic-security InRelease
Hit:5 http://ppa.launchpad.net/ansible/ansible/ubuntu bionic InRelease
Hit:6 https://packages.cloud.google.com/apt kubernetes-xenial InRelease
Reading package lists...
Building dependency tree...
Reading state information...
11 packages can be upgraded. Run 'apt list --upgradable' to see them.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

### ansible lh -m shell -a "sudo apt upgrade" (localhost)

```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible lh -m shell -a "sudo apt upgrade -y"
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host 192.168.100.221 should use /usr/bin/python3,
but is using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible
release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more
information. This feature will be removed in version 2.12. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
192.168.100.221 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
  python-certifi python-chardet python-jmespath python-kerberos
  python-libcloud python-lockfile python-openssl python-requests
  python-selinux python-simplejson python-urllib3 python-xmltodict
Use 'sudo apt autoremove' to remove them.
The following packages will be upgraded:
  ansible apport kubectl libc-bin libc-dev-bin libc6 libc6-dev locales
  multiarch-support python3-apport python3-problem-report
11 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 23.7 MB of archives.
After this operation, 9,216 B of additional disk space will be used.
Get:1 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libc6-dev amd64 2.27-3ubuntu1.4 [2,585 kB]
Get:2 http://ppa.launchpad.net/ansible/ansible/ubuntu bionic/main amd64 ansible all 2.9.16-1ppa~bionic [5,801 kB]
Get:4 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libc-dev-bin amd64 2.27-3ubuntu1.4 [71.8 kB]
Get:5 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libc6 amd64 2.27-3ubuntu1.4 [2,832 kB]
Get:6 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 locales all 2.27-3ubuntu1.4 [3,611 kB]
Get:7 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libc-bin amd64 2.27-3ubuntu1.4 [643 kB]
Get:8 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 multiarch-support amd64 2.27-3ubuntu1.4 [6,944 B]
Get:9 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-problem-report all 2.20.9-0ubuntu7.21 [10.3 kB]
Get:10 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 python3-apport all 2.20.9-0ubuntu7.21 [82.3 kB]
Get:11 http://by.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apport all 2.20.9-0ubuntu7.21 [125 kB]
Get:3 https://packages.cloud.google.com/apt kubernetes-xenial/main amd64 kubectl amd64 1.20.1-00 [7,948 kB]
Preconfiguring packages ...
Fetched 23.7 MB in 1s (24.5 MB/s)
(Reading database ... 121850 files and directories currently installed.)
Preparing to unpack .../libc6-dev_2.27-3ubuntu1.4_amd64.deb ...
Unpacking libc6-dev:amd64 (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Preparing to unpack .../libc-dev-bin_2.27-3ubuntu1.4_amd64.deb ...
Unpacking libc-dev-bin (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Preparing to unpack .../libc6_2.27-3ubuntu1.4_amd64.deb ...
Unpacking libc6:amd64 (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Setting up libc6:amd64 (2.27-3ubuntu1.4) ...
(Reading database ... 121850 files and directories currently installed.)
Preparing to unpack .../locales_2.27-3ubuntu1.4_all.deb ...
Unpacking locales (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Preparing to unpack .../libc-bin_2.27-3ubuntu1.4_amd64.deb ...
Unpacking libc-bin (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Setting up libc-bin (2.27-3ubuntu1.4) ...
(Reading database ... 121850 files and directories currently installed.)
Preparing to unpack .../0-multiarch-support_2.27-3ubuntu1.4_amd64.deb ...
Unpacking multiarch-support (2.27-3ubuntu1.4) over (2.27-3ubuntu1.3) ...
Preparing to unpack .../1-ansible_2.9.16-1ppa~bionic_all.deb ...
Unpacking ansible (2.9.16-1ppa~bionic) over (2.9.15-1ppa~bionic) ...
Preparing to unpack .../2-python3-problem-report_2.20.9-0ubuntu7.21_all.deb ...
Unpacking python3-problem-report (2.20.9-0ubuntu7.21) over (2.20.9-0ubuntu7.20) ...
Preparing to unpack .../3-python3-apport_2.20.9-0ubuntu7.21_all.deb ...
Unpacking python3-apport (2.20.9-0ubuntu7.21) over (2.20.9-0ubuntu7.20) ...
Preparing to unpack .../4-apport_2.20.9-0ubuntu7.21_all.deb ...
Unpacking apport (2.20.9-0ubuntu7.21) over (2.20.9-0ubuntu7.20) ...
Preparing to unpack .../5-kubectl_1.20.1-00_amd64.deb ...
Unpacking kubectl (1.20.1-00) over (1.20.0-00) ...
Setting up multiarch-support (2.27-3ubuntu1.4) ...
Setting up python3-problem-report (2.20.9-0ubuntu7.21) ...
Setting up ansible (2.9.16-1ppa~bionic) ...
Setting up kubectl (1.20.1-00) ...
Setting up libc-dev-bin (2.27-3ubuntu1.4) ...
Setting up libc6-dev:amd64 (2.27-3ubuntu1.4) ...
Setting up locales (2.27-3ubuntu1.4) ...
Generating locales (this might take a while)...
  en_US.UTF-8... done
Generation complete.
Setting up python3-apport (2.20.9-0ubuntu7.21) ...
Setting up apport (2.20.9-0ubuntu7.21) ...
apport-autoreport.service is a disabled or a static unit, not starting it.
Processing triggers for ureadahead (0.100.0-21) ...
Processing triggers for systemd (237-3ubuntu10.43) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible lh -m shell -a "sudo apt upgrade -y"
```

### ec_ws_14 (ubuntu)

```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible 192.168.202.14 -u root -m shell -a "apt update && hostnamectl && ip a"
192.168.202.14 | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://archive.ubuntu.com/ubuntu bionic-security InRelease
Reading package lists...
Building dependency tree...
Reading state information...
107 packages can be upgraded. Run 'apt list --upgradable' to see them.
   Static hostname: sa-ubuntu-14
         Icon name: computer-container
           Chassis: container
        Machine ID: db91a8d9813048b3b0d9627361bf92a2
           Boot ID: faf7360076da4fda829d762dc2fcb435
    Virtualization: lxc
  Operating System: Ubuntu 18.04.5 LTS
            Kernel: Linux 5.3.10-1-pve
      Architecture: x86-64
1025: eth0@if1026: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 22:e8:90:6f:4b:82 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.202.14/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::20e8:90ff:fe6f:4b82/64 scope link
       valid_lft forever preferred_lft forever
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
ansible 192.168.202.14 -u root -m shell -a "apt upgrade -y"
192.168.202.14 | FAILED | rc=100 >>
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
E: dpkg was interrupted, you must manually run 'dpkg --configure -a' to correct the problem. non-zero return code
ansible 192.168.202.14 -u root -m shell -a "dpkg --configure -a"
```


```
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$ ansible 192.168.202.14 -u root -m shell -a "apt upgrade -y"
192.168.202.14 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```

### ec_ws_13 (centos)

```
 ansible 192.168.202.13 -u root -m shell -a "yum update -y"
[WARNING]: Consider using the yum module rather than running 'yum'.  If you need to use command because
yum is insufficient you can add 'warn: false' to this command task or set 'command_warnings=False' in
ansible.cfg to get rid of this message.
192.168.202.13 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.agh.edu.pl
 * extras: centos1.hti.pl
 * updates: centos2.hti.pl
No packages marked for update
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all

 ansible 192.168.202.13 -u root -m shell -a "ip a"        192.168.202.13 | CHANGED | rc=0 >>
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
997: eth0@if998: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 2e:82:17:c8:9d:48 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 192.168.202.13/16 brd 192.168.255.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::2c82:17ff:fec8:9d48/64 scope link
       valid_lft forever preferred_lft forever

ansible 192.168.202.13 -u root -m shell -a "hostnamectl" 
192.168.202.13 | CHANGED | rc=0 >>
   Static hostname: sa-centos-13
         Icon name: computer-container
           Chassis: container
        Machine ID: e5c38f6c01444ba99c44a80effc932f5
           Boot ID: faf7360076da4fda829d762dc2fcb435
    Virtualization: lxc
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 5.3.10-1-pve
      Architecture: x86-64

 ansible 192.168.202.13 -u root -m shell -a "yum upgrade -y"
[WARNING]: Consider using the yum module rather than running 'yum'.  If you need to use command because
yum is insufficient you can add 'warn: false' to this command task or set 'command_warnings=False' in
ansible.cfg to get rid of this message.
192.168.202.13 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.agh.edu.pl
 * extras: centos1.hti.pl
 * updates: centos2.hti.pl
No packages marked for update
user@u_ssh_k8s:/etc/ansible/group_vars/ec_all$
```
