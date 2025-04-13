# 05. Ansible start
## Homework Assignment 1: Setting Up Ansible
```bash
1 cd	homework/05.AnsibleStart/
2 sudo apt install -y ansible
3 ansible --version
4 mkdir ~/ansible-playbooks
5 cd ~/ansible-playbooks
6 vim hello_ansible.yml
7 ansible-playbook hello_ansible.yml
8 ssh-copy-id -p 32510 jump_sa@178.124.206.53
9 ssh -p 32510 jump_sa@178.124.206.53
10 ssh root@192.168.202.1
11 ssh root@192.168.202.2
12 sudo apt	install	sshpass
13 ssh-copy-id root@192.168.202.1
14 ssh-copy-id root@192.168.202.2
```
### Homework Assignment 2: Managing Remote Hosts
```bash
15 vim install_packages.yml
16 ssh root@192.168.202.1
17 vim inventory.yaml
18 vim install packages.yml
19 ansible-playbook -i inventory.yaml install_package.yml
```
### Homework Assignment 3: Managing Users and Groups
```bash
20 ls
21 vim inventory.yaml
22 vim mng_users_groups.yaml
23 ansible-vault   create  secret_vars.yml
24 ansible-vault crypt secret_vars.yml
25 ansible-vault encrypt secret_vars.yml
26 vim mng_users_groups.yaml
27 ls
28 vim secret_vars.yml
29 vim mng_users_groups.yaml 
30 ansible-playbook -i inventory.yaml mng_users_groups.
yaml --extra-vars @secret_vars.yml --extra-vars "username=Bancheuski groupname=users" --ask-vault-pass