## First Part "Install and start Ansible"
1. I have Asnible for Ubuntu:  
 ```Bash
skefil@skefil:~/ansible-playbooks$ ansible --version
ansible [core 2.15.1]
  config file = None
  configured module search path = ['/home/skefil/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/skefil/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.3
  libyaml = True
```
2. Create ansible-playbook(hello_ansible.yml):
```yaml
---
- name: Hello Ansible Playbook
  hosts: localhost
  tasks:
    - name: Print a message
      ansible.builtin.debug:
        msg: "Hello, Ansible!"

```
3. Start playbook with ansible:
```Bash
ansible-playbook hello_ansible.yml
```

## Second Part "Remote hosts"

### hosts
```yaml
#[node1]
#10.0.4.8 

#[node2]
#10.0.4.9 

[work1]
192.168.202.1 ansible_user=root

[work2]
192.168.202.2 ansible_user=root

#[workshop]
#192.168.201.1 ansible_user=root

```
### Config ssh
```yaml
Host ec_bastion
    User jump_sa
    Port 32510
    HostName 178.124.206.53

Host 192.168.202.*
    ProxyJump ec_bastion

Host 192.168.208.*
    ProxyJump ec_bastion

Host 192.168.203.*
    ProxyJump ec_bastion

Host 192.168.201.*
    ProxyJump ec_bastion


```

### Install Htop for remote hosts
```yaml
---
- name: Install htop on remote hosts
  hosts: all
  become: true
  tasks:
    - name: Install htop package
      apt:
        name: htop
        state: present

```

## Third Part "Manage users and groups"

### Playbook for manage user and group
```yaml
---
- name: Manage Users and Groups
  hosts: all
  become: yes
  tasks:
    - name: Create a new group
      group:
        name: "{{ user_group }}"
        state: present

    - name: Create a new user
      user:
        name: "{{ user_name }}"
        group: "{{ user_group }}"
        password: "{{ user_password | password_hash('sha512') }}"
        state: present

```
 ```Bash
ansible-playbook manage_users.yml -e "user_name=Andrei user_group=Bakaushyn user_password=1234"
```

