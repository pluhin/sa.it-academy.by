### 07.Ansible.Cruise
## Ansible playbook with role webserver - output
~~~bash
PLAY [all_workers] *******************************************************************************************
TASK [Gathering Facts] ***************************************************************************************Thursday 02 June 2022  10:47:25 +0300 (0:00:00.013)       0:00:00.013 *********
ok: [host46]
ok: [host45]

TASK [webserver : Include deploy for Ubuntu systems] *********************************************************Thursday 02 June 2022  10:47:49 +0300 (0:00:23.619)       0:00:23.632 *********
skipping: [host45]
included: /home/maxim/ansible/roles/webserver/tasks/http_ubuntu.yaml for host46

TASK [webserver : NGINX. Install packages] *******************************************************************Thursday 02 June 2022  10:47:49 +0300 (0:00:00.122)       0:00:23.755 *********
ok: [host46]

TASK [webserver : NGINX. Enable & start service] *************************************************************Thursday 02 June 2022  10:48:00 +0300 (0:00:11.191)       0:00:34.946 *********
ok: [host46]

TASK [webserver : Configure server blocks] *******************************************************************Thursday 02 June 2022  10:48:07 +0300 (0:00:06.320)       0:00:41.267 *********
included: /home/maxim/ansible/roles/webserver/tasks/srv_block.yaml for host46 => (item=ubuntu_site_1)
included: /home/maxim/ansible/roles/webserver/tasks/srv_block.yaml for host46 => (item=ubuntu_site_2)

TASK [webserver : Create home directory] *********************************************************************Thursday 02 June 2022  10:48:07 +0300 (0:00:00.131)       0:00:41.398 *********
ok: [host46]

TASK [webserver : Copy start page] ***************************************************************************Thursday 02 June 2022  10:48:13 +0300 (0:00:06.147)       0:00:47.546 *********
ok: [host46]

TASK [webserver : Copy config server block] ******************************************************************Thursday 02 June 2022  10:48:22 +0300 (0:00:08.868)       0:00:56.414 *********
ok: [host46]

TASK [webserver : Create home directory] *********************************************************************Thursday 02 June 2022  10:48:31 +0300 (0:00:08.947)       0:01:05.362 *********
ok: [host46]

TASK [webserver : Copy start page] ***************************************************************************Thursday 02 June 2022  10:48:37 +0300 (0:00:05.913)       0:01:11.276 *********
ok: [host46]

TASK [webserver : Copy config server block] ******************************************************************Thursday 02 June 2022  10:48:45 +0300 (0:00:08.780)       0:01:20.056 *********
ok: [host46]

TASK [webserver : Check connection to server blocks] *********************************************************Thursday 02 June 2022  10:48:55 +0300 (0:00:09.532)       0:01:29.589 *********
included: /home/maxim/ansible/roles/webserver/tasks/check.yaml for host46 => (item=ubuntu_site_1)
included: /home/maxim/ansible/roles/webserver/tasks/check.yaml for host46 => (item=ubuntu_site_2)

TASK [webserver : Check connection to sites] *****************************************************************Thursday 02 June 2022  10:48:55 +0300 (0:00:00.104)       0:01:29.694 *********
ok: [host46]

TASK [webserver : Print out] *********************************************************************************Thursday 02 June 2022  10:49:01 +0300 (0:00:05.989)       0:01:35.683 *********
ok: [host46] => {
    "msg": "Host: ubuntu_site_1"
}

TASK [webserver : Check connection to sites] *****************************************************************Thursday 02 June 2022  10:49:01 +0300 (0:00:00.094)       0:01:35.778 *********
ok: [host46]

TASK [webserver : Print out] *********************************************************************************Thursday 02 June 2022  10:49:07 +0300 (0:00:06.172)       0:01:41.950 *********
ok: [host46] => {
    "msg": "Host: ubuntu_site_2"
}

TASK [webserver : Include deploy for CentOS systems] *********************************************************Thursday 02 June 2022  10:49:07 +0300 (0:00:00.075)       0:01:42.026 *********
skipping: [host46]
included: /home/maxim/ansible/roles/webserver/tasks/http_centos.yaml for host45

TASK [webserver : NGINX. Install packages] *******************************************************************Thursday 02 June 2022  10:49:07 +0300 (0:00:00.103)       0:01:42.129 *********
ok: [host45]

