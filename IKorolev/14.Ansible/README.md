
# 14.Ansible

# Ansible tasks log
```
ansible-playbook -i inv.yaml play.yaml

PLAY [redmine] *****************************************************************

TASK [Gathering Facts] *********************************************************
Monday 19 April 2021  14:00:07 +0200 (0:00:00.026)       0:00:00.026 ********** 
ok: [redmine]

TASK [Redmine. Install packages] ***********************************************
Monday 19 April 2021  14:00:09 +0200 (0:00:01.503)       0:00:01.529 ********** 
ok: [redmine]

TASK [Redmine. Clone repository] ***********************************************
Monday 19 April 2021  14:00:11 +0200 (0:00:01.922)       0:00:03.452 ********** 
ok: [redmine]

TASK [Redmine. Change permissions] *********************************************
Monday 19 April 2021  14:00:11 +0200 (0:00:00.620)       0:00:04.073 ********** 
ok: [redmine]

TASK [Redmine. Change permissions] *********************************************
Monday 19 April 2021  14:00:12 +0200 (0:00:00.677)       0:00:04.751 ********** 
ok: [redmine]

TASK [mysql : Redmine. Install packages] ***************************************
Monday 19 April 2021  14:00:12 +0200 (0:00:00.584)       0:00:05.335 ********** 
ok: [redmine]

TASK [mysql : MySQL. Install and setup] ****************************************
Monday 19 April 2021  14:00:14 +0200 (0:00:01.898)       0:00:07.234 ********** 
ok: [redmine]

TASK [mysql : mysql_db] ********************************************************
Monday 19 April 2021  14:00:15 +0200 (0:00:01.018)       0:00:08.253 ********** 
ok: [redmine]

TASK [mysql : mysql_user] ******************************************************
Monday 19 April 2021  14:00:16 +0200 (0:00:00.725)       0:00:08.979 ********** 
[WARNING]: Module did not set no_log for update_password
ok: [redmine]

TASK [mysql : Config database] *************************************************
Monday 19 April 2021  14:00:17 +0200 (0:00:00.713)       0:00:09.692 ********** 
ok: [redmine]

TASK [redmine : Redmine. Setup 01] *********************************************
Monday 19 April 2021  14:00:18 +0200 (0:00:01.228)       0:00:10.920 ********** 
changed: [redmine]

TASK [redmine : Session store secret generation] *******************************
Monday 19 April 2021  14:00:29 +0200 (0:00:11.432)       0:00:22.353 ********** 
ok: [redmine]

TASK [redmine : Redmine. Setup 02] *********************************************
Monday 19 April 2021  14:00:30 +0200 (0:00:00.614)       0:00:22.967 ********** 
changed: [redmine]

TASK [redmine : Configuration files for virtualhost] ***************************
Monday 19 April 2021  14:00:39 +0200 (0:00:08.777)       0:00:31.745 ********** 
ok: [redmine]

TASK [redmine : Add redmine-5.sa to host file] *********************************
Monday 19 April 2021  14:00:40 +0200 (0:00:00.925)       0:00:32.670 ********** 
changed: [redmine]

TASK [redmine : uri] ***********************************************************
Monday 19 April 2021  14:00:41 +0200 (0:00:00.753)       0:00:33.424 ********** 
ok: [redmine]

TASK [redmine : lineinfile] ****************************************************
Monday 19 April 2021  14:00:41 +0200 (0:00:00.763)       0:00:34.187 ********** 
changed: [redmine]

PLAY RECAP *********************************************************************
redmine                    : ok=17   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 19 April 2021  14:00:42 +0200 (0:00:00.625)       0:00:34.813 ********** 
=============================================================================== 
redmine : Redmine. Setup 01 -------------------------------------------- 11.43s
redmine : Redmine. Setup 02 --------------------------------------------- 8.78s
Redmine. Install packages ----------------------------------------------- 1.92s
mysql : Redmine. Install packages --------------------------------------- 1.90s
Gathering Facts --------------------------------------------------------- 1.50s
mysql : Config database ------------------------------------------------- 1.23s
redmine : Configuration files for virtualhost --------------------------- 1.16s
mysql : MySQL. Install and setup ---------------------------------------- 1.02s
redmine : uri ----------------------------------------------------------- 0.76s
mysql : mysql_db -------------------------------------------------------- 0.73s
mysql : mysql_user ------------------------------------------------------ 0.71s
Redmine. Change permissions --------------------------------------------- 0.68s
redmine : lineinfile ---------------------------------------------------- 0.63s
Redmine. Clone repository ----------------------------------------------- 0.62s
redmine : Session store secret generation ------------------------------- 0.61s
Redmine. Change permissions --------------------------------------------- 0.58s
redmine : Add redmine-5.sa to host file --------------------------------- 0.52s
Playbook run took 0 days, 0 hours, 0 minutes, 34 seconds

```

![img](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/14.Ansible/1.png)
