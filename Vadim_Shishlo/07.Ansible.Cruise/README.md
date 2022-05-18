# 07.Ansible.Cruise



## Playbook with roles to install Nginx server , setup two virtual hosts ans test it





### playbooknginx.yaml
```
vadim@vadim-VirtualBox:~/ansible2$ ansible-playbook -i inv.yaml playbooknginx.yaml

PLAY [all_workers] *******************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:13 +0300 (0:00:00.029)       0:00:00.029 *******
ok: [host55]
ok: [host56]

TASK [Show ansible host] *************************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:16 +0300 (0:00:03.029)       0:00:03.058 *******
ok: [host55] => {
    "msg": "OS Version = CentOS  7.7 Core"
}
ok: [host56] => {
    "msg": "OS Version = Ubuntu  18.04 bionic"
}

TASK [nginx : Install Eple-Release on CentOS] ****************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:16 +0300 (0:00:00.185)       0:00:03.243 *******
skipping: [host56]
ok: [host55]

TASK [nginx : Install NGINX on CentOS] ***********************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:25 +0300 (0:00:09.240)       0:00:12.484 *******
skipping: [host56]
ok: [host55]

TASK [nginx : Install NGINX on Ubuntu] ***********************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:32 +0300 (0:00:06.598)       0:00:19.082 *******
skipping: [host55]
ok: [host56]

TASK [nginx : Createing directory] ***************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:36 +0300 (0:00:04.046)       0:00:23.128 *******
skipping: [host55] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
skipping: [host55] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
skipping: [host56] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
skipping: [host56] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})

TASK [nginx : Copying configuration template] ****************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:38 +0300 (0:00:02.347)       0:00:25.476 *******
skipping: [host55] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
skipping: [host55] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
skipping: [host56] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
skipping: [host56] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})

TASK [nginx : Copying first page.] ***************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:43 +0300 (0:00:04.357)       0:00:29.833 *******
skipping: [host55] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
skipping: [host55] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
skipping: [host56] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
skipping: [host56] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})

TASK [nginx : Copying hosts template] ************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:46 +0300 (0:00:03.001)       0:00:32.834 *******
ok: [host55]
ok: [host56]

TASK [nginx : Check content to the sites] ********************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:48 +0300 (0:00:01.760)       0:00:34.595 *******
skipping: [host55] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
skipping: [host55] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu1.test', 'ip': '192.168.202.56'})
ok: [host55] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})
ok: [host56] => (item={'name': 'local-ubuntu2.test', 'ip': '192.168.202.56'})
skipping: [host56] => (item={'name': 'local-centos1.test', 'ip': '192.168.202.55'})
skipping: [host56] => (item={'name': 'local-centos2.test', 'ip': '192.168.202.55'})

TASK [nginx : print out] *************************************************************************************************************************************************************************
Tuesday 17 May 2022  11:24:50 +0300 (0:00:02.589)       0:00:37.184 *******
ok: [host55] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "ansible_loop_var": "item",
                "changed": false,
                "item": {
                    "ip": "192.168.202.56",
                    "name": "local-ubuntu1.test"
                },
                "skip_reason": "Conditional result was False",
                "skipped": true
            },
            {
                "ansible_loop_var": "item",
                "changed": false,
                "item": {
                    "ip": "192.168.202.56",
                    "name": "local-ubuntu2.test"
                },
                "skip_reason": "Conditional result was False",
                "skipped": true
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<head>\n<title>My Test Page for CentOS !</title>\n</head>\n<body>\n<h1>My Test Page for CentOS !</h1>\n<p>My Test Page for CentOS ! ip adress is </p>\n</body>\n</html>",
                "content_length": "167",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Tue, 17 May 2022 11:24:49 GMT",
                "elapsed": 0,
                "etag": "\"61fee59b-a7\"",
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
                        "url": "http://local-centos1.test",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.55",
                    "name": "local-centos1.test"
                },
                "last_modified": "Tue, 17 May 2022 11:01:15 GMT",
                "msg": "OK (167 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-centos1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<head>\n<title>My Test Page for CentOS !</title>\n</head>\n<body>\n<h1>My Test Page for CentOS !</h1>\n<p>My Test Page for CentOS ! ip adress is </p>\n</body>\n</html>",
                "content_length": "167",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Tue, 17 May 2022 11:24:50 GMT",
                "elapsed": 0,
                "etag": "\"61fee59d-a7\"",
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
                        "url": "http://local-centos2.test",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.55",
                    "name": "local-centos2.test"
                },
                "last_modified": "Tue, 17 May 2022 11:01:17 GMT",
                "msg": "OK (167 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-centos2.test"
            }
        ],
        "skipped": false
    }
}
ok: [host56] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<head>\n<title>My Test Page for Ubuntu !</title>\n</head>\n<body>\n<h1>My Test Page for Ubuntu !</h1>\n<p>My Test Page for Ubuntu ! ip adress is </p>\n</body>\n</html>",
                "content_length": "167",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Tue, 17 May 2022 11:24:49 GMT",
                "elapsed": 0,
                "etag": "\"61fee59b-a7\"",
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
                        "url": "http://local-ubuntu1.test",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.56",
                    "name": "local-ubuntu1.test"
                },
                "last_modified": "Tue, 17 May 2022 11:01:15 GMT",
                "msg": "OK (167 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n<head>\n<title>My Test Page for Ubuntu !</title>\n</head>\n<body>\n<h1>My Test Page for Ubuntu !</h1>\n<p>My Test Page for Ubuntu ! ip adress is </p>\n</body>\n</html>",
                "content_length": "167",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Tue, 17 May 2022 11:24:50 GMT",
                "elapsed": 0,
                "etag": "\"61fee59d-a7\"",
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
                        "url": "http://local-ubuntu2.test",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.56",
                    "name": "local-ubuntu2.test"
                },
                "last_modified": "Tue, 17 May 2022 11:01:17 GMT",
                "msg": "OK (167 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu2.test"
            },
            {
                "ansible_loop_var": "item",
                "changed": false,
                "item": {
                    "ip": "192.168.202.55",
                    "name": "local-centos1.test"
                },
                "skip_reason": "Conditional result was False",
                "skipped": true
            },
            {
                "ansible_loop_var": "item",
                "changed": false,
                "item": {
                    "ip": "192.168.202.55",
                    "name": "local-centos2.test"
                },
                "skip_reason": "Conditional result was False",
                "skipped": true
            }
        ],
        "skipped": false
    }
}

PLAY RECAP ***************************************************************************************************************************************************************************************
host56                     : ok=9    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
host55                      : ok=10   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Tuesday 17 May 2022  11:24:51 +0300 (0:00:00.315)       0:00:37.499 *******
===============================================================================
nginx : Install Eple-Release on CentOS ---------------------------------------------------------------------------------------------------------------------------------------------------- 9.24s
nginx : Install NGINX on CentOS ----------------------------------------------------------------------------------------------------------------------------------------------------------- 6.60s
nginx : Copying configuration template ---------------------------------------------------------------------------------------------------------------------------------------------------- 4.36s
nginx : Install NGINX on Ubuntu ----------------------------------------------------------------------------------------------------------------------------------------------------------- 4.05s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.03s
nginx : Copying first page. --------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.00s
nginx : Check content to the sites -------------------------------------------------------------------------------------------------------------------------------------------------------- 2.59s
nginx : Createing directory --------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.35s
nginx : Copying hosts template ------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.76s
nginx : print out ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.32s
Show ansible host ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.19s
Playbook run took 0 days, 0 hours, 0 minutes, 37 seconds

```




