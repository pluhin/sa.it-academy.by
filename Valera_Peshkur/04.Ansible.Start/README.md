## 04.Ansible.Start

### TODO

1. Deploy Ansible on localhost

* Setup local user to run commands without password 
```bash
useradd -m -s /bin/bash -p devops devops
visudo #devops ALL=(ALL) NOPASSWD: ALL
su devops
```
* Run command for upgradelocally
```bash
sudo apt upgrade
sudo apt install ansible
```

2. Create own inventory with all var and hierarchie

* inv.yaml
* ./group_vars

3. Connect to the remote hosts

* `ssh-copy-id -i .ssh/id_rsa.pub jump_sa@178.124.206.48`

* `vim /etc/ssh/ssh_config`

> Host Bastion
>       User jump_sa
>       HostName 178.124.206.48
> Host 192.168.254.*
>       ProxyJump Bastion
> Host 192.168.253.*
>       ProxyJump Bastion

* `ansible-vault create group_vars/all/vault.yaml`
* `visudo` 
user ALL=(ALL) NOPASSWD: ALL #for sa_ub

* `ansible -m ping -i inv.yaml all --ask-vault-pass`
* `ansible all -m shell -a "cat /etc/hosts" -i inv.yaml --ask-vault-pass`
* `ansible sa_ub -m shell -a "apt -y upgrade" -b -i inv.yaml --ask-vault-pass`
* `ansible sa_cent -m shell -a "yum -y upgrade" -b -i inv.yaml --ask-vault-pass`
