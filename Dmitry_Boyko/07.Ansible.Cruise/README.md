### 07.Ansible.Cruise

## Role webserver

# 1. Deploying nginx 

```yaml
ansible-playbook -i inv.yaml nginx_deploy.yaml -t deploy

PLAY [all_workers] *****************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
Saturday 05 February 2022  15:06:11 +0300 (0:00:00.020)       0:00:00.020 *****
ok: [host02]
ok: [host01]

TASK [webserver : include_tasks] ***************************************************************************************************************************************
Saturday 05 February 2022  15:06:15 +0300 (0:00:03.632)       0:00:03.653 *****
skipping: [host01]
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/ubuntu.yaml for host02

TASK [webserver : [Ubuntu] Include common variables] *******************************************************************************************************************
Saturday 05 February 2022  15:06:15 +0300 (0:00:00.074)       0:00:03.728 *****
ok: [host02]

TASK [webserver : [Ubuntu] Include specifics variables] ****************************************************************************************************************
Saturday 05 February 2022  15:06:15 +0300 (0:00:00.029)       0:00:03.757 *****
ok: [host02]

TASK [webserver : [Ubuntu] Nginx. Install packages] ********************************************************************************************************************
Saturday 05 February 2022  15:06:15 +0300 (0:00:00.024)       0:00:03.782 *****
ok: [host02]

TASK [webserver : [Ubuntu] Nginx. Enable and start service] ************************************************************************************************************
Saturday 05 February 2022  15:06:19 +0300 (0:00:03.816)       0:00:07.598 *****
ok: [host02]

TASK [webserver : [Ubuntu] Nginx. Deploy] ******************************************************************************************************************************
Saturday 05 February 2022  15:06:20 +0300 (0:00:00.945)       0:00:08.543 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/deploy.yaml for host02 => (item=ubuntu-01.site)
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/deploy.yaml for host02 => (item=ubuntu-02.site)

TASK [webserver : [ubuntu-01.site] Checking if exists directory] *******************************************************************************************************
Saturday 05 February 2022  15:06:20 +0300 (0:00:00.042)       0:00:08.586 *****
ok: [host02]

TASK [webserver : [ubuntu-01.site] Add ubuntu-01.site.html] ************************************************************************************************************
Saturday 05 February 2022  15:06:21 +0300 (0:00:00.702)       0:00:09.288 *****
ok: [host02]

TASK [webserver : [ubuntu-01.site] Creating configuration files] *******************************************************************************************************
Saturday 05 February 2022  15:06:22 +0300 (0:00:01.174)       0:00:10.463 *****
ok: [host02]

TASK [webserver : [ubuntu-02.site] Checking if exists directory] *******************************************************************************************************
Saturday 05 February 2022  15:06:23 +0300 (0:00:01.021)       0:00:11.484 *****
ok: [host02]

TASK [webserver : [ubuntu-02.site] Add ubuntu-02.site.html] ************************************************************************************************************
Saturday 05 February 2022  15:06:24 +0300 (0:00:00.638)       0:00:12.123 *****
changed: [host02]

TASK [webserver : [ubuntu-02.site] Creating configuration files] *******************************************************************************************************
Saturday 05 February 2022  15:06:25 +0300 (0:00:01.052)       0:00:13.176 *****
ok: [host02]

TASK [webserver : [Ubuntu] Restart nginx] ******************************************************************************************************************************
Saturday 05 February 2022  15:06:26 +0300 (0:00:01.030)       0:00:14.206 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/restart.yaml for host02

TASK [webserver : include_tasks] ***************************************************************************************************************************************
Saturday 05 February 2022  15:06:26 +0300 (0:00:00.032)       0:00:14.238 *****
skipping: [host02]
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/centos.yaml for host01

TASK [webserver : [CentOS] Include common variables] *******************************************************************************************************************
Saturday 05 February 2022  15:06:26 +0300 (0:00:00.044)       0:00:14.283 *****
ok: [host01]

TASK [webserver : [CentOS] Include specifics variables] ****************************************************************************************************************
Saturday 05 February 2022  15:06:26 +0300 (0:00:00.022)       0:00:14.305 *****
ok: [host01]

TASK [webserver : [CentOS] Install EPEL Repo] **************************************************************************************************************************
Saturday 05 February 2022  15:06:26 +0300 (0:00:00.022)       0:00:14.327 *****
ok: [host01]

TASK [webserver : [CentOS] Nginx. Install packages] ********************************************************************************************************************
Saturday 05 February 2022  15:06:34 +0300 (0:00:08.739)       0:00:23.067 *****
ok: [host01]

TASK [webserver : [CentOS] Nginx. Enable and start service] ************************************************************************************************************
Saturday 05 February 2022  15:06:39 +0300 (0:00:04.151)       0:00:27.219 *****
ok: [host01]

TASK [webserver : [CentOS] Nginx. Deploy] ******************************************************************************************************************************
Saturday 05 February 2022  15:06:39 +0300 (0:00:00.683)       0:00:27.903 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/deploy.yaml for host01 => (item=centos-01.site)
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/deploy.yaml for host01 => (item=centos-02.site)

TASK [webserver : [centos-01.site] Checking if exists directory] *******************************************************************************************************
Saturday 05 February 2022  15:06:39 +0300 (0:00:00.035)       0:00:27.938 *****
ok: [host01]

TASK [webserver : [centos-01.site] Add centos-01.site.html] ************************************************************************************************************
Saturday 05 February 2022  15:06:40 +0300 (0:00:00.637)       0:00:28.576 *****
ok: [host01]

TASK [webserver : [centos-01.site] Creating configuration files] *******************************************************************************************************
Saturday 05 February 2022  15:06:41 +0300 (0:00:01.032)       0:00:29.608 *****
ok: [host01]

TASK [webserver : [centos-02.site] Checking if exists directory] *******************************************************************************************************
Saturday 05 February 2022  15:06:42 +0300 (0:00:00.988)       0:00:30.597 *****
ok: [host01]

TASK [webserver : [centos-02.site] Add centos-02.site.html] ************************************************************************************************************
Saturday 05 February 2022  15:06:43 +0300 (0:00:00.593)       0:00:31.190 *****
ok: [host01]

TASK [webserver : [centos-02.site] Creating configuration files] *******************************************************************************************************
Saturday 05 February 2022  15:06:44 +0300 (0:00:01.003)       0:00:32.193 *****
ok: [host01]

TASK [webserver : [CentOS] Restart nginx] ******************************************************************************************************************************
Saturday 05 February 2022  15:06:45 +0300 (0:00:01.004)       0:00:33.198 *****
included: /home/dmitry/it-academy/sa.it-academy.by/Dmitry_Boyko/07.Ansible.Cruise/roles/webserver/tasks/restart.yaml for host01

PLAY RECAP *************************************************************************************************************************************************************
host01                     : ok=16   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host02                     : ok=15   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Saturday 05 February 2022  15:06:45 +0300 (0:00:00.059)       0:00:33.257 *****
===============================================================================
webserver : [CentOS] Install EPEL Repo -------------------------------------------------------------------------------------------------------------------------- 8.74s
webserver : [CentOS] Nginx. Install packages -------------------------------------------------------------------------------------------------------------------- 4.15s
webserver : [Ubuntu] Nginx. Install packages -------------------------------------------------------------------------------------------------------------------- 3.82s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------- 3.63s
webserver : [ubuntu-01.site] Add ubuntu-01.site.html ------------------------------------------------------------------------------------------------------------ 1.17s
webserver : [ubuntu-02.site] Add ubuntu-02.site.html ------------------------------------------------------------------------------------------------------------ 1.05s
webserver : [centos-01.site] Add centos-01.site.html ------------------------------------------------------------------------------------------------------------ 1.03s
webserver : [ubuntu-02.site] Creating configuration files ------------------------------------------------------------------------------------------------------- 1.03s
webserver : [ubuntu-01.site] Creating configuration files ------------------------------------------------------------------------------------------------------- 1.02s
webserver : [centos-02.site] Creating configuration files ------------------------------------------------------------------------------------------------------- 1.00s
webserver : [centos-02.site] Add centos-02.site.html ------------------------------------------------------------------------------------------------------------ 1.00s
webserver : [centos-01.site] Creating configuration files ------------------------------------------------------------------------------------------------------- 0.99s
webserver : [Ubuntu] Nginx. Enable and start service ------------------------------------------------------------------------------------------------------------ 0.95s
webserver : [ubuntu-01.site] Checking if exists directory ------------------------------------------------------------------------------------------------------- 0.70s
webserver : [CentOS] Nginx. Enable and start service ------------------------------------------------------------------------------------------------------------ 0.68s
webserver : [ubuntu-02.site] Checking if exists directory ------------------------------------------------------------------------------------------------------- 0.64s
webserver : [centos-01.site] Checking if exists directory ------------------------------------------------------------------------------------------------------- 0.64s
webserver : [centos-02.site] Checking if exists directory ------------------------------------------------------------------------------------------------------- 0.59s
webserver : include_tasks --------------------------------------------------------------------------------------------------------------------------------------- 0.07s
webserver : [CentOS] Restart nginx ------------------------------------------------------------------------------------------------------------------------------ 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 33 seconds

```


