## Output
```
[root@onlyoffice ans_cruise]# ansible-playbook web.yaml -i hosts.yaml -u root

PLAY [ec] *****************************************************************************************

TASK [Gathering Facts] ****************************************************************************
Sunday 18 April 2021  11:52:57 -0400 (0:00:00.045)       0:00:00.045 **********
ok: [worker_01]
ok: [worker_02]

TASK [testing : Check if we have SUDO with NOPASSWD] **********************************************
Sunday 18 April 2021  11:52:59 -0400 (0:00:01.913)       0:00:01.959 **********
ok: [worker_01]
ok: [worker_02]

TASK [testing : Check if we have connection to public repositories] *******************************
Sunday 18 April 2021  11:53:00 -0400 (0:00:00.807)       0:00:02.767 **********
ok: [worker_02]
ok: [worker_01]

TASK [testing : print out] ************************************************************************
Sunday 18 April 2021  11:53:03 -0400 (0:00:02.738)       0:00:05.506 **********
ok: [worker_01] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [worker_02] => {
    "msg": "('http://archive.ubuntu.com/', 200, 'OK (696 bytes)')"
}

TASK [testing : Check if we have connection to docker hub] ****************************************
Sunday 18 April 2021  11:53:03 -0400 (0:00:00.184)       0:00:05.690 **********
ok: [worker_01]
ok: [worker_02]

TASK [testing : print out] ************************************************************************
Sunday 18 April 2021  11:53:04 -0400 (0:00:01.377)       0:00:07.067 **********
ok: [worker_01] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [worker_02] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}

TASK [testing : Check if RAM is less 1024 MB] *****************************************************
Sunday 18 April 2021  11:53:04 -0400 (0:00:00.174)       0:00:07.241 **********
ok: [worker_01] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [worker_02] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

TASK [testing : Check if HDD is less 15 GB] *******************************************************
Sunday 18 April 2021  11:53:05 -0400 (0:00:00.187)       0:00:07.428 **********
ok: [worker_01] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [worker_02] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

TASK [webserver : Nginx. Install packages to Ubuntu] **********************************************
Sunday 18 April 2021  11:53:05 -0400 (0:00:00.206)       0:00:07.634 **********
skipping: [worker_01]
ok: [worker_02]

TASK [webserver : Nginx. Enable and start service on Ubuntu] **************************************
Sunday 18 April 2021  11:53:07 -0400 (0:00:02.649)       0:00:10.284 **********
skipping: [worker_01]
ok: [worker_02]

TASK [webserver : Nginx. Install packages to Centos] **********************************************
Sunday 18 April 2021  11:53:09 -0400 (0:00:01.377)       0:00:11.661 **********
skipping: [worker_02]
ok: [worker_01]

TASK [webserver : Nginx. Enable and start service on Centos] **************************************
Sunday 18 April 2021  11:53:10 -0400 (0:00:01.194)       0:00:12.855 **********
skipping: [worker_02]
ok: [worker_01]

TASK [webserver : Copy nginx config] **************************************************************
Sunday 18 April 2021  11:53:11 -0400 (0:00:00.770)       0:00:13.625 **********
skipping: [worker_02]
ok: [worker_01]

TASK [webserver : HTTPS. Enable firewall port on Centos] ******************************************
Sunday 18 April 2021  11:53:12 -0400 (0:00:01.377)       0:00:15.003 **********
skipping: [worker_02]
ok: [worker_01]

TASK [webserver : reload service firewalld on Centos] *********************************************
Sunday 18 April 2021  11:53:13 -0400 (0:00:01.160)       0:00:16.163 **********
skipping: [worker_02]
changed: [worker_01]

TASK [webserver : Copy first page] ****************************************************************
Sunday 18 April 2021  11:53:15 -0400 (0:00:01.370)       0:00:17.534 **********
ok: [worker_01]
ok: [worker_02]

TASK [webserver : Check connection to Localhost] **************************************************
Sunday 18 April 2021  11:53:16 -0400 (0:00:01.491)       0:00:19.025 **********
ok: [worker_01]
ok: [worker_02]

TASK [webserver : print out] **********************************************************************
Sunday 18 April 2021  11:53:17 -0400 (0:00:00.793)       0:00:19.818 **********
ok: [worker_01] => {
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
ok: [worker_02] => {
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

TASK [webserver : Templates] **********************************************************************
Sunday 18 April 2021  11:53:17 -0400 (0:00:00.177)       0:00:19.996 **********
ok: [worker_01]
ok: [worker_02]

TASK [webserver : Check template] *****************************************************************
Sunday 18 April 2021  11:53:18 -0400 (0:00:01.146)       0:00:21.142 **********
ok: [worker_01]
ok: [worker_02]

TASK [webserver : print out] **********************************************************************
Sunday 18 April 2021  11:53:19 -0400 (0:00:00.650)       0:00:21.792 **********
ok: [worker_01] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.13   local-centos.site",
        "192.168.202.14   local-ubuntu.site"
    ]
}
ok: [worker_02] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.13   local-centos.site",
        "192.168.202.14   local-ubuntu.site"
    ]
}

TASK [webserver : Check content to the sites] *****************************************************
Sunday 18 April 2021  11:53:19 -0400 (0:00:00.236)       0:00:22.029 **********
ok: [worker_01] => (item={'name': 'local-centos.site', 'ip': '192.168.202.13'})
ok: [worker_02] => (item={'name': 'local-centos.site', 'ip': '192.168.202.13'})
ok: [worker_01] => (item={'name': 'local-ubuntu.site', 'ip': '192.168.202.14'})
ok: [worker_02] => (item={'name': 'local-ubuntu.site', 'ip': '192.168.202.14'})

TASK [webserver : print out] **********************************************************************
Sunday 18 April 2021  11:53:21 -0400 (0:00:01.552)       0:00:23.582 **********
ok: [worker_01] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hoooray!!!! This service is up and running!!!!</h1>",
                "content_length": "55",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 18 Apr 2021 15:53:20 GMT",
                "elapsed": 0,
                "etag": "\"60772600-37\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "backup": null,
                        "body": null,
                        "body_format": "raw",
                        "client_cert": null,
                        "client_key": null,
                        "content": null,
                        "creates": null,
                        "delimiter": null,
                        "dest": null,
                        "directory_mode": null,
                        "follow": false,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "regexp": null,
                        "remote_src": null,
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
                        "unsafe_writes": null,
                        "url": "http://local-centos.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.13",
                    "name": "local-centos.site"
                },
                "last_modified": "Wed, 14 Apr 2021 17:27:28 GMT",
                "msg": "OK (55 bytes)",
                "redirected": false,
                "server": "nginx/1.16.1",
                "status": 200,
                "url": "http://local-centos.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hoooray!!!! This service is up and running!!!!</h1>",
                "content_length": "55",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 18 Apr 2021 15:53:20 GMT",
                "elapsed": 0,
                "etag": "\"6077251a-37\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "backup": null,
                        "body": null,
                        "body_format": "raw",
                        "client_cert": null,
                        "client_key": null,
                        "content": null,
                        "creates": null,
                        "delimiter": null,
                        "dest": null,
                        "directory_mode": null,
                        "follow": false,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "regexp": null,
                        "remote_src": null,
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
                        "unsafe_writes": null,
                        "url": "http://local-ubuntu.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.14",
                    "name": "local-ubuntu.site"
                },
                "last_modified": "Wed, 14 Apr 2021 17:23:38 GMT",
                "msg": "OK (55 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu.site"
            }
        ]
    }
}
ok: [worker_02] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hoooray!!!! This service is up and running!!!!</h1>",
                "content_length": "55",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 18 Apr 2021 15:53:20 GMT",
                "elapsed": 0,
                "etag": "\"60772600-37\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "backup": null,
                        "body": null,
                        "body_format": "raw",
                        "client_cert": null,
                        "client_key": null,
                        "content": null,
                        "creates": null,
                        "delimiter": null,
                        "dest": null,
                        "directory_mode": null,
                        "follow": false,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "regexp": null,
                        "remote_src": null,
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
                        "unsafe_writes": null,
                        "url": "http://local-centos.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.13",
                    "name": "local-centos.site"
                },
                "last_modified": "Wed, 14 Apr 2021 17:27:28 GMT",
                "msg": "OK (55 bytes)",
                "redirected": false,
                "server": "nginx/1.16.1",
                "status": 200,
                "url": "http://local-centos.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hoooray!!!! This service is up and running!!!!</h1>",
                "content_length": "55",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 18 Apr 2021 15:53:21 GMT",
                "elapsed": 0,
                "etag": "\"6077251a-37\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "backup": null,
                        "body": null,
                        "body_format": "raw",
                        "client_cert": null,
                        "client_key": null,
                        "content": null,
                        "creates": null,
                        "delimiter": null,
                        "dest": null,
                        "directory_mode": null,
                        "follow": false,
                        "follow_redirects": "safe",
                        "force": false,
                        "force_basic_auth": false,
                        "group": null,
                        "headers": {},
                        "http_agent": "ansible-httpget",
                        "method": "GET",
                        "mode": null,
                        "owner": null,
                        "regexp": null,
                        "remote_src": null,
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
                        "unsafe_writes": null,
                        "url": "http://local-ubuntu.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.14",
                    "name": "local-ubuntu.site"
                },
                "last_modified": "Wed, 14 Apr 2021 17:23:38 GMT",
                "msg": "OK (55 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-ubuntu.site"
            }
        ]
    }
}

PLAY RECAP ****************************************************************************************
worker_01                  : ok=21   changed=1    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
worker_02                  : ok=18   changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

Sunday 18 April 2021  11:53:21 -0400 (0:00:00.143)       0:00:23.725 **********
===============================================================================
testing : Check if we have connection to public repositories ------------------------------- 2.74s
webserver : Nginx. Install packages to Ubuntu ---------------------------------------------- 2.65s
Gathering Facts ---------------------------------------------------------------------------- 1.91s
webserver : Check content to the sites ----------------------------------------------------- 1.55s
webserver : Copy first page ---------------------------------------------------------------- 1.49s
webserver : Nginx. Enable and start service on Ubuntu -------------------------------------- 1.38s
webserver : Copy nginx config -------------------------------------------------------------- 1.38s
testing : Check if we have connection to docker hub ---------------------------------------- 1.38s
webserver : reload service firewalld on Centos --------------------------------------------- 1.37s
webserver : Nginx. Install packages to Centos ---------------------------------------------- 1.19s
webserver : HTTPS. Enable firewall port on Centos ------------------------------------------ 1.16s
webserver : Templates ---------------------------------------------------------------------- 1.15s
testing : Check if we have SUDO with NOPASSWD ---------------------------------------------- 0.81s
webserver : Check connection to Localhost -------------------------------------------------- 0.79s
webserver : Nginx. Enable and start service on Centos -------------------------------------- 0.77s
webserver : Check template ----------------------------------------------------------------- 0.65s
webserver : print out ---------------------------------------------------------------------- 0.24s
testing : Check if HDD is less 15 GB ------------------------------------------------------- 0.21s
testing : Check if RAM is less 1024 MB ----------------------------------------------------- 0.19s
testing : print out ------------------------------------------------------------------------ 0.18s
Playbook run took 0 days, 0 hours, 0 minutes, 23 seconds


```
