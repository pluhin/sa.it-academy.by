# CONFIGS

## ansible.cfg

```bash
 [defaults]
 # inventory = /etc/ansible/hosts
 # remote_tmp = /tmp/.ansible/tmp
 forks = 3
 host_key_checking = false
 callbacks_enabled = profile_tasks, timer
```

## inv.yaml

```bash
 all_workers:
  children:
   work_sa:
     hosts:
       host05:
         ansible_host: 192.168.202.5
	 ansible_user: root
       host06:
         ansible_host: 192.168.202.6
	 ansible_user: root
 jump_sa:
  vars:
   env: "it-academy"
  hosts:
   bastion:
     ansible_host: 178.124.206.53
     ansible_user: jump_sa
```

# HA1

## PLAYBOOK


```bash
 - hosts: work_sa
  gather_facts: False
  tasks:
   - name: Echo Hello
     debug:
       msg: "Hello, Ansible!"
```

## RESULT


```bash
PLAY [work_sa] ******************************************************************************************************************************************************************************

TASK [Echo Hello] ***************************************************************************************************************************************************************************
Tuesday 29 July 2025  18:08:02 +0000 (0:00:00.017)       0:00:00.017 **********
ok: [host05] => {
    "msg": "Hello, Ansible!"
}
ok: [host06] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP **********************************************************************************************************************************************************************************
host05                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 29 July 2025  18:08:02 +0000 (0:00:00.032)       0:00:00.049 **********
===============================================================================
Echo Hello --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

# HA2

## PLAYBOOK

```bash
- name: Install basic packages
  hosts: work_sa
  become: true

  vars:
    basic_packages:
      - htop
      - vim
      - curl
      - git
      - unzip
      - net-tools
      - wget

  tasks:
    - name: Update basic packages
      apt:
        update_cache: yes
        cache_valid_time: 3600

    - name: Install basic packages
      apt:
        name: "{{ basic_packages }}"
        state: present
```

## RESULT

```bash
PLAY [Install basic packages] ***************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************
Wednesday 30 July 2025  16:56:21 +0000 (0:00:00.019)       0:00:00.019 ********
[WARNING]: Platform linux on host host05 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning
of that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host05]
[WARNING]: Platform linux on host host06 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning
of that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host06]

TASK [Update basic packages] ****************************************************************************************************************************************************************
Wednesday 30 July 2025  16:56:24 +0000 (0:00:02.570)       0:00:02.589 ********
changed: [host05]
changed: [host06]

TASK [Install basic packages] ************************************************************************************************************************************************************
Wednesday 30 July 2025  16:56:37 +0000 (0:00:13.654)       0:00:16.243 ********
changed: [host06]
changed: [host05]

PLAY RECAP **********************************************************************************************************************************************************************************
host05                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 30 July 2025  16:56:41 +0000 (0:00:03.785)       0:00:20.029 ********
===============================================================================
Update basic packages --------------------------------------------------------------------------------------------------------------------------------------------------------------- 13.65s
Установка базовых пакетов ------------------------------------------------------------------------------------------------------------------------------------------------------------ 3.79s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.57s
Playbook run took 0 days, 0 hours, 0 minutes, 20 seconds
```

# HA3

## PLAYBOOK

```bash
- hosts: all_workers
  gather_facts: yes
  become: yes

  vars_prompt:
    - name: "new_user"
      prompt: "Enter the username for the new user"
      private: no
    - name: "user_password"
      prompt: "Enter the password for the new user"
      private: yes
    - name: "user_group"
      prompt: "Enter the group name to assign the user"
      private: no

  vars:
    ansible_python_interpreter: /usr/bin/python3

  tasks:
    - name: Ensure python3-pip is installed (Debian/Ubuntu)
      apt:
        name: python3-pip
        state: present
      when: ansible_facts['os_family'] == "Debian"

    - name: Ensure python3-pip is installed (RedHat/CentOS)
      yum:
        name: python3-pip
        state: present
      when: ansible_facts['os_family'] == "RedHat"

    - name: Install passlib python package via pip
      pip:
        name: passlib
        executable: pip3
        state: present

    - name: Add new user {{ new_user }}
      user:
        name: "{{ new_user }}"
        state: present
        shell: /bin/bash
        password: "{{ user_password | password_hash('sha512') }}"
      register: out
    - debug:
        var: out

    - name: Create group {{ user_group }}
      group:
        name: "{{ user_group }}"
        state: present
      register: out
    - debug:
        var: out
```

## RESULT 

```bash
Enter the username for the new user: devops-r
Enter the password for the new user:
Enter the group name to assign the user: dev-it

PLAY [all_workers] **************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************
Wednesday 30 July 2025  18:39:51 +0000 (0:00:19.029)       0:00:19.029 ********
ok: [host06]
ok: [host05]

TASK [Ensure python3-pip is installed (Debian/Ubuntu)] **************************************************************************************************************************************
Wednesday 30 July 2025  18:39:54 +0000 (0:00:02.508)       0:00:21.537 ********
ok: [host06]
ok: [host05]