TASK [webserver : NGINX. Enable & start service] *************************************************************Thursday 02 June 2022  10:49:45 +0300 (0:00:37.737)       0:02:19.867 *********
ok: [host45]

TASK [webserver : Configure srv blocks] **********************************************************************Thursday 02 June 2022  10:50:03 +0300 (0:00:17.560)       0:02:37.428 *********
included: /home/maxim/ansible/roles/webserver/tasks/srv_block.yaml for host45 => (item=centos_site_1)
included: /home/maxim/ansible/roles/webserver/tasks/srv_block.yaml for host45 => (item=centos_site_2)

TASK [webserver : Create home directory] *********************************************************************Thursday 02 June 2022  10:50:03 +0300 (0:00:00.384)       0:02:37.812 *********
ok: [host45]

TASK [webserver : Copy start page] ***************************************************************************Thursday 02 June 2022  10:50:20 +0300 (0:00:17.339)       0:02:55.152 *********
ok: [host45]

TASK [webserver : Copy config server block] ******************************************************************
Thursday 02 June 2022  10:50:46 +0300 (0:00:25.893)       0:03:21.046 *********
ok: [host45]

TASK [webserver : Create home directory] *********************************************************************
Thursday 02 June 2022  10:51:12 +0300 (0:00:26.069)       0:03:47.116 *********
ok: [host45]

TASK [webserver : Copy start page] ***************************************************************************
Thursday 02 June 2022  10:51:30 +0300 (0:00:17.549)       0:04:04.666 *********
ok: [host45]

TASK [webserver : Copy config server block] ******************************************************************
Thursday 02 June 2022  10:51:56 +0300 (0:00:25.958)       0:04:30.624 *********
ok: [host45]

TASK [webserver : Check connection to srv_blocks] ************************************************************
Thursday 02 June 2022  10:52:22 +0300 (0:00:26.221)       0:04:56.846 *********
included: /home/maxim/ansible/roles/webserver/tasks/check.yaml for host45 => (item=centos_site_1)
included: /home/maxim/ansible/roles/webserver/tasks/check.yaml for host45 => (item=centos_site_2)

TASK [webserver : Check connection to sites] *****************************************************************
Thursday 02 June 2022  10:52:22 +0300 (0:00:00.123)       0:04:56.970 *********
ok: [host45]

TASK [webserver : Print out] *********************************************************************************
Thursday 02 June 2022  10:52:40 +0300 (0:00:17.354)       0:05:14.325 *********
ok: [host45] => {
    "msg": "Host: centos_site_1"
}

TASK [webserver : Check connection to sites] *****************************************************************
Thursday 02 June 2022  10:52:40 +0300 (0:00:00.090)       0:05:14.416 *********
ok: [host45]

TASK [webserver : Print out] *********************************************************************************
Thursday 02 June 2022  10:52:57 +0300 (0:00:17.186)       0:05:31.602 *********
ok: [host45] => {
    "msg": "Host: centos_site_2"
}

PLAY RECAP ***************************************************************************************************
host45                     : ok=18   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host46                     : ok=18   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Thursday 02 June 2022  10:52:57 +0300 (0:00:00.152)       0:05:31.755 *********
===============================================================================
webserver : NGINX. Install packages ------------------------------------------------------------------ 37.74s
webserver : Copy config server block ----------------------------------------------------------------- 26.22s
webserver : Copy config server block ----------------------------------------------------------------- 26.07s
webserver : Copy start page -------------------------------------------------------------------------- 25.96s
webserver : Copy start page -------------------------------------------------------------------------- 25.89s
Gathering Facts -------------------------------------------------------------------------------------- 23.62s
webserver : NGINX. Enable & start service ------------------------------------------------------------ 17.56s
webserver : Create home directory -------------------------------------------------------------------- 17.55s
webserver : Check connection to sites ---------------------------------------------------------------- 17.35s
webserver : Create home directory -------------------------------------------------------------------- 17.34s
webserver : Check connection to sites ---------------------------------------------------------------- 17.19s
webserver : NGINX. Install packages ------------------------------------------------------------------ 11.19s
webserver : Copy config server block ------------------------------------------------------------------ 9.53s
webserver : Copy config server block ------------------------------------------------------------------ 8.95s
webserver : Copy start page --------------------------------------------------------------------------- 8.87s
webserver : Copy start page --------------------------------------------------------------------------- 8.78s
webserver : NGINX. Enable & start service ------------------------------------------------------------- 6.32s
webserver : Check connection to sites ----------------------------------------------------------------- 6.17s
webserver : Create home directory --------------------------------------------------------------------- 6.15s
webserver : Check connection to sites ----------------------------------------------------------------- 5.99s
Playbook run took 0 days, 0 hours, 5 minutes, 31 seconds
~~~
## Ansible playbook with role test - output
~~~bash
PLAY [all_workers] *******************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************************************
Thursday 02 June 2022  11:05:51 +0300 (0:00:00.020)       0:00:00.020 *********
ok: [host46]
ok: [host45]

