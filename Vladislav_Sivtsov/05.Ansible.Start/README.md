### Homework Assignment 1: Setting Up Ansible
```bash
 mkdir 05.Ansible.Start
 1128  ls
 1129  cd 05.Ansible.Start
 1130  sudo apt update
 1131  sudo apt upgrade
 1132  sudo apt install python3-pip
 sudo apt update\nsudo apt install ansible
  vim helloAnsible.yaml
  ```yaml
  
    - name: Hello Ansible Playbook
      hosts: localhost
      connection: local
      tasks:
        - name: Print hello message
          debug:
            msg: "Hello, Ansible!"
        
ansible-playbook helloAnsible.yaml
        
### Homework Assignment 2: Managing Remote Hosts
### hosts 192.168.202.17-18

### Bastion:
  # IP: 178.124.206.53
  # user: jump_sa 
  # pass: g7jEYr8&WWI7
  # port: 32510
# internal hosts:
  # user: root 
  # pass: QwertY_13

### change ansible.cfg for connect to the root
```yaml
  [defaults]
remote_user = root
inventory = invent.yaml
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer

vim install_packages.yaml
```yaml

- name: Install basic packages
  hosts: all_workers

  tasks:
    - name: Update apt cache
      ansible.builtin.apt:
        update_cache: yes

    - name: Install vim and htop
      ansible.builtin.apt:
        name:
          - vim
          - htop
        state: latest
### Homework Assignment 3: Managing Users and Groups
vim manage_users.yaml
```yaml
- name: Manage users and groups on remote hosts
  hosts: all_workers
  vars:
    username: "testuser"
    user_group: "developers"
    user_password: "Password123!"

  tasks:
    - name: Create group
      ansible.builtin.group:
        name: "{{ user_group }}"
        state: present

    - name: Create user and assign to group
      ansible.builtin.user:
        name: "{{ username }}"
        group: "{{ user_group }}"
        append: yes
        shell: /bin/bash
        create_home: yes
        state: present

    - name: Set user password
      ansible.builtin.user:
        name: "{{ username }}"
        password: "{{ user_password | password_hash('sha512') }}"
        update_password: always

    - name: Verify user and group configuration
      ansible.builtin.command: "id {{ username }}"
      register: user_check
      changed_when: false

    - name: Display verification results
      ansible.builtin.debug:
        var: user_check.stdout
``` bash
        ansible-playbook -i invent.yaml manage_users.yaml 
        ansible-playbook -i invent.yaml manage_users.yaml \\n  -e "username=Vlad" \\n  -e "user_group=DevOps" \\n  -e "user_password='$StrongPass123!'"