# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible

* Install Ansible on your local machine or a virtual environment.
```shell
   84  sudo apt install python3-pip
   85  sudo pip3 install ansible
   86  apt install pipx
   87  sudo apt install pipx
   88  sudo pipx install ansible
   89  pipx ensurepath
   90  pipx completions
   91  ansible -v
...
   94  ansible --version
   95  pipx list
   96  pipx install ansible
   97  pipx list
...
   99  ansible --version
...
  101  find . | grep ansible
  102  .local/share/pipx/venvs/ansible/bin/ansible --version
  103  export PATH="$PATH:/home/dserikov/.local/share/pipx/venvs/ansible/bin"
  104  source ~/.zshrc
...
  107  ansible --version
```
* Create a directory for your Ansible playbooks and configuration files.
```shell
  123  mkdir 05.ansible_start
  124  cd 05.ansible_start/
...
  129  touch inv.yaml
  130  nano inv.yaml 
...
  135  cd ~
  136  ll
  137  ssh-keygen -t rsa
  138  ll
  139  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  140  ssh -p 32510 'jump_sa@178.124.206.53'
```
**inv.yaml**
```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host9:
          ansible_host: 192.168.202.9
        host10:
          ansible_host: 192.168.202.10
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
```shell
  159  touch ansible.cfg
  160  nano ansible.cfg 
```
**ansible.cfg**
```yaml
[defaults]
# inventory = /etc/ansible/hosts
# remote_tmp = /tmp/.ansible/tmp
forks = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

```shell
  171  mkdir -p group_vars/all_workers
  172  ll
  173  nano ./group_vars/all_workers/vars.yaml
```
**vars.yaml**
```yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
```
```shell
  177  ansible -i inv.yaml -m ping -u root all_workers
  178  ansible-vault create group_vars/all_workers/vault.yaml
  179  cat group_vars/all_workers/vault.yaml
  180  ansible-vault edit group_vars/all_workers/vault.yaml
...
  183  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
```
* Write an Ansible playbook that prints "Hello, Ansible!" to the console.
```shell
  208  touch hello_playbook.yaml
  209  nano hello_playbook.yaml 
  210  cat hello_playbook.yaml 
```
**hello_playbook.yaml**
```yaml
- hosts: all_workers
  gather_facts: False
  strategy: free

  tasks:
    - name: Ansible Greetings
      debug:
        msg: "Hello, Ansible!"
```
* Run the playbook using the ansible-playbook command and ensure it executes successfully.
```shell
ansible-playbook -i inv.yaml hello_playbook.yaml --ask-vault-pass
```
**output result:**
```shell
Vault password: 

PLAY [all_workers] ***********************************************************************************************************************************************************************************************
Thursday 11 July 2024  15:01:43 +0000 (0:00:00.056)       0:00:00.056 ********* 
Thursday 11 July 2024  15:01:43 +0000 (0:00:00.011)       0:00:00.067 ********* 

TASK [Ansible Greetings] *****************************************************************************************************************************************************************************************
ok: [host9] => {
    "msg": "Hello, Ansible!"
}
ok: [host10] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *******************************************************************************************************************************************************************************************************
host10                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host9                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 11 July 2024  15:01:43 +0000 (0:00:00.040)       0:00:00.108 ********* 
=============================================================================== 
Ansible Greetings ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

## Homework Assignment 2: Managing Remote Hosts

* Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.

**inv.yaml**
```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host9:
          ansible_host: 192.168.202.9
        host10:
          ansible_host: 192.168.202.10
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
* Ensure SSH access to the remote machine from your local machine.
```shell
ansible -i inv.yaml -m ping all_workers --ask-vault-pass
```
```shell
Vault password: 
host10 | UNREACHABLE! => {
    "changed": false,
    "msg": "Failed to connect to the host via ssh: root@192.168.202.10: Permission denied (publickey,password).",
    "unreachable": true
}
[WARNING]: Platform linux on host host9 is using the discovered Python interpreter at /usr/bin/python3.8, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
host9 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.8"
    },
    "changed": false,
    "ping": "pong"
}

```
* Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.
```yaml
---
- name: Install vim on remote hosts
  hosts: all
  become: yes  # Elevate privileges to root, required for package installation
  tasks:
    - name: Ensure vim is installed
      apt:  # Use `yum` if your remote host uses RHEL/CentOS
        name: vim
        state: present
      when: ansible_os_family == "Debian"

    - name: Ensure vim is installed
      yum:  # Use `yum` if your remote host uses RHEL/CentOS
        name: vim
        state: present
      when: ansible_os_family == "RedHat"
```
* Use inventory files to manage the connection details for the remote host. 
```shell
ansible-playbook -i inv.yaml install_htop_playbook.yaml --ask-vault-pass
```
* Execute the playbook and verify that the package is installed on the remote host.
```shell
Vault password: 

PLAY [Install vim on remote hosts] *******************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************
Thursday 11 July 2024  15:15:25 +0000 (0:00:00.021)       0:00:00.021 ********* 
fatal: [bastion]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 178.124.206.53 port 22: Connection refused", "unreachable": true}
fatal: [host10]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: root@192.168.202.10: Permission denied (publickey,password).", "unreachable": true}
[WARNING]: Platform linux on host host9 is using the discovered Python interpreter at /usr/bin/python3.8, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host9]

TASK [Ensure vim is installed] ***********************************************************************************************************************************************************************************
Thursday 11 July 2024  15:15:29 +0000 (0:00:04.228)       0:00:04.249 ********* 
ok: [host9]

TASK [Ensure vim is installed] ***********************************************************************************************************************************************************************************
Thursday 11 July 2024  15:15:32 +0000 (0:00:02.854)       0:00:07.103 ********* 
skipping: [host9]

PLAY RECAP *******************************************************************************************************************************************************************************************************
bastion                    : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
host10                     : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
host9                      : ok=2    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Thursday 11 July 2024  15:15:32 +0000 (0:00:00.068)       0:00:07.171 ********* 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 4.23s
Ensure vim is installed ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.85s
Ensure vim is installed ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds
```

