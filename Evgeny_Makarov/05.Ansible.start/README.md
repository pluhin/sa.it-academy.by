# 05.Ansible.Start

### Assignment 1
* Ansible install. Version: 2.20.5
* Added playbook `hello.yaml`
* `ansible-playbook hello.yaml`
* Result:
```bash
PLAY [My playbook] *************************************************************

TASK [Print hello message] *****************************************************
Monday 11 May 2026  11:29:31 +0300 (0:00:00.021)       0:00:00.021 ************ 
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


TASKS RECAP ********************************************************************
Monday 11 May 2026  11:29:31 +0300 (0:00:00.009)       0:00:00.030 ************ 
=============================================================================== 
Print hello message ----------------------------------------------------- 0.01s

PLAYBOOK RECAP *****************************************************************
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```
