### 07.Ansible.Cruise

# 1. Deploying nginx 

```bash
dmitry@vmbox01:~/ansible.cruise$ ansible-playbook -i inv.yaml nginx_deploy.yaml

  PLAY [all_workers] *******************************************************************************************************************************************************

  TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [host19]
  [DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host host20 should use /usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible
  releases. A future Ansible release will default to using the discovered platform python for this host. See
  https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in version 2.12. Deprecation
  warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [host20]

  TASK [debug] *************************************************************************************************************************************************************
ok: [host19] => {
      "msg": "192.168.202.19"
}
ok: [host20] => {
      "msg": "192.168.202.20"
}

TASK [web_server : Deploy for Debian systems] ****************************************************************************************************************************
skipping: [host19]
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/ubuntu.yaml for host20

TASK [web_server : Nginx. Install packages] ******************************************************************************************************************************
ok: [host20]

TASK [web_server : Nginx. Enable and start service] **********************************************************************************************************************
ok: [host20]

TASK [web_server : Nginx. Deploy ubuntu] *********************************************************************************************************************************
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/deploy.yaml for host20
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/deploy.yaml for host20

TASK [web_server : Make sure destination dir exists] *********************************************************************************************************************
ok: [host20]

TASK [web_server : Add index.html] ***************************************************************************************************************************************
ok: [host20]

TASK [web_server : Add conf] *********************************************************************************************************************************************
ok: [host20]

TASK [web_server : Debug] ************************************************************************************************************************************************
ok: [host20] => {
      "msg": "Virtual host: local-debian1.site"
}

TASK [web_server : Make sure destination dir exists] *********************************************************************************************************************
ok: [host20]

TASK [web_server : Add index.html] ***************************************************************************************************************************************
ok: [host20]

TASK [web_server : Add conf] *********************************************************************************************************************************************
ok: [host20]

TASK [web_server : Debug] ************************************************************************************************************************************************
ok: [host20] => {
      "msg": "Virtual host: local-debian2.site"
}

TASK [web_server : Restart nginx ubuntu] *********************************************************************************************************************************
changed: [host20]

TASK [web_server : Nginx. Test ubuntu] ***********************************************************************************************************************************
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/test.yaml for host20
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/test.yaml for host20

TASK [web_server : [local-debian1.site] Create record in /etc/hosts] *****************************************************************************************************
changed: [host20]

TASK [web_server : [local-debian1.site] Checking is opening HTTP port 80] ************************************************************************************************
ok: [host20]

TASK [web_server : [local-debian1.site] Checking Url] ********************************************************************************************************************
ok: [host20]

TASK [web_server : [local-debian1.site] Delete record from /etc/hosts] ***************************************************************************************************
changed: [host20]

TASK [web_server : [local-debian2.site] Create record in /etc/hosts] *****************************************************************************************************
changed: [host20]

TASK [web_server : [local-debian2.site] Checking is opening HTTP port 80] ************************************************************************************************
ok: [host20]

TASK [web_server : [local-debian2.site] Checking Url] ********************************************************************************************************************
ok: [host20]

TASK [web_server : [local-debian2.site] Delete record from /etc/hosts] ***************************************************************************************************
changed: [host20]

TASK [web_server : Deploy for RedHat systems] ****************************************************************************************************************************
skipping: [host20]
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/centos.yaml for host19

TASK [web_server : Install EPEL Repo] ************************************************************************************************************************************
ok: [host19]

TASK [web_server : Nginx. Install packages] ******************************************************************************************************************************
ok: [host19]

TASK [web_server : Nginx. Enable and start service] **********************************************************************************************************************
ok: [host19]

TASK [web_server : Nginx. Deploy centos] *********************************************************************************************************************************
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/deploy.yaml for host19
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/deploy.yaml for host19

TASK [web_server : Make sure destination dir exists] *********************************************************************************************************************
ok: [host19]

TASK [web_server : Add index.html] ***************************************************************************************************************************************
ok: [host19]

TASK [web_server : Add conf] *********************************************************************************************************************************************
ok: [host19]

TASK [web_server : Debug] ************************************************************************************************************************************************
ok: [host19] => {
      "msg": "Virtual host: local-centos1.site"
}

TASK [web_server : Make sure destination dir exists] *********************************************************************************************************************
ok: [host19]

TASK [web_server : Add index.html] ***************************************************************************************************************************************
ok: [host19]

TASK [web_server : Add conf] *********************************************************************************************************************************************
ok: [host19]

TASK [web_server : Debug] ************************************************************************************************************************************************
ok: [host19] => {
      "msg": "Virtual host: local-centos2.site"
}

TASK [web_server : Restart nginx centos] *********************************************************************************************************************************
changed: [host19]

TASK [web_server : Nginx. Enable firewall port] **************************************************************************************************************************
ok: [host19]

TASK [web_server : Nginx. reload service firewalld] **********************************************************************************************************************
changed: [host19]

TASK [web_server : Nginx. Test centos] ***********************************************************************************************************************************
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/test.yaml for host19
included: /home/dmitry/ansible.cruise/roles/web_server/tasks/test.yaml for host19

TASK [web_server : [local-centos1.site] Create record in /etc/hosts] *****************************************************************************************************
changed: [host19]

TASK [web_server : [local-centos1.site] Checking is opening HTTP port 80] ************************************************************************************************
ok: [host19]

TASK [web_server : [local-centos1.site] Checking Url] ********************************************************************************************************************
ok: [host19]

TASK [web_server : [local-centos1.site] Delete record from /etc/hosts] ***************************************************************************************************
changed: [host19]

TASK [web_server : [local-centos2.site] Create record in /etc/hosts] *****************************************************************************************************
changed: [host19]

TASK [web_server : [local-centos2.site] Checking is opening HTTP port 80] ************************************************************************************************
ok: [host19]

TASK [web_server : [local-centos2.site] Checking Url] ********************************************************************************************************************
ok: [host19]

TASK [web_server : [local-centos2.site] Delete record from /etc/hosts] ***************************************************************************************************
changed: [host19]

  PLAY RECAP ***************************************************************************************************************************************************************
host19                     : ok=29   changed=6    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host20                     : ok=26   changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

```
# 2. Testing deployment result 

