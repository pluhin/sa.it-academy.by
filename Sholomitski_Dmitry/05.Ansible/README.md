# Homework Assignment 1: Setting Up Ansible

```bash
sudo apt install ansible

ansible --version

xaos@ubuntu:~/gitaction$ ansible --version
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/home/xaos/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/xaos/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Nov  6 2024, 18:32:19) [GCC 13.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True

mkdir ansible
cd ansible/
```

## Write an Ansible playbook that prints "Hello, Ansible!" to the console

```yaml
- hosts: all_workers
  gather_facts: False
  #strategy: free
  #serial: 1
  vars:
    var_01: "Hello, Ansible!"
  tasks:
    - name: Print variables
      debug:
        msg: "{{ var_01 }}"

```

```bash
ansible-playbook -i inv.yaml playbook1.yaml
```

```bash

PLAY [all_workers] **********************************************************************************************

TASK [Print variables] ******************************************************************************************
Thursday 02 January 2025  14:59:49 +0000 (0:00:00.005)       0:00:00.005 ******
ok: [host_19] => {
    "msg": "Hello, Ansible!"
}
ok: [host_20] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ******************************************************************************************************
host_19                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host_20                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 02 January 2025  14:59:49 +0000 (0:00:00.026)       0:00:00.031 ******
===============================================================================
Print variables ------------------------------------------------------------------------------------------ 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

## Homework Assignment 2: Managing Remote Hosts

### Create inventory file

```yaml
all_workers:
  children:
    work_sa:
      vars:
        ansible_user: root
      hosts:
        host_19:
          ansible_host: 192.168.202.19
        host_20:
          ansible_host: 192.168.202.20

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    jump_bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### Add SSH parametres

``` bash
xaos@ubuntu:~/ansible$ cat group_vars/all_workers/var.yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
```

#### Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host

``` yaml
- hosts: all_workers
  #gather_facts: False
  #strategy: free
  #serial: 1
  tasks:
    - name: Install mc
      ansible.builtin.apt:
        name: mc
        state: present
    - name: Check installation
      shell: |
        apt-cache policy mc | grep "Installed"
      register: installed
    - name: Print
      debug:
        msg: "{{ installed.stdout }}"
```

``` bash
xaos@ubuntu:~/ansible$ ansible-playbook -i inv.yaml playbook2.yaml

PLAY [all_workers] ********************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************
Thursday 02 January 2025  15:52:07 +0000 (0:00:00.004)       0:00:00.004 ******
ok: [host_19]
ok: [host_20]

TASK [Install mc] *********************************************************************************************************
Thursday 02 January 2025  15:52:12 +0000 (0:00:04.505)       0:00:04.510 ******
ok: [host_19]
ok: [host_20]

TASK [Check installation] *************************************************************************************************
Thursday 02 January 2025  15:52:14 +0000 (0:00:02.809)       0:00:07.320 ******
changed: [host_19]
changed: [host_20]

TASK [Print] **************************************************************************************************************
Thursday 02 January 2025  15:52:16 +0000 (0:00:01.938)       0:00:09.259 ******
ok: [host_19] => {
    "msg": "  Installed: 3:4.8.27-1"
}
ok: [host_20] => {
    "msg": "  Installed: 3:4.8.27-1"
}

PLAY RECAP ****************************************************************************************************************
host_19                    : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host_20                    : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 02 January 2025  15:52:17 +0000 (0:00:00.091)       0:00:09.350 ******
===============================================================================
Gathering Facts ---------------------------------------------------------------------------------------------------- 4.51s
Install mc --------------------------------------------------------------------------------------------------------- 2.81s
Check installation ------------------------------------------------------------------------------------------------- 1.94s
Print -------------------------------------------------------------------------------------------------------------- 0.09s
Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds
```

### Homework Assignment 3: Managing Users and Groups

create_user.yaml

```yaml
- name: Manage users and groups on remote hosts
  hosts: all_workers
  become: yes
  vars:
    user_name: "{{ user_name | default('newuser') }}"
    group_name: "{{ group_name | default('newgroup') }}"
    user_password: "{{ user_password | default('password123') }}"

  tasks:
    - name: Ensure the group exists
      ansible.builtin.group:
        name: "{{ group_name }}"
        state: present

    - name: Create a new user
      ansible.builtin.user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        shell: /bin/bash
        state: present
        create_home: yes
        password: "{{ user_password | password_hash('sha512') }}"

    - name: Add the user to the specified group (if not already added)
      ansible.builtin.user:
        name: "{{ user_name }}"
        groups: "{{ group_name }}"
        append: yes
        state: present

    - name: Verify the user and group configuration
      ansible.builtin.command:
        cmd: id {{ user_name }}
      register: user_info
      changed_when: false

    - name: Display the user and group info
      ansible.builtin.debug:
        msg: "User Info: {{ user_info.stdout }}"

```

``` bash
xaos@ubuntu:~/ansible$ ansible-playbook create_user.yml -i inv.yaml -e "user_name=testuser group_name=testgroup user_password='password'"

PLAY [Manage users and groups on remote hosts] ******************************************************************

TASK [Gathering Facts] ******************************************************************************************
Thursday 02 January 2025  15:41:14 +0000 (0:00:00.004)       0:00:00.004 ******
ok: [host_20]
ok: [host_19]

TASK [Ensure the group exists] **********************************************************************************
Thursday 02 January 2025  15:41:18 +0000 (0:00:03.592)       0:00:03.597 ******
ok: [host_19]
ok: [host_20]

TASK [Create a new user] ****************************************************************************************
Thursday 02 January 2025  15:41:20 +0000 (0:00:01.980)       0:00:05.578 ******
changed: [host_19]
changed: [host_20]

TASK [Add the user to the specified group (if not already added)] ***********************************************
Thursday 02 January 2025  15:41:22 +0000 (0:00:02.721)       0:00:08.299 ******
ok: [host_20]
ok: [host_19]

TASK [Verify the user and group configuration] ******************************************************************
Thursday 02 January 2025  15:41:25 +0000 (0:00:02.990)       0:00:11.289 ******
ok: [host_20]
ok: [host_19]

TASK [Display the user and group info] **************************************************************************
Thursday 02 January 2025  15:41:28 +0000 (0:00:02.511)       0:00:13.801 ******
ok: [host_19] => {
    "msg": "User Info: uid=1000(testuser) gid=1000(testgroup) groups=1000(testgroup)"
}
ok: [host_20] => {
    "msg": "User Info: uid=1000(testuser) gid=1000(testgroup) groups=1000(testgroup)"
}

PLAY RECAP ******************************************************************************************************
host_19                    : ok=6    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host_20                    : ok=6    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 02 January 2025  15:41:28 +0000 (0:00:00.087)       0:00:13.888 ******
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------ 3.59s
Add the user to the specified group (if not already added) ----------------------------------------------- 2.99s
Create a new user ---------------------------------------------------------------------------------------- 2.72s
Verify the user and group configuration ------------------------------------------------------------------ 2.51s
Ensure the group exists ---------------------------------------------------------------------------------- 1.98s
Display the user and group info -------------------------------------------------------------------------- 0.09s
Playbook run took 0 days, 0 hours, 0 minutes, 13 seconds
```
