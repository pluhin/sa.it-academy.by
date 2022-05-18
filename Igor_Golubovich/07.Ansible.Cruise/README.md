# 07.Ansible.Cruise by Igor Golubovich

## Playbook web_task.yml

```bash
igoz@Ubuntu20:~/Desktop/ansible_main$ ansible-playbook -i inv.yaml web_task.yml -b

PLAY [all_workers] *****************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************
Понедельник 16 мая 2022  15:28:32 +0300 (0:00:00.011)       0:00:00.011 *******
ok: [redhat]
ok: [ubuntu]

TASK [webserver : Include deploy for Debian systems] *******************************************************************************************************
Понедельник 16 мая 2022  15:28:36 +0300 (0:00:04.614)       0:00:04.625 *******
skipping: [redhat]
included: /home/igoz/Desktop/devops_homework/7_ansible/ansible_main/roles/webserver/tasks/http_ubuntu.yml for ubuntu

TASK [webserver : Nginx. Install packages] *****************************************************************************************************************
Понедельник 16 мая 2022  15:28:37 +0300 (0:00:00.101)       0:00:04.727 *******
changed: [ubuntu]

TASK [webserver : Nginx. Enable and start service] *********************************************************************************************************
Понедельник 16 мая 2022  15:28:56 +0300 (0:00:19.287)       0:00:24.014 *******
ok: [ubuntu]

TASK [webserver : Include deploy for RedHat systems] *******************************************************************************************************
Понедельник 16 мая 2022  15:28:58 +0300 (0:00:02.048)       0:00:26.063 *******
skipping: [ubuntu]
included: /home/igoz/Desktop/devops_homework/7_ansible/ansible_main/roles/webserver/tasks/http_redhat.yml for redhat

TASK [webserver : Nginx. Install packages] *****************************************************************************************************************
Понедельник 16 мая 2022  15:28:58 +0300 (0:00:00.109)       0:00:26.172 *******
changed: [redhat]

TASK [webserver : Nginx. Enable and start service] *********************************************************************************************************
Понедельник 16 мая 2022  15:29:36 +0300 (0:00:38.119)       0:01:04.292 *******
changed: [redhat]

TASK [webserver : Nginx. Set up] ***************************************************************************************************************************
Понедельник 16 мая 2022  15:29:38 +0300 (0:00:02.236)       0:01:06.528 *******
included: /home/igoz/Desktop/devops_homework/7_ansible/ansible_main/roles/webserver/tasks/setup_nginx.yml for redhat, ubuntu

TASK [webserver : Nginx. Remove welcome file] **************************************************************************************************************
Понедельник 16 мая 2022  15:29:38 +0300 (0:00:00.096)       0:01:06.625 *******
ok: [redhat]
ok: [ubuntu]

TASK [webserver : Nginx. Copy config file] *****************************************************************************************************************
Понедельник 16 мая 2022  15:29:40 +0300 (0:00:01.887)       0:01:08.512 *******
changed: [redhat]
changed: [ubuntu]

TASK [webserver : Nginx. Copy first page] ******************************************************************************************************************
Понедельник 16 мая 2022  15:29:44 +0300 (0:00:03.434)       0:01:11.947 *******
changed: [redhat]
changed: [ubuntu]

TASK [webserver : Test] ************************************************************************************************************************************
Понедельник 16 мая 2022  15:29:47 +0300 (0:00:03.135)       0:01:15.083 *******
included: /home/igoz/Desktop/devops_homework/7_ansible/ansible_main/roles/webserver/tasks/http_test.yml for redhat, ubuntu

TASK [webserver : Check connection to Localhost] ***********************************************************************************************************
Понедельник 16 мая 2022  15:29:47 +0300 (0:00:00.109)       0:01:15.193 *******
ok: [redhat]
ok: [ubuntu]

TASK [webserver : print out] *******************************************************************************************************************************
Понедельник 16 мая 2022  15:29:49 +0300 (0:00:01.687)       0:01:16.880 *******
ok: [redhat] => {
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
ok: [ubuntu] => {
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

TASK [webserver : Templates] *******************************************************************************************************************************
Понедельник 16 мая 2022  15:29:49 +0300 (0:00:00.097)       0:01:16.977 *******
changed: [redhat]
changed: [ubuntu]

TASK [webserver : Check content to the sites] **************************************************************************************************************
Понедельник 16 мая 2022  15:29:52 +0300 (0:00:03.451)       0:01:20.429 *******
ok: [ubuntu] => (item={'name': 'local-redhat.site', 'ip': '192.168.20.173'})
ok: [redhat] => (item={'name': 'local-redhat.site', 'ip': '192.168.20.173'})
ok: [ubuntu] => (item={'name': 'local-ubuntu.site', 'ip': '192.168.20.165'})
ok: [redhat] => (item={'name': 'local-ubuntu.site', 'ip': '192.168.20.165'})

TASK [webserver : print out] *******************************************************************************************************************************
Понедельник 16 мая 2022  15:29:56 +0300 (0:00:03.541)       0:01:23.970 *******
ok: [redhat] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<body bgcolor=\"gray\">\n<h2><font color=\"gold\"><div><center>07.Ansible cruise</center></div></font></h2>\n<b><font color=\"orange\"><div><center>Create by Igor Golubovich for DevOps course</center></div></font></b>\n<b><font color=\"red\"><div><center>server hostname: ip-192-168-20-173</center></div></font></b>\n<b><font color=\"red\"><div><center>server OS family is: RedHat</center></div></font></b>\n</body>\n</html>\n",
                "content_length": "416",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 16 May 2022 12:29:54 GMT",
                "elapsed": 0,
                "etag": "\"628243b9-1a0\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "dest": null,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "remote_src": false,
                        "removes": null,
                        "return_content": true,
                        "selevel": null,
                        "serole": null,
                        "setype": null,
                        "seuser": null,
                        "src": null,
                        "status_code": [
                            200
                        ],
                        "timeout": 30,
                        "unix_socket": null,
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://local-redhat.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.20.173",
                    "name": "local-redhat.site"
                },
                "last_modified": "Mon, 16 May 2022 12:29:45 GMT",
                "msg": "OK (416 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://local-redhat.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<body bgcolor=\"gray\">\n<h2><font color=\"gold\"><div><center>07.Ansible cruise</center></div></font></h2>\n<b><font color=\"orange\"><div><center>Create by Igor Golubovich for DevOps course</center></div></font></b>\n<b><font color=\"red\"><div><center>server hostname: ip-192-168-20-165</center></div></font></b>\n<b><font color=\"red\"><div><center>server OS family is: Debian</center></div></font></b>\n</body>\n</html>\n",
                "content_length": "416",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 16 May 2022 12:29:56 GMT",
                "elapsed": 0,
                "etag": "\"628243b9-1a0\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "dest": null,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "remote_src": false,
                        "removes": null,
                        "return_content": true,
                        "selevel": null,
                        "serole": null,
                        "setype": null,
                        "seuser": null,
                        "src": null,
                        "status_code": [
                            200
                        ],
                        "timeout": 30,
                        "unix_socket": null,
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://local-ubuntu.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.20.165",
                    "name": "local-ubuntu.site"
                },
                "last_modified": "Mon, 16 May 2022 12:29:45 GMT",
                "msg": "OK (416 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu.site"
            }
        ],
        "skipped": false
    }
}
ok: [ubuntu] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<body bgcolor=\"gray\">\n<h2><font color=\"gold\"><div><center>07.Ansible cruise</center></div></font></h2>\n<b><font color=\"orange\"><div><center>Create by Igor Golubovich for DevOps course</center></div></font></b>\n<b><font color=\"red\"><div><center>server hostname: ip-192-168-20-173</center></div></font></b>\n<b><font color=\"red\"><div><center>server OS family is: RedHat</center></div></font></b>\n</body>\n</html>\n",
                "content_length": "416",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 16 May 2022 12:29:54 GMT",
                "elapsed": 0,
                "etag": "\"628243b9-1a0\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "dest": null,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "remote_src": false,
                        "removes": null,
                        "return_content": true,
                        "selevel": null,
                        "serole": null,
                        "setype": null,
                        "seuser": null,
                        "src": null,
                        "status_code": [
                            200
                        ],
                        "timeout": 30,
                        "unix_socket": null,
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://local-redhat.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.20.173",
                    "name": "local-redhat.site"
                },
                "last_modified": "Mon, 16 May 2022 12:29:45 GMT",
                "msg": "OK (416 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://local-redhat.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<body bgcolor=\"gray\">\n<h2><font color=\"gold\"><div><center>07.Ansible cruise</center></div></font></h2>\n<b><font color=\"orange\"><div><center>Create by Igor Golubovich for DevOps course</center></div></font></b>\n<b><font color=\"red\"><div><center>server hostname: ip-192-168-20-165</center></div></font></b>\n<b><font color=\"red\"><div><center>server OS family is: Debian</center></div></font></b>\n</body>\n</html>\n",
                "content_length": "416",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 16 May 2022 12:29:55 GMT",
                "elapsed": 0,
                "etag": "\"628243b9-1a0\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "dest": null,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "remote_src": false,
                        "removes": null,
                        "return_content": true,
                        "selevel": null,
                        "serole": null,
                        "setype": null,
                        "seuser": null,
                        "src": null,
                        "status_code": [
                            200
                        ],
                        "timeout": 30,
                        "unix_socket": null,
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://local-ubuntu.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.20.165",
                    "name": "local-ubuntu.site"
                },
                "last_modified": "Mon, 16 May 2022 12:29:45 GMT",
                "msg": "OK (416 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu.site"
            }
        ],
        "skipped": false
    }
}

RUNNING HANDLER [webserver : restart nginx] ****************************************************************************************************************
Понедельник 16 мая 2022  15:29:56 +0300 (0:00:00.139)       0:01:24.110 *******
changed: [redhat]
changed: [ubuntu]

NO MORE HOSTS LEFT *****************************************************************************************************************************************

PLAY RECAP *************************************************************************************************************************************************
redhat                     : ok=15   changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
ubuntu                     : ok=15   changed=5    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Понедельник 16 мая 2022  15:29:58 +0300 (0:00:01.848)       0:01:25.958 *******
===============================================================================
webserver : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------- 38.12s
webserver : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------- 19.29s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------- 4.61s
webserver : Check content to the sites -------------------------------------------------------------------------------------------------------------- 3.54s
webserver : Templates ------------------------------------------------------------------------------------------------------------------------------- 3.45s
webserver : Nginx. Copy config file ----------------------------------------------------------------------------------------------------------------- 3.43s
webserver : Nginx. Copy first page ------------------------------------------------------------------------------------------------------------------ 3.14s
webserver : Nginx. Enable and start service --------------------------------------------------------------------------------------------------------- 2.24s
webserver : Nginx. Enable and start service --------------------------------------------------------------------------------------------------------- 2.05s
webserver : Nginx. Remove welcome file -------------------------------------------------------------------------------------------------------------- 1.89s
webserver : restart nginx --------------------------------------------------------------------------------------------------------------------------- 1.85s
webserver : Check connection to Localhost ----------------------------------------------------------------------------------------------------------- 1.69s
webserver : print out ------------------------------------------------------------------------------------------------------------------------------- 0.14s
webserver : Test ------------------------------------------------------------------------------------------------------------------------------------ 0.11s
webserver : Include deploy for RedHat systems ------------------------------------------------------------------------------------------------------- 0.11s
webserver : Include deploy for Debian systems ------------------------------------------------------------------------------------------------------- 0.10s
webserver : print out ------------------------------------------------------------------------------------------------------------------------------- 0.10s
webserver : Nginx. Set up --------------------------------------------------------------------------------------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 1 minutes, 25 seconds
```

