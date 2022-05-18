# 07.AnsibleCruise homework

## Ansible Playbook with role to install Nginx server and setup two virtual hosts (nginx_inst.yml).
```bash
PLAY [work_sa] ********************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************
Серада 18 мая 2022  19:44:26 +0300 (0:00:00.011)       0:00:00.011 ************ 
ok: [host35]
ok: [host36]

TASK [setup : Install Nginx on Debian Family] *************************************************************************************************
Серада 18 мая 2022  19:44:28 +0300 (0:00:01.633)       0:00:01.644 ************ 
skipping: [host35]
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/nginx_deb.yml for host36

TASK [setup : Install Nginx on Debian Family] *************************************************************************************************
Серада 18 мая 2022  19:44:28 +0300 (0:00:00.131)       0:00:01.776 ************ 
ok: [host36]

TASK [setup : Start Nginx] ********************************************************************************************************************
Серада 18 мая 2022  19:44:29 +0300 (0:00:01.212)       0:00:02.989 ************ 
ok: [host36]

TASK [setup : Create virtual domain directory] ************************************************************************************************
Серада 18 мая 2022  19:44:30 +0300 (0:00:00.999)       0:00:03.989 ************ 
ok: [host36] => (item=debian1.local)
ok: [host36] => (item=debian2.local)

TASK [setup : Remove default site] ************************************************************************************************************
Серада 18 мая 2022  19:44:32 +0300 (0:00:01.197)       0:00:05.186 ************ 
ok: [host36]

TASK [setup : Create index.html for every virtual domain] *************************************************************************************
Серада 18 мая 2022  19:44:32 +0300 (0:00:00.680)       0:00:05.867 ************ 
ok: [host36] => (item=debian1.local)
ok: [host36] => (item=debian2.local)

TASK [setup : Create config file for every virtual domain] ************************************************************************************
Серада 18 мая 2022  19:44:34 +0300 (0:00:01.987)       0:00:07.854 ************ 
ok: [host36] => (item=debian1.local)
ok: [host36] => (item=debian2.local)

TASK [setup : Create links] *******************************************************************************************************************
Серада 18 мая 2022  19:44:36 +0300 (0:00:01.909)       0:00:09.763 ************ 
ok: [host36] => (item=debian1.local)
ok: [host36] => (item=debian2.local)

TASK [setup : Install Nginx on RedHat Family] *************************************************************************************************
Серада 18 мая 2022  19:44:37 +0300 (0:00:01.116)       0:00:10.880 ************ 
skipping: [host36]
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/nginx_red.yml for host35

TASK [setup : Install epel] *******************************************************************************************************************
Серада 18 мая 2022  19:44:37 +0300 (0:00:00.107)       0:00:10.988 ************ 
ok: [host35]

TASK [setup : Install Nginx on RedHat Family] *************************************************************************************************
Серада 18 мая 2022  19:44:38 +0300 (0:00:00.872)       0:00:11.861 ************ 
ok: [host35]

TASK [setup : Start Nginx] ********************************************************************************************************************
Серада 18 мая 2022  19:44:48 +0300 (0:00:09.435)       0:00:21.296 ************ 
ok: [host35]

TASK [setup : Create virtual domain directory] ************************************************************************************************
Серада 18 мая 2022  19:44:48 +0300 (0:00:00.629)       0:00:21.926 ************ 
ok: [host35] => (item=redhat1.local)
ok: [host35] => (item=redhat2.local)

TASK [setup : Create index.html for every virtual domain] *************************************************************************************
Серада 18 мая 2022  19:44:49 +0300 (0:00:01.028)       0:00:22.955 ************ 
ok: [host35] => (item=redhat1.local)
ok: [host35] => (item=redhat2.local)

TASK [setup : Create config file for every virtual domain] ************************************************************************************
Серада 18 мая 2022  19:44:51 +0300 (0:00:01.702)       0:00:24.657 ************ 
ok: [host35] => (item=redhat1.local)
ok: [host35] => (item=redhat2.local)

TASK [setup : Open port] **********************************************************************************************************************
Серада 18 мая 2022  19:44:53 +0300 (0:00:02.011)       0:00:26.669 ************ 
ok: [host35]

TASK [setup : Restart firewalld] **************************************************************************************************************
Серада 18 мая 2022  19:44:54 +0300 (0:00:00.873)       0:00:27.543 ************ 
changed: [host35]

TASK [setup : Edit hosts] *********************************************************************************************************************
Серада 18 мая 2022  19:44:55 +0300 (0:00:00.973)       0:00:28.516 ************ 
ok: [host35]
ok: [host36]

TASK [setup : Check deployment/validate functionality of virtualhosts] ************************************************************************
Серада 18 мая 2022  19:44:56 +0300 (0:00:00.913)       0:00:29.429 ************ 
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/check.yml for host35 => (item=redhat1.local)
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/check.yml for host35 => (item=redhat2.local)
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/check.yml for host36 => (item=debian1.local)
included: /home/ivan/devops/it-academy.by/Ivan_Nemkovich/07.AnsibleCruise/roles/setup/tasks/check.yml for host36 => (item=debian2.local)

TASK [setup : Check deployment/validate functionality of virtualhosts] ************************************************************************
Серада 18 мая 2022  19:44:56 +0300 (0:00:00.133)       0:00:29.563 ************ 
ok: [host35]

TASK [setup : print out] **********************************************************************************************************************
Серада 18 мая 2022  19:44:57 +0300 (0:00:00.750)       0:00:30.313 ************ 
ok: [host35] => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<html>\n <head>\n <title>redhat1.local</title>\n </head>\n <body>\n <h1>Welcome to redhat1.local website on RedHat!!!!</h1>\n </body>\n</html>\n",
        "content_length": "136",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 18 May 2022 16:44:57 GMT",
        "elapsed": 0,
        "etag": "\"62852118-88\"",
        "failed": false,
        "failed_when_result": false,
        "last_modified": "Wed, 18 May 2022 16:38:48 GMT",
        "msg": "OK (136 bytes)",
        "redirected": false,
        "server": "nginx/1.20.1",
        "status": 200,
        "url": "http://redhat1.local"
    }
}

TASK [setup : Check deployment/validate functionality of virtualhosts] ************************************************************************
Серада 18 мая 2022  19:44:57 +0300 (0:00:00.070)       0:00:30.383 ************ 
ok: [host35]

TASK [setup : print out] **********************************************************************************************************************
Серада 18 мая 2022  19:44:57 +0300 (0:00:00.501)       0:00:30.885 ************ 
ok: [host35] => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<html>\n <head>\n <title>redhat2.local</title>\n </head>\n <body>\n <h1>Welcome to redhat2.local website on RedHat!!!!</h1>\n </body>\n</html>\n",
        "content_length": "136",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 18 May 2022 16:44:57 GMT",
        "elapsed": 0,
        "etag": "\"62852119-88\"",
        "failed": false,
        "failed_when_result": false,
        "last_modified": "Wed, 18 May 2022 16:38:49 GMT",
        "msg": "OK (136 bytes)",
        "redirected": false,
        "server": "nginx/1.20.1",
        "status": 200,
        "url": "http://redhat2.local"
    }
}

TASK [setup : Check deployment/validate functionality of virtualhosts] ************************************************************************
Серада 18 мая 2022  19:44:57 +0300 (0:00:00.073)       0:00:30.959 ************ 
ok: [host36]

TASK [setup : print out] **********************************************************************************************************************
Серада 18 мая 2022  19:44:58 +0300 (0:00:00.557)       0:00:31.517 ************ 
ok: [host36] => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<html>\n <head>\n <title>debian1.local</title>\n </head>\n <body>\n <h1>Welcome to debian1.local website on Debian!!!!</h1>\n </body>\n</html>\n",
        "content_length": "136",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 18 May 2022 16:44:58 GMT",
        "elapsed": 0,
        "etag": "\"6285221c-88\"",
        "failed": false,
        "failed_when_result": false,
        "last_modified": "Wed, 18 May 2022 16:43:08 GMT",
        "msg": "OK (136 bytes)",
        "redirected": false,
        "server": "nginx/1.14.0 (Ubuntu)",
        "status": 200,
        "url": "http://debian1.local"
    }
}

TASK [setup : Check deployment/validate functionality of virtualhosts] ************************************************************************
Серада 18 мая 2022  19:44:58 +0300 (0:00:00.069)       0:00:31.586 ************ 
ok: [host36]

TASK [setup : print out] **********************************************************************************************************************
Серада 18 мая 2022  19:44:59 +0300 (0:00:00.617)       0:00:32.204 ************ 
ok: [host36] => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<html>\n <head>\n <title>debian2.local</title>\n </head>\n <body>\n <h1>Welcome to debian2.local website on Debian!!!!</h1>\n </body>\n</html>\n",
        "content_length": "136",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 18 May 2022 16:44:59 GMT",
        "elapsed": 0,
        "etag": "\"6285221d-88\"",
        "failed": false,
        "failed_when_result": false,
        "last_modified": "Wed, 18 May 2022 16:43:09 GMT",
        "msg": "OK (136 bytes)",
        "redirected": false,
        "server": "nginx/1.14.0 (Ubuntu)",
        "status": 200,
        "url": "http://debian2.local"
    }
}

PLAY RECAP ************************************************************************************************************************************
host35                     : ok=17   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host36                     : ok=16   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Серада 18 мая 2022  19:44:59 +0300 (0:00:00.117)       0:00:32.321 ************ 
=============================================================================== 
setup : Install Nginx on RedHat Family ------------------------------------------------------------------------------------------------- 9.44s
setup : Create config file for every virtual domain ------------------------------------------------------------------------------------ 2.01s
setup : Create index.html for every virtual domain ------------------------------------------------------------------------------------- 1.99s
setup : Create config file for every virtual domain ------------------------------------------------------------------------------------ 1.91s
setup : Create index.html for every virtual domain ------------------------------------------------------------------------------------- 1.70s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------ 1.63s
setup : Install Nginx on Debian Family ------------------------------------------------------------------------------------------------- 1.21s
setup : Create virtual domain directory ------------------------------------------------------------------------------------------------ 1.20s
setup : Create links ------------------------------------------------------------------------------------------------------------------- 1.12s
setup : Create virtual domain directory ------------------------------------------------------------------------------------------------ 1.03s
setup : Start Nginx -------------------------------------------------------------------------------------------------------------------- 1.00s
setup : Restart firewalld -------------------------------------------------------------------------------------------------------------- 0.97s
setup : Edit hosts --------------------------------------------------------------------------------------------------------------------- 0.91s
setup : Open port ---------------------------------------------------------------------------------------------------------------------- 0.87s
setup : Install epel ------------------------------------------------------------------------------------------------------------------- 0.87s
setup : Check deployment/validate functionality of virtualhosts ------------------------------------------------------------------------ 0.75s
setup : Remove default site ------------------------------------------------------------------------------------------------------------ 0.68s
setup : Start Nginx -------------------------------------------------------------------------------------------------------------------- 0.63s
setup : Check deployment/validate functionality of virtualhosts ------------------------------------------------------------------------ 0.62s
setup : Check deployment/validate functionality of virtualhosts ------------------------------------------------------------------------ 0.56s
Playbook run took 0 days, 0 hours, 0 minutes, 32 seconds

```

