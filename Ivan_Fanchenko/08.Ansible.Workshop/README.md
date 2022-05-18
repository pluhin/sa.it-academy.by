# 08.Ansible.Workshop

## Redmine screenshot

![Redmine screenshot](./printscreen_of_redmine.png)


## Console output result

```yaml
ansible-playbook -i inventory.yaml redmine.yaml

PLAY [redmine] *****************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 16.04 on host redmine_27 should use /usr/bin/python3, but is using /usr/bin/python for backward 
compatibility with prior Ansible releases. A future Ansible release will default to using the discovered platform python for this host. See
 https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in
 version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [redmine_27]

TASK [debug] *******************************************************************************************************************************
ok: [redmine_27] => {
    "msg": "192.168.201.27"
}

TASK [Redmine. Install packages] ***********************************************************************************************************
ok: [redmine_27]

TASK [redmine : Redmine. Clone repository] *************************************************************************************************
ok: [redmine_27]

TASK [redmine : Redmine. Change permissions] ***********************************************************************************************
ok: [redmine_27]

TASK [redmine : Redmine. Change permissions] ***********************************************************************************************
changed: [redmine_27]

TASK [redmine : Config database] ***********************************************************************************************************
ok: [redmine_27]

TASK [redmine : Redmine. Setup 01] *********************************************************************************************************
changed: [redmine_27]

TASK [redmine : Session store secret generation] *******************************************************************************************
ok: [redmine_27]

TASK [redmine : Redmine. Setup 02] *********************************************************************************************************
changed: [redmine_27]

TASK [redmine : Configuration files for virtualhost] ***************************************************************************************
ok: [redmine_27]

TASK [mysql : mysql_db] ********************************************************************************************************************
ok: [redmine_27]

TASK [mysql : mysql_user] ******************************************************************************************************************
ok: [redmine_27]

TASK [Add redmine-27.sa to host file] ******************************************************************************************************
changed: [redmine_27]

TASK [uri] *********************************************************************************************************************************
ok: [redmine_27]

TASK [uri] *********************************************************************************************************************************
ok: [redmine_27]

TASK [lineinfile] **************************************************************************************************************************
changed: [redmine_27]

PLAY RECAP *********************************************************************************************************************************
redmine_27                 : ok=17   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```


## Testing console output result

```yaml
ansible-playbook -i inventory.yaml redmine.yaml -t test --ask-vault-pass

Vault password: 

PLAY [redmine] *****************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 16.04 on host redmine_27 should use /usr/bin/python3, but is using /usr/bin/python for backward 
compatibility with prior Ansible releases. A future Ansible release will default to using the discovered platform python for this host. See
 https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in
 version 2.12. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [redmine_27]

TASK [Add redmine-27.sa to host file] ******************************************************************************************************
changed: [redmine_27]

TASK [==== Test deployment ====] ***********************************************************************************************************
ok: [redmine_27]

TASK [Send successfull notification to slack] **********************************************************************************************
ok: [redmine_27]

TASK [lineinfile] **************************************************************************************************************************
changed: [redmine_27]

PLAY RECAP *********************************************************************************************************************************
redmine_27                 : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  

```