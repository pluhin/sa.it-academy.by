### 08.Ansible.Workshop

```bash
dmitry@vmbox01:~/ansible_workshop$ ansible-playbook -i inv.yaml redmine.yaml

PLAY [redmine] ***********************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 16.04 on host redmine should use /usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible
releases. A future Ansible release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in version 2.12. Deprecation
warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [redmine]

TASK [Show ansible host] *************************************************************************************************************************************************
ok: [redmine] => {
    "msg": "192.168.201.10"
}

TASK [mysql : MySQL.Install MYSQL] ***************************************************************************************************************************************
ok: [redmine]

TASK [mysql : MySQL.Create DB] *******************************************************************************************************************************************
ok: [redmine]

TASK [mysql : MySQL.Create DB User] **************************************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Install Redmine and dependencies] ***************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Clone repository] *******************************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Change permissions] *****************************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Change permissions] *****************************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Config database] ********************************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Setup 01] ***************************************************************************************************************************************
changed: [redmine]

TASK [redmine : Redmine. Session store secret generation] ****************************************************************************************************************
ok: [redmine]

TASK [redmine : Redmine. Setup 02] ***************************************************************************************************************************************
changed: [redmine]

TASK [redmine : Redmine. Configuration files for virtualhost] ************************************************************************************************************
ok: [redmine]

TASK [Add redmine-10.sa to host file] ************************************************************************************************************************************
changed: [redmine]

TASK [uri] ***************************************************************************************************************************************************************
ok: [redmine]

TASK [lineinfile] ********************************************************************************************************************************************************
changed: [redmine]

PLAY RECAP ***************************************************************************************************************************************************************
redmine                    : ok=17   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