## Testing role (test.yml)
```bash
PLAY [work_sa] ********************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************
Серада 18 мая 2022  20:45:21 +0300 (0:00:00.012)       0:00:00.012 ************ 
ok: [host35]
ok: [host36]

TASK [test : Check if we have SUDO with NOPASSWD] *********************************************************************************************
Серада 18 мая 2022  20:45:25 +0300 (0:00:03.106)       0:00:03.118 ************ 
changed: [host35]
changed: [host36]

TASK [test : print out] ***********************************************************************************************************************
Серада 18 мая 2022  20:45:25 +0300 (0:00:00.623)       0:00:03.742 ************ 
ok: [host35] => {
    "msg": [
        "/root"
    ]
}
ok: [host36] => {
    "msg": [
        "/root"
    ]
}

TASK [test : Check connections to public repositories] ****************************************************************************************
Серада 18 мая 2022  20:45:25 +0300 (0:00:00.065)       0:00:03.808 ************ 
ok: [host35] => (item=https://cloud.debian.org/images/cloud/)
ok: [host36] => (item=https://cloud.debian.org/images/cloud/)
ok: [host35] => (item=http://mirror.centos.org/centos/)
ok: [host36] => (item=http://mirror.centos.org/centos/)
ok: [host35] => (item=https://pypi.org/)
ok: [host36] => (item=https://pypi.org/)

TASK [test : Check if we have connection to docker hub registry (return content check)] *******************************************************
Серада 18 мая 2022  20:45:28 +0300 (0:00:02.441)       0:00:06.249 ************ 
ok: [host35]
ok: [host36]

TASK [test : print out] ***********************************************************************************************************************
Серада 18 мая 2022  20:45:29 +0300 (0:00:01.254)       0:00:07.503 ************ 
ok: [host35] => {
    "msg": "200"
}
ok: [host36] => {
    "msg": "200"
}

TASK [test : Ensure that free space on HDD is enough] *****************************************************************************************
Серада 18 мая 2022  20:45:29 +0300 (0:00:00.085)       0:00:07.589 ************ 
failed: [host35] (item={'block_used': 479893, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4647935, 'size_available': 19037941760, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop34', 'inode_used': 23505, 'block_size': 4096, 'inode_available': 1287215}) => {
    "ansible_loop_var": "item",
    "assertion": false,
    "changed": false,
    "evaluated_to": false,
    "item": {
        "block_available": 4647935,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 479893,
        "device": "/dev/loop34",
        "fstype": "ext4",
        "inode_available": 1287215,
        "inode_total": 1310720,
        "inode_used": 23505,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19037941760,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "disk space is not enough"
}
...ignoring
failed: [host36] (item={'mount': '/', 'device': '/dev/loop35', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18824179712, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4595747, 'block_used': 532081, 'inode_total': 1310720, 'inode_available': 1283942, 'inode_used': 26778, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "assertion": false,
    "changed": false,
    "evaluated_to": false,
    "item": {
        "block_available": 4595747,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 532081,
        "device": "/dev/loop35",
        "fstype": "ext4",
        "inode_available": 1283942,
        "inode_total": 1310720,
        "inode_used": 26778,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18824179712,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "disk space is not enough"
}
...ignoring

TASK [test : Ensure that RAM is enough] *******************************************************************************************************
Серада 18 мая 2022  20:45:29 +0300 (0:00:00.071)       0:00:07.660 ************ 
ok: [host35] => {
    "changed": false,
    "msg": "RAM space is enough"
}
ok: [host36] => {
    "changed": false,
    "msg": "RAM space is enough"
}

PLAY RECAP ************************************************************************************************************************************
host35                     : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1   
host36                     : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1   

Серада 18 мая 2022  20:45:29 +0300 (0:00:00.134)       0:00:07.795 ************ 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------ 3.11s
test : Check connections to public repositories ---------------------------------------------------------------------------------------- 2.44s
test : Check if we have connection to docker hub registry (return content check) ------------------------------------------------------- 1.25s
test : Check if we have SUDO with NOPASSWD --------------------------------------------------------------------------------------------- 0.62s
test : Ensure that RAM is enough ------------------------------------------------------------------------------------------------------- 0.13s
test : print out ----------------------------------------------------------------------------------------------------------------------- 0.09s
test : Ensure that free space on HDD is enough ----------------------------------------------------------------------------------------- 0.07s
test : print out ----------------------------------------------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds
```
