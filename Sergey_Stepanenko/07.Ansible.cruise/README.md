## Role webserver

### $ ansible-playbook my_web.yaml -i inv.yaml
```bash
sergey@ubunru22:~/07.Ansible$ ansible-playbook my_web.yaml -i inv.yaml

PLAY [all_workers] ******************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
Saturday 20 August 2022  17:04:06 +0300 (0:00:00.045)       0:00:00.045 ******* 
ok: [host28]
ok: [host27]

TASK [webserver : Include deploy for Debian systems] ********************************************************************************************************
Saturday 20 August 2022  17:04:08 +0300 (0:00:02.316)       0:00:02.362 ******* 
skipping: [host27]
included: /home/sergey/07.Ansible/roles/webserver/tasks/nginx_deb.yaml for host28

TASK [webserver : Nginx. Install packages] ******************************************************************************************************************
Saturday 20 August 2022  17:04:09 +0300 (0:00:00.124)       0:00:02.486 ******* 
ok: [host28]

TASK [webserver : Nginx. Enable and start service] **********************************************************************************************************
Saturday 20 August 2022  17:04:11 +0300 (0:00:02.593)       0:00:05.079 ******* 
ok: [host28]

TASK [webserver : Nginx. Deploy debian] *********************************************************************************************************************
Saturday 20 August 2022  17:04:12 +0300 (0:00:01.062)       0:00:06.142 ******* 
included: /home/sergey/07.Ansible/roles/webserver/tasks/deploy.yaml for host28 => (item=local-debian1.site)
included: /home/sergey/07.Ansible/roles/webserver/tasks/deploy.yaml for host28 => (item=local-debian2.site)

TASK [webserver : Check if directory exists.] ***************************************************************************************************************
Saturday 20 August 2022  17:04:12 +0300 (0:00:00.113)       0:00:06.256 ******* 
ok: [host28]

TASK [webserver : Copy index.html] **************************************************************************************************************************
Saturday 20 August 2022  17:04:13 +0300 (0:00:00.682)       0:00:06.938 ******* 
ok: [host28]

TASK [webserver : Add templates conf] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:14 +0300 (0:00:01.113)       0:00:08.052 ******* 
ok: [host28]

TASK [webserver : Debug] ************************************************************************************************************************************
Saturday 20 August 2022  17:04:15 +0300 (0:00:00.952)       0:00:09.005 ******* 
ok: [host28] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Check if directory exists.] ***************************************************************************************************************
Saturday 20 August 2022  17:04:15 +0300 (0:00:00.079)       0:00:09.084 ******* 
ok: [host28]

TASK [webserver : Copy index.html] **************************************************************************************************************************
Saturday 20 August 2022  17:04:16 +0300 (0:00:00.575)       0:00:09.659 ******* 
ok: [host28]

TASK [webserver : Add templates conf] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:17 +0300 (0:00:00.936)       0:00:10.596 ******* 
ok: [host28]

TASK [webserver : Debug] ************************************************************************************************************************************
Saturday 20 August 2022  17:04:18 +0300 (0:00:01.015)       0:00:11.611 ******* 
ok: [host28] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Restart nginx debian] *********************************************************************************************************************
Saturday 20 August 2022  17:04:18 +0300 (0:00:00.107)       0:00:11.719 ******* 
changed: [host28]

TASK [webserver : Nginx. Test debian] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:19 +0300 (0:00:00.853)       0:00:12.572 ******* 
included: /home/sergey/07.Ansible/roles/webserver/tasks/test.yaml for host28 => (item=local-debian1.site)
included: /home/sergey/07.Ansible/roles/webserver/tasks/test.yaml for host28 => (item=local-debian2.site)

TASK [webserver : Check content to the sites] ***************************************************************************************************************
Saturday 20 August 2022  17:04:19 +0300 (0:00:00.096)       0:00:12.669 ******* 
ok: [host28]

TASK [webserver : Debug test] *******************************************************************************************************************************
Saturday 20 August 2022  17:04:20 +0300 (0:00:00.813)       0:00:13.482 ******* 
ok: [host28] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [webserver : Check content to the sites] ***************************************************************************************************************
Saturday 20 August 2022  17:04:20 +0300 (0:00:00.076)       0:00:13.559 ******* 
ok: [host28]

TASK [webserver : Debug test] *******************************************************************************************************************************
Saturday 20 August 2022  17:04:20 +0300 (0:00:00.625)       0:00:14.185 ******* 
ok: [host28] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [webserver : Include deploy for RedHat systems] ********************************************************************************************************
Saturday 20 August 2022  17:04:20 +0300 (0:00:00.090)       0:00:14.275 ******* 
skipping: [host28]
included: /home/sergey/07.Ansible/roles/webserver/tasks/nginx_rh.yaml for host27

TASK [webserver : Install EPEL Repo] ************************************************************************************************************************
Saturday 20 August 2022  17:04:20 +0300 (0:00:00.103)       0:00:14.379 ******* 
ok: [host27]

TASK [webserver : Nginx. Install packages] ******************************************************************************************************************
Saturday 20 August 2022  17:04:22 +0300 (0:00:02.048)       0:00:16.427 ******* 
ok: [host27]

TASK [webserver : Nginx. Enable and start service] **********************************************************************************************************
Saturday 20 August 2022  17:04:24 +0300 (0:00:01.865)       0:00:18.292 ******* 
ok: [host27]

TASK [webserver : Nginx. Deploy centos] *********************************************************************************************************************
Saturday 20 August 2022  17:04:25 +0300 (0:00:00.859)       0:00:19.152 ******* 
included: /home/sergey/07.Ansible/roles/webserver/tasks/deploy.yaml for host27 => (item=local-centos1.site)
included: /home/sergey/07.Ansible/roles/webserver/tasks/deploy.yaml for host27 => (item=local-centos2.site)

TASK [webserver : Check if directory exists.] ***************************************************************************************************************
Saturday 20 August 2022  17:04:25 +0300 (0:00:00.084)       0:00:19.236 ******* 
ok: [host27]

TASK [webserver : Copy index.html] **************************************************************************************************************************
Saturday 20 August 2022  17:04:26 +0300 (0:00:00.608)       0:00:19.844 ******* 
ok: [host27]

TASK [webserver : Add templates conf] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:27 +0300 (0:00:01.012)       0:00:20.857 ******* 
ok: [host27]

TASK [webserver : Debug] ************************************************************************************************************************************
Saturday 20 August 2022  17:04:28 +0300 (0:00:01.021)       0:00:21.878 ******* 
ok: [host27] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Check if directory exists.] ***************************************************************************************************************
Saturday 20 August 2022  17:04:28 +0300 (0:00:00.063)       0:00:21.942 ******* 
ok: [host27]

TASK [webserver : Copy index.html] **************************************************************************************************************************
Saturday 20 August 2022  17:04:29 +0300 (0:00:00.601)       0:00:22.544 ******* 
ok: [host27]

TASK [webserver : Add templates conf] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:30 +0300 (0:00:01.036)       0:00:23.580 ******* 
ok: [host27]

TASK [webserver : Debug] ************************************************************************************************************************************
Saturday 20 August 2022  17:04:31 +0300 (0:00:01.005)       0:00:24.586 ******* 
ok: [host27] => {
    "msg": "Virtual host: local-centos2.site"
}

TASK [webserver : Restart nginx centos] *********************************************************************************************************************
Saturday 20 August 2022  17:04:31 +0300 (0:00:00.054)       0:00:24.640 ******* 
changed: [host27]

TASK [webserver : Nginx. Enable firewall port] **************************************************************************************************************
Saturday 20 August 2022  17:04:32 +0300 (0:00:00.952)       0:00:25.593 ******* 
ok: [host27]

TASK [webserver : Nginx. reload service firewalld] **********************************************************************************************************
Saturday 20 August 2022  17:04:33 +0300 (0:00:01.031)       0:00:26.624 ******* 
changed: [host27]

TASK [webserver : Nginx. Test centos] ***********************************************************************************************************************
Saturday 20 August 2022  17:04:34 +0300 (0:00:00.868)       0:00:27.492 ******* 
included: /home/sergey/07.Ansible/roles/webserver/tasks/test.yaml for host27 => (item=local-centos1.site)
included: /home/sergey/07.Ansible/roles/webserver/tasks/test.yaml for host27 => (item=local-centos2.site)

TASK [webserver : Check content to the sites] ***************************************************************************************************************
Saturday 20 August 2022  17:04:34 +0300 (0:00:00.091)       0:00:27.583 ******* 
ok: [host27]

TASK [webserver : Debug test] *******************************************************************************************************************************
Saturday 20 August 2022  17:04:34 +0300 (0:00:00.679)       0:00:28.262 ******* 
ok: [host27] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [webserver : Check content to the sites] ***************************************************************************************************************
Saturday 20 August 2022  17:04:34 +0300 (0:00:00.055)       0:00:28.318 ******* 
ok: [host27]

TASK [webserver : Debug test] *******************************************************************************************************************************
Saturday 20 August 2022  17:04:35 +0300 (0:00:00.807)       0:00:29.126 ******* 
ok: [host27] => {
    "msg": "Virtual host: local-centos2.site"
}

PLAY RECAP **************************************************************************************************************************************************
host27                     : ok=24   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host28                     : ok=21   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Saturday 20 August 2022  17:04:35 +0300 (0:00:00.176)       0:00:29.303 ******* 
=============================================================================== 
webserver : Nginx. Install packages ------------------------------------------------------------------------------------------------------------------ 2.59s
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------- 2.32s
webserver : Install EPEL Repo ------------------------------------------------------------------------------------------------------------------------ 2.05s
webserver : Nginx. Install packages ------------------------------------------------------------------------------------------------------------------ 1.87s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------- 1.11s
webserver : Nginx. Enable and start service ---------------------------------------------------------------------------------------------------------- 1.06s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------- 1.04s
webserver : Nginx. Enable firewall port -------------------------------------------------------------------------------------------------------------- 1.03s
webserver : Add templates conf ----------------------------------------------------------------------------------------------------------------------- 1.02s
webserver : Add templates conf ----------------------------------------------------------------------------------------------------------------------- 1.02s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------- 1.01s
webserver : Add templates conf ----------------------------------------------------------------------------------------------------------------------- 1.01s
webserver : Add templates conf ----------------------------------------------------------------------------------------------------------------------- 0.95s
webserver : Restart nginx centos --------------------------------------------------------------------------------------------------------------------- 0.95s
webserver : Copy index.html -------------------------------------------------------------------------------------------------------------------------- 0.94s
webserver : Nginx. reload service firewalld ---------------------------------------------------------------------------------------------------------- 0.87s
webserver : Nginx. Enable and start service ---------------------------------------------------------------------------------------------------------- 0.86s
webserver : Restart nginx debian --------------------------------------------------------------------------------------------------------------------- 0.85s
webserver : Check content to the sites --------------------------------------------------------------------------------------------------------------- 0.81s
webserver : Check content to the sites --------------------------------------------------------------------------------------------------------------- 0.81s
Playbook run took 0 days, 0 hours, 0 minutes, 29 seconds
```

