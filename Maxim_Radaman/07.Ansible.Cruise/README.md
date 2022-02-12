# 07.Ansible.Cruise Maxim Radaman

## Ansible play with installation nginx

```bash
ansible-playbook -i inventory.yaml web.yaml

PLAY [web_hosts] *************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:20 +0000 (0:00:00.020)       0:00:00.020 *******
ok: [host13]
ok: [host14]

TASK [webservers : Include deploy for Debian systems] ************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:24 +0000 (0:00:03.477)       0:00:03.497 *******
skipping: [host13]
included: /ansilbe07/roles/webservers/tasks/nginx_deb.yaml for host14

TASK [webservers : Nginx. Install packages] **********************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:24 +0000 (0:00:00.128)       0:00:03.625 *******
ok: [host14]

TASK [webservers : Nginx. Enable and start service] **************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:27 +0000 (0:00:02.759)       0:00:06.385 *******
ok: [host14]

TASK [webservers : Nginx. Remove welcome file] *******************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:28 +0000 (0:00:01.146)       0:00:07.531 *******
ok: [host14]

TASK [webservers : Templates] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:29 +0000 (0:00:00.871)       0:00:08.403 *******
ok: [host14]

TASK [webservers : Copy first page] ******************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:30 +0000 (0:00:01.460)       0:00:09.864 *******
ok: [host14]

TASK [webservers : Include deploy for RedHat systems] ************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:32 +0000 (0:00:01.670)       0:00:11.535 *******
skipping: [host14]
included: /ansilbe07/roles/webservers/tasks/nginx_rh.yaml for host13

TASK [webservers : Nginx. Install packages] **********************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:32 +0000 (0:00:00.113)       0:00:11.648 *******
ok: [host13]

TASK [webservers : Nginx. Remove welcome file] *******************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:33 +0000 (0:00:01.243)       0:00:12.892 *******
ok: [host13]

TASK [webservers : Nginx. Enable and start service] **************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:34 +0000 (0:00:00.673)       0:00:13.565 *******
ok: [host13]

TASK [webservers : Nginx. Enable firewall port] ******************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:34 +0000 (0:00:00.812)       0:00:14.378 *******
ok: [host13]

TASK [webservers : Nginx. reload service firewalld] **************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:36 +0000 (0:00:01.060)       0:00:15.438 *******
changed: [host13]

TASK [webservers : Templates] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:37 +0000 (0:00:01.149)       0:00:16.588 *******
ok: [host13]

TASK [webservers : Copy first page] ******************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:38 +0000 (0:00:01.092)       0:00:17.680 *******
ok: [host13]

TASK [webservers : Check connection to Localhost] ****************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:40 +0000 (0:00:02.046)       0:00:19.726 *******
ok: [host13]
ok: [host14]

TASK [webservers : print out] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:41 +0000 (0:00:00.821)       0:00:20.548 *******
ok: [host13] => {
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
ok: [host14] => {
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

TASK [webservers : Templates] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:41 +0000 (0:00:00.129)       0:00:20.677 *******
ok: [host14]
ok: [host13]

TASK [webservers : Check template] *******************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:42 +0000 (0:00:01.504)       0:00:22.182 *******
ok: [host13]
ok: [host14]

TASK [webservers : print out] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:43 +0000 (0:00:00.863)       0:00:23.045 *******
ok: [host13] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.13   local-cent.site",
        "192.168.202.14   local-deb.site"
    ]
}
ok: [host14] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.13   local-cent.site",
        "192.168.202.14   local-deb.site"
    ]
}

TASK [webservers : Check content to the sites] *******************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:43 +0000 (0:00:00.126)       0:00:23.172 *******
ok: [host13] => (item={'name': 'local-cent.site', 'ip': '192.168.202.13'})
ok: [host14] => (item={'name': 'local-cent.site', 'ip': '192.168.202.13'})
ok: [host14] => (item={'name': 'local-deb.site', 'ip': '192.168.202.14'})
ok: [host13] => (item={'name': 'local-deb.site', 'ip': '192.168.202.14'})

TASK [webservers : print out] ************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:42:45 +0000 (0:00:02.130)       0:00:25.303 *******
ok: [host13] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 06 Feb 2022 15:42:44 GMT",
                "elapsed": 0,
                "etag": "\"61ffd6b9-16\"",
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
                        "unsafe_writes": false,
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.13",
                    "name": "local-cent.site"
                },
                "last_modified": "Sun, 06 Feb 2022 14:10:01 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 06 Feb 2022 15:42:45 GMT",
                "elapsed": 0,
                "etag": "\"61ffd6ad-16\"",
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
                        "unsafe_writes": false,
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.14",
                    "name": "local-deb.site"
                },
                "last_modified": "Sun, 06 Feb 2022 14:09:49 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ],
        "skipped": false
    }
}
ok: [host14] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 06 Feb 2022 15:42:44 GMT",
                "elapsed": 0,
                "etag": "\"61ffd6b9-16\"",
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
                        "unsafe_writes": false,
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.13",
                    "name": "local-cent.site"
                },
                "last_modified": "Sun, 06 Feb 2022 14:10:01 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 06 Feb 2022 15:42:45 GMT",
                "elapsed": 0,
                "etag": "\"61ffd6ad-16\"",
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
                        "unsafe_writes": false,
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.14",
                    "name": "local-deb.site"
                },
                "last_modified": "Sun, 06 Feb 2022 14:09:49 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP *******************************************************************************************************************************************************************************************************
host13                     : ok=16   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host14                     : ok=14   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Sunday 06 February 2022  15:42:46 +0000 (0:00:00.216)       0:00:25.519 *******
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.48s
webservers : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.76s
webservers : Check content to the sites ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.13s
webservers : Copy first page ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.05s
webservers : Copy first page ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.67s
webservers : Templates ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.50s
webservers : Templates ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.46s
webservers : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.24s
webservers : Nginx. reload service firewalld -------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.15s
webservers : Nginx. Enable and start service -------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.15s
webservers : Templates ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.09s
webservers : Nginx. Enable firewall port ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.06s
webservers : Nginx. Remove welcome file ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.87s
webservers : Check template ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.86s
webservers : Check connection to Localhost ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.82s
webservers : Nginx. Enable and start service -------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.81s
webservers : Nginx. Remove welcome file ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.67s
webservers : print out ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.22s
webservers : print out ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.13s
webservers : Include deploy for Debian systems ------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.13s
Playbook run took 0 days, 0 hours, 0 minutes, 25 seconds


```
## Implement testing role

