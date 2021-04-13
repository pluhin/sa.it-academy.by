
# 14.Ansible

# Ansible tasks log
```
ansible-playbook -i inv.yaml play.yaml 

PLAY [redmine] *************************************************************************************

TASK [Gathering Facts] *****************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 16.04 on host redmine should use /usr/bin/python3, but 
is using /usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible 
release will default to using the discovered platform python for this host. See 
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more 
information. This feature will be removed in version 2.12. Deprecation warnings can be disabled by 
setting deprecation_warnings=False in ansible.cfg.
ok: [redmine]

TASK [Redmine. Install packages] *******************************************************************
ok: [redmine]

TASK [Redmine. Clone repository] *******************************************************************
ok: [redmine]

TASK [Redmine. Change permissions] *****************************************************************
ok: [redmine]

TASK [Redmine. Change permissions] *****************************************************************
ok: [redmine]

TASK [mysql : Redmine. Install packages] ***********************************************************
ok: [redmine]

TASK [mysql : MySQL. Install and setup] ************************************************************
ok: [redmine]

TASK [mysql : mysql_db] ****************************************************************************
ok: [redmine]

TASK [mysql : mysql_user] **************************************************************************
[WARNING]: Module did not set no_log for update_password
ok: [redmine]

TASK [mysql : Config database] *********************************************************************
ok: [redmine]

TASK [redmine : Redmine. Setup 01] *****************************************************************
changed: [redmine]

TASK [redmine : Session store secret generation] ***************************************************
ok: [redmine]

TASK [redmine : Redmine. Setup 02] *****************************************************************
changed: [redmine]

TASK [redmine : Install Nginx Web Server on Debian Family] *****************************************
skipping: [redmine]

TASK [redmine : Replace nginx.conf] ****************************************************************
ok: [redmine]

TASK [redmine : Configuration] *********************************************************************
ok: [redmine]

TASK [redmine : Add redmine-5.sa to host file] *****************************************************
changed: [redmine]

TASK [redmine : uri] *******************************************************************************
ok: [redmine]

TASK [redmine : lineinfile] ************************************************************************
ok: [redmine]

PLAY RECAP *****************************************************************************************
redmine                    : ok=18   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

```