```bash
ansible-playbook -i inv.yaml nginx_deploy.yaml -t testing                                                                                      

PLAY [all_workers] *****************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
Saturday 05 February 2022  15:04:46 +0300 (0:00:00.020)       0:00:00.020 *****
ok: [host02]
ok: [host01]

TASK [webserver : include_tasks] ***************************************************************************************************************************************
Saturday 05 February 2022  15:04:50 +0300 (0:00:03.800)       0:00:03.821 *****
skipping: [host01]
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/ubuntu.yaml for host02

TASK [webserver : [Ubuntu] Include specifics variables] ****************************************************************************************************************
Saturday 05 February 2022  15:04:50 +0300 (0:00:00.051)       0:00:03.872 *****
ok: [host02]

TASK [webserver : [Ubuntu] Nginx. vHosts testing] **********************************************************************************************************************
Saturday 05 February 2022  15:04:50 +0300 (0:00:00.044)       0:00:03.916 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/testing.yaml for host02 => (item=ubuntu-01.site)
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/testing.yaml for host02 => (item=ubuntu-02.site)

TASK [webserver : [ubuntu-01.site] Create record in /etc/hosts] ********************************************************************************************************
Saturday 05 February 2022  15:04:50 +0300 (0:00:00.046)       0:00:03.963 *****
changed: [host02]

TASK [webserver : [ubuntu-01.site] Checking is opening HTTP port 80] ***************************************************************************************************
Saturday 05 February 2022  15:04:51 +0300 (0:00:00.686)       0:00:04.649 *****
ok: [host02]

TASK [webserver : [ubuntu-01.site] Checking Url] ***********************************************************************************************************************
Saturday 05 February 2022  15:04:52 +0300 (0:00:00.699)       0:00:05.348 *****
ok: [host02]

TASK [webserver : [ubuntu-01.site] Delete record from /etc/hosts] ******************************************************************************************************
Saturday 05 February 2022  15:04:52 +0300 (0:00:00.770)       0:00:06.119 *****
changed: [host02]

TASK [webserver : [ubuntu-02.site] Create record in /etc/hosts] ********************************************************************************************************
Saturday 05 February 2022  15:04:53 +0300 (0:00:00.727)       0:00:06.846 *****
changed: [host02]

TASK [webserver : [ubuntu-02.site] Checking is opening HTTP port 80] ***************************************************************************************************
Saturday 05 February 2022  15:04:54 +0300 (0:00:00.646)       0:00:07.493 *****
ok: [host02]

TASK [webserver : [ubuntu-02.site] Checking Url] ***********************************************************************************************************************
Saturday 05 February 2022  15:04:54 +0300 (0:00:00.666)       0:00:08.160 *****
ok: [host02]

TASK [webserver : [ubuntu-02.site] Delete record from /etc/hosts] ******************************************************************************************************
Saturday 05 February 2022  15:04:55 +0300 (0:00:00.734)       0:00:08.894 *****
changed: [host02]

TASK [webserver : include_tasks] ***************************************************************************************************************************************
Saturday 05 February 2022  15:04:56 +0300 (0:00:00.639)       0:00:09.534 *****
skipping: [host02]
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/centos.yaml for host01

TASK [webserver : [CentOS] Include specifics variables] ****************************************************************************************************************
Saturday 05 February 2022  15:04:56 +0300 (0:00:00.043)       0:00:09.578 *****
ok: [host01]

TASK [webserver : [CentOS] Nginx. vHosts testing] **********************************************************************************************************************
Saturday 05 February 2022  15:04:56 +0300 (0:00:00.020)       0:00:09.598 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/testing.yaml for host01 => (item=centos-01.site)
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/testing.yaml for host01 => (item=centos-02.site)

TASK [webserver : [centos-01.site] Create record in /etc/hosts] ********************************************************************************************************
Saturday 05 February 2022  15:04:56 +0300 (0:00:00.039)       0:00:09.638 *****
changed: [host01]

TASK [webserver : [centos-01.site] Checking is opening HTTP port 80] ***************************************************************************************************
Saturday 05 February 2022  15:04:56 +0300 (0:00:00.609)       0:00:10.247 *****
ok: [host01]

TASK [webserver : [centos-01.site] Checking Url] ***********************************************************************************************************************
Saturday 05 February 2022  15:04:57 +0300 (0:00:00.613)       0:00:10.861 *****
ok: [host01]

TASK [webserver : [centos-01.site] Delete record from /etc/hosts] ******************************************************************************************************
Saturday 05 February 2022  15:04:58 +0300 (0:00:00.634)       0:00:11.495 *****
changed: [host01]

TASK [webserver : [centos-02.site] Create record in /etc/hosts] ********************************************************************************************************
Saturday 05 February 2022  15:04:58 +0300 (0:00:00.627)       0:00:12.123 *****
changed: [host01]

TASK [webserver : [centos-02.site] Checking is opening HTTP port 80] ***************************************************************************************************
Saturday 05 February 2022  15:04:59 +0300 (0:00:00.568)       0:00:12.691 *****
ok: [host01]

TASK [webserver : [centos-02.site] Checking Url] ***********************************************************************************************************************
Saturday 05 February 2022  15:05:00 +0300 (0:00:00.598)       0:00:13.290 *****
ok: [host01]

TASK [webserver : [centos-02.site] Delete record from /etc/hosts] ******************************************************************************************************
Saturday 05 February 2022  15:05:00 +0300 (0:00:00.655)       0:00:13.946 *****
changed: [host01]

PLAY RECAP *************************************************************************************************************************************************************
host01                     : ok=13   changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host02                     : ok=13   changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Saturday 05 February 2022  15:05:01 +0300 (0:00:00.620)       0:00:14.567 *****
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------- 3.80s
webserver : [ubuntu-01.site] Checking Url ----------------------------------------------------------------------------------------------------------------------- 0.77s
webserver : [ubuntu-02.site] Checking Url ----------------------------------------------------------------------------------------------------------------------- 0.73s
webserver : [ubuntu-01.site] Delete record from /etc/hosts ------------------------------------------------------------------------------------------------------ 0.73s
webserver : [ubuntu-01.site] Checking is opening HTTP port 80 --------------------------------------------------------------------------------------------------- 0.70s
webserver : [ubuntu-01.site] Create record in /etc/hosts -------------------------------------------------------------------------------------------------------- 0.69s
webserver : [ubuntu-02.site] Checking is opening HTTP port 80 --------------------------------------------------------------------------------------------------- 0.67s
webserver : [centos-02.site] Checking Url ----------------------------------------------------------------------------------------------------------------------- 0.66s
webserver : [ubuntu-02.site] Create record in /etc/hosts -------------------------------------------------------------------------------------------------------- 0.65s
webserver : [ubuntu-02.site] Delete record from /etc/hosts ------------------------------------------------------------------------------------------------------ 0.64s
webserver : [centos-01.site] Checking Url ----------------------------------------------------------------------------------------------------------------------- 0.63s
webserver : [centos-01.site] Delete record from /etc/hosts ------------------------------------------------------------------------------------------------------ 0.63s
webserver : [centos-02.site] Delete record from /etc/hosts ------------------------------------------------------------------------------------------------------ 0.62s
webserver : [centos-01.site] Checking is opening HTTP port 80 --------------------------------------------------------------------------------------------------- 0.61s
webserver : [centos-01.site] Create record in /etc/hosts -------------------------------------------------------------------------------------------------------- 0.61s
webserver : [centos-02.site] Checking is opening HTTP port 80 --------------------------------------------------------------------------------------------------- 0.60s
webserver : [centos-02.site] Create record in /etc/hosts -------------------------------------------------------------------------------------------------------- 0.57s
webserver : include_tasks --------------------------------------------------------------------------------------------------------------------------------------- 0.05s
webserver : [Ubuntu] Nginx. vHosts testing ---------------------------------------------------------------------------------------------------------------------- 0.05s
webserver : [Ubuntu] Include specifics variables ---------------------------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 14 seconds
```