TASK [Ensure python3-pip is installed (RedHat/CentOS)] **************************************************************************************************************************************
Wednesday 30 July 2025  18:39:55 +0000 (0:00:01.828)       0:00:23.366 ********
skipping: [host05]
skipping: [host06]

TASK [Install passlib python package via pip] ***********************************************************************************************************************************************
Wednesday 30 July 2025  18:39:56 +0000 (0:00:00.072)       0:00:23.438 ********
ok: [host05]
ok: [host06]

TASK [Add new user devops-r] ****************************************************************************************************************************************************************
Wednesday 30 July 2025  18:39:57 +0000 (0:00:01.464)       0:00:24.902 ********
changed: [host05]
changed: [host06]

TASK [debug] ********************************************************************************************************************************************************************************
Wednesday 30 July 2025  18:39:58 +0000 (0:00:01.430)       0:00:26.333 ********
ok: [host05] => {
    "out": {
        "changed": true,
        "comment": "",
        "create_home": true,
        "failed": false,
        "group": 1002,
        "home": "/home/devops-r",
        "name": "devops-r",
        "password": "NOT_LOGGING_PASSWORD",
        "shell": "/bin/bash",
        "state": "present",
        "system": false,
        "uid": 1001
    }
}
ok: [host06] => {
    "out": {
        "changed": true,
        "comment": "",
        "create_home": true,
        "failed": false,
        "group": 1002,
        "home": "/home/devops-r",
        "name": "devops-r",
        "password": "NOT_LOGGING_PASSWORD",
        "shell": "/bin/bash",
        "state": "present",
        "system": false,
        "uid": 1001
    }
}

TASK [Create group dev-it] ******************************************************************************************************************************************************************
Wednesday 30 July 2025  18:39:59 +0000 (0:00:00.068)       0:00:26.401 ********
changed: [host06]
changed: [host05]

TASK [debug] ********************************************************************************************************************************************************************************
Wednesday 30 July 2025  18:40:00 +0000 (0:00:01.416)       0:00:27.818 ********
ok: [host05] => {
    "out": {
        "changed": true,
        "failed": false,
        "gid": 1003,
        "name": "dev-it",
        "state": "present",
        "system": false
    }
}
ok: [host06] => {
    "out": {
        "changed": true,
        "failed": false,
        "gid": 1003,
        "name": "dev-it",
        "state": "present",
        "system": false
    }
}

TASK [Add user devops-r to groups dev-it and sudo] ******************************************************************************************************************************************
Wednesday 30 July 2025  18:40:00 +0000 (0:00:00.060)       0:00:27.878 ********
changed: [host05]
changed: [host06]

TASK [debug] ********************************************************************************************************************************************************************************
Wednesday 30 July 2025  18:40:01 +0000 (0:00:00.808)       0:00:28.687 ********
ok: [host05] => {
    "out": {
        "append": true,
        "changed": true,
        "comment": "",
        "failed": false,
        "group": 1002,
        "groups": "dev-it,sudo",
        "home": "/home/devops-r",
        "move_home": false,
        "name": "devops-r",
        "shell": "/bin/bash",
        "state": "present",
        "uid": 1001
    }
}
ok: [host06] => {
    "out": {
        "append": true,
        "changed": true,
        "comment": "",
        "failed": false,
        "group": 1002,
        "groups": "dev-it,sudo",
        "home": "/home/devops-r",
        "move_home": false,
        "name": "devops-r",
        "shell": "/bin/bash",
        "state": "present",
        "uid": 1001
    }
}

TASK [Check user groups] ********************************************************************************************************************************************************************
Wednesday 30 July 2025  18:40:01 +0000 (0:00:00.048)       0:00:28.735 ********
changed: [host06]
changed: [host05]

TASK [debug] ********************************************************************************************************************************************************************************
Wednesday 30 July 2025  18:40:02 +0000 (0:00:01.033)       0:00:29.769 ********
ok: [host05] => {
    "out.stdout_lines": [
        "uid=1001(devops-r) gid=1002(devops-r) groups=1002(devops-r),27(sudo),1003(dev-it)"
    ]
}
ok: [host06] => {
    "out.stdout_lines": [
        "uid=1001(devops-r) gid=1002(devops-r) groups=1002(devops-r),27(sudo),1003(dev-it)"
    ]
}

PLAY RECAP **********************************************************************************************************************************************************************************
host05                     : ok=11   changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host06                     : ok=11   changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Wednesday 30 July 2025  18:40:02 +0000 (0:00:00.079)       0:00:29.848 ********
===============================================================================
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.51s
Ensure python3-pip is installed (Debian/Ubuntu) -------------------------------------------------------------------------------------------------------------------------------------- 1.83s
Install passlib python package via pip ----------------------------------------------------------------------------------------------------------------------------------------------- 1.46s
Add new user devops-r ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.43s
Create group dev-it ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.42s
Check user groups -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.03s
Add user devops-r to groups dev-it and sudo ------------------------------------------------------------------------------------------------------------------------------------------ 0.81s
debug -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.08s
Ensure python3-pip is installed (RedHat/CentOS) -------------------------------------------------------------------------------------------------------------------------------------- 0.07s
debug -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
debug -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.06s
debug -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 29 seconds
```
