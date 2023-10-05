# 05.Ansible start

## Setting Up Ansible

### Installed  Ansible on my virtual environment. Created a directory for Ansble files

**Command history:**

```bash
  879  sudo apt update
  880  sudo apt upgrade
  881  apt install python3-pip
  882  mkdir 05.Ansble.Start
  883  cd 05.Ansble.Start
  884  pip3 install ansible
  885  ansible --version
```
---

**`ansible --version` output**
```bash
  ansible [core 2.15.4]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.9/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```

### Wrote an Ansible playbook that prints `"Hello, Ansible!"` to the console.

**Command history**

```bash
  886  nano playbook.yaml
  887  ansible-playbook playbook.yaml
```
---
**Ansble playbook inside**

```yaml
- name: all_machine
  hosts: localhost
  vars:
    hi: "Hello, Ansible!"
  tasks:
    - name: Print hi
      debug:
        msg: "{{ hi }}"
```
---
**What `ansible-playbook` print:**
```bash
PLAY [all_machine] *************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [Print hi] ****************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

---

## Managing Remote Hosts

### Use an  IT-ACADEMY DC VM. Ensured SSH access to the remote machine from local machine. And set up inventory file

**Inventory file**
```yaml

all_machine:
  children:
    work_sa:
      hosts:
        host5:
          ansible_host: 192.168.202.5
        host6:
          ansible_host: 192.168.202.6
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
**Config file**
```yaml
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
---
**Command history**
```bash 

  912  cd 05.Ansble.Start
  913  nano inventory.yaml
  914  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  915  ssh -p 32510 jump_sa@178.124.206.53
  917  nano ~/.ssh/config
  918  ssh root@192.168.202.5
  919  mkdir -p group_vars/all_machine
  920  nano group_vars/all_machine/vars.yaml
  921  ansible-inventory -i inventory.yaml --graph
  922  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_machine -u root --ask-pass
  923  nano group_vars/all_machine/vars.yaml
  924  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_machine -u root --ask-pass
  925  apt install sshpass
  926  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_machine -u root --ask-pass
  927  nano ansible.cfg
  928  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_machine -u root --ask-pass
  930  ssh root@192.168.202.5
  931  ssh root@192.168.202.6
```

### Wrote an Ansible playbook to install a packages (htop, ftop, mc, net-tools) on the remote host.

**Inside playbook file**
```yaml
- hosts: all_machine
  gather_facts: true
  pre_tasks:
    - name: Set authorized key taken from file
      authorized_key:
        user: "{{ ansible_user }}"
        state: present
        key: "{{ item }}"
      with_items:
      - "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
      tags:
        - never
  tasks:
  - name: Update app list
    apt:
      update_cache: yes
    tags:
      - install
  - name: Install iftop
    apt:
      name: iftop
      state: latest
    tags:
      - install
  - name: Install htop
    apt:
      name: htop
      state: latest
    tags:
      - install
  - name: Install mc
    apt:
      name: mc
      state: latest
    tags:
      - install
  - name: Install net-tools
    apt:
      name: net-tools
      state: latest
    tags:
      - install
  - name: All done
    debug:
      msg: "All apps installed"
    tags:
      - check
```

### Executed the playbook and verifyed that the package was installed on the remote host

**Command history**
```bash 
  946  nano playbbok2.yaml
  947  ansible-playbook -i inventory.yaml playbbok2.yaml  --ask-vault-pass
```

**Result of playbook:**
```bash
 05.Ansble.Start ansible-playbook -i inventory.yaml playbbok2.yaml  --ask-vault-pass
Vault password:

PLAY [all_machine] *************************************************************

TASK [Gathering Facts] *********************************************************
Среда 04 октября 2023  21:16:33 +0300 (0:00:00.012)       0:00:00.012 *********
ok: [host6]
ok: [host5]

TASK [Update app list] *********************************************************
Среда 04 октября 2023  21:16:36 +0300 (0:00:02.594)       0:00:02.606 *********
changed: [host6]
changed: [host5]

TASK [Install iftop] ***********************************************************
Среда 04 октября 2023  21:16:45 +0300 (0:00:09.584)       0:00:12.191 *********
changed: [host5]
changed: [host6]

