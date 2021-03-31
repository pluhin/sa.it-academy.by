# 11.Ansible
```
user ALL=(ALL) NOPASSWD: /usr/bin/apt, /sbin/reboot
ansible localhost -m shell -a 'sudo apt upgrade -y' --ask-vault-pass
```
---
[img]()


## Ansible commands
```
ansible -i hosts.yaml -m shell -a 'hostname && hostname -i' ec2  -u root
```
[img]()
```
ansible -i hosts.yaml ec2 -m ping -u root  --ask-vault-pass
```
[img]()
```
ansible -i hosts.yaml w_1 -m shell -a "yum upgrade -y"  --ask-vault-pass
ansible -i hosts.yaml -m shell -a 'apt-get update && apt-get upgrade' w_2
```

