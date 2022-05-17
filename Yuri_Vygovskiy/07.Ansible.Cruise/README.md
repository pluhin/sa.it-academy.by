# 07.Ansible.Cruise

## Ansible play with installation nginx

```bash

ansible-playbook web.yaml -i inventory.yaml

PLAY [all_workers] **********************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
Tuesday 17 May 2022  22:34:07 +0000 (0:00:00.012)       0:00:00.012 ***********
ok: [host14]
ok: [host13]

TASK [webserver : Include deploy for Debian systems] ************************************************************
Tuesday 17 May 2022  22:34:14 +0000 (0:00:07.017)       0:00:07.030 ***********
skipping: [host13]
included: /home/vagrant/07.Ansible/roles/webserver/tasks/nginx_ubuntu.yaml for host14

TASK [webserver : Nginx. Install packages] **********************************************************************
Tuesday 17 May 2022  22:34:14 +0000 (0:00:00.135)       0:00:07.165 ***********
ok: [host14]

TASK [webserver : Nginx. Enable and start service] **************************************************************
Tuesday 17 May 2022  22:34:21 +0000 (0:00:07.531)       0:00:14.697 ***********
ok: [host14]

TASK [webserver : Nginx. Deploy ubuntu] *************************************************************************
Tuesday 17 May 2022  22:34:25 +0000 (0:00:03.234)       0:00:17.932 ***********
included: /home/vagrant/07.Ansible/roles/webserver/tasks/deploy.yaml for host14 => (item=local-debian1.site)
included: /home/vagrant/07.Ansible/roles/webserver/tasks/deploy.yaml for host14 => (item=local-debian2.site)

TASK [webserver : Make sure destination dir exists] *************************************************************
Tuesday 17 May 2022  22:34:25 +0000 (0:00:00.121)       0:00:18.054 ***********
changed: [host14]

TASK [webserver : Add index.html] *******************************************************************************
Tuesday 17 May 2022  22:34:28 +0000 (0:00:02.873)       0:00:20.928 ***********
changed: [host14]

TASK [webserver : Add conf] *************************************************************************************
Tuesday 17 May 2022  22:34:33 +0000 (0:00:05.922)       0:00:26.850 ***********
changed: [host14]

TASK [webserver : Debug] ****************************************************************************************
Tuesday 17 May 2022  22:34:39 +0000 (0:00:05.635)       0:00:32.485 ***********
ok: [host14] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Make sure destination dir exists] *************************************************************
Tuesday 17 May 2022  22:34:39 +0000 (0:00:00.093)       0:00:32.579 ***********
changed: [host14]

TASK [webserver : Add index.html] *******************************************************************************
Tuesday 17 May 2022  22:34:42 +0000 (0:00:02.788)       0:00:35.367 ***********
changed: [host14]

TASK [webserver : Add conf] *************************************************************************************
Tuesday 17 May 2022  22:34:48 +0000 (0:00:05.649)       0:00:41.017 ***********
changed: [host14]

TASK [webserver : Debug] ****************************************************************************************
Tuesday 17 May 2022  22:34:53 +0000 (0:00:05.734)       0:00:46.751 ***********
ok: [host14] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Restart nginx ubuntu] *************************************************************************
Tuesday 17 May 2022  22:34:53 +0000 (0:00:00.086)       0:00:46.838 ***********
changed: [host14]

TASK [webserver : Nginx. Test ubuntu] ***************************************************************************
Tuesday 17 May 2022  22:34:56 +0000 (0:00:02.944)       0:00:49.782 ***********
included: /home/vagrant/07.Ansible/roles/webserver/tasks/test.yaml for host14 => (item=local-debian1.site)
included: /home/vagrant/07.Ansible/roles/webserver/tasks/test.yaml for host14 => (item=local-debian2.site)

TASK [webserver : Check content to the sites] *******************************************************************
Tuesday 17 May 2022  22:34:57 +0000 (0:00:00.103)       0:00:49.886 ***********
ok: [host14]

TASK [webserver : Debug test] ***********************************************************************************
Tuesday 17 May 2022  22:35:00 +0000 (0:00:03.011)       0:00:52.897 ***********
ok: [host14] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Check content to the sites] *******************************************************************
Tuesday 17 May 2022  22:35:00 +0000 (0:00:00.093)       0:00:52.990 ***********
ok: [host14]

TASK [webserver : Debug test] ***********************************************************************************
Tuesday 17 May 2022  22:35:02 +0000 (0:00:02.847)       0:00:55.838 ***********
ok: [host14] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Include deploy for RedHat systems] ************************************************************
Tuesday 17 May 2022  22:35:02 +0000 (0:00:00.041)       0:00:55.879 ***********
skipping: [host14]
included: /home/vagrant/07.Ansible/roles/webserver/tasks/nginx_cent.yaml for host13

TASK [webserver : Install EPEL Repo] ****************************************************************************
Tuesday 17 May 2022  22:35:03 +0000 (0:00:00.100)       0:00:55.980 ***********
ok: [host13]

TASK [webserver : Nginx. Install packages] **********************************************************************
Tuesday 17 May 2022  22:35:06 +0000 (0:00:03.160)       0:00:59.140 ***********
ok: [host13]

TASK [webserver : Nginx. Enable and start service] **************************************************************
Tuesday 17 May 2022  22:35:09 +0000 (0:00:03.165)       0:01:02.306 ***********
ok: [host13]

TASK [webserver : Nginx. Deploy centos] *************************************************************************
Tuesday 17 May 2022  22:35:12 +0000 (0:00:02.932)       0:01:05.239 ***********
included: /home/vagrant/07.Ansible/roles/webserver/tasks/deploy.yaml for host13 => (item=local-centos1.site)
included: /home/vagrant/07.Ansible/roles/webserver/tasks/deploy.yaml for host13 => (item=local-centos2.site)

TASK [webserver : Make sure destination dir exists] *************************************************************
Tuesday 17 May 2022  22:35:12 +0000 (0:00:00.086)       0:01:05.325 ***********
ok: [host13]

TASK [webserver : Add index.html] *******************************************************************************
Tuesday 17 May 2022  22:35:15 +0000 (0:00:02.832)       0:01:08.158 ***********
ok: [host13]

TASK [webserver : Add conf] *************************************************************************************
Tuesday 17 May 2022  22:35:19 +0000 (0:00:04.536)       0:01:12.695 ***********
ok: [host13]

TASK [webserver : Debug] ****************************************************************************************
Tuesday 17 May 2022  22:35:24 +0000 (0:00:04.438)       0:01:17.134 ***********
ok: [host13] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Make sure destination dir exists] *************************************************************
Tuesday 17 May 2022  22:35:24 +0000 (0:00:00.053)       0:01:17.187 ***********
ok: [host13]

TASK [webserver : Add index.html] *******************************************************************************
Tuesday 17 May 2022  22:35:27 +0000 (0:00:02.714)       0:01:19.902 ***********
ok: [host13]

TASK [webserver : Add conf] *************************************************************************************
Tuesday 17 May 2022  22:35:31 +0000 (0:00:04.379)       0:01:24.281 ***********
ok: [host13]

TASK [webserver : Debug] ****************************************************************************************
Tuesday 17 May 2022  22:35:35 +0000 (0:00:04.359)       0:01:28.641 ***********
ok: [host13] => {
    "msg": "Virtual host: local-centos2.site"
}

TASK [webserver : Restart nginx centos] *************************************************************************
Tuesday 17 May 2022  22:35:35 +0000 (0:00:00.054)       0:01:28.695 ***********
changed: [host13]

TASK [webserver : Nginx. Enable firewall port] ******************************************************************
Tuesday 17 May 2022  22:35:38 +0000 (0:00:03.120)       0:01:31.815 ***********
ok: [host13]

TASK [webserver : Nginx. reload service firewalld] **************************************************************
Tuesday 17 May 2022  22:35:42 +0000 (0:00:03.188)       0:01:35.004 ***********
changed: [host13]

TASK [webserver : Nginx. Test centos] ***************************************************************************
Tuesday 17 May 2022  22:35:45 +0000 (0:00:03.193)       0:01:38.197 ***********
included: /home/vagrant/07.Ansible/roles/webserver/tasks/test.yaml for host13 => (item=local-centos1.site)
included: /home/vagrant/07.Ansible/roles/webserver/tasks/test.yaml for host13 => (item=local-centos2.site)

TASK [webserver : Check content to the sites] *******************************************************************
Tuesday 17 May 2022  22:35:45 +0000 (0:00:00.094)       0:01:38.292 ***********
ok: [host13]

TASK [webserver : Debug test] ***********************************************************************************
Tuesday 17 May 2022  22:35:48 +0000 (0:00:03.033)       0:01:41.325 ***********
ok: [host13] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Check content to the sites] *******************************************************************
Tuesday 17 May 2022  22:35:48 +0000 (0:00:00.053)       0:01:41.378 ***********
ok: [host13]

TASK [webserver : Debug test] ***********************************************************************************
Tuesday 17 May 2022  22:35:51 +0000 (0:00:03.004)       0:01:44.383 ***********
ok: [host13] => {
    "msg": "Virtual host: local-centos2.site"
}

PLAY RECAP ******************************************************************************************************
host13                     : ok=24   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host14                     : ok=21   changed=7    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Tuesday 17 May 2022  22:35:51 +0000 (0:00:00.146)       0:01:44.529 ***********
===============================================================================
webserver : Nginx. Install packages ---------------------------------------------------------------------- 7.53s
Gathering Facts ------------------------------------------------------------------------------------------ 7.02s
webserver : Add index.html ------------------------------------------------------------------------------- 5.92s
webserver : Add conf ------------------------------------------------------------------------------------- 5.73s
webserver : Add index.html ------------------------------------------------------------------------------- 5.65s
webserver : Add conf ------------------------------------------------------------------------------------- 5.64s
webserver : Add index.html ------------------------------------------------------------------------------- 4.54s
webserver : Add conf ------------------------------------------------------------------------------------- 4.44s
webserver : Add index.html ------------------------------------------------------------------------------- 4.38s
webserver : Add conf ------------------------------------------------------------------------------------- 4.36s
webserver : Nginx. Enable and start service -------------------------------------------------------------- 3.23s
webserver : Nginx. reload service firewalld -------------------------------------------------------------- 3.19s
webserver : Nginx. Enable firewall port ------------------------------------------------------------------ 3.19s
webserver : Nginx. Install packages ---------------------------------------------------------------------- 3.17s
webserver : Install EPEL Repo ---------------------------------------------------------------------------- 3.16s
webserver : Restart nginx centos ------------------------------------------------------------------------- 3.12s
webserver : Check content to the sites ------------------------------------------------------------------- 3.03s
webserver : Check content to the sites ------------------------------------------------------------------- 3.01s
webserver : Check content to the sites ------------------------------------------------------------------- 3.00s
webserver : Restart nginx ubuntu ------------------------------------------------------------------------- 2.94s
Playbook run took 0 days, 0 hours, 1 minutes, 44 seconds

```