TASK [Install htop] ************************************************************
Среда 04 октября 2023  21:16:49 +0300 (0:00:03.202)       0:00:15.394 *********
changed: [host5]
changed: [host6]

TASK [Install mc] **************************************************************
Среда 04 октября 2023  21:16:52 +0300 (0:00:03.317)       0:00:18.711 *********
ok: [host6]
ok: [host5]

TASK [Install net-tools] *******************************************************
Среда 04 октября 2023  21:16:53 +0300 (0:00:01.567)       0:00:20.279 *********
changed: [host5]
changed: [host6]

TASK [All done] ****************************************************************
Среда 04 октября 2023  21:17:07 +0300 (0:00:13.816)       0:00:34.095 *********
ok: [host5] => {
    "msg": "All apps installed"
}
ok: [host6] => {
    "msg": "All apps installed"
}

PLAY RECAP *********************************************************************
host5                      : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host6                      : ok=7    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Среда 04 октября 2023  21:17:07 +0300 (0:00:00.181)       0:00:34.277 *********
===============================================================================
Install net-tools ------------------------------------------------------ 13.82s
Update app list --------------------------------------------------------- 9.58s
Install htop ------------------------------------------------------------ 3.32s
Install iftop ----------------------------------------------------------- 3.20s
Gathering Facts --------------------------------------------------------- 2.59s
Install mc -------------------------------------------------------------- 1.57s
All done ---------------------------------------------------------------- 0.18s
Playbook run took 0 days, 0 hours, 0 minutes, 34 seconds
```

## Managing Users and Groups

### Created a playbook to manage users and groups on a remote host.

**Command history**
```bash
 962  nano users.yaml
 987  ansible-vault edit  group_vars/all_machine/vault.yaml
 988  ansible-playbook -i inventory.yaml users.yaml --ask-vault-pass
```

**Inside Playbook file**
```yaml
- hosts: "{{ group | default('all_machine') }}"
  vars:
    new_user: ivanchuk
    new_group: md_sa2_25_23
  tasks:
  - name: Check variable
    debug:
      msg: "You requested user {{ new_user }} | Also yoy requested group {{ new_group }}"
  - name: Creating group {{ new_group }}
    group:
      name: "{{ new_group }}"
      state: present
    register: group_check_result
  - name: Check {{ new_group }}
    command: getent group {{ new_group }}
    register: group_check_result
    ignore_errors: yes
  - name: Message from check group
    debug:
      msg: |
        Group {{ new_group }}
        {{ "Alredy exist." if group_check_result.rc == 0 else "don't esxist" }}
  - name: Creating user {{ new_user }}
    user:
      name: "{{ new_user }}"
      comment: Ya Ya Ya
      state: present
  - name: Check user
    shell: |
      grep "{{ new_user }}" /etc/passwd
      date
    register: out
  - name: Message from check user
    debug:
      msg: "{{ out.stdout_lines }}"
  - name: Hack vault
    ansible.builtin.include_vars:
      file: /home/05.Ansble.Start/group_vars/all_machine/vault.yaml
  - name: Set User password
    user:
      name: "{{ new_user }}"
      password: "{{ set_password }}"
      state: present
    become: yes
  - name: Check password
    shell: "passwd -S {{ new_user }}"
    register: passwd_result
  - name: Check message password
    debug:
      msg: "Current password status: {{ passwd_result.stdout }}"
```

### Executed the playbook and verifyed that the user and group configurations was applied.

**Result of playbook**
```bash 
Vault password:

PLAY [all_machine] ***********************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
Четверг 05 октября 2023  18:48:34 +0300 (0:00:00.061)       0:00:00.061 *******
ok: [host6]
ok: [host5]

TASK [Check variable] ********************************************************************************************************************
Четверг 05 октября 2023  18:48:37 +0300 (0:00:02.741)       0:00:02.803 *******
ok: [host5] => {
    "msg": "You requested user ivanchuk | Also yoy requested group md_sa2_25_23"
}
ok: [host6] => {
    "msg": "You requested user ivanchuk | Also yoy requested group md_sa2_25_23"
}

