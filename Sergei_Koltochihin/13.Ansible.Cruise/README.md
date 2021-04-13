### Ansible. Cruise
#### Nginx deployment
```sh
sergei@sergei-VirtualBox:~/vebinar13$ ansible-playbook -i hosts.yaml play_web.yaml -u root

PLAY [all_hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Tuesday 13 April 2021  12:03:24 +0300 (0:00:00.031)       0:00:00.031 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : nginx install packages] ********************************************************************************************************************
Tuesday 13 April 2021  12:03:26 +0300 (0:00:01.806)       0:00:01.838 ********* 
skipping: [worker1]
ok: [worker2]

TASK [web : nginx enable and restart service] **********************************************************************************************************
Tuesday 13 April 2021  12:03:28 +0300 (0:00:02.454)       0:00:04.293 ********* 
skipping: [worker1]
ok: [worker2]

TASK [web : install nginx dependencies] ****************************************************************************************************************
Tuesday 13 April 2021  12:03:30 +0300 (0:00:01.300)       0:00:05.594 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : nginx install packages] ********************************************************************************************************************
Tuesday 13 April 2021  12:03:31 +0300 (0:00:01.181)       0:00:06.775 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : nginx enable and restart service] **********************************************************************************************************
Tuesday 13 April 2021  12:03:32 +0300 (0:00:00.846)       0:00:07.621 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : enable firewall port 80 tcp] ***************************************************************************************************************
Tuesday 13 April 2021  12:03:33 +0300 (0:00:00.765)       0:00:08.387 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : enable firewall port 9001 tcp] *************************************************************************************************************
Tuesday 13 April 2021  12:03:34 +0300 (0:00:01.143)       0:00:09.530 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : reload service firewalld] ******************************************************************************************************************
Tuesday 13 April 2021  12:03:35 +0300 (0:00:00.960)       0:00:10.491 ********* 
skipping: [worker2]
changed: [worker1]

TASK [web : Remove default page] ***********************************************************************************************************************
Tuesday 13 April 2021  12:03:36 +0300 (0:00:01.502)       0:00:11.993 ********* 
changed: [worker1]
changed: [worker2]

TASK [web : Copy custom first page] ********************************************************************************************************************
Tuesday 13 April 2021  12:03:37 +0300 (0:00:00.908)       0:00:12.901 ********* 
changed: [worker1]
changed: [worker2]

TASK [web : Check connection to localhost] *************************************************************************************************************
Tuesday 13 April 2021  12:03:39 +0300 (0:00:02.009)       0:00:14.911 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : print output] ******************************************************************************************************************************
Tuesday 13 April 2021  12:03:40 +0300 (0:00:00.805)       0:00:15.717 ********* 
ok: [worker1] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}
ok: [worker2] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

TASK [web : Templates] *********************************************************************************************************************************
Tuesday 13 April 2021  12:03:40 +0300 (0:00:00.110)       0:00:15.827 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : Check template] ****************************************************************************************************************************
Tuesday 13 April 2021  12:03:41 +0300 (0:00:01.149)       0:00:16.976 ********* 
ok: [worker2]
ok: [worker1]

TASK [web : print out] *********************************************************************************************************************************
Tuesday 13 April 2021  12:03:42 +0300 (0:00:00.841)       0:00:17.818 ********* 
ok: [worker1] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 additionalsite.add",
        "::1       localhost localhost.localdomain localhost6 localhost6.localdomain6 additionalsite.add",
        "",
        "192.168.202.8 local-deb.site",
        "192.168.202.7 local-cent.site"
    ]
}
ok: [worker2] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4 additionalsite.add",
        "::1       localhost localhost.localdomain localhost6 localhost6.localdomain6 additionalsite.add",
        "",
        "192.168.202.8 local-deb.site",
        "192.168.202.7 local-cent.site"
    ]
}

TASK [web : Check content of the sites] ****************************************************************************************************************
Tuesday 13 April 2021  12:03:42 +0300 (0:00:00.102)       0:00:17.920 ********* 
ok: [worker2] => (item={'name': 'local-deb.site', 'ip': '192.168.202.8'})
ok: [worker1] => (item={'name': 'local-deb.site', 'ip': '192.168.202.8'})
ok: [worker1] => (item={'name': 'local-cent.site', 'ip': '192.168.202.7'})
ok: [worker2] => (item={'name': 'local-cent.site', 'ip': '192.168.202.7'})

TASK [web : print out] *********************************************************************************************************************************
Tuesday 13 April 2021  12:03:44 +0300 (0:00:01.823)       0:00:19.743 ********* 
ok: [worker1] => {
    "msg": "<h1>Nginx first custom page</h1> | <h1>Nginx first custom page</h1>"
}
ok: [worker2] => {
    "msg": "<h1>Nginx first custom page</h1> | <h1>Nginx first custom page</h1>"
}

TASK [web : Create sites-available folder for nginx] ***************************************************************************************************
Tuesday 13 April 2021  12:03:44 +0300 (0:00:00.102)       0:00:19.845 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : Create sites-enabled folder for nginx] *****************************************************************************************************
Tuesday 13 April 2021  12:03:45 +0300 (0:00:00.676)       0:00:20.522 ********* 
skipping: [worker2]
ok: [worker1]

TASK [web : Creating additional vhost] *****************************************************************************************************************
Tuesday 13 April 2021  12:03:45 +0300 (0:00:00.751)       0:00:21.273 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : Enable additional site] ********************************************************************************************************************
Tuesday 13 April 2021  12:03:47 +0300 (0:00:01.116)       0:00:22.390 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : Copy custom additional page] ***************************************************************************************************************
Tuesday 13 April 2021  12:03:47 +0300 (0:00:00.670)       0:00:23.061 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : Check connection to additional site on localhost] ******************************************************************************************
Tuesday 13 April 2021  12:03:49 +0300 (0:00:01.647)       0:00:24.709 ********* 
ok: [worker1]
ok: [worker2]

TASK [web : print output] ******************************************************************************************************************************
Tuesday 13 April 2021  12:03:50 +0300 (0:00:00.725)       0:00:25.435 ********* 
ok: [worker1] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 9001,
        "search_regex": null,
        "state": "started"
    }
}
ok: [worker2] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 9001,
        "search_regex": null,
        "state": "started"
    }
}

RUNNING HANDLER [web : restart nginx] ******************************************************************************************************************
Tuesday 13 April 2021  12:03:50 +0300 (0:00:00.088)       0:00:25.523 ********* 
changed: [worker1]
changed: [worker2]

PLAY RECAP *********************************************************************************************************************************************
worker1                    : ok=24   changed=4    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
worker2                    : ok=18   changed=3    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0   

Tuesday 13 April 2021  12:03:51 +0300 (0:00:01.002)       0:00:26.525 ********* 
=============================================================================== 
web : nginx install packages -------------------------------------------------------------------------------------------------------------------- 2.45s
web : Copy custom first page -------------------------------------------------------------------------------------------------------------------- 2.01s
web : Check content of the sites ---------------------------------------------------------------------------------------------------------------- 1.82s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 1.81s
web : Copy custom additional page --------------------------------------------------------------------------------------------------------------- 1.65s
web : reload service firewalld ------------------------------------------------------------------------------------------------------------------ 1.50s
web : nginx enable and restart service ---------------------------------------------------------------------------------------------------------- 1.30s
web : install nginx dependencies ---------------------------------------------------------------------------------------------------------------- 1.18s
web : Templates --------------------------------------------------------------------------------------------------------------------------------- 1.15s
web : enable firewall port 80 tcp --------------------------------------------------------------------------------------------------------------- 1.14s
web : Creating additional vhost ----------------------------------------------------------------------------------------------------------------- 1.12s
web : restart nginx ----------------------------------------------------------------------------------------------------------------------------- 1.00s
web : enable firewall port 9001 tcp ------------------------------------------------------------------------------------------------------------- 0.96s
web : Remove default page ----------------------------------------------------------------------------------------------------------------------- 0.91s
web : nginx install packages -------------------------------------------------------------------------------------------------------------------- 0.85s
web : Check template ---------------------------------------------------------------------------------------------------------------------------- 0.84s
web : Check connection to localhost ------------------------------------------------------------------------------------------------------------- 0.81s
web : nginx enable and restart service ---------------------------------------------------------------------------------------------------------- 0.77s
web : Create sites-enabled folder for nginx ----------------------------------------------------------------------------------------------------- 0.75s
web : Check connection to additional site on localhost ------------------------------------------------------------------------------------------ 0.73s
Playbook run took 0 days, 0 hours, 0 minutes, 26 seconds
```
#### Tests for Nginx deployment
```sh
sergei@sergei-VirtualBox:~/vebinar13$ ansible-playbook -i hosts.yaml play_test.yaml 

PLAY [all_hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Thursday 08 April 2021  14:38:35 +0300 (0:00:00.026)       0:00:00.026 ******** 
ok: [worker1]
ok: [worker2]

TASK [test : check ram] ********************************************************************************************************************************
Thursday 08 April 2021  14:38:38 +0300 (0:00:02.560)       0:00:02.587 ******** 
ok: [worker1] => (item={'real': {'total': 4096, 'used': 227, 'free': 3869}, 'swap': {'cached': 0, 'total': 6144, 'free': 6143, 'used': 1}, 'nocache': {'used': 124, 'free': 3972}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 3972,
            "used": 124
        },
        "real": {
            "free": 3869,
            "total": 4096,
            "used": 227
        },
        "swap": {
            "cached": 0,
            "free": 6143,
            "total": 6144,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'real': {'total': 4096, 'used': 439, 'free': 3657}, 'nocache': {'free': 3971, 'used': 125}, 'swap': {'total': 6144, 'free': 6143, 'used': 1, 'cached': 0}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 3971,
            "used": 125
        },
        "real": {
            "free": 3657,
            "total": 4096,
            "used": 439
        },
        "swap": {
            "cached": 0,
            "free": 6143,
            "total": 6144,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}

TASK [test : check free space] *************************************************************************************************************************
Thursday 08 April 2021  14:38:38 +0300 (0:00:00.113)       0:00:02.701 ******** 
ok: [worker1] => (item={'block_used': 466835, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4660993, 'size_available': 19091427328, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop6', 'inode_used': 23013, 'block_size': 4096, 'inode_available': 1287707}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4660993,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 466835,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1287707,
        "inode_total": 1310720,
        "inode_used": 23013,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19091427328,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18624442368, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4546983, 'block_used': 580845, 'inode_total': 1310720, 'inode_available': 1283593, 'inode_used': 27127, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4546983,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 580845,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1283593,
        "inode_total": 1310720,
        "inode_used": 27127,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18624442368,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Check SUDO with NOPASSWD] *****************************************************************************************************************
Thursday 08 April 2021  14:38:38 +0300 (0:00:00.119)       0:00:02.820 ******** 
ok: [worker1]
ok: [worker2]

TASK [test : Check public repositories] ****************************************************************************************************************
Thursday 08 April 2021  14:38:39 +0300 (0:00:01.030)       0:00:03.851 ******** 
ok: [worker1] => (item={'url': 'ftp.by.debian.org', 'port': 80})
ok: [worker2] => (item={'url': 'ftp.by.debian.org', 'port': 80})
ok: [worker1] => (item={'url': 'tut.by', 'port': 80})
ok: [worker2] => (item={'url': 'tut.by', 'port': 80})
ok: [worker1] => (item={'url': 'pypi.org', 'port': 443})
ok: [worker2] => (item={'url': 'pypi.org', 'port': 443})

TASK [test : Check connection to doker] ****************************************************************************************************************
Thursday 08 April 2021  14:38:42 +0300 (0:00:02.889)       0:00:06.741 ******** 
ok: [worker1] => (item=https://registry.hub.docker.com)
ok: [worker2] => (item=https://registry.hub.docker.com)

TASK [test : Print output] *****************************************************************************************************************************
Thursday 08 April 2021  14:38:44 +0300 (0:00:01.727)       0:00:08.468 ******** 
ok: [worker1] => (item=200) => {
    "msg": "200"
}
ok: [worker2] => (item=200) => {
    "msg": "200"
}

PLAY RECAP *********************************************************************************************************************************************
worker1                    : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker2                    : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 08 April 2021  14:38:44 +0300 (0:00:00.096)       0:00:08.565 ******** 
=============================================================================== 
test : Check public repositories ---------------------------------------------------------------------------------------------------------------- 2.89s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 2.56s
test : Check connection to doker ---------------------------------------------------------------------------------------------------------------- 1.73s
test : Check SUDO with NOPASSWD ----------------------------------------------------------------------------------------------------------------- 1.03s
test : check free space ------------------------------------------------------------------------------------------------------------------------- 0.12s
test : check ram -------------------------------------------------------------------------------------------------------------------------------- 0.11s
test : Print output ----------------------------------------------------------------------------------------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```