### Ansible. Cruise
#### Nginx deployment
```sh
sergei@sergei-VirtualBox:~/vebinar13$ ansible-playbook -i hosts.yaml play_web.yaml

PLAY [all_hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Thursday 08 April 2021  14:37:07 +0300 (0:00:00.030)       0:00:00.030 ******** 
ok: [worker1]
ok: [worker2]

TASK [web : nginx install packages] ********************************************************************************************************************
Thursday 08 April 2021  14:37:09 +0300 (0:00:02.503)       0:00:02.533 ******** 
skipping: [worker1]
ok: [worker2]

TASK [web : nginx enable and restart service] **********************************************************************************************************
Thursday 08 April 2021  14:37:12 +0300 (0:00:02.650)       0:00:05.183 ******** 
skipping: [worker1]
ok: [worker2]

TASK [web : install nginx dependencies] ****************************************************************************************************************
Thursday 08 April 2021  14:37:13 +0300 (0:00:01.359)       0:00:06.543 ******** 
skipping: [worker2]
ok: [worker1]

TASK [web : nginx install packages] ********************************************************************************************************************
Thursday 08 April 2021  14:37:15 +0300 (0:00:01.226)       0:00:07.769 ******** 
skipping: [worker2]
ok: [worker1]

TASK [web : nginx enable and restart service] **********************************************************************************************************
Thursday 08 April 2021  14:37:16 +0300 (0:00:00.881)       0:00:08.651 ******** 
skipping: [worker2]
ok: [worker1]

TASK [web : enable firewall port] **********************************************************************************************************************
Thursday 08 April 2021  14:37:16 +0300 (0:00:00.866)       0:00:09.518 ******** 
skipping: [worker2]
changed: [worker1]

TASK [web : reload service firewalld] ******************************************************************************************************************
Thursday 08 April 2021  14:37:18 +0300 (0:00:01.948)       0:00:11.466 ******** 
skipping: [worker2]
changed: [worker1]

TASK [web : Remove default page] ***********************************************************************************************************************
Thursday 08 April 2021  14:37:19 +0300 (0:00:00.843)       0:00:12.310 ******** 
changed: [worker2]
changed: [worker1]

TASK [web : Copy custom first page] ********************************************************************************************************************
Thursday 08 April 2021  14:37:21 +0300 (0:00:01.424)       0:00:13.735 ******** 
changed: [worker1]
changed: [worker2]

TASK [web : Check connection to localhost] *************************************************************************************************************
Thursday 08 April 2021  14:37:23 +0300 (0:00:02.623)       0:00:16.358 ******** 
ok: [worker1]
ok: [worker2]

TASK [web : print output] ******************************************************************************************************************************
Thursday 08 April 2021  14:37:24 +0300 (0:00:00.963)       0:00:17.321 ******** 
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
Thursday 08 April 2021  14:37:24 +0300 (0:00:00.113)       0:00:17.435 ******** 
ok: [worker1]
ok: [worker2]

TASK [web : Check template] ****************************************************************************************************************************
Thursday 08 April 2021  14:37:26 +0300 (0:00:01.709)       0:00:19.145 ******** 
ok: [worker1]
ok: [worker2]

TASK [web : print out] *********************************************************************************************************************************
Thursday 08 April 2021  14:37:27 +0300 (0:00:01.026)       0:00:20.172 ******** 
ok: [worker1] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1       localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.8 local-deb.site",
        "192.168.202.7 local-cent.site"
    ]
}
ok: [worker2] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1       localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.8 local-deb.site",
        "192.168.202.7 local-cent.site"
    ]
}

TASK [web : Check content to the sites] ****************************************************************************************************************
Thursday 08 April 2021  14:37:27 +0300 (0:00:00.121)       0:00:20.293 ******** 
ok: [worker1] => (item={'name': 'local-deb.site', 'ip': '192.168.202.8'})
ok: [worker2] => (item={'name': 'local-deb.site', 'ip': '192.168.202.8'})
ok: [worker1] => (item={'name': 'local-cent.site', 'ip': '192.168.202.7'})
ok: [worker2] => (item={'name': 'local-cent.site', 'ip': '192.168.202.7'})

TASK [web : print out] *********************************************************************************************************************************
Thursday 08 April 2021  14:37:29 +0300 (0:00:02.046)       0:00:22.340 ******** 
ok: [worker1] => {
    "msg": "<h1>Nginx first custom page</h1> | <h1>Nginx first custom page</h1>"
}
ok: [worker2] => {
    "msg": "<h1>Nginx first custom page</h1> | <h1>Nginx first custom page</h1>"
}

RUNNING HANDLER [web : restart nginx] ******************************************************************************************************************
Thursday 08 April 2021  14:37:29 +0300 (0:00:00.086)       0:00:22.427 ******** 
changed: [worker1]
changed: [worker2]

PLAY RECAP *********************************************************************************************************************************************
worker1                    : ok=16   changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
worker2                    : ok=13   changed=3    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0   

Thursday 08 April 2021  14:37:31 +0300 (0:00:01.233)       0:00:23.660 ******** 
=============================================================================== 
web : nginx install packages -------------------------------------------------------------------------------------------------------------------- 2.65s
web : Copy custom first page -------------------------------------------------------------------------------------------------------------------- 2.62s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 2.50s
web : Check content to the sites ---------------------------------------------------------------------------------------------------------------- 2.05s
web : enable firewall port ---------------------------------------------------------------------------------------------------------------------- 1.95s
web : Templates --------------------------------------------------------------------------------------------------------------------------------- 1.71s
web : Remove default page ----------------------------------------------------------------------------------------------------------------------- 1.43s
web : nginx enable and restart service ---------------------------------------------------------------------------------------------------------- 1.36s
web : restart nginx ----------------------------------------------------------------------------------------------------------------------------- 1.23s
web : install nginx dependencies ---------------------------------------------------------------------------------------------------------------- 1.23s
web : Check template ---------------------------------------------------------------------------------------------------------------------------- 1.03s
web : Check connection to localhost ------------------------------------------------------------------------------------------------------------- 0.96s
web : nginx install packages -------------------------------------------------------------------------------------------------------------------- 0.88s
web : nginx enable and restart service ---------------------------------------------------------------------------------------------------------- 0.87s
web : reload service firewalld ------------------------------------------------------------------------------------------------------------------ 0.84s
web : print out --------------------------------------------------------------------------------------------------------------------------------- 0.12s
web : print output ------------------------------------------------------------------------------------------------------------------------------ 0.11s
web : print out --------------------------------------------------------------------------------------------------------------------------------- 0.09s
Playbook run took 0 days, 0 hours, 0 minutes, 23 seconds
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
