# 05. Ansible start

## Local Sandbox
### Bash History
```bash
mkdir ubuntu
cd ubuntu
vagrant init bento/ubuntu-20.04
vagrant up
vagrant ssh
```

#### inside sandbox machine
```bash
sudo su
apt update && apt upgrade -y
apt install -y ansible
useradd -m -s /bin/bash ansible
echo "ansible ALL=NOPASSWD: /usr/bin/apt update, /usr/bin/apt upgrade -y" >> /etc/sudoers.d/ansible
su - ansible
ansible localhost -m shell -a "sudo apt update && sudo apt upgrade -y"
```

#### Ansible output
```bash
ansible@vagrant:~$ ansible localhost -m shell -a "sudo apt update && sudo apt upgrade -y"
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
localhost | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu focal InRelease
Get:2 http://archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Hit:3 http://security.ubuntu.com/ubuntu focal-security InRelease
Get:4 http://archive.ubuntu.com/ubuntu focal-backports InRelease [101 kB]
Fetched 214 kB in 1s (254 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
```

## Remote hosts (working-hosts)

### Configs
#### /etc/ansible/hosts
```init
[ec_all:children]
work_hosts

[ec_all:vars]
ansible_ssh_user=ansible

[jump]
ec_jump ansible_host=178.124.206.53 ansible_ssh_user=jump_sa

[work_hosts]
192.168.202.1
192.168.202.2
```

#### /etc/ansible/group_vars/ec_all.yaml
```yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
```

#### ~/.ssh/config
```bash
Host ec_jump
        User jump_sa
        HostName 178.124.206.53

Host 192.168.201.* 192.168.202.* 192.168.203.*
        ProxyJump ec_jump
```

### Bash history
#### Local history
```bash
sudo su
apt install sshpass
cd /etc/ansible/
vim hosts
mkdir group_vars
vim group_vars/ec_all.yaml
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
vim ~/.ssh/config
ssh 192.168.202.1
ssh 192.168.202.2
ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=ansible" ec_all --ask-pass
ansible work-hosts -m ping
ansible work_hosts -m shell -a "hostname && hostname -I"
ansible 192.168.202.2 -m shell -a "sudo apt update && sudo apt-get upgrade -y"
ansible 192.168.202.1 -m shell -a "sudo yum upgrade -y"
```

#### 192.168.202.1 history
```bash
useradd -m -s /bin/bash ansible
yum install sudo
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible
echo "ansible:ansible" | chpasswd
```

#### 192.168.202.2 history
```bash
useradd -m -s /bin/bash ansible
echo "ansible ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible
echo "ansible:ansible" | chpasswd
```

### Ansible output
#### Hostname and IP
```bash
root@vagrant:/etc/ansible# ansible work_hosts -m shell -a "hostname && hostname -I"
192.168.202.2 | CHANGED | rc=0 >>
sa-ubuntu-2
192.168.202.2
192.168.202.1 | CHANGED | rc=0 >>
sa-centos-1
192.168.202.1
```

#### Ubuntu upgrade
```bash
root@vagrant:/etc/ansible# ansible 192.168.202.2 -m shell -a "sudo apt update && sudo apt upgrade -y"
192.168.202.2 | CHANGED | rc=0 >>
Hit:1 http://packages.icinga.com/ubuntu icinga-bionic InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:3 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:4 http://archive.ubuntu.com/ubuntu bionic-security InRelease
Reading package lists...
Building dependency tree...
Reading state information...
3 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following NEW packages will be installed:
  distro-info libllvm10 libnetplan0 python3-pkg-resources
The following packages will be upgraded:
  libgl1-mesa-dri netplan.io ubuntu-advantage-tools
Preconfiguring packages ...
3 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/25.6 MB of archives.
After this operation, 189 MB of additional disk space will be used.
...
Setting up netplan.io (0.99-0ubuntu3~18.04.4) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Processing triggers for dbus (1.12.2-1ubuntu1.2) ...
Processing triggers for libc-bin (2.27-3ubuntu1.4) ...
```

#### Centos upgrade
```bash
root@vagrant:/etc/ansible# ansible 192.168.202.1 -m shell -a "sudo yum upgrade -y"
192.168.202.1 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: ftp.byfly.by
 * epel: mirror.logol.ru
 * extras: ftp.byfly.by
 * updates: ftp.byfly.by
Resolving Dependencies
--> Running transaction check
...
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                      Arch    Version                    Repository
                                                                           Size
================================================================================
Updating:
...
Transaction Summary
================================================================================
Install              ( 1 Dependent package)
Upgrade  80 Packages

Total download size: 56 M
Downloading packages:
Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
--------------------------------------------------------------------------------
Total                                               32 MB/s |  56 MB  00:01
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
...
Complete!newaliases: In sSMTP aliases are read from a plain text file
```
