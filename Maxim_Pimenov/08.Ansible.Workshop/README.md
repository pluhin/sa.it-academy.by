### 08.Ansible.Workshop
## Playbook play.yml
~~~bash

PLAY [redmine_23] **************************************************************

TASK [Gathering Facts] *********************************************************
Tuesday 07 June 2022  22:44:41 +0300 (0:00:00.013)       0:00:00.013 ********** 
ok: [redmine_23]

TASK [debug] *******************************************************************
Tuesday 07 June 2022  22:44:44 +0300 (0:00:02.732)       0:00:02.745 ********** 
ok: [redmine_23] => {
    "msg": "192.168.201.23"
}

TASK [Base packages] ***********************************************************
Tuesday 07 June 2022  22:44:44 +0300 (0:00:00.032)       0:00:02.778 ********** 
included: /home/maxim/ansible_roles/base_packages.yaml for redmine_23

TASK [Redmine. Install base packages] ******************************************
Tuesday 07 June 2022  22:44:44 +0300 (0:00:00.068)       0:00:02.847 ********** 
ok: [redmine_23]

TASK [mysql : Redmine. Install MySQL packages] *********************************
Tuesday 07 June 2022  22:44:46 +0300 (0:00:02.622)       0:00:05.469 ********** 
ok: [redmine_23]

TASK [mysql : mysql_db] ********************************************************
Tuesday 07 June 2022  22:44:49 +0300 (0:00:02.655)       0:00:08.124 ********** 
ok: [redmine_23]

TASK [mysql : mysql_user] ******************************************************
Tuesday 07 June 2022  22:44:51 +0300 (0:00:01.616)       0:00:09.741 ********** 
ok: [redmine_23]

TASK [redmine : Redmine. Clone repository] *************************************
Tuesday 07 June 2022  22:44:52 +0300 (0:00:01.614)       0:00:11.355 ********** 
ok: [redmine_23]

TASK [redmine : Redmine. Change permissions for Apache] ************************
Tuesday 07 June 2022  22:44:54 +0300 (0:00:01.734)       0:00:13.090 ********** 
ok: [redmine_23]

TASK [redmine : Redmine. Change permissions for Redmine] ***********************
Tuesday 07 June 2022  22:44:56 +0300 (0:00:01.642)       0:00:14.732 ********** 
ok: [redmine_23]

TASK [redmine : Config database] ***********************************************
Tuesday 07 June 2022  22:44:57 +0300 (0:00:01.650)       0:00:16.382 ********** 
ok: [redmine_23]

TASK [redmine : Redmine. Setup 01] *********************************************
Tuesday 07 June 2022  22:45:00 +0300 (0:00:02.287)       0:00:18.670 ********** 
changed: [redmine_23]

TASK [redmine : Session store secret generation] *******************************
Tuesday 07 June 2022  22:45:07 +0300 (0:00:06.927)       0:00:25.597 ********** 
ok: [redmine_23]

TASK [redmine : Redmine. Setup 02] *********************************************
Tuesday 07 June 2022  22:45:08 +0300 (0:00:01.568)       0:00:27.165 ********** 
changed: [redmine_23]

TASK [redmine : Configuration files for virtualhost] ***************************
Tuesday 07 June 2022  22:45:21 +0300 (0:00:12.546)       0:00:39.712 ********** 
ok: [redmine_23]

TASK [redmine : meta] **********************************************************
Tuesday 07 June 2022  22:45:23 +0300 (0:00:02.198)       0:00:41.911 ********** 

TASK [Validation & notification] ***********************************************
Tuesday 07 June 2022  22:45:23 +0300 (0:00:00.038)       0:00:41.949 ********** 
included: /home/maxim/ansible_roles/validation.yaml for redmine_23

TASK [Add redmine-23.sa to host file] ******************************************
Tuesday 07 June 2022  22:45:23 +0300 (0:00:00.086)       0:00:42.035 ********** 
changed: [redmine_23]

TASK [uri] *********************************************************************
Tuesday 07 June 2022  22:45:24 +0300 (0:00:01.496)       0:00:43.532 ********** 
ok: [redmine_23]

TASK [Send success notification] ***********************************************
Tuesday 07 June 2022  22:45:26 +0300 (0:00:01.530)       0:00:45.063 ********** 
ok: [redmine_23]

TASK [Remove redmine-23.sa record from hosts file] *****************************
Tuesday 07 June 2022  22:45:28 +0300 (0:00:02.092)       0:00:47.156 ********** 
changed: [redmine_23]

PLAY RECAP *********************************************************************
redmine_23                 : ok=20   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 07 June 2022  22:45:30 +0300 (0:00:01.457)       0:00:48.613 ********** 
=============================================================================== 
redmine : Redmine. Setup 02 -------------------------------------------- 12.55s
redmine : Redmine. Setup 01 --------------------------------------------- 6.93s
Gathering Facts --------------------------------------------------------- 2.73s
mysql : Redmine. Install MySQL packages --------------------------------- 2.66s
Redmine. Install base packages ------------------------------------------ 2.62s
redmine : Config database ----------------------------------------------- 2.29s
redmine : Configuration files for virtualhost --------------------------- 2.20s
Send success notification ----------------------------------------------- 2.09s
redmine : Redmine. Clone repository ------------------------------------- 1.73s
redmine : Redmine. Change permissions for Redmine ----------------------- 1.65s
redmine : Redmine. Change permissions for Apache ------------------------ 1.64s
mysql : mysql_db -------------------------------------------------------- 1.62s
mysql : mysql_user ------------------------------------------------------ 1.61s
redmine : Session store secret generation ------------------------------- 1.57s
uri --------------------------------------------------------------------- 1.53s
Add redmine-23.sa to host file ------------------------------------------ 1.50s
Remove redmine-23.sa record from hosts file ----------------------------- 1.46s
Validation & notification ----------------------------------------------- 0.09s
Base packages ----------------------------------------------------------- 0.07s
redmine : meta ---------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 48 seconds
~~~
