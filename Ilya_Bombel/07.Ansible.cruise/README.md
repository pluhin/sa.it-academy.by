# 07.Ansible.cruise homework

## Playbook of web.yaml

### Create Ansible Playbook with role(s) to install Nginx server and setup two virtual hosts. Playbook should meet the following requirements:
* Depends from OS (at least two)
* Setup Nginx for two virtualhosts using templates
* Create and add index.html files
* Check deployment/validate functionality of virtualhosts

```bash
ansible-playbook -i inventory.yaml web.yaml
[DEPRECATION WARNING]: "include" is deprecated, use include_tasks/import_tasks instead. This feature will be removed in version 2.16. Deprecation warnings can be
disabled by setting deprecation_warnings=False in ansible.cfg.

PLAY [all_workers] **************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************
Tuesday 17 May 2022  12:53:28 +0000 (0:00:00.016)       0:00:00.016 ***********
ok: [host9]
ok: [host10]

TASK [webserver : NGINX. Install packages] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:31 +0000 (0:00:02.293)       0:00:02.310 ***********
skipping: [host9]
ok: [host10]

TASK [webserver : Nginx. Enable and start servce] *******************************************************************************************************************
Tuesday 17 May 2022  12:53:33 +0000 (0:00:02.744)       0:00:05.054 ***********
skipping: [host9]
ok: [host10]

TASK [webserver : Nginx. Deploy Ubuntu] *****************************************************************************************************************************
Tuesday 17 May 2022  12:53:34 +0000 (0:00:01.053)       0:00:06.107 ***********
skipping: [host9] => (item=ubuntu1.site)
skipping: [host9] => (item=ubuntu2.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/deploy.yaml for host10 => (item=ubuntu1.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/deploy.yaml for host10 => (item=ubuntu2.site)

TASK [webserver : Check if directory exists] ************************************************************************************************************************
Tuesday 17 May 2022  12:53:35 +0000 (0:00:00.143)       0:00:06.251 ***********
ok: [host10]

TASK [webserver : Copy index.html] **********************************************************************************************************************************
Tuesday 17 May 2022  12:53:35 +0000 (0:00:00.759)       0:00:07.011 ***********
ok: [host10]

TASK [webserver : Templates virtual_hosts] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:36 +0000 (0:00:01.138)       0:00:08.150 ***********
changed: [host10]

TASK [webserver : Check if directory exists] ************************************************************************************************************************
Tuesday 17 May 2022  12:53:38 +0000 (0:00:01.256)       0:00:09.406 ***********
changed: [host10]

TASK [webserver : Copy index.html] **********************************************************************************************************************************
Tuesday 17 May 2022  12:53:38 +0000 (0:00:00.645)       0:00:10.051 ***********
changed: [host10]

TASK [webserver : Templates virtual_hosts] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:39 +0000 (0:00:01.119)       0:00:11.171 ***********
changed: [host10]

TASK [webserver : Restart nginx Ubuntu] *****************************************************************************************************************************
Tuesday 17 May 2022  12:53:41 +0000 (0:00:01.147)       0:00:12.319 ***********
skipping: [host9]
changed: [host10]

TASK [webserver : Nginx. Check Ubuntu virtualhosts] *****************************************************************************************************************
Tuesday 17 May 2022  12:53:42 +0000 (0:00:00.911)       0:00:13.230 ***********
skipping: [host9] => (item=ubuntu1.site)
skipping: [host9] => (item=ubuntu2.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/check.yaml for host10 => (item=ubuntu1.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/check.yaml for host10 => (item=ubuntu2.site)

TASK [webserver : Check content to the sites] ***********************************************************************************************************************
Tuesday 17 May 2022  12:53:42 +0000 (0:00:00.146)       0:00:13.377 ***********
ok: [host10]

TASK [webserver : Print output] *************************************************************************************************************************************
Tuesday 17 May 2022  12:53:43 +0000 (0:00:00.835)       0:00:14.213 ***********
ok: [host10] => {
    "msg": "Host: ubuntu1.site"
}

TASK [webserver : Check content to the sites] ***********************************************************************************************************************
Tuesday 17 May 2022  12:53:43 +0000 (0:00:00.064)       0:00:14.277 ***********
ok: [host10]

TASK [webserver : Print output] *************************************************************************************************************************************
Tuesday 17 May 2022  12:53:43 +0000 (0:00:00.683)       0:00:14.961 ***********
ok: [host10] => {
    "msg": "Host: ubuntu2.site"
}

TASK [webserver : Install epel repo] ********************************************************************************************************************************
Tuesday 17 May 2022  12:53:43 +0000 (0:00:00.040)       0:00:15.001 ***********
skipping: [host10]
ok: [host9]

TASK [webserver : NGINX. Install packages] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:44 +0000 (0:00:00.975)       0:00:15.977 ***********
skipping: [host10]
ok: [host9]

TASK [webserver : NGINX. Enable and start servce] *******************************************************************************************************************
Tuesday 17 May 2022  12:53:45 +0000 (0:00:00.817)       0:00:16.795 ***********
skipping: [host10]
ok: [host9]

TASK [webserver : NGINX. Enable firewall port] **********************************************************************************************************************
Tuesday 17 May 2022  12:53:46 +0000 (0:00:00.718)       0:00:17.513 ***********
skipping: [host10]
ok: [host9]

TASK [webserver : NGINX. reload service firewalld] ******************************************************************************************************************
Tuesday 17 May 2022  12:53:47 +0000 (0:00:01.125)       0:00:18.638 ***********
skipping: [host10]
changed: [host9]

TASK [webserver : Nginx. Deploy CentOS] *****************************************************************************************************************************
Tuesday 17 May 2022  12:53:48 +0000 (0:00:00.929)       0:00:19.568 ***********
skipping: [host10] => (item=centos1.site)
skipping: [host10] => (item=centos2.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/deploy.yaml for host9 => (item=centos1.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/deploy.yaml for host9 => (item=centos2.site)

TASK [webserver : Check if directory exists] ************************************************************************************************************************
Tuesday 17 May 2022  12:53:48 +0000 (0:00:00.125)       0:00:19.694 ***********
ok: [host9]

TASK [webserver : Copy index.html] **********************************************************************************************************************************
Tuesday 17 May 2022  12:53:49 +0000 (0:00:00.664)       0:00:20.358 ***********
ok: [host9]

TASK [webserver : Templates virtual_hosts] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:50 +0000 (0:00:01.055)       0:00:21.414 ***********
changed: [host9]

TASK [webserver : Check if directory exists] ************************************************************************************************************************
Tuesday 17 May 2022  12:53:51 +0000 (0:00:01.125)       0:00:22.539 ***********
changed: [host9]

TASK [webserver : Copy index.html] **********************************************************************************************************************************
Tuesday 17 May 2022  12:53:51 +0000 (0:00:00.609)       0:00:23.149 ***********
changed: [host9]

TASK [webserver : Templates virtual_hosts] **************************************************************************************************************************
Tuesday 17 May 2022  12:53:53 +0000 (0:00:01.125)       0:00:24.275 ***********
changed: [host9]

TASK [webserver : Restart nginx CentOS] *****************************************************************************************************************************
Tuesday 17 May 2022  12:53:54 +0000 (0:00:01.104)       0:00:25.380 ***********
skipping: [host10]
changed: [host9]

TASK [webserver : Nginx. Check CentOS virtualhosts] *****************************************************************************************************************
Tuesday 17 May 2022  12:53:54 +0000 (0:00:00.800)       0:00:26.180 ***********
skipping: [host10] => (item=centos1.site)
skipping: [host10] => (item=centos2.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/check.yaml for host9 => (item=centos1.site)
included: /home/vagrant/ansible_cruise/roles/webserver/tasks/check.yaml for host9 => (item=centos2.site)

TASK [webserver : Check content to the sites] ***********************************************************************************************************************
Tuesday 17 May 2022  12:53:55 +0000 (0:00:00.121)       0:00:26.302 ***********
ok: [host9]

TASK [webserver : Print output] *************************************************************************************************************************************
Tuesday 17 May 2022  12:53:55 +0000 (0:00:00.650)       0:00:26.952 ***********
ok: [host9] => {
    "msg": "Host: centos1.site"
}

TASK [webserver : Check content to the sites] ***********************************************************************************************************************
Tuesday 17 May 2022  12:53:55 +0000 (0:00:00.061)       0:00:27.014 ***********
ok: [host9]

TASK [webserver : Print output] *************************************************************************************************************************************
Tuesday 17 May 2022  12:53:56 +0000 (0:00:00.647)       0:00:27.662 ***********
ok: [host9] => {
    "msg": "Host: centos2.site"
}

PLAY RECAP **********************************************************************************************************************************************************
host10                     : ok=18   changed=5    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0
host9                      : ok=21   changed=6    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

Tuesday 17 May 2022  12:53:56 +0000 (0:00:00.152)       0:00:27.814 ***********
===============================================================================
webserver : NGINX. Install packages -------------------------------------------------------------------------------------------------------------------------- 2.74s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------- 2.29s
webserver : Templates virtual_hosts -------------------------------------------------------------------------------------------------------------------------- 1.26s
webserver : Templates virtual_hosts -------------------------------------------------------------------------------------------------------------------------- 1.15s
webserver : Copy index.html ---------------------------------------------------------------------------------------------------------------------------------- 1.14s
webserver : Copy index.html ---------------------------------------------------------------------------------------------------------------------------------- 1.13s
webserver : NGINX. Enable firewall port ---------------------------------------------------------------------------------------------------------------------- 1.13s
webserver : Templates virtual_hosts -------------------------------------------------------------------------------------------------------------------------- 1.12s
webserver : Copy index.html ---------------------------------------------------------------------------------------------------------------------------------- 1.12s
webserver : Templates virtual_hosts -------------------------------------------------------------------------------------------------------------------------- 1.10s
webserver : Copy index.html ---------------------------------------------------------------------------------------------------------------------------------- 1.06s
webserver : Nginx. Enable and start servce ------------------------------------------------------------------------------------------------------------------- 1.05s
webserver : Install epel repo -------------------------------------------------------------------------------------------------------------------------------- 0.98s
webserver : NGINX. reload service firewalld ------------------------------------------------------------------------------------------------------------------ 0.93s
webserver : Restart nginx Ubuntu ----------------------------------------------------------------------------------------------------------------------------- 0.91s
webserver : Check content to the sites ----------------------------------------------------------------------------------------------------------------------- 0.84s
webserver : NGINX. Install packages -------------------------------------------------------------------------------------------------------------------------- 0.82s
webserver : Restart nginx CentOS ----------------------------------------------------------------------------------------------------------------------------- 0.80s
webserver : Check if directory exists ------------------------------------------------------------------------------------------------------------------------ 0.76s
webserver : NGINX. Enable and start servce ------------------------------------------------------------------------------------------------------------------- 0.72s
Playbook run took 0 days, 0 hours, 0 minutes, 27 seconds
```

