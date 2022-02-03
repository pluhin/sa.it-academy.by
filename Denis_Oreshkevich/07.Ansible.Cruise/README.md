## 07.Ansible.Cruise

### Nginx server playbook

[Task main](ansible/roles/webserver/tasks/main.yaml)

#### Console

```log
vagrant@vagrant:~/ansible$ ansible-playbook web.yaml -i inv.yaml

PLAY [all_hosts] *****************************************************************************

TASK [Gathering Facts] ***********************************************************************
Thursday 03 February 2022  10:47:02 +0000 (0:00:00.037)       0:00:00.037 *****
ok: [host11]
ok: [host12]

TASK [webserver : Include deploy for Debian systems] *****************************************
Thursday 03 February 2022  10:47:04 +0000 (0:00:02.265)       0:00:02.302 *****
skipping: [host11]
included: /home/vagrant/ansible/roles/webserver/tasks/nginx_deb.yaml for host12

TASK [webserver : Nginx. Install packages] ***************************************************
Thursday 03 February 2022  10:47:04 +0000 (0:00:00.122)       0:00:02.425 *****
ok: [host12]

TASK [webserver : Nginx. Enable and start service] *******************************************
Thursday 03 February 2022  10:47:06 +0000 (0:00:02.098)       0:00:04.523 *****
ok: [host12]

TASK [webserver : Nginx. Deploy debian] ******************************************************
Thursday 03 February 2022  10:47:07 +0000 (0:00:01.122)       0:00:05.646 *****
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host12 => (item=local-debian1.site)
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host12 => (item=local-debian2.site)

TASK [webserver : Make sure destination dir exists] ******************************************
Thursday 03 February 2022  10:47:07 +0000 (0:00:00.103)       0:00:05.749 *****
ok: [host12]

TASK [webserver : Add index.html] ************************************************************
Thursday 03 February 2022  10:47:08 +0000 (0:00:00.856)       0:00:06.606 *****
ok: [host12]

TASK [webserver : Add conf] ******************************************************************
Thursday 03 February 2022  10:47:10 +0000 (0:00:01.316)       0:00:07.923 *****
ok: [host12]

TASK [webserver : Debug] *********************************************************************
Thursday 03 February 2022  10:47:11 +0000 (0:00:01.075)       0:00:08.999 *****
ok: [host12] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Make sure destination dir exists] ******************************************
Thursday 03 February 2022  10:47:11 +0000 (0:00:00.058)       0:00:09.058 *****
ok: [host12]

TASK [webserver : Add index.html] ************************************************************
Thursday 03 February 2022  10:47:11 +0000 (0:00:00.610)       0:00:09.668 *****
ok: [host12]

TASK [webserver : Add conf] ******************************************************************
Thursday 03 February 2022  10:47:12 +0000 (0:00:01.082)       0:00:10.751 *****
ok: [host12]

TASK [webserver : Debug] *********************************************************************
Thursday 03 February 2022  10:47:13 +0000 (0:00:01.084)       0:00:11.835 *****
ok: [host12] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Restart nginx debian] ******************************************************
Thursday 03 February 2022  10:47:14 +0000 (0:00:00.063)       0:00:11.899 *****
changed: [host12]

TASK [webserver : Nginx. Test debian] ********************************************************
Thursday 03 February 2022  10:47:14 +0000 (0:00:00.938)       0:00:12.837 *****
included: /home/vagrant/ansible/roles/webserver/tasks/test.yaml for host12 => (item=local-debian1.site)
included: /home/vagrant/ansible/roles/webserver/tasks/test.yaml for host12 => (item=local-debian2.site)

TASK [webserver : Check content to the sites] ************************************************
Thursday 03 February 2022  10:47:15 +0000 (0:00:00.105)       0:00:12.943 *****
ok: [host12]

TASK [webserver : Debug test] ****************************************************************
Thursday 03 February 2022  10:47:15 +0000 (0:00:00.891)       0:00:13.834 *****
ok: [host12] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Check content to the sites] ************************************************
Thursday 03 February 2022  10:47:16 +0000 (0:00:00.060)       0:00:13.894 *****
ok: [host12]

TASK [webserver : Debug test] ****************************************************************
Thursday 03 February 2022  10:47:16 +0000 (0:00:00.731)       0:00:14.626 *****
ok: [host12] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Include deploy for RedHat systems] *****************************************
Thursday 03 February 2022  10:47:16 +0000 (0:00:00.037)       0:00:14.664 *****
skipping: [host12]
included: /home/vagrant/ansible/roles/webserver/tasks/nginx_rh.yaml for host11

TASK [webserver : Install EPEL Repo] *********************************************************
Thursday 03 February 2022  10:47:16 +0000 (0:00:00.096)       0:00:14.761 *****
ok: [host11]

TASK [webserver : Nginx. Install packages] ***************************************************
Thursday 03 February 2022  10:47:17 +0000 (0:00:00.963)       0:00:15.724 *****
ok: [host11]

TASK [webserver : Nginx. Enable and start service] *******************************************
Thursday 03 February 2022  10:47:18 +0000 (0:00:00.853)       0:00:16.577 *****
ok: [host11]

TASK [webserver : Nginx. Deploy centos] ******************************************************
Thursday 03 February 2022  10:47:19 +0000 (0:00:00.818)       0:00:17.395 *****
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host11 => (item=local-centos1.site)
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host11 => (item=local-centos2.site)

TASK [webserver : Make sure destination dir exists] ******************************************
Thursday 03 February 2022  10:47:19 +0000 (0:00:00.087)       0:00:17.482 *****
ok: [host11]

TASK [webserver : Add index.html] ************************************************************
Thursday 03 February 2022  10:47:20 +0000 (0:00:00.648)       0:00:18.131 *****
ok: [host11]

TASK [webserver : Add conf] ******************************************************************
Thursday 03 February 2022  10:47:21 +0000 (0:00:01.405)       0:00:19.537 *****
ok: [host11]

TASK [webserver : Debug] *********************************************************************
Thursday 03 February 2022  10:47:23 +0000 (0:00:01.362)       0:00:20.899 *****
ok: [host11] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Make sure destination dir exists] ******************************************
Thursday 03 February 2022  10:47:23 +0000 (0:00:00.047)       0:00:20.947 *****
ok: [host11]

TASK [webserver : Add index.html] ************************************************************
Thursday 03 February 2022  10:47:23 +0000 (0:00:00.679)       0:00:21.626 *****
ok: [host11]

TASK [webserver : Add conf] ******************************************************************
Thursday 03 February 2022  10:47:24 +0000 (0:00:01.125)       0:00:22.752 *****
ok: [host11]

TASK [webserver : Debug] *********************************************************************
Thursday 03 February 2022  10:47:25 +0000 (0:00:01.088)       0:00:23.840 *****
ok: [host11] => {
    "msg": "Virtual host: local-centos2.site"
}

TASK [webserver : Restart nginx centos] ******************************************************
Thursday 03 February 2022  10:47:26 +0000 (0:00:00.047)       0:00:23.888 *****
changed: [host11]

TASK [webserver : Nginx. Enable firewall port] ***********************************************
Thursday 03 February 2022  10:47:26 +0000 (0:00:00.929)       0:00:24.818 *****
ok: [host11]

TASK [webserver : Nginx. reload service firewalld] *******************************************
Thursday 03 February 2022  10:47:28 +0000 (0:00:01.061)       0:00:25.879 *****
changed: [host11]

TASK [webserver : Nginx. Test centos] ********************************************************
Thursday 03 February 2022  10:47:29 +0000 (0:00:01.291)       0:00:27.170 *****
included: /home/vagrant/ansible/roles/webserver/tasks/test.yaml for host11 => (item=local-centos1.site)
included: /home/vagrant/ansible/roles/webserver/tasks/test.yaml for host11 => (item=local-centos2.site)

TASK [webserver : Check content to the sites] ************************************************
Thursday 03 February 2022  10:47:29 +0000 (0:00:00.093)       0:00:27.264 *****
ok: [host11]

TASK [webserver : Debug test] ****************************************************************
Thursday 03 February 2022  10:47:30 +0000 (0:00:00.691)       0:00:27.955 *****
ok: [host11] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Check content to the sites] ************************************************
Thursday 03 February 2022  10:47:30 +0000 (0:00:00.080)       0:00:28.035 *****
ok: [host11]

TASK [webserver : Debug test] ****************************************************************
Thursday 03 February 2022  10:47:30 +0000 (0:00:00.700)       0:00:28.736 *****
ok: [host11] => {
    "msg": "Virtual host: local-centos2.site"
}

PLAY RECAP ***********************************************************************************
host11                     : ok=24   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host12                     : ok=21   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Thursday 03 February 2022  10:47:30 +0000 (0:00:00.125)       0:00:28.862 *****
===============================================================================
Gathering Facts ----------------------------------------------------------------------- 2.27s
webserver : Nginx. Install packages --------------------------------------------------- 2.10s
webserver : Add index.html ------------------------------------------------------------ 1.41s
webserver : Add conf ------------------------------------------------------------------ 1.36s
webserver : Add index.html ------------------------------------------------------------ 1.32s
webserver : Nginx. reload service firewalld ------------------------------------------- 1.29s
webserver : Add index.html ------------------------------------------------------------ 1.13s
webserver : Nginx. Enable and start service ------------------------------------------- 1.12s
webserver : Add conf ------------------------------------------------------------------ 1.09s
webserver : Add conf ------------------------------------------------------------------ 1.08s
webserver : Add index.html ------------------------------------------------------------ 1.08s
webserver : Add conf ------------------------------------------------------------------ 1.08s
webserver : Nginx. Enable firewall port ----------------------------------------------- 1.06s
webserver : Install EPEL Repo --------------------------------------------------------- 0.96s
webserver : Restart nginx debian ------------------------------------------------------ 0.94s
webserver : Restart nginx centos ------------------------------------------------------ 0.93s
webserver : Check content to the sites ------------------------------------------------ 0.89s
webserver : Make sure destination dir exists ------------------------------------------ 0.86s
webserver : Nginx. Install packages --------------------------------------------------- 0.85s
webserver : Nginx. Enable and start service ------------------------------------------- 0.82s
Playbook run took 0 days, 0 hours, 0 minutes, 28 seconds

```

