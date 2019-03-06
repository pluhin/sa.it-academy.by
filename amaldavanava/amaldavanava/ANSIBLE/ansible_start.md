# Ansible Start
<<<<<<< HEAD
- Installing Ansible on a local machine
=======
- Installing Ansible on local machine
>>>>>>> Ansible start
```bash
sudo apt-get install ansible
sudo update-alternatives --config editor
sudo visudo 
sudo apt-get update
ansible localhost -m apt -a "upgrade=yes update_cache=yes" -b
```
<<<<<<< HEAD
- Output
=======
-Output
>>>>>>> Ansible start
```bash
localhost | SUCCESS => {
    "changed": false, 
    "msg": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nReading extended state information...\nInitializing package states...\nWriting extended state information...\nBuilding tag database...\nNo packages will be installed, upgraded, or removed.\n0 packages upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\nNeed to get 0 B of archives. After unpacking 0 B will be used.\nWriting extended state information...\nReading package lists...\nBuilding dependency tree...\nReading state information...\nReading extended state information...\nInitializing package states...\nWriting extended state information...\nBuilding tag database...\n", 
    "stderr": "", 
```
<<<<<<< HEAD
- Creating ssh key for jump host and importing key on the jump host
```bash
ssh-keygen -t rsa -b 4096 -C "ansible_maldavanava"
ssh-copy-id -i .ssh/id_rsa.pub jump@178.124.206.48
=======
- Connect to the remote host
```bash
 24  ssh-keygen -t rsa -b 4096 -C "ansible_maldavanava"
 25  ssh-copy-id -i .ssh/id_rsa.pub jump@178.124.206.48
>>>>>>> Ansible start
```
- ssh_config
```bash
###################
Host Bastion
	User jump
	HostName 178.124.206.48
Host 192.168.254.*
	ProxyJump Bastion
```
<<<<<<< HEAD

- Allowing created user "nmol" executing commands withount password (192.168.254.50/51) 
```bash
## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d
%agarim ALL=(ALL) NOPASSWD: ALL
nmol	ALL=(ALL) NOPASSWD: ALL
```

- Ansible inventory file
=======
-Ansible inventory
>>>>>>> Ansible start
```bash
[jump]
178.124.206.48 ansible_user=jump

[cent]
192.168.254.50 ansible_user=nmol ansible_ssh_pass=QwertY_13

[ub]
ubuntu_01 ansible_host=192.168.254.51

[etc:children]
jump
cent
ub
```
<<<<<<< HEAD

- Ansible graph
=======
-Allow ansible user upgrade system (192.168.254.50/51) 
```bash
## Read drop-in files from /etc/sudoers.d (the # here does not mean a comment)
#includedir /etc/sudoers.d
%agarim ALL=(ALL) NOPASSWD: ALL
nmol	ALL=(ALL) NOPASSWD: ALL
```
-Ansible graph
>>>>>>> Ansible start
```bash
$ ansible-inventory --graph
@all:
  |--@etc:
  |  |--@cent:
  |  |  |--192.168.254.50
  |  |--@jump:
  |  |  |--178.124.206.48
  |  |--@ub:
  |  |  |--ubuntu_01
  |--@ungrouped:
```
<<<<<<< HEAD
- Upgrading remote ubuntu host
=======
-Upgrading remote ubuntu host
>>>>>>> Ansible start
```bash
$ ansible ub -m apt -a "upgrade=yes update_cache=yes" --ask-vault-pass -b
Vault password: 
 [WARNING]: Could not find aptitude. Using apt-get instead.

ubuntu_01 | SUCCESS => {
    "changed": false, 
    "msg": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\n", 
    "stderr": "", 
    "stderr_lines": [], 
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\n", 
    "stdout_lines": [
        "Reading package lists...", 
        "Building dependency tree...", 
        "Reading state information...", 
        "Calculating upgrade...", 
        "0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded."
    ]
}
```
<<<<<<< HEAD
- Upgrading remote centos host
=======
-Upgrading remote centos host
>>>>>>> Ansible start
```bash
$ ansible cent -m yum -a "name=* state=latest" -b
192.168.254.50 | SUCCESS => {
    "changed": false, 
    "msg": "", 
    "rc": 0, 
    "results": [
        "Nothing to do here, all packages are up to date"
    ]
}
```
<<<<<<< HEAD
- Get Hostnames  
=======
- Hostname
>>>>>>> Ansible start
```bash
$ ansible all -m shell -a "cat /etc/hostname" --ask-vault-pass
Vault password: 
178.124.206.48 | SUCCESS | rc=0 >>
sc

192.168.254.50 | SUCCESS | rc=0 >>
sa-cent

ubuntu_01 | SUCCESS | rc=0 >>
sa-ubuntu
```
<<<<<<< HEAD
- Getting hosts' ip adressess
```bash
$ ansible all -m setup -a filter=ansible_all_ipv4* --ask-vault-pass
Vault password: 
178.124.206.48 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.18.0.1", 
            "172.17.0.1", 
            "192.168.254.11", 
            "172.19.0.1", 
            "178.124.206.48"
        ]
    }, 
    "changed": false
}
192.168.254.50 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "192.168.254.50"
        ]
    }, 
    "changed": false
}
ubuntu_01 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "192.168.254.51"
        ]
    }, 
    "changed": false
}
``` 
=======


>>>>>>> Ansible start