# 2. Testing deployment result 

```yaml
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

```yaml
ansible-playbook -i inv.yaml testing.yaml

PLAY [all_workers] *****************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
Saturday 05 February 2022  15:02:38 +0300 (0:00:00.006)       0:00:00.006 *****
ok: [host02]
ok: [host01]

TASK [testing : Checking NOPASSWD in Sudoers] **************************************************************************************************************************
Saturday 05 February 2022  15:02:42 +0300 (0:00:03.698)       0:00:03.704 *****
ok: [host01]
ok: [host02]

TASK [testing : Checking Debian/CentOS repositories] *******************************************************************************************************************
Saturday 05 February 2022  15:02:42 +0300 (0:00:00.722)       0:00:04.427 *****
ok: [host02] => (item=http://centos.mirror.liquidtelecom.com/)
ok: [host01] => (item=http://centos.mirror.liquidtelecom.com/)
ok: [host01] => (item=http://ftp.is.co.za/mirror/centos/)
ok: [host02] => (item=http://ftp.is.co.za/mirror/centos/)
ok: [host01] => (item=http://mirror.hostart.az/CentOS/)
ok: [host02] => (item=http://mirror.hostart.az/CentOS/)
ok: [host01] => (item=http://ftp.byfly.by/debian/)
ok: [host02] => (item=http://ftp.byfly.by/debian/)
ok: [host01] => (item=http://deb.debian.org/debian/)
ok: [host02] => (item=http://deb.debian.org/debian/)
ok: [host01] => (item=http://ftp.debian.org/debian/)
ok: [host02] => (item=http://ftp.debian.org/debian/)

TASK [testing : Checking Docker Hub] ***********************************************************************************************************************************
Saturday 05 February 2022  15:02:48 +0300 (0:00:05.880)       0:00:10.307 *****
ok: [host02]
ok: [host01]

TASK [testing : Checking free space in storage] ************************************************************************************************************************
Saturday 05 February 2022  15:02:50 +0300 (0:00:01.402)       0:00:11.710 *****
ok: [host01] => (item={'block_used': 477879, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4649949, 'size_available': 19046191104, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop0', 'inode_used': 23522, 'block_size': 4096, 'inode_available': 1287198}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4649949,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 477879,
        "device": "/dev/loop0",
        "fstype": "ext4",
        "inode_available": 1287198,
        "inode_total": 1310720,
        "inode_used": 23522,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19046191104,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host02] => (item={'mount': '/', 'device': '/dev/loop1', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18804477952, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4590937, 'block_used': 536891, 'inode_total': 1310720, 'inode_available': 1283905, 'inode_used': 26815, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4590937,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 536891,
        "device": "/dev/loop1",
        "fstype": "ext4",
        "inode_available": 1283905,
        "inode_total": 1310720,
        "inode_used": 26815,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18804477952,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [testing : Checking free memory] **********************************************************************************************************************************
Saturday 05 February 2022  15:02:50 +0300 (0:00:00.046)       0:00:11.756 *****
ok: [host01] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [host02] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *************************************************************************************************************************************************************
host01                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host02                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 05 February 2022  15:02:50 +0300 (0:00:00.086)       0:00:11.843 *****
===============================================================================
testing : Checking Debian/CentOS repositories ------------------------------------------------------------------------------------------------------------------- 5.88s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------- 3.70s
testing : Checking Docker Hub ----------------------------------------------------------------------------------------------------------------------------------- 1.40s
testing : Checking NOPASSWD in Sudoers -------------------------------------------------------------------------------------------------------------------------- 0.72s
testing : Checking free memory ---------------------------------------------------------------------------------------------------------------------------------- 0.09s
testing : Checking free space in storage ------------------------------------------------------------------------------------------------------------------------ 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds

```
