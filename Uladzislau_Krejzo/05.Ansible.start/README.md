# Homework 05.Ansible.start
## Assignment 1

```bash
  483  sudo apt update
  484  sudo apt install python3-pip
  485  sudo pip3 install ansible
  486  ansible --version
  487  vim  Hello.yaml
  489  ansible-playbook hello.yaml

```
hello.yaml
```bash
- name: Start Hello, Ansible
  hosts: localhost
  tasks:
    - name: Print a message
      debug:
        msg: Hello, Ansible!

```
## Assignment 2
```bash
  490  mkdir -p group_vars/all_workers
  491  vim  ansible.cfg
  492  vim  inv.yml
  493  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  494  ssh -p 32510 jump_sa@178.124.206.53
  495  logout
  496  vim ~/.ssh/config
  497  vim group_vars/all_workers/vars.yaml
  498  vim install_htop.yml
  499  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  500  ssh -p 32510 jump_sa@178.124.206.53
  501  ansible-playbook -i inv.yml install_htop.yml -u root
  502  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/05.Ansible.start/
  503  ansible-playbook -i inv.yml install_htop.yml -u root
  504  ssh -p 32510 root@192.168.202.11
  505  ssh root@192.168.202.11
  506  ssh root@192.168.202.12
  507  ssh-copy-id  root@192.168.202.11
  508  ssh  root@192.168.202.11
  509  ssh-copy-id  root@192.168.202.12
  510  ssh  root@192.168.202.12
  511  ansible-playbook -i inv.yml install_htop.yml -u root
```
ansible.cfg
```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
inv.yml
```bash
all_workers:
  children:
    work_sa:
      hosts:
        host13:
          ansible_host: 192.168.202.11
        host14:
          ansible_host: 192.168.202.12
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
vars.yaml
```bash
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
```
.ssh/config
```bash
Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
        ProxyJump ec_bastion
```
install_htop.yml
```bash
- name: Install htop
  hosts: all_workers
  become: yes
  tasks:
    - name: Install htop
      package:
        name: htop
        state: present
```

## Assignment 3 
Will be created group workers and audit with worker1 and auditor1 users  

```bash
  512  mkdir vars
  513  vim ./vars/main.yuml
  514  vim add_user.yml
  515  ansible-playbook -i inv.yaml add_user.yml -u root
  516  mv ./vars/main.yuml .vars/main.yml
  517  mv ./vars/main.yuml ./vars/main.yml
  518  ansible-playbook -i inv.yaml add_user.yml -u root
  519  ansible-playbook -i inv.yml add_user.yml -u root
  520  vim README.md
  521  history > README.md
```
main.yml
```bash
mygroups:
  - name: workers
  - name: audit

users:
  - name: worker1
    group: workers
    password: usual1

  - name: auditor1
    group: audit
    password: audit2
```

add_user,yml
```bash
- name: Add users, password and groups
  hosts: all_workers
  become: yes
  vars_files:
    - vars/main.yml
  tasks:
    - name: Create groups
      group:
        name: "{{ item.name }}"
        state: present
      loop: "{{ mygroups }}"

    - name: Create users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        password: "{{ item.password | password_hash('sha512') }}"
        state: present
      loop: "{{ users }}"

```