## Implement testing role by using test.yaml for playbook:
* Check if we have SUDO with NOPASSWD
* Check connections to public repositories (Debian/CentOS and pip package repository)
* Check if we have connection to docker hub registry (return content check)
* Check if we have enough RAM/HDD (you can create thresholds by yourself)

```bash
ansible-playbook -i inventory.yaml test.yaml

PLAY [all_workers] **************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************
Tuesday 17 May 2022  13:11:23 +0000 (0:00:00.011)       0:00:00.011 ***********
ok: [host9]
ok: [host10]

TASK [test : Check SUDO with NOPASSWD] ******************************************************************************************************************************
Tuesday 17 May 2022  13:11:26 +0000 (0:00:02.278)       0:00:02.290 ***********
ok: [host9]
ok: [host10]

TASK [test : Check connections to public repos] *********************************************************************************************************************
Tuesday 17 May 2022  13:11:26 +0000 (0:00:00.742)       0:00:03.033 ***********
ok: [host10] => (item=https://deb.debian.org/debian)
ok: [host9] => (item=https://deb.debian.org/debian)
ok: [host10] => (item=http://mirror.centos.org/centos/)
ok: [host9] => (item=http://mirror.centos.org/centos/)
ok: [host10] => (item=https://pypi.org/simple)
ok: [host9] => (item=https://pypi.org/simple)

TASK [test : Check connection Docker hub] ***************************************************************************************************************************
Tuesday 17 May 2022  13:11:34 +0000 (0:00:07.310)       0:00:10.345 ***********
ok: [host9]
ok: [host10]

TASK [test : Check HDD] *********************************************************************************************************************************************
Tuesday 17 May 2022  13:11:35 +0000 (0:00:01.320)       0:00:11.665 ***********
ok: [host9] => (item={'block_used': 479934, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4647894, 'size_available': 19037773824, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop8', 'inode_used': 23501, 'block_size': 4096, 'inode_available': 1287219}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4647894,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 479934,
        "device": "/dev/loop8",
        "fstype": "ext4",
        "inode_available": 1287219,
        "inode_total": 1310720,
        "inode_used": 23501,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19037773824,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available disk space: 90% of disk space."
}
ok: [host10] => (item={'mount': '/', 'device': '/dev/loop9', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18814623744, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4593414, 'block_used': 534414, 'inode_total': 1310720, 'inode_available': 1283913, 'inode_used': 26807, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4593414,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 534414,
        "device": "/dev/loop9",
        "fstype": "ext4",
        "inode_available": 1283913,
        "inode_total": 1310720,
        "inode_used": 26807,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18814623744,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available disk space: 89% of disk space."
}

TASK [test : Check RAM] *********************************************************************************************************************************************
Tuesday 17 May 2022  13:11:35 +0000 (0:00:00.127)       0:00:11.793 ***********
ok: [host9] => {
    "changed": false,
    "msg": "OK. Available RAM: 77% of RAM."
}
ok: [host10] => {
    "changed": false,
    "msg": "OK. Available RAM: 76% of RAM."
}

PLAY RECAP **********************************************************************************************************************************************************
host10                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host9                      : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 17 May 2022  13:11:35 +0000 (0:00:00.191)       0:00:11.985 ***********
===============================================================================
test : Check connections to public repos --------------------------------------------------------------------------------------------------------------------- 7.31s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------- 2.28s
test : Check connection Docker hub --------------------------------------------------------------------------------------------------------------------------- 1.32s
test : Check SUDO with NOPASSWD ------------------------------------------------------------------------------------------------------------------------------ 0.74s
test : Check RAM --------------------------------------------------------------------------------------------------------------------------------------------- 0.19s
test : Check HDD --------------------------------------------------------------------------------------------------------------------------------------------- 0.13s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds
```