TASK [test : Check connection to docker hub registry] ********************************************************************************************************************************************************************
Thursday 02 June 2022  11:06:15 +0300 (0:00:23.484)       0:00:23.505 *********
ok: [host46]
ok: [host45]

TASK [test : print out] **************************************************************************************************************************************************************************************************
Thursday 02 June 2022  11:06:33 +0300 (0:00:17.976)       0:00:41.481 *********
ok: [host45] => {
    "msg": "200"
}
ok: [host46] => {
    "msg": "200"
}

TASK [test : Check connections to public repositories] *******************************************************************************************************************************************************************
Thursday 02 June 2022  11:06:33 +0300 (0:00:00.083)       0:00:41.564 *********
ok: [host46] => (item=http://ftp.debian.org/debian/)
ok: [host46] => (item=https://cloud.centos.org/)
ok: [host45] => (item=http://ftp.debian.org/debian/)
ok: [host46] => (item=https://pypi.org/)
ok: [host45] => (item=https://cloud.centos.org/)
ok: [host45] => (item=https://pypi.org/)

TASK [test : Check if we have SUDO with NOPASSWD] ************************************************************************************************************************************************************************
Thursday 02 June 2022  11:07:25 +0300 (0:00:52.475)       0:01:34.040 *********
changed: [host46]
changed: [host45]

TASK [test : print out] **************************************************************************************************************************************************************************************************
Thursday 02 June 2022  11:07:43 +0300 (0:00:17.277)       0:01:51.318 *********
ok: [host45] => {
    "msg": [
        "/root"
    ]
}
ok: [host46] => {
    "msg": [
        "/root"
    ]
}

TASK [test : Ensure that free space on HDD is enough] ********************************************************************************************************************************************************************
Thursday 02 June 2022  11:07:43 +0300 (0:00:00.111)       0:01:51.429 *********
ok: [host45] => (item={'block_used': 481391, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4646437, 'size_available': 19031805952, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop44', 'inode_used': 23552, 'block_size': 4096, 'inode_available': 1287168}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4646437,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 481391,
        "device": "/dev/loop44",
        "fstype": "ext4",
        "inode_available": 1287168,
        "inode_total": 1310720,
        "inode_used": 23552,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19031805952,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "disk space is enough"
}
ok: [host46] => (item={'mount': '/', 'device': '/dev/loop45', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18786533376, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4586556, 'block_used': 541272, 'inode_total': 1310720, 'inode_available': 1283925, 'inode_used': 26795, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4586556,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 541272,
        "device": "/dev/loop45",
        "fstype": "ext4",
        "inode_available": 1283925,
        "inode_total": 1310720,
        "inode_used": 26795,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18786533376,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "disk space is enough"
}

TASK [test : Ensure that RAM is enough] **********************************************************************************************************************************************************************************
Thursday 02 June 2022  11:07:43 +0300 (0:00:00.113)       0:01:51.543 *********
ok: [host45] => {
    "changed": false,
    "msg": "RAM space is enough"
}
ok: [host46] => {
    "changed": false,
    "msg": "RAM space is enough"
}

PLAY RECAP ***************************************************************************************************************************************************************************************************************
host45                     : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host46                     : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 02 June 2022  11:07:43 +0300 (0:00:00.192)       0:01:51.736 *********
===============================================================================
test : Check connections to public repositories ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 52.48s
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 23.48s
test : Check connection to docker hub registry ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 17.98s
test : Check if we have SUDO with NOPASSWD ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- 17.28s
test : Ensure that RAM is enough ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.19s
test : Ensure that free space on HDD is enough -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.11s
test : print out -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.11s
test : print out -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.08s
Playbook run took 0 days, 0 hours, 1 minutes, 51 seconds
~~~

