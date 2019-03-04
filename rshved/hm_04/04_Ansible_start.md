# Lesson 4: Ansible.Start
### Ansible on localhost
```bash
pelsh@HP-ENVY-m6:~$ ansible --version
ansible 2.7.8
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/pelsh/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.12 (default, Nov 12 2018, 14:36:49) [GCC 5.4.0 20160609]
```
### Sudoers
```bash
# User privilege specification
root    ALL=(ALL:ALL) ALL
# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL

hutemai  ALL=(ALL)  NOPASSWD: /usr/bin/apt
```
### Run commands without passwd
```bash
hutemai@HP-ENVY-m6:/$ sudo apt update
Hit:1 http://by.archive.ubuntu.com/ubuntu xenial InRelease
Hit:2 http://by.archive.ubuntu.com/ubuntu xenial-updates InRelease                                                                 
Hit:3 http://by.archive.ubuntu.com/ubuntu xenial-backports InRelease                                                               
Hit:4 http://ppa.launchpad.net/ansible/ansible/ubuntu xenial InRelease                                                             
Ign:5 http://dl.google.com/linux/chrome/deb stable InRelease                                                                       
Hit:6 http://ppa.launchpad.net/atareao/telegram/ubuntu xenial InRelease                                                            
Hit:7 http://dl.google.com/linux/chrome/deb stable Release                                                                      
Hit:8 http://ppa.launchpad.net/jonathonf/python-3.6/ubuntu xenial InRelease                                                     
Hit:9 http://ppa.launchpad.net/nm-l2tp/network-manager-l2tp/ubuntu xenial InRelease                                             
Hit:10 http://ppa.launchpad.net/shimmerproject/ppa/ubuntu xenial InRelease                                                      
Get:11 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]                                                     
Hit:12 https://repo.skype.com/deb stable InRelease             
Hit:14 https://packagecloud.io/slacktechnologies/slack/debian jessie InRelease
Fetched 109 kB in 3s (29,3 kB/s)
Reading package lists... Done
Building dependency tree       
Reading state information... Done
105 packages can be upgraded. Run 'apt list --upgradable' to see them.
hutemai@HP-ENVY-m6:/$ sudo service avahi-daemon restart
[sudo] password for hutemai: 
hutemai@HP-ENVY-m6:/$ 
```
### Inventory
```bash
pelsh@HP-ENVY-m6:~/ansible$ ansible-inventory --graph
@all:
  |--@jump:
  |  |--178.124.206.48
  |--@os_linux:
  |  |--@cent_os:
  |  |  |--cent_os_1
  |  |--@ubuntu_os:
  |  |  |--ubuntu_os_1
  |--@ungrouped:
pelsh@HP-ENVY-m6:~$ ansible-inventory --host=cent_os
{
    "ansible_host": "192.168.254.50", 
    "ansible_user": "root"
}
pelsh@HP-ENVY-m6:~$ ansible-inventory --host=ubuntu_os
{
    "ansible_host": "192.168.254.51", 
    "ansible_user": "user"
}
```
### Ping Pong
```bash
pelsh@HP-ENVY-m6:~$ ansible all -m ping
ubuntu_os_1 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
178.124.206.48 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
cent_os_1 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
}
```
### Print hostname and ip
```bash
pelsh@HP-ENVY-m6:~$ ansible os_linux -m shell -a "ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
ubuntu_os_1 | CHANGED | rc=0 >>
127.0.0.1
192.168.254.51
10.70.20.11

cent_os_1 | CHANGED | rc=0 >>
127.0.0.1
192.168.254.50
```
### Update hosts
```bash
pelsh@HP-ENVY-m6:~$ ansible ubuntu_os -m shell -a "sudo apt update"
 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

ubuntu_os_1 | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:3 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic-security InRelease
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

pelsh@HP-ENVY-m6:~$ ansible cent_os -m shell -a "sudo yum update"
 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

cent_os_1 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.byfly.by
 * extras: ftp.byfly.by
 * updates: ftp.byfly.by
No packages marked for update
```