### Test role

[Task main](ansible/roles/test/tasks/main.yaml)

#### Console

```log
vagrant@vagrant:~/ansible$ ansible-playbook test.yaml -i inv.yaml

PLAY [all_hosts] **************************************************************************************

TASK [Gathering Facts] ********************************************************************************
Thursday 03 February 2022  14:57:44 +0000 (0:00:00.012)       0:00:00.012 *****
ok: [host12]
ok: [host11]

TASK [test : Check SUDO with NOPASSWD] ****************************************************************
Thursday 03 February 2022  14:57:46 +0000 (0:00:02.508)       0:00:02.521 *****
ok: [host12]
ok: [host11]

TASK [test : Check repos] *****************************************************************************
Thursday 03 February 2022  14:57:47 +0000 (0:00:00.841)       0:00:03.362 *****
ok: [host12] => (item=https://deb.debian.org/debian)
ok: [host11] => (item=https://deb.debian.org/debian)
ok: [host11] => (item=https://cloud.centos.org/centos)
ok: [host12] => (item=https://cloud.centos.org/centos)
ok: [host12] => (item=https://pypi.org/simple)
ok: [host11] => (item=https://pypi.org/simple)

TASK [test : Check Docker Hub] ************************************************************************
Thursday 03 February 2022  14:57:54 +0000 (0:00:06.762)       0:00:10.124 *****
ok: [host12]
ok: [host11]

TASK [test : Check Mount point] ***********************************************************************
Thursday 03 February 2022  14:57:55 +0000 (0:00:01.337)       0:00:11.462 *****
ok: [host11] => (item={'block_used': 472854, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4654974, 'size_available': 19066773504, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop10', 'inode_used': 23515, 'block_size': 4096, 'inode_available': 1287205}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4654974,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 472854,
        "device": "/dev/loop10",
        "fstype": "ext4",
        "inode_available": 1287205,
        "inode_total": 1310720,
        "inode_used": 23515,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19066773504,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available 90.78 % of disk space."
}
ok: [host12] => (item={'mount': '/', 'device': '/dev/loop11', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18804666368, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4590983, 'block_used': 536845, 'inode_total': 1310720, 'inode_available': 1283912, 'inode_used': 26808, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4590983,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 536845,
        "device": "/dev/loop11",
        "fstype": "ext4",
        "inode_available": 1283912,
        "inode_total": 1310720,
        "inode_used": 26808,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18804666368,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available 89.53 % of disk space."
}

TASK [test : Check RAM] *******************************************************************************
Thursday 03 February 2022  14:57:55 +0000 (0:00:00.098)       0:00:11.561 *****
ok: [host11] => {
    "changed": false,
    "msg": "OK. Available 90.11% of RAM."
}
ok: [host12] => {
    "changed": false,
    "msg": "OK. Available 86.38% of RAM."
}

PLAY RECAP ********************************************************************************************
host11                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host12                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 03 February 2022  14:57:55 +0000 (0:00:00.155)       0:00:11.716 *****
===============================================================================
test : Check repos ----------------------------------------------------------------------------- 6.76s
Gathering Facts -------------------------------------------------------------------------------- 2.51s
test : Check Docker Hub ------------------------------------------------------------------------ 1.34s
test : Check SUDO with NOPASSWD ---------------------------------------------------------------- 0.84s
test : Check RAM ------------------------------------------------------------------------------- 0.16s
test : Check Mount point ----------------------------------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds

```



