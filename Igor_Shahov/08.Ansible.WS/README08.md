# Ansible work

```

migel@migel:~/Ansible08/08Workshop$ ansible-playbook -i inventory.yaml task.yaml
[WARNING]: packaging Python module unavailable; unable to validate collection
Ansible version requirements

PLAY [redmine] ********************************************************************

TASK [Gathering Facts] ************************************************************
ok: [redmine_16]

TASK [Hosts] **********************************************************************
ok: [redmine_16] => {
    "msg": "192.168.201.16"
}

TASK [My_SQL : MY_SQL. Install packages] ******************************************
ok: [redmine_16]

TASK [My_SQL : mysql_db] **********************************************************
ok: [redmine_16]

TASK [My_SQL : mysql_user] ********************************************************
ok: [redmine_16]

TASK [redmine : Redmine. Clone repository] ****************************************
ok: [redmine_16]

TASK [redmine : Redmine. Change permissions] **************************************
ok: [redmine_16]

TASK [redmine : Redmine. Change permissions] **************************************
ok: [redmine_16]

TASK [redmine : Config database] **************************************************
ok: [redmine_16]

TASK [redmine : Redmine. Setup 01] ************************************************
changed: [redmine_16]

TASK [redmine : Session store secret generation] **********************************
ok: [redmine_16]

TASK [redmine : Redmine. Setup 02] ************************************************
changed: [redmine_16]

TASK [redmine : Configuration files for virtualhost] ******************************
ok: [redmine_16]

TASK [redmine : apache restart] ***************************************************
[WARNING]: Consider using the service module rather than running 'service'.  If
you need to use command because service is insufficient you can add 'warn: false'
to this command task or set 'command_warnings=False' in ansible.cfg to get rid of
this message.
changed: [redmine_16]

TASK [redmine : Add redmine-16.sa to host file] ***********************************
changed: [redmine_16]

TASK [add redmine to host file] ***************************************************
changed: [redmine_16]

TASK [uri] ************************************************************************
ok: [redmine_16]

TASK [lineinfile] *****************************************************************
changed: [redmine_16]

PLAY RECAP ************************************************************************
redmine_16                 : ok=18   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

migel@migel:~/Ansible08/08Workshop$

```