# Configs:

### inv.yaml

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.3
        host2:
          ansible_host: 192.168.202.4
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### ansible.cfg

```yaml
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
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
(ansible_venv) admin@Ubuntu:~/05.Ansible$ ansible-playbook -i inv.yaml hello_ansible.yaml

PLAY [all_workers] *************************************************************************************

TASK [Hello Ansible] ***********************************************************************************
Wednesday 09 July 2025  17:29:42 +0000 (0:00:00.007)       0:00:00.007 ********
ok: [host1] => {
    "msg": "Hello, Ansible!"
}
ok: [host2] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************************************
host1                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 09 July 2025  17:29:42 +0000 (0:00:00.022)       0:00:00.029 ********
===============================================================================
Hello Ansible ----------------------------------------------------------------------------------- 0.02s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

## Home Assigment 2

```yaml
- hosts: all_workers
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
(ansible_venv) admin@Ubuntu:~/05.Ansible$ ansible-playbook -i inv.yaml install_packs.yaml

PLAY [all_workers] *************************************************************************************

TASK [Install vim] *************************************************************************************
Wednesday 09 July 2025  17:51:15 +0000 (0:00:00.006)       0:00:00.006 ********
ok: [host1]
ok: [host2]

TASK [Install Htop] ************************************************************************************
Wednesday 09 July 2025  17:51:18 +0000 (0:00:03.282)       0:00:03.288 ********
ok: [host2]
ok: [host1]

TASK [Install mc] **************************************************************************************
Wednesday 09 July 2025  17:51:20 +0000 (0:00:02.292)       0:00:05.581 ********
ok: [host1]
ok: [host2]

PLAY RECAP *********************************************************************************************
host1                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 09 July 2025  17:51:22 +0000 (0:00:02.267)       0:00:07.848 ********
===============================================================================
Install vim ------------------------------------------------------------------------------------- 3.28s
Install Htop ------------------------------------------------------------------------------------ 2.29s
Install mc -------------------------------------------------------------------------------------- 2.27s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds
```


## Home Assigment 3

```yaml
- hosts: all_workers
  become: true
  vars:
    target_user: "user1"
    target_group: "DevOps"

  tasks:
    - name: Create group
      ansible.builtin.group:
        name: "{{ target_group }}"
        state: present

    - name: Create user
      ansible.builtin.user:
        name: "{{ target_user }}"
        group: "{{ target_group }}"
        shell: /bin/bash
```

```
(ansible_venv) admin@Ubuntu:~/05.Ansible$ ansible-playbook -i inv.yaml create_user.yaml

PLAY [all_workers] *************************************************************************************

TASK [Gathering Facts] *********************************************************************************
Wednesday 09 July 2025  18:13:38 +0000 (0:00:00.007)       0:00:00.007 ********
ok: [host2]
ok: [host1]

TASK [Create group] ************************************************************************************
Wednesday 09 July 2025  18:13:40 +0000 (0:00:02.053)       0:00:02.061 ********
ok: [host1]
ok: [host2]

TASK [Create user] *************************************************************************************
Wednesday 09 July 2025  18:13:40 +0000 (0:00:00.692)       0:00:02.753 ********
ok: [host1]
ok: [host2]

PLAY RECAP *********************************************************************************************
host1                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 09 July 2025  18:13:41 +0000 (0:00:01.071)       0:00:03.824 ********
===============================================================================
Gathering Facts --------------------------------------------------------------------------------- 2.05s
Create user ------------------------------------------------------------------------------------- 1.07s
Create group ------------------------------------------------------------------------------------ 0.69s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds
```