## Implement testing role

```bash

ansible-playbook task1.yaml -i inventory.yaml

PLAY [all_workers] **********************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
Tuesday 17 May 2022  21:30:07 +0000 (0:00:00.013)       0:00:00.013 ***********
ok: [host13]
ok: [host14]

TASK [test : Check SUDO with NOPASSWD] **************************************************************************
Tuesday 17 May 2022  21:30:14 +0000 (0:00:07.312)       0:00:07.326 ***********
ok: [host13]
ok: [host14]

TASK [test : Check access to repositories] **********************************************************************
Tuesday 17 May 2022  21:30:17 +0000 (0:00:03.009)       0:00:10.335 ***********
ok: [host13] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host14] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host13] => (item=https://deb.debian.org/debian)
ok: [host14] => (item=https://deb.debian.org/debian)
ok: [host13] => (item=https://cloud.centos.org/centos)
ok: [host14] => (item=https://cloud.centos.org/centos)
ok: [host13] => (item=https://pypi.org/simple)
ok: [host14] => (item=https://pypi.org/simple)

TASK [test : Check access to the Docker Hub] ********************************************************************
Tuesday 17 May 2022  21:30:33 +0000 (0:00:15.831)       0:00:26.167 ***********
ok: [host14]
ok: [host13]

TASK [test : Check Mount point] *********************************************************************************
Tuesday 17 May 2022  21:30:37 +0000 (0:00:03.480)       0:00:29.647 ***********
ok: [host13] => (item={'block_used': 479850, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount':
 '/', 'block_available': 4647978, 'size_available': 19038117888, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 
 'rw,relatime', 'device': '/dev/loop12', 'inode_used': 23492, 'block_size': 4096, 'inode_available': 1287228}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4647978,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 479850,
        "device": "/dev/loop12",
        "fstype": "ext4",
        "inode_available": 1287228,
        "inode_total": 1310720,
        "inode_used": 23492,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19038117888,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 90.64 % of disk space."
}
ok: [host14] => (item={'mount': '/', 'device': '/dev/loop13', 'fstype': 'ext4', 'options': 
'rw,relatime', 'size_total': 21003583488, 'size_available': 18823254016, 'block_size': 
4096, 'block_total': 5127828, 'block_available': 4595521, 'block_used': 532307, 'inode_total': 
1310720, 'inode_available': 1283927, 'inode_used': 26793, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4595521,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 532307,
        "device": "/dev/loop13",
        "fstype": "ext4",
        "inode_available": 1283927,
        "inode_total": 1310720,
        "inode_used": 26793,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18823254016,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 89.62 % of disk space."
}

TASK [test : Check RAM] *****************************************************************************************
Tuesday 17 May 2022  21:30:37 +0000 (0:00:00.151)       0:00:29.799 ***********
ok: [host13] => {
    "changed": false,
    "msg": "OK. Available 80.03% of RAM."
}
ok: [host14] => {
    "changed": false,
    "msg": "OK. Available 76.86% of RAM."
}

PLAY RECAP ******************************************************************************************************
host13                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host14                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 17 May 2022  21:30:37 +0000 (0:00:00.169)       0:00:29.969 ***********
===============================================================================
test : Check access to repositories --------------------------------------------------------------------- 15.83s
Gathering Facts ------------------------------------------------------------------------------------------ 7.31s
test : Check access to the Docker Hub -------------------------------------------------------------------- 3.48s
test : Check SUDO with NOPASSWD -------------------------------------------------------------------------- 3.01s
test : Check RAM ----------------------------------------------------------------------------------------- 0.17s
test : Check Mount point --------------------------------------------------------------------------------- 0.15s
```