## Playbook test_task.yml

```bash
igoz@Ubuntu20:~/Desktop/ansible_main$ ansible-playbook -i inv.yaml test_task.yml -b

PLAY [all_workers] *****************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************
Понедельник 16 мая 2022  16:24:17 +0300 (0:00:00.009)       0:00:00.009 *******
ok: [redhat]
ok: [ubuntu]

TASK [testing : Check SUDO with NOPASSWD] ******************************************************************************************************************
Понедельник 16 мая 2022  16:24:21 +0300 (0:00:04.006)       0:00:04.016 *******
ok: [ubuntu]
ok: [redhat]

TASK [testing : Check connections to public repositories] **************************************************************************************************
Понедельник 16 мая 2022  16:24:23 +0300 (0:00:01.640)       0:00:05.656 *******
ok: [ubuntu] => (item=http://archive.ubuntu.com/ubuntu)
ok: [redhat] => (item=http://archive.ubuntu.com/ubuntu)
ok: [ubuntu] => (item=https://deb.debian.org/debian)
ok: [redhat] => (item=https://deb.debian.org/debian)
ok: [redhat] => (item=https://cloud.centos.org)
ok: [ubuntu] => (item=https://cloud.centos.org)
ok: [redhat] => (item=https://pypi.org/simple)
ok: [ubuntu] => (item=https://pypi.org/simple)

TASK [testing : Check connection to docker hub registry] ***************************************************************************************************
Понедельник 16 мая 2022  16:24:30 +0300 (0:00:07.275)       0:00:12.931 *******
ok: [ubuntu]
ok: [redhat]

TASK [testing : Check HDD] *********************************************************************************************************************************
Понедельник 16 мая 2022  16:24:32 +0300 (0:00:02.172)       0:00:15.104 *******
ok: [redhat] => (item={'mount': '/', 'device': '/dev/nvme0n1p2', 'fstype': 'xfs', 'options': 'rw,seclabel,relatime,attr2,inode64,logbufs=8,logbsize=32k,noquota', 'size_total': 10724814848, 'size_available': 9045745664, 'block_size': 4096, 'block_total': 2618363, 'block_available': 2208434, 'block_used': 409929, 'inode_total': 5241840, 'inode_available': 5197618, 'inode_used': 44222, 'uuid': 'd35fe619-1d06-4ace-9fe3-169baad3e421'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 2208434,
        "block_size": 4096,
        "block_total": 2618363,
        "block_used": 409929,
        "device": "/dev/nvme0n1p2",
        "fstype": "xfs",
        "inode_available": 5197618,
        "inode_total": 5241840,
        "inode_used": 44222,
        "mount": "/",
        "options": "rw,seclabel,relatime,attr2,inode64,logbufs=8,logbsize=32k,noquota",
        "size_available": 9045745664,
        "size_total": 10724814848,
        "uuid": "d35fe619-1d06-4ace-9fe3-169baad3e421"
    },
    "msg": "Available 84.34 % of disk space."
}
ok: [ubuntu] => (item={'mount': '/', 'device': '/dev/root', 'fstype': 'ext4', 'options': 'rw,relatime,discard', 'size_total': 8259014656, 'size_available': 6513446912, 'block_size': 4096, 'block_total': 2016361, 'block_available': 1590197, 'block_used': 426164, 'inode_total': 1024000, 'inode_available': 953501, 'inode_used': 70499, 'uuid': 'd524a2b2-6c92-4e05-a703-a792582d46fb'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 1590197,
        "block_size": 4096,
        "block_total": 2016361,
        "block_used": 426164,
        "device": "/dev/root",
        "fstype": "ext4",
        "inode_available": 953501,
        "inode_total": 1024000,
        "inode_used": 70499,
        "mount": "/",
        "options": "rw,relatime,discard",
        "size_available": 6513446912,
        "size_total": 8259014656,
        "uuid": "d524a2b2-6c92-4e05-a703-a792582d46fb"
    },
    "msg": "Available 78.86 % of disk space."
}
skipping: [ubuntu] => (item={'mount': '/snap/amazon-ssm-agent/5163', 'device': '/dev/loop0', 'fstype': 'squashfs', 'options': 'ro,nodev,relatime', 'size_total': 28049408, 'size_available': 0, 'block_size': 131072, 'block_total': 214, 'block_available': 0, 'block_used': 214, 'inode_total': 16, 'inode_available': 0, 'inode_used': 16, 'uuid': 'N/A'})
skipping: [ubuntu] => (item={'mount': '/snap/core18/2344', 'device': '/dev/loop1', 'fstype': 'squashfs', 'options': 'ro,nodev,relatime', 'size_total': 58327040, 'size_available': 0, 'block_size': 131072, 'block_total': 445, 'block_available': 0, 'block_used': 445, 'inode_total': 10849, 'inode_available': 0, 'inode_used': 10849, 'uuid': 'N/A'})
skipping: [ubuntu] => (item={'mount': '/snap/core20/1434', 'device': '/dev/loop2', 'fstype': 'squashfs', 'options': 'ro,nodev,relatime', 'size_total': 65011712, 'size_available': 0, 'block_size': 131072, 'block_total': 496, 'block_available': 0, 'block_used': 496, 'inode_total': 11789, 'inode_available': 0, 'inode_used': 11789, 'uuid': 'N/A'})
skipping: [ubuntu] => (item={'mount': '/snap/lxd/22753', 'device': '/dev/loop3', 'fstype': 'squashfs', 'options': 'ro,nodev,relatime', 'size_total': 71172096, 'size_available': 0, 'block_size': 131072, 'block_total': 543, 'block_available': 0, 'block_used': 543, 'inode_total': 802, 'inode_available': 0, 'inode_used': 802, 'uuid': 'N/A'})
skipping: [ubuntu] => (item={'mount': '/snap/snapd/15534', 'device': '/dev/loop4', 'fstype': 'squashfs', 'options': 'ro,nodev,relatime', 'size_total': 46923776, 'size_available': 0, 'block_size': 131072, 'block_total': 358, 'block_available': 0, 'block_used': 358, 'inode_total': 484, 'inode_available': 0, 'inode_used': 484, 'uuid': 'N/A'})

TASK [testing : Check RAM] *********************************************************************************************************************************
Понедельник 16 мая 2022  16:24:33 +0300 (0:00:00.204)       0:00:15.308 *******
ok: [redhat] => {
    "changed": false,
    "msg": "OK. Available 32% of RAM."
}
fatal: [ubuntu]: FAILED! => {
    "assertion": "ram_used | int >= 30",
    "changed": false,
    "evaluated_to": false,
    "msg": "Fail. Available 18.98%."
}
...ignoring

PLAY RECAP *************************************************************************************************************************************************
redhat                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1   

Понедельник 16 мая 2022  16:24:33 +0300 (0:00:00.297)       0:00:15.606 *******
===============================================================================
testing : Check connections to public repositories -------------------------------------------------------------------------------------------------- 7.28s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------- 4.01s
testing : Check connection to docker hub registry --------------------------------------------------------------------------------------------------- 2.17s
testing : Check SUDO with NOPASSWD ------------------------------------------------------------------------------------------------------------------ 1.64s
testing : Check RAM --------------------------------------------------------------------------------------------------------------------------------- 0.30s
testing : Check HDD --------------------------------------------------------------------------------------------------------------------------------- 0.20s
Playbook run took 0 days, 0 hours, 0 minutes, 15 seconds
```
