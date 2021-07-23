## Ansible log
---
```bash
vagrant@ubuntu:~$ ansible-playbook -i hosts.yaml play2.yaml

PLAY [redmine] *****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [red_01]

TASK [debug] *******************************************************************
ok: [red_01] => {
    "msg": "192.168.201.15"
}

TASK [mysql : mysql_db] ********************************************************
ok: [red_01]

TASK [mysql : mysql_user] ******************************************************
ok: [red_01]

TASK [mysql : Config database] *************************************************
ok: [red_01]

TASK [redmine : Redmine. Clone repository] *************************************
ok: [red_01]

TASK [redmine : Redmine. Change permissions] ***********************************
ok: [red_01]

TASK [redmine : Redmine. Change permissions] ***********************************
changed: [red_01]

TASK [redmine : Redmine. Setup 01] *********************************************
changed: [red_01]

TASK [redmine : Session store secret generation] *******************************
ok: [red_01]

TASK [redmine : Redmine. Setup 02] *********************************************
changed: [red_01]

TASK [redmine : Configuration files for virtualhost] ***************************
ok: [red_01]

TASK [Add redmine-15.sa to host file] ******************************************
changed: [red_01]

TASK [uri] *********************************************************************
ok: [red_01]

TASK [lineinfile] **************************************************************
changed: [red_01]

TASK [Check connection] ********************************************************
ok: [red_01]

TASK [Send notification] *******************************************************
ok: [red_01]

TASK [Test] ********************************************************************
ok: [red_01]

TASK [Print output] ************************************************************
ok: [red_01] => {
    "msg": "Status: 200"
}

PLAY RECAP *********************************************************************
red_01                     : ok=19   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

vagrant@ubuntu:~$

```