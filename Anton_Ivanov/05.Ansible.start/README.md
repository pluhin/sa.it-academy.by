# HW 5 Anton Ivanov
## First Part "Install and start Ansible"
1. Install Asnible for Ubuntu:  
  - apt install pip
  - sudo pip3 install ansible
2. Create ansible-playbook(first.yaml):
```yaml
- hosts: localhost
  tasks:
    - name: Print hello
      debug:
        msg: "Hello, Ansible!"
```
3. Start playbook with ansible:
  - ansible-playbook first.yaml

## Second Part "Remote hosts"

### Inventory File
```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host3:
          ansible_host: 192.168.202.3
        host4:
          ansible_host: 192.168.202.4
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
### Install Htop for remote hosts
```yaml
- hosts: all_workers
  tasks:
    - name: Update
      apt:
        update_cache: yes
    - name: Install htop
      apt:
        name: htop
        state: present
```

## Third Part "Manage users and groups"

### Playbook for manage user and group
```yaml
- name: Manage Users and Groups
  hosts: host3
  vars:
    user_name: "new_user"
    group_name: "new_group"
    password: "password123"

  tasks:
    - name: Create new group
      group:
        name: "{{ group_name }}"
        state: present

    - name: Create new user
      user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        state: present

    - name: Set password for new user
      user:
        name: "{{ user_name }}"
        password: "{{ password }}"

    - name: Add user to group
      user:
        name: "{{ user_name }}"
        groups: "{{ group_name }}"
        append: yes
```


