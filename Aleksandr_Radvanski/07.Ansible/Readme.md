https://github.com/aionfiend/07.Ansible

#7.1
1. brew install ansible
2. mkdir 07.Ansible/7.1
3. touch ansible.cfg, inventory.ini, playbook.yaml
4. user@users-MacBook-Pro$ ansible-playbook playbook.yaml
```[WARNING]: Unable to parse /Users/user/Documents/DevOps_learning/07.Ansible/Ansible/07.Ansible/7.1/localhost as an inventory source
   [WARNING]: No inventory was parsed, only implicit localhost is available
   [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
   [WARNING]: Skipping callback plugin 'timer #время выполнения задачи', unable to load

PLAY [Hello] *****************************************************************************************************************************************************************************************************************

TASK [Print Hello] ***********************************************************************************************************************************************************************************************************
ok: [localhost] => {
"msg": "Hello, Ansible"
}

PLAY RECAP *******************************************************************************************************************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

#7.2
```
root@ws-1:~# htop --version
htop 3.0.5

user@users-MacBook-Pro$ ansible-playbook -i inventory.yaml playbook.yaml
[WARNING]: Skipping callback plugin 'timer #время выполнения задачи', unable to load

PLAY [all] *******************************************************************************************************************************************************************************************************************

TASK [Install htop] **********************************************************************************************************************************************************************************************************
Monday 07 September 2026  14:54:36 +0300 (0:00:00.023)       0:00:00.023 ****** 
[WARNING]: Host 'host01' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
changed: [host01]

PLAY RECAP *******************************************************************************************************************************************************************************************************************
host01                     : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


TASKS RECAP ******************************************************************************************************************************************************************************************************************
Monday 07 September 2026  14:54:50 +0300 (0:00:14.317)       0:00:14.341 ****** 
=============================================================================== 
Install htop --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 14.32s

```

#7.3
1. user@users-MacBook-Pro$ ansible-playbook -i inventory.yaml playbook.yaml --ask-vault-pass
```
Vault password:
[WARNING]: Skipping callback plugin 'profile_tasks #время выполнения задачи', unable to load

PLAY [all] *******************************************************************************************************************************************************************************************************************

TASK [add group] *************************************************************************************************************************************************************************************************************
[WARNING]: Host 'host01' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ok: [host01]

TASK [add user stydent1] *****************************************************************************************************************************************************************************************************
changed: [host01]

TASK [Check 'add user'] ******************************************************************************************************************************************************************************************************
ok: [host01]

TASK [Out work info] *********************************************************************************************************************************************************************************************************
ok: [host01] => {
"msg": "Done. User testuser has been verified."
}

PLAY RECAP *******************************************************************************************************************************************************************************************************************
host01                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
2. user@users-MacBook-Pro$ ansible-playbook -i inventory.yaml playbook.yaml --ask-vault-pass -e "user_name=firstuser group_name=testgroup"
```
 Vault password:
   [WARNING]: Skipping callback plugin 'profile_tasks #время выполнения задачи', unable to load

PLAY [all] *******************************************************************************************************************************************************************************************************************

TASK [add group] *************************************************************************************************************************************************************************************************************
[WARNING]: Host 'host01' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.21/reference_appendices/interpreter_discovery.html for more information.
ok: [host01]

TASK [add user stydent1] *****************************************************************************************************************************************************************************************************
changed: [host01]

TASK [Check 'add user'] ******************************************************************************************************************************************************************************************************
ok: [host01]

TASK [Show user check result] ************************************************************************************************************************************************************************************************
ok: [host01] => {
"user_check.ansible_facts.getent_passwd": {
"firstuser": [
"x",
"1001",
"1002",
"",
"/home/firstuser",
"/bin/bash"
]
}
}

TASK [Out work info] *********************************************************************************************************************************************************************************************************
ok: [host01] => {
"msg": "Done. User firstuser has been verified."
}

PLAY RECAP *******************************************************************************************************************************************************************************************************************
host01                     : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```