TASK [Creating group md_sa2_25_23] *******************************************************************************************************
Четверг 05 октября 2023  18:48:37 +0300 (0:00:00.096)       0:00:02.900 *******
ok: [host6]
ok: [host5]

TASK [Check md_sa2_25_23] ****************************************************************************************************************
Четверг 05 октября 2023  18:48:38 +0300 (0:00:00.939)       0:00:03.840 *******
changed: [host5]
changed: [host6]

TASK [Message from check group] **********************************************************************************************************
Четверг 05 октября 2023  18:48:39 +0300 (0:00:00.952)       0:00:04.793 *******
ok: [host5] => {
    "msg": "Group md_sa2_25_23\nAlredy exist.\n"
}
ok: [host6] => {
    "msg": "Group md_sa2_25_23\nAlredy exist.\n"
}

TASK [Creating user ivanchuk] ************************************************************************************************************
Четверг 05 октября 2023  18:48:39 +0300 (0:00:00.079)       0:00:04.873 *******
ok: [host6]
ok: [host5]

TASK [Check user] ************************************************************************************************************************
Четверг 05 октября 2023  18:48:40 +0300 (0:00:01.096)       0:00:05.969 *******
changed: [host5]
changed: [host6]

TASK [Message from check user] ***********************************************************************************************************
Четверг 05 октября 2023  18:48:41 +0300 (0:00:00.830)       0:00:06.799 *******
ok: [host5] => {
    "msg": [
        "ivanchuk:x:1000:1001:Ya Ya Ya:/home/ivanchuk:/bin/sh",
        "Thu Oct  5 15:48:41 UTC 2023"
    ]
}
ok: [host6] => {
    "msg": [
        "ivanchuk:x:1000:1001:Ya Ya Ya:/home/ivanchuk:/bin/sh",
        "Thu Oct  5 15:48:41 UTC 2023"
    ]
}

TASK [Hack vault] ************************************************************************************************************************
Четверг 05 октября 2023  18:48:41 +0300 (0:00:00.076)       0:00:06.876 *******
ok: [host5]
ok: [host6]

TASK [Set User password] *****************************************************************************************************************
Четверг 05 октября 2023  18:48:41 +0300 (0:00:00.126)       0:00:07.003 *******
[WARNING]: The input password appears not to have been hashed. The 'password' argument must be encrypted for this module to work
properly.
changed: [host5]
changed: [host6]

TASK [Check password] ********************************************************************************************************************
Четверг 05 октября 2023  18:48:42 +0300 (0:00:00.892)       0:00:07.895 *******
changed: [host5]
changed: [host6]

TASK [Check message password] ************************************************************************************************************
Четверг 05 октября 2023  18:48:43 +0300 (0:00:00.826)       0:00:08.722 *******
ok: [host5] => {
    "msg": "Current password status: ivanchuk P 10/05/2023 0 99999 7 -1"
}
ok: [host6] => {
    "msg": "Current password status: ivanchuk P 10/05/2023 0 99999 7 -1"
}

PLAY RECAP *******************************************************************************************************************************
host5                      : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host6                      : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Четверг 05 октября 2023  18:48:43 +0300 (0:00:00.191)       0:00:08.914 *******
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------------------- 2.74s
Creating user ivanchuk ------------------------------------------------------------------------------------------------------------ 1.10s
Check md_sa2_25_23 ---------------------------------------------------------------------------------------------------------------- 0.95s
Creating group md_sa2_25_23 ------------------------------------------------------------------------------------------------------- 0.94s
Set User password ----------------------------------------------------------------------------------------------------------------- 0.89s
Check user ------------------------------------------------------------------------------------------------------------------------ 0.83s
Check password -------------------------------------------------------------------------------------------------------------------- 0.83s
Check message password ------------------------------------------------------------------------------------------------------------ 0.19s
Hack vault ------------------------------------------------------------------------------------------------------------------------ 0.13s
Check variable -------------------------------------------------------------------------------------------------------------------- 0.10s
Message from check group ---------------------------------------------------------------------------------------------------------- 0.08s
Message from check user ----------------------------------------------------------------------------------------------------------- 0.08s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```