```bash
ansible-playbook -i inventory.yaml task2.yaml

PLAY [web_hosts] *************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:17 +0000 (0:00:00.013)       0:00:00.013 *******
ok: [host13]
ok: [host14]

TASK [task2 : Check SUDO with NOPASSWD] **************************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:19 +0000 (0:00:02.474)       0:00:02.488 *******
ok: [host13]
ok: [host14]

TASK [task2 : Check access to repositories] **********************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:20 +0000 (0:00:00.888)       0:00:03.376 *******
ok: [host13] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host14] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host13] => (item=https://deb.debian.org/debian)
ok: [host14] => (item=https://deb.debian.org/debian)
ok: [host14] => (item=https://cloud.centos.org/centos)
ok: [host13] => (item=https://cloud.centos.org/centos)
ok: [host14] => (item=https://pypi.org/simple)
ok: [host13] => (item=https://pypi.org/simple)

TASK [task2 : Check access to the Docker Hub] ********************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:45 +0000 (0:00:24.484)       0:00:27.860 *******
ok: [host13]
ok: [host14]

TASK [task2 : Check Mount point] *********************************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:47 +0000 (0:00:02.073)       0:00:29.934 *******
ok: [host13] => (item={'block_used': 477925, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4649903, 'size_available': 19046002688, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop12', 'inode_used': 23562, 'block_size': 4096, 'inode_available': 1287158}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4649903,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 477925,
        "device": "/dev/loop12",
        "fstype": "ext4",
        "inode_available": 1287158,
        "inode_total": 1310720,
        "inode_used": 23562,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19046002688,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 90.68 % of disk space."
}
ok: [host14] => (item={'mount': '/', 'device': '/dev/loop13', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18805547008, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4591198, 'block_used': 536630, 'inode_total': 1310720, 'inode_available': 1283910, 'inode_used': 26810, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4591198,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 536630,
        "device": "/dev/loop13",
        "fstype": "ext4",
        "inode_available": 1283910,
        "inode_total": 1310720,
        "inode_used": 26810,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18805547008,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 89.53 % of disk space."
}

TASK [task2 : Check RAM] *****************************************************************************************************************************************************************************************
Sunday 06 February 2022  15:47:47 +0000 (0:00:00.198)       0:00:30.133 *******
ok: [host13] => {
    "changed": false,
    "msg": "OK. Available 89.23% of RAM."
}
ok: [host14] => {
    "changed": false,
    "msg": "OK. Available 86.35000000000001% of RAM."
}

PLAY RECAP *******************************************************************************************************************************************************************************************************
host13                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host14                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 06 February 2022  15:47:47 +0000 (0:00:00.201)       0:00:30.334 *******
===============================================================================
task2 : Check access to repositories --------------------------------------------------------------------------------------------------------------------------------------------------------------------- 24.48s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.47s
task2 : Check access to the Docker Hub -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.07s
task2 : Check SUDO with NOPASSWD -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.89s
task2 : Check RAM ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.20s
task2 : Check Mount point --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.20s
Playbook run took 0 days, 0 hours, 0 minutes, 30 seconds
```

