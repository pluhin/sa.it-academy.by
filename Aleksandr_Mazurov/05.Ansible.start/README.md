# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible

sudo apt update

sudo apt install python3-pip

sudo pip3 install ansible

ansible --version

nano Hello.yaml

ansible-playbook Hello.yaml

## Homework Assignment 2: Managing Remote Hosts

mkdir -p group_vars/all_workers

nano ansible.cfg

nano inv.yml

ssh-copy-id -p 32510 jump_sa@178.124.206.53

ssh -p 32510 jump_sa@178.124.206.53

logout

nano ~/.ssh/config

```bash
Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
        ProxyJump ec_bastion
```

nano group_vars/all_workers/vars.yaml

```bash
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
```

nano install_htop.yml

```yaml
- name: Install htop
  hosts: all_workers
  become: yes
  tasks:
    - name: Install htop
      package:
        name: htop
        state: present
```

ansible-playbook -i inv.yaml install_htop.yml -u root

## Homework Assignment 3: Managing Users and Groups

nano add_user.yml

```yaml
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

mkdir vars

cd vars

nano main.yml

```yaml
mygroups:
  - name: group1
  - name: group2

users:
  - name: user1
    group: group1
    password: password1

  - name: user2
    group: group2
    password: password2
```

ansible-playbook -i inv.yaml add_user.yml -u root
