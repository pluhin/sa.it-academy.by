04.Ansible.start
-------
  - ansible installation
  ``` bash
  sudo yum install -y epel-release && sudo yum install -y ansible
  ```
  - user creation on vagrnt boxes
  ``` bash
  sudo useradd chasey -d /home/chasey
  ```
  - user add sudo grout 
  ``` bash
  sudo usermod -aG sudo chasey
  ```
  - adding password
  ``` bash
  sudo passwd chasey
  ```
  - configuring ansible inventory
  ```bash
[ub]
ub ansible_host=192.168.88.23
[cent]
cent ansible_host=192.168.88.17
[all:children]
ub
cent
```
- groupevars /etc/ansible/group_vars/all
``` bash
 env: all
 ```
- hostvars /etc/ansible/host_vars/cent
``` bash
nsible_user: chasey
ansible_ssh_pass: *****
```
hostvars /etc/ansible/host_vars/ub
``` bash
nsible_user: chasey
ansible_ssh_pass: *****
```
- ping remoute hosts
``` bash
 ansible all -m ping 
 192.168.88.23 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
 }
 192.168.88.17 | SUCCESS => {
    "changed": false, 
    "ping": "pong"
 }
```
- get hosts hostnames
  ``` bash
  ansible all -m shell -a "hostname"
  192.168.88.17 | CHANGED | rc=0 >>
  centos

  192.168.88.23 | CHANGED | rc=0 >>
  ubuntu
  ```
- packeges update centos
``` bash 
ansible cent -m shell -a "sudo yum update -yqq" 
 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

centos | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: mirror.datacenter.by
Resolving Dependencies
--> Running transaction check
---> Package GeoIP.x86_64 0:1.5.0-11.el7 will be updated
---> Package GeoIP.x86_64 0:1.5.0-13.el7 will be an update
---> Package NetworkManager.x86_64 1:1.10.2-16.el7_5 will be updated
---> Package NetworkManager.x86_64 1:1.12.0-10.el7_6 will be an update
---> Package NetworkManager-libnm.x86_64 1:1.10.2-16.el7_5 will be updated
---> Package NetworkManager-libnm.x86_64 1:1.12.0-10.el7_6 will be an update
```
- packeges update ubuntu
``` bash 
```
ansible ub -m shell -a "sudo apt-get update -yqq"
``` bash
ansible ubuntu -m shell -a "sudo apt-get update -yqq"
 [WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

ubuntu | FAILED | rc=100 >>
E: Release file for http://security.ubuntu.com/ubuntu/dists/bionic-security/InRelease is not valid yet (invalid for another 1h 14min 36s). Updates for this repository will not be applied.
E: Release file for http://archive.ubuntu.com/ubuntu/dists/bionic-updates/InRelease is not valid yet (invalid for another 1h 14min 50s). Updates for this repository will not be applied.non-zero return code

```