## Homework Assignment 3: Managing Users and Groups

* Create a playbook to manage users and groups on a remote host.
* Define tasks to create a new user, assign the user to a specific group, and set a password.
* Parameterize the playbook to allow dynamic user and group names.
```shell
  205  touch manage_users_playbook.yaml
  206  nano manage_users_playbook.yaml 
```
**manage_users_playbook.yaml**
```yaml
---
- name: Manage users and groups on remote hosts
  hosts: all
  become: yes  # Elevate privileges to root
  vars:
    group_name: mygroup
    user_name: dserikov
    user_password: mysecretpassword

  tasks:
    - name: Ensure group exists
      group:
        name: "{{ group_name }}"
        state: present

    - name: Ensure user exists
      user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        state: present
        password: "{{ user_password }}"
        shell: /bin/bash

    - name: Ensure home directory exists for the user
      file:
        path: "/home/{{ user_name }}"
        state: directory
        owner: "{{ user_name }}"
        group: "{{ group_name }}"
        mode: '0755'
```
* Execute the playbook and verify that the user and group configurations are applied.
```shell
Vault password: 

PLAY [Manage users and groups on remote hosts] *******************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************
Thursday 11 July 2024  15:28:21 +0000 (0:00:00.014)       0:00:00.014 ********* 
fatal: [bastion]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 178.124.206.53 port 22: Connection refused", "unreachable": true}
fatal: [host10]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: root@192.168.202.10: Permission denied (publickey,password).", "unreachable": true}
[WARNING]: Platform linux on host host9 is using the discovered Python interpreter at /usr/bin/python3.8, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host9]

TASK [Ensure group exists] ***************************************************************************************************************************************************************************************
Thursday 11 July 2024  15:28:25 +0000 (0:00:04.124)       0:00:04.139 ********* 
ok: [host9]

TASK [Ensure user exists] ****************************************************************************************************************************************************************************************
Thursday 11 July 2024  15:28:27 +0000 (0:00:01.781)       0:00:05.920 ********* 
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this module to work properly.
changed: [host9]

TASK [Ensure home directory exists for the user] *****************************************************************************************************************************************************************
Thursday 11 July 2024  15:28:29 +0000 (0:00:01.834)       0:00:07.754 ********* 
ok: [host9]

PLAY RECAP *******************************************************************************************************************************************************************************************************
bastion                    : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
host10                     : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
host9                      : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 11 July 2024  15:28:31 +0000 (0:00:01.891)       0:00:09.645 ********* 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 4.13s
Ensure home directory exists for the user ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.89s
Ensure user exists ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.83s
Ensure group exists --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.78s
Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds
```