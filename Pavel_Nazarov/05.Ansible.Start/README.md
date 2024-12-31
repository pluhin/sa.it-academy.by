# 05.Ansible.Start

## Homework Assignment 1: Setting Up Ansible

**hello_playbook.yaml**:
```yaml
- hosts: workers
  gather_facts: False

  tasks:
    - name: This command will change the working directory to somedir/
      ansible.builtin.shell:
        cmd: echo "Hello, Ansible!"
      register: shell_out

    - name: Debuging
      debug:
        msg: "{{ shell_out.stdout_lines }}"
```

Result:
```bash
ansible-playbook -i hosts.yaml hello_playbook.yaml

PLAY [workers] ******************************************************************************************************

TASK [This command will change the working directory to somedir/] ***************************************************
Monday 30 December 2024  08:30:50 +0000 (0:00:00.013)       0:00:00.013 ******* 
[WARNING]: Platform linux on host worker_01 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
changed: [worker_01]
[WARNING]: Platform linux on host worker_02 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
changed: [worker_02]

TASK [Debuging] *****************************************************************************************************
Monday 30 December 2024  08:30:52 +0000 (0:00:01.184)       0:00:01.198 ******* 
ok: [worker_01] => {
    "msg": [
        "Hello, Ansible!"
    ]
}
ok: [worker_02] => {
    "msg": [
        "Hello, Ansible!"
    ]
}

PLAY RECAP **********************************************************************************************************
worker_01                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker_02                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 30 December 2024  08:30:52 +0000 (0:00:00.060)       0:00:01.258 ******* 
=============================================================================== 
This command will change the working directory to somedir/ --------------------------------------------------- 1.18s
Debuging ----------------------------------------------------------------------------------------------------- 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 1 seconds
```

## Homework Assignment 2: Managing Remote Hosts

**manage_playbook.yaml**:

```yaml
- hosts: workers
  gather_facts: True

  tasks:
    - name: Install naginx
      ansible.builtin.apt:
        name: nginx
        update_cache: yes
```

**Inventosy file**:
```yaml
workers:
  children:
    work_sa:
      vars:
        ansible_user: root
      hosts:
        worker_01:
          ansible_host: 192.168.202.9
        worker_02:
          ansible_host: 192.168.202.10
```


Result:
```bash
ansible-playbook -i hosts.yaml manage_playbook.yaml

PLAY [workers] ******************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************
Monday 30 December 2024  08:56:53 +0000 (0:00:00.014)       0:00:00.014 ******* 
[WARNING]: Platform linux on host worker_02 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [worker_02]
[WARNING]: Platform linux on host worker_01 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [worker_01]

TASK [Install naginx] ***********************************************************************************************
Monday 30 December 2024  08:56:55 +0000 (0:00:02.331)       0:00:02.345 ******* 
changed: [worker_01]
changed: [worker_02]

PLAY RECAP **********************************************************************************************************
worker_01                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker_02                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 30 December 2024  08:56:58 +0000 (0:00:03.348)       0:00:05.693 ******* 
=============================================================================== 
Install naginx ----------------------------------------------------------------------------------------------- 3.35s
Gathering Facts ---------------------------------------------------------------------------------------------- 2.33s
Playbook run took 0 days, 0 hours, 0 minutes, 5 seconds
```

Cheking:
```bash
ssh root@192.168.202.9
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '24.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Mon Dec 30 08:59:41 2024 from 192.168.204.82
-bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
root@sa-9:~# nginx -v
nginx version: nginx/1.18.0 (Ubuntu)
```

## Homework Assignment 3: Managing Users and Groups

**manage_users_playbook.yaml**:

```yaml
- name: Manage users and groups
  hosts: workers
  gather_facts: True
  vars:
    user_name: "{{ user_name | default('default_user') }}"
    group_name: "{{ group_name | default('default_group') }}"
    user_password: "{{ 'default_password!' | password_hash('sha512') }}"

  tasks:

    - name: Ensure the group exists
      ansible.builtin.group:
        name: "{{ group_name }}"
        state: present

    - name: Ensure the user exists and assign to the group
      ansible.builtin.user:
        name: "{{ user_name }}"
        groups: "{{ group_name }}"
        state: present
        password: "{{ user_password }}"

    - name: Verify the user creation
      ansible.builtin.shell: "id {{ user_name }}"
      register: user_info
      ignore_errors: true

    - name: Debug user information
      debug:
        msg: "{{ user_info.stdout }}"
```

Result:
```bash
ansible-playbook -i hosts.yaml manage_users_playbook.yaml -e "user_name=testuser" -e "group_name=testgrp" -e "user_password=defpasswd"

PLAY [Manage users and groups] **************************************************************************************

TASK [Gathering Facts] **********************************************************************************************
Monday 30 December 2024  09:21:45 +0000 (0:00:00.011)       0:00:00.011 ******* 
[WARNING]: Platform linux on host worker_02 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [worker_02]
[WARNING]: Platform linux on host worker_01 is using the discovered Python interpreter at /usr/bin/python3.10, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [worker_01]

TASK [Ensure the group exists] **************************************************************************************
Monday 30 December 2024  09:21:47 +0000 (0:00:02.239)       0:00:02.250 ******* 
changed: [worker_01]
changed: [worker_02]

TASK [Ensure the user exists and assign to the group] ***************************************************************
Monday 30 December 2024  09:21:48 +0000 (0:00:01.015)       0:00:03.266 ******* 
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this
module to work properly.
changed: [worker_01]
changed: [worker_02]

TASK [Verify the user creation] *************************************************************************************
Monday 30 December 2024  09:21:49 +0000 (0:00:01.027)       0:00:04.293 ******* 
changed: [worker_02]
changed: [worker_01]

TASK [Debug user information] ***************************************************************************************
Monday 30 December 2024  09:21:50 +0000 (0:00:00.992)       0:00:05.285 ******* 
ok: [worker_01] => {
    "msg": "uid=1000(testuser) gid=1001(testuser) groups=1001(testuser),1000(testgrp)"
}
ok: [worker_02] => {
    "msg": "uid=1000(testuser) gid=1001(testuser) groups=1001(testuser),1000(testgrp)"
}

PLAY RECAP **********************************************************************************************************
worker_01                  : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker_02                  : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 30 December 2024  09:21:50 +0000 (0:00:00.133)       0:00:05.419 ******* 
=============================================================================== 
Gathering Facts ---------------------------------------------------------------------------------------------- 2.24s
Ensure the user exists and assign to the group --------------------------------------------------------------- 1.03s
Ensure the group exists -------------------------------------------------------------------------------------- 1.02s
Verify the user creation ------------------------------------------------------------------------------------- 0.99s
Debug user information --------------------------------------------------------------------------------------- 0.13s
Playbook run took 0 days, 0 hours, 0 minutes, 5 seconds
```