## Role Testing
### $ ansible-playbook my_test.yaml -i inv.yaml
```bash
sergey@ubunru22:~/07.Ansible$ ansible-playbook my_test.yaml -i inv.yaml

PLAY [all_workers] ******************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************
Saturday 20 August 2022  17:07:23 +0300 (0:00:00.019)       0:00:00.019 ******* 
ok: [host27]
ok: [host28]

TASK [test : Check SUDO with NOPASSWD] **********************************************************************************************************************
Saturday 20 August 2022  17:07:25 +0300 (0:00:02.282)       0:00:02.301 ******* 
ok: [host28]
ok: [host27]

TASK [test : Check repos] ***********************************************************************************************************************************
Saturday 20 August 2022  17:07:26 +0300 (0:00:00.745)       0:00:03.047 ******* 
ok: [host27] => (item=https://deb.debian.org/debian)
ok: [host28] => (item=https://deb.debian.org/debian)
ok: [host28] => (item=https://cloud.centos.org/centos)
ok: [host27] => (item=https://cloud.centos.org/centos)
ok: [host28] => (item=https://pypi.org/simple)
ok: [host27] => (item=https://pypi.org/simple)

TASK [test : Check Docker Hub] ******************************************************************************************************************************
Saturday 20 August 2022  17:07:30 +0300 (0:00:03.608)       0:00:06.655 ******* 
ok: [host28]
ok: [host27]

TASK [test : Check Mount point] *****************************************************************************************************************************
Saturday 20 August 2022  17:07:31 +0300 (0:00:01.425)       0:00:08.081 ******* 
ok: [host27] => (item={'mount': '/', 'device': '/dev/loop26', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18972295168, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4631908, 'block_used': 484656, 'inode_total': 1310720, 'inode_available': 1285857, 'inode_used': 24863, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4631908,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 484656,
        "device": "/dev/loop26",
        "fstype": "ext4",
        "inode_available": 1285857,
        "inode_total": 1310720,
        "inode_used": 24863,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18972295168,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "OK. Available 90.53 % of disk space."
}
ok: [host28] => (item={'mount': '/', 'device': '/dev/loop27', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18769231872, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4582332, 'block_used': 534232, 'inode_total': 1310720, 'inode_available': 1282574, 'inode_used': 28146, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4582332,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 534232,
        "device": "/dev/loop27",
        "fstype": "ext4",
        "inode_available": 1282574,
        "inode_total": 1310720,
        "inode_used": 28146,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18769231872,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "OK. Available 89.56 % of disk space."
}

TASK [test : Check RAM] *************************************************************************************************************************************
Saturday 20 August 2022  17:07:31 +0300 (0:00:00.117)       0:00:08.198 ******* 
ok: [host27] => (item={'mount': '/', 'device': '/dev/loop26', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18972295168, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4631908, 'block_used': 484656, 'inode_total': 1310720, 'inode_available': 1285857, 'inode_used': 24863, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4631908,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 484656,
        "device": "/dev/loop26",
        "fstype": "ext4",
        "inode_available": 1285857,
        "inode_total": 1310720,
        "inode_used": 24863,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18972295168,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host28] => (item={'mount': '/', 'device': '/dev/loop27', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18769231872, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4582332, 'block_used': 534232, 'inode_total': 1310720, 'inode_available': 1282574, 'inode_used': 28146, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4582332,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 534232,
        "device": "/dev/loop27",
        "fstype": "ext4",
        "inode_available": 1282574,
        "inode_total": 1310720,
        "inode_used": 28146,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18769231872,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

PLAY RECAP **************************************************************************************************************************************************
host27                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host28                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Saturday 20 August 2022  17:07:31 +0300 (0:00:00.177)       0:00:08.376 ******* 
=============================================================================== 
test : Check repos ----------------------------------------------------------------------------------------------------------------------------------- 3.61s
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------- 2.28s
test : Check Docker Hub ------------------------------------------------------------------------------------------------------------------------------ 1.43s
test : Check SUDO with NOPASSWD ---------------------------------------------------------------------------------------------------------------------- 0.75s
test : Check RAM ------------------------------------------------------------------------------------------------------------------------------------- 0.18s
test : Check Mount point ----------------------------------------------------------------------------------------------------------------------------- 0.12s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```


