# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible
```shell
sudo apt install ansible
ansible --version
mkdir 05.Ansible
cd 05.Ansible/
nano hello_playbook.yaml
ansible-playbook hello_playbook.yaml
```
##### Playbook
```yaml
- name: Greeting
  hosts: localhost

  tasks:
    - name: Print hello
      debug:
        msg: "Hello, Ansible!"
```
##### Playbook Output
```shell
PLAY [Greeting] *********************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
ok: [localhost]

TASK [Print hello] ******************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP **************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 2: Managing Remote Hosts
```shell
nano inv.yaml
ssh-copy-id -p32510 jump_sa@178.124.206.53
ssh -p 32510 'jump_sa@178.124.206.53'
ansible-inventory -i inv.yaml --graph

  @all:
    |--@ungrouped:
    |--@all_workers:
    |  |--@work_sa:
    |  |  |--host13
    |  |  |--host14
    |--@jump_sa:
    |  |--bastion

ansible-playbook -i inv.yaml  installing_playbook.yaml  --ask-vault-pass
Vault password:
```
##### Playbook
```yaml
- name: Install
  hosts: all_workers

  tasks:
    - name: Install htop
      ansible.builtin.apt:
        name: htop
        state: latest
        update_cache: yes

    - name: Chek if htop installed
      shell: |
        htop --version
      register: htop_check
      ignore_errors: yes

    - name: Print htop version
      debug:
        msg: "{{ htop_check.stdout }}"
```
##### Playbook Output
```shell
TASK [Gathering Facts] **************************************************************************************************************************************
Воскресенье 05 января 2025  22:48:36 +0000 (0:00:00.124)       0:00:00.124 ****
ok: [host13]
ok: [host14]

TASK [Install htop] *****************************************************************************************************************************************
Воскресенье 05 января 2025  22:48:41 +0000 (0:00:04.451)       0:00:04.575 ****
changed: [host14]
changed: [host13]

TASK [Chek if htop installed] *******************************************************************************************************************************
Воскресенье 05 января 2025  22:48:50 +0000 (0:00:08.629)       0:00:13.205 ****
changed: [host13]
changed: [host14]

TASK [Print htop version] ***********************************************************************************************************************************
Воскресенье 05 января 2025  22:48:51 +0000 (0:00:01.356)       0:00:14.561 ****
ok: [host13] => {
    "msg": "htop 3.0.5"
}
ok: [host14] => {
    "msg": "htop 3.0.5"
}

PLAY RECAP **************************************************************************************************************************************************
host13                     : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host14                     : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Homework Assignment 3: Managing Users and Groups
##### Playbook
```yaml
- name: Managing Users and Groups
  hosts: all_workers

  tasks:
    - name: Print variable
      debug:
        msg: "You requested user {{ username }} and group {{ usergroup }}"

    - name: Create a group
      ansible.builtin.group:
        name: "{{ usergroup }}"
        state: present

    - name: Create a user
      ansible.builtin.user:
        name: "{{ username }}"
        password: "{{ password | password_hash('sha512') }}"
        group: "{{ usergroup }}"
        comment: Managed by Ansible
        state: present

    - name: Check if user exists
      shell: id "{{ username }}"
      register: user_check
      ignore_errors: yes

    - name: Print user info
      debug:
        msg: "{{ user_check.stdout_lines }}
```
##### Variables
```shell
tree group_vars/all_workers/

  group_vars/all_workers/
  ├── user_credentials.yaml
  ├── var.yaml
  └── vault.yaml

ansible-vault edit group_vars/all_workers/user_credentials.yaml
Vault password:

  username: "testuser"
  usergroup: "testgroup"
  password: "testpassword"

```
##### Playbook Output
```shell
ansible-playbook -i inv.yaml  manage_user.yaml --ask-vault-pass
Vault password:

PLAY [Managing Users and Groups] ****************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
Воскресенье 05 января 2025  22:20:40 +0000 (0:00:00.129)       0:00:00.129 ****
ok: [host14]
ok: [host13]

TASK [Print variable] ***************************************************************************************************************************************
Воскресенье 05 января 2025  22:20:45 +0000 (0:00:05.158)       0:00:05.288 ****
ok: [host13] => {
    "msg": "You requested user testuser and group testgroup"
}
ok: [host14] => {
    "msg": "You requested user testuser and group testgroup"
}

TASK [Create a group] ***************************************************************************************************************************************
Воскресенье 05 января 2025  22:20:46 +0000 (0:00:00.235)       0:00:05.524 ****
changed: [host14]
changed: [host13]

TASK [Create a user] ****************************************************************************************************************************************
Воскресенье 05 января 2025  22:20:47 +0000 (0:00:01.566)       0:00:07.090 ****
changed: [host14]
changed: [host13]

TASK [Check if user exists] *********************************************************************************************************************************
Воскресенье 05 января 2025  22:20:50 +0000 (0:00:02.860)       0:00:09.951 ****
changed: [host13]
changed: [host14]

TASK [Print user info] **************************************************************************************************************************************
Воскресенье 05 января 2025  22:20:51 +0000 (0:00:01.358)       0:00:11.309 ****
ok: [host13] => {
    "msg": [
        "uid=1000(testuser) gid=1000(testgroup) groups=1000(testgroup)"
    ]
}
ok: [host14] => {
    "msg": [
        "uid=1000(testuser) gid=1000(testgroup) groups=1000(testgroup)"
    ]
}

PLAY RECAP **************************************************************************************************************************************************
host13                     : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host14                     : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