## Role Testing

```bash
dmitry@vmbox01:~/ansible.cruise$ ansible-playbook -i inv.yaml testing.yaml

PLAY [all_workers] *******************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
ok: [host19]
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host host20 should use /usr/bin/python3, but is using /usr/bin/python for backward compatibility with prior Ansible
releases. A future Ansible release will default to using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This feature will be removed in version 2.12. Deprecation
warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
ok: [host20]

TASK [debug] *************************************************************************************************************************************************************
ok: [host19] => {
    "msg": "192.168.202.19"
}
ok: [host20] => {
    "msg": "192.168.202.20"
}

TASK [testing : Checking NOPASSWD in Sudoers] ****************************************************************************************************************************
ok: [host20]
ok: [host19]

TASK [testing : Checking Debian/CentOS repositories] *********************************************************************************************************************
ok: [host19] => (item=https://deb.debian.org/debian)
ok: [host20] => (item=https://deb.debian.org/debian)
ok: [host19] => (item=https://cloud.centos.org/centos)
ok: [host20] => (item=https://cloud.centos.org/centos)
ok: [host20] => (item=https://pypi.org/simple)
ok: [host19] => (item=https://pypi.org/simple)

TASK [testing : Checking Docker Hub] *************************************************************************************************************************************
ok: [host20]
ok: [host19]

TASK [testing : Checking free space in storage] **************************************************************************************************************************
ok: [host19] => (item={'block_used': 477572, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4650256, 'size_available': 19047448576, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop18', 'inode_used': 23530, 'block_size': 4096, 'inode_available': 1287190}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4650256,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 477572,
        "device": "/dev/loop18",
        "fstype": "ext4",
        "inode_available": 1287190,
        "inode_total": 1310720,
        "inode_used": 23530,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19047448576,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host20] => (item={'block_used': 629637, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4498191, 'size_available': 18424590336, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop19', 'inode_used': 36058, 'block_size': 4096, 'inode_available': 1274662}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4498191,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 629637,
        "device": "/dev/loop19",
        "fstype": "ext4",
        "inode_available": 1274662,
        "inode_total": 1310720,
        "inode_used": 36058,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18424590336,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [testing : Checking free memory] ************************************************************************************************************************************
ok: [host19] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [host20] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP ***************************************************************************************************************************************************************
host19                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host20                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


```