## Implement testing role 

### playbook.yaml
```
vadim@vadim-VirtualBox:~/ansible2$ ansible-playbook -i inv.yaml playbook.yaml

PLAY [all_workers] *******************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************
Tuesday 17 May 2022  11:54:41 +0300 (0:00:00.026)       0:00:00.026 *******
ok: [host55]
ok: [host56]

TASK [Show ansible host] *************************************************************************************************************************************************************************
Tuesday 17 May 2022  11:54:44 +0300 (0:00:03.026)       0:00:03.052 *******
ok: [host55] => {
    "msg": "OS Version = CentOS  7.7 Core"
}
ok: [host56] => {
    "msg": "OS Version = Ubuntu  18.04 bionic"
}

TASK [test : Check we have SUDO with NOPASSWD] ***************************************************************************************************************************************************
Tuesday 17 May 2022  11:54:44 +0300 (0:00:00.222)       0:00:03.275 *******
ok: [host55]
ok: [host56]

TASK [test : Check connections to public repositories (Debian/CentOS and pip package repository)] ************************************************************************************************
Tuesday 17 May 2022  11:54:45 +0300 (0:00:01.063)       0:00:04.339 *******
ok: [host55] => (item=http://archive.ubuntu.com)
ok: [host56] => (item=http://archive.ubuntu.com)
ok: [host55] => (item=http://mirror.centos.org)
ok: [host56] => (item=http://mirror.centos.org)
ok: [host55] => (item=https://pypi.org)
ok: [host56] => (item=https://pypi.org)

TASK [test : Check if we have connection to docker hub registry] *********************************************************************************************************************************
Tuesday 17 May 2022  11:54:49 +0300 (0:00:03.535)       0:00:07.874 *******
ok: [host55]
ok: [host56]

TASK [test : print out docker response] **********************************************************************************************************************************************************
Tuesday 17 May 2022  11:54:50 +0300 (0:00:01.606)       0:00:09.481 *******
ok: [host55] => {
    "msg": "https://hub.docker.com - STATUS Code: 200"
}
ok: [host56] => {
    "msg": "https://hub.docker.com - STATUS Code: 200"
}

TASK [test : Check free HDD space (More than 1024 MB)] *******************************************************************************************************************************************
Tuesday 17 May 2022  11:54:51 +0300 (0:00:00.149)       0:00:09.631 *******
ok: [host55] => {
    "changed": false,
    "msg": "SUCCESS. You HDD memory = 18160.3359375 Mb. it is more than 1024 MB"
}
ok: [host56] => {
    "changed": false,
    "msg": "SUCCESS. You HDD memory = 16548.796875 Mb. it is more than 1024 MB"
}

TASK [test : Check free RAM space (More than 256 MB)] ********************************************************************************************************************************************
Tuesday 17 May 2022  11:54:51 +0300 (0:00:00.218)       0:00:09.849 *******
ok: [host55] => {
    "changed": false,
    "msg": "SUCCESS. You RAM memory = 3480 Mb. it is more than 256 MB"
}
ok: [host56] => {
    "changed": false,
    "msg": "SUCCESS. You RAM memory = 1770 Mb. it is more than 256 MB"
}

PLAY RECAP ***************************************************************************************************************************************************************************************
host56                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host55                      : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 17 May 2022  11:54:51 +0300 (0:00:00.282)       0:00:10.132 *******
===============================================================================
test : Check connections to public repositories (Debian/CentOS and pip package repository) ------------------------------------------------------------------------------------------------ 3.54s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.03s
test : Check if we have connection to docker hub registry --------------------------------------------------------------------------------------------------------------------------------- 1.61s
test : Check we have SUDO with NOPASSWD --------------------------------------------------------------------------------------------------------------------------------------------------- 1.06s
test : Check free RAM space (More than 256 MB) -------------------------------------------------------------------------------------------------------------------------------------------- 0.28s
Show ansible host ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.22s
test : Check free HDD space (More than 1024 MB) ------------------------------------------------------------------------------------------------------------------------------------------- 0.22s
test : print out docker response ---------------------------------------------------------------------------------------------------------------------------------------------------------- 0.15s

```