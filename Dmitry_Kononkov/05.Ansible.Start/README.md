# Configs:

### inv.yaml

```yaml
cen_all: 
  vars: 
    ansible_ssh_user: root
  children:
    work_host:
      hosts: 
        work_01:
          ansible_host: 192.168.100.xxx
```

### ansible.cfg

```yaml
[defaults]
host_key_checking = False
callback_whitelist = profile_tasks, timer
[inventory]
[privilege_escalation]
[paramiko_connection]
[connection]
[persistent_connection]
[accelerate]
[selinux]
[colors]
[diff]
```

## Home Assigment 1

```yaml
- hosts: work_host
  gather_facts: False
  tasks:
    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```

```
root@ubuntu-focal:~/05.Ansible.Start# ansible-playbook -i inv.yaml hello_playbook.yaml 
[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names to new standard, use callbacks_enabled instead. This feature will be removed from 
ansible-core in version 2.15. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.

PLAY [work_host] ************************************************************************************************************************************************

TASK [Hello Ansible] ********************************************************************************************************************************************
Sunday 04 February 2024  18:49:00 +0000 (0:00:00.015)       0:00:00.015 ******* 
ok: [work_01] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ******************************************************************************************************************************************************
work_01                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 04 February 2024  18:49:00 +0000 (0:00:00.029)       0:00:00.045 ******* 
=============================================================================== 
Hello Ansible -------------------------------------------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

## Home Assigment 2

```yaml
- hosts: work_host
  gather_facts: False
  
  
  tasks:
    - name: Install vim
      package:
        name: vim
        state: present  
    - name: Install Htop
      package:
        name: htop
        state: present
    - name: Install mc
      package:
        name: mc
        state: present
```

```
root@ubuntu-focal:~/05.Ansible.Start# ansible-playbook -i inv.yaml packages.yaml 
[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names to new standard, use callbacks_enabled instead. This feature will be removed from 
ansible-core in version 2.15. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.

PLAY [work_host] ************************************************************************************************************************************************

TASK [Install vim] **********************************************************************************************************************************************
Sunday 04 February 2024  18:50:42 +0000 (0:00:00.018)       0:00:00.018 ******* 
ok: [work_01]

TASK [Install Htop] *********************************************************************************************************************************************
Sunday 04 February 2024  18:50:45 +0000 (0:00:02.801)       0:00:02.820 ******* 
ok: [work_01]

TASK [Install mc] ***********************************************************************************************************************************************
Sunday 04 February 2024  18:50:46 +0000 (0:00:01.587)       0:00:04.407 ******* 
changed: [work_01]

PLAY RECAP ******************************************************************************************************************************************************
work_01                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 04 February 2024  18:50:53 +0000 (0:00:06.800)       0:00:11.208 ******* 
=============================================================================== 
Install mc ----------------------------------------------------------------------------------------------------------------------------------------------- 6.80s
Install vim ---------------------------------------------------------------------------------------------------------------------------------------------- 2.80s
Install Htop --------------------------------------------------------------------------------------------------------------------------------------------- 1.59s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds
```

## Home Assigment 3

```yaml
- hosts: work_host
  become: yes
  
  tasks:
    - name: Create group
      user:
        name: users-01
        state: present

    - name: Create user
      user:
        name: user1
        state: present
        shell: /bin/bash
        groups: users-01
```

```
root@ubuntu-focal:~/05.Ansible.Start# ansible-playbook -i inv.yaml users-group.yaml 
[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names to new standard, use callbacks_enabled instead. This feature will be removed from 
ansible-core in version 2.15. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.

PLAY [work_host] ************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************
Sunday 04 February 2024  19:14:26 +0000 (0:00:00.011)       0:00:00.011 ******* 
ok: [work_01]

TASK [Create group] *********************************************************************************************************************************************
Sunday 04 February 2024  19:14:28 +0000 (0:00:02.051)       0:00:02.062 ******* 
ok: [work_01]

TASK [Create user] **********************************************************************************************************************************************
Sunday 04 February 2024  19:14:28 +0000 (0:00:00.508)       0:00:02.571 ******* 
changed: [work_01]

PLAY RECAP ******************************************************************************************************************************************************
work_01                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 04 February 2024  19:14:29 +0000 (0:00:00.374)       0:00:02.946 ******* 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------ 2.05s
Create group --------------------------------------------------------------------------------------------------------------------------------------------- 0.51s
Create user ---------------------------------------------------------------------------------------------------------------------------------------------- 0.37s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```