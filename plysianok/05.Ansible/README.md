# 05 Ansible start

## Create ansible sandbox form Vagrant
---
```bash
Vagrant.configure("2") do |config|
  config.vm.define "debian-10" do |vm1|
    vm1.vm.hostname = "Debian10-Ansible"
    vm1.vm.box = "bento/debian-10"
    vm1.vm.network "public_network", ip: "192.168.100.200"
    
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "debian10-ansible"
      vb.gui = false
      vb.memory = "2048"
    end

    vm1.vm.provision "shell", run: "always", inline: <<-SHELL
        sudo useradd ansibleuser -p ansible
        sudo bash -c "echo 'ansibleuser ALL=(ALL:ALL) NOPASSWD: ALL'>> /etc/sudoers"
	echo "Added user"
	deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
	sudo apt update && sudo apt upgrade -y
	sudo apt install -y ansible
	ansible --version
	echo "Ansible installed"
    SHELL
  end
end
```
---
## Ansible ad-hoc upgrade sandbox

---
```bash
vagrant@Debian10-Ansible:~$ ansible localhost -m shell -a "sudo apt upgrade -y"
 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

localhost | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```
---

## Configured remote  ssh connection

---
### /etc/.ssh/config
```bash
Host ec_jump
	User jump_sa
	Hostname 178.124.206.XX
Host 192.168.202.13 192.168.202.14 192.168.203.13 192.168.203.14 192.168.201.7
	ProxyJump ec_jump
```
### Create ssh-key and copy to jump-server
```bash
ssh-keygen
ssh-copy-id jump_sa@178.124.206.XX
```
---
### Test remote connection 
```bash
# Connect to CentOS
vagrant@Debian10-Ansible:~$ ssh root@192.vagrant@Debian10-Ansible:~$ ssh root@192.168.202.14
exit
# Connect to Ubuntu
Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 5.3.10-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '20.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Tue Jun 22 15:07:40 2021 from 192.168.204.82
root@sa-ubuntu-14:~# 
168.202.13
Last login: Wed Jun 23 05:36:04 2021 from 192.168.204.82
[root@sa-centos-13 ~]# 
exit
```
---
## Build Ansible inventory
```bash
ansible-inventory --graph
@all:
  |--@ec_all:
  |  |--@k8s:
  |  |  |--k8s_01
  |  |  |--k8s_02
  |  |--@work_hosts:
  |  |  |--work_01
  |  |  |--work_02
  |  |--@workshop_hosts:
  |  |  |--work_shop_01
  |--@ungrouped:
```
### /etc/ansible/hosts
```bash
ec_all:
  vars: 
    ansible_ssh_user: root
  children:
    work_hosts:
      hosts:
        work_01:
          ansible_host: 192.168.202.13
        work_02:
          ansible_host: 192.168.202.14
    workshop_hosts:
      hosts:
        work_shop_01:
          ansible_host: 192.168.201.7
    k8s:
      hosts:
        k8s_01:
          ansible_host: 192.168.203.13
        k8s_02:
          ansible_host: 192.168.203.14
#jump:
#  hosts:
#    ec_jump:
#      ansible_host: 178.124.206.XX
#      ansible_ssh_user: jump_sa
# This block is commented out so as not to accidentally break the Jump-server.
```
### Test ansible connection
```bash
vagrant@Debian10-Ansible:~$ ansible work_hosts -m ping
work_02 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
work_01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```
---

## Ansible ad-hoc 
### Print out host names and IP
```bash
vagrant@Debian10-Ansible:~$ ansible work_hosts -m shell -a "hostname && hostname -I"
work_02 | CHANGED | rc=0 >>
sa-ubuntu-14
192.168.202.14 

work_01 | CHANGED | rc=0 >>
sa-centos-13
192.168.202.13 
```
### Upgrade packages Ubuntu
```bash
ansible work_02 -m shell -a "apt update && apt upgrade -y"

work_02 | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Hit:3 http://packages.icinga.com/ubuntu icinga-bionic InRelease
Get:4 http://archive.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [2126 kB]
Get:6 http://archive.ubuntu.com/ubuntu bionic-updates/main Translation-en [421 kB]
Get:7 http://archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [388 kB]
Get:8 http://archive.ubuntu.com/ubuntu bionic-updates/restricted Translation-en [52.6 kB]
Get:9 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1738 kB]
Get:10 http://archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [371 kB]
Get:11 http://archive.ubuntu.com/ubuntu bionic-security/main amd64 Packages [1754 kB]
Get:12 http://archive.ubuntu.com/ubuntu bionic-security/main Translation-en [326 kB]
Get:13 http://archive.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1128 kB]
Get:14 http://archive.ubuntu.com/ubuntu bionic-security/universe Translation-en [255 kB]
Fetched 8737 kB in 2s (3662 kB/s)
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
```
### Upgrage packages to CentOS

```bash
ansible work_01 -m shell -a "yum upgrade -y"
 [WARNING]: Consider using the yum module rather than running yum.  If you need to use command because yum is insufficient you can add warn=False to this command task or set command_warnings=False in
ansible.cfg to get rid of this message.

work_01 | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * epel: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Resolving Dependencies
--> Running transaction check
---> Package acl.x86_64 0:2.2.51-14.el7 will be updated
---> Package acl.x86_64 0:2.2.51-15.el7 will be an update
.... # Upgraded 161 package
Updated:
  acl.x86_64 0:2.2.51-15.el7                                                    
  bash.x86_64 0:4.2.46-34.el7                                                   
  bind-export-libs.x86_64 32:9.11.4-26.P2.el7_9.5                               
  binutils.x86_64 0:2.27-44.base.el7                                            
  ca-certificates.noarch 0:2020.2.41-70.0.el7_8      
  ```
  ---



