## 07. Ansible cruise

### Output of ansible playbook (install Nginx server):
```bash
PLAY [all_workers] ****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
Thursday 08 September 2022  23:02:37 +0300 (0:00:00.011)       0:00:00.011 **** 
ok: [host29]
ok: [host30]

TASK [webserver : Include deploy for Debian systems] ******************************************************************************************************************************************************
Thursday 08 September 2022  23:02:43 +0300 (0:00:05.144)       0:00:05.155 **** 
skipping: [host29]
included: /home/yurych/Old.tmp/Sync/DevOps/It-academy/07.Ansible/roles/webserver/tasks/http_deb.yaml for host30

TASK [webserver : Nginx. Install packages] ****************************************************************************************************************************************************************
Thursday 08 September 2022  23:02:43 +0300 (0:00:00.075)       0:00:05.231 **** 
ok: [host30]

TASK [webserver : Copy first page] ************************************************************************************************************************************************************************
Thursday 08 September 2022  23:02:50 +0300 (0:00:07.543)       0:00:12.774 **** 
ok: [host30]

TASK [webserver : Nginx. Enable and start service] ********************************************************************************************************************************************************
Thursday 08 September 2022  23:02:54 +0300 (0:00:03.788)       0:00:16.562 **** 
ok: [host30]

TASK [webserver : Include deploy for RedHat systems] ******************************************************************************************************************************************************
Thursday 08 September 2022  23:02:57 +0300 (0:00:02.704)       0:00:19.267 **** 
skipping: [host30]
included: /home/yurych/Old.tmp/Sync/DevOps/It-academy/07.Ansible/roles/webserver/tasks/http_rh.yaml for host29

TASK [webserver : Nginx. Install packages] ****************************************************************************************************************************************************************
Thursday 08 September 2022  23:02:57 +0300 (0:00:00.062)       0:00:19.329 **** 
ok: [host29]

TASK [webserver : Copy first page] ************************************************************************************************************************************************************************
Thursday 08 September 2022  23:02:59 +0300 (0:00:02.311)       0:00:21.641 **** 
ok: [host29]

TASK [webserver : Nginx. Enable and start service] ********************************************************************************************************************************************************
Thursday 08 September 2022  23:03:01 +0300 (0:00:02.074)       0:00:23.716 **** 
ok: [host29]

TASK [webserver : Nginx. Enable firewall port] ************************************************************************************************************************************************************
Thursday 08 September 2022  23:03:03 +0300 (0:00:01.430)       0:00:25.146 **** 
ok: [host29] => (item=80/tcp)
ok: [host29] => (item=443/tcp)

TASK [webserver : Check connection to Localhost] **********************************************************************************************************************************************************
Thursday 08 September 2022  23:03:06 +0300 (0:00:02.977)       0:00:28.123 **** 
ok: [host29]
ok: [host30]

TASK [webserver : print out] ******************************************************************************************************************************************************************************
Thursday 08 September 2022  23:03:09 +0300 (0:00:03.474)       0:00:31.597 **** 
ok: [host29] => {
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
ok: [host30] => {
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

TASK [webserver : Templates] ******************************************************************************************************************************************************************************
Thursday 08 September 2022  23:03:09 +0300 (0:00:00.092)       0:00:31.690 **** 
ok: [host29]
ok: [host30]

TASK [webserver : Check content to the sites] *************************************************************************************************************************************************************
Thursday 08 September 2022  23:03:13 +0300 (0:00:03.756)       0:00:35.447 **** 
ok: [host29] => (item={'name': 'local-cent.site', 'ip': '192.168.202.29'})
ok: [host30] => (item={'name': 'local-cent.site', 'ip': '192.168.202.29'})
ok: [host29] => (item={'name': 'local-deb.site', 'ip': '192.168.202.30'})
ok: [host30] => (item={'name': 'local-deb.site', 'ip': '192.168.202.30'})

TASK [webserver : print out] ******************************************************************************************************************************************************************************
Thursday 08 September 2022  23:03:18 +0300 (0:00:05.581)       0:00:41.028 **** 
ok: [host29] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hi from hostname=host29</h1>",
                "content_length": "32",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 08 Sep 2022 20:03:14 GMT",
                "elapsed": 0,
                "etag": "\"631a47aa-20\"",
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
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.29",
                    "name": "local-cent.site"
                },
                "last_modified": "Thu, 08 Sep 2022 19:51:06 GMT",
                "msg": "OK (32 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hi from hostname=host30</h1>",
                "content_length": "32",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 08 Sep 2022 20:03:15 GMT",
                "elapsed": 0,
                "etag": "\"631a47a1-20\"",
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
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.30",
                    "name": "local-deb.site"
                },
                "last_modified": "Thu, 08 Sep 2022 19:50:57 GMT",
                "msg": "OK (32 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ],
        "skipped": false
    }
}
ok: [host30] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hi from hostname=host29</h1>",
                "content_length": "32",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 08 Sep 2022 20:03:15 GMT",
                "elapsed": 0,
                "etag": "\"631a47aa-20\"",
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
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.29",
                    "name": "local-cent.site"
                },
                "last_modified": "Thu, 08 Sep 2022 19:51:06 GMT",
                "msg": "OK (32 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hi from hostname=host30</h1>",
                "content_length": "32",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 08 Sep 2022 20:03:18 GMT",
                "elapsed": 0,
                "etag": "\"631a47a1-20\"",
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
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.30",
                    "name": "local-deb.site"
                },
                "last_modified": "Thu, 08 Sep 2022 19:50:57 GMT",
                "msg": "OK (32 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP ************************************************************************************************************************************************************************************************
host29                     : ok=11   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host30                     : ok=10   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Thursday 08 September 2022  23:03:19 +0300 (0:00:00.114)       0:00:41.142 **** 
=============================================================================== 
webserver : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 7.54s
webserver : Check content to the sites ------------------------------------------------------------------------------------------------------------------------------------------------------------- 5.58s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 5.14s
webserver : Copy first page ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 3.79s
webserver : Templates ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 3.76s
webserver : Check connection to Localhost ---------------------------------------------------------------------------------------------------------------------------------------------------------- 3.47s
webserver : Nginx. Enable firewall port ------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.98s
webserver : Nginx. Enable and start service -------------------------------------------------------------------------------------------------------------------------------------------------------- 2.70s
webserver : Nginx. Install packages ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.31s
webserver : Copy first page ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.07s
webserver : Nginx. Enable and start service -------------------------------------------------------------------------------------------------------------------------------------------------------- 1.43s
webserver : print out ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.11s
webserver : print out ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.09s
webserver : Include deploy for Debian systems ------------------------------------------------------------------------------------------------------------------------------------------------------ 0.08s
webserver : Include deploy for RedHat systems ------------------------------------------------------------------------------------------------------------------------------------------------------ 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 41 seconds
```

### Output of ansible playbook (testing role):
```bash
ansible-playbook -i inventory.yaml test1.yaml -u root

PLAY [all_workers] ****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
Thursday 08 September 2022  23:05:45 +0300 (0:00:00.010)       0:00:00.010 **** 
ok: [host29]
ok: [host30]

TASK [Check SUDO with NOPASSWD] ***************************************************************************************************************************************************************************
Thursday 08 September 2022  23:05:55 +0300 (0:00:09.735)       0:00:09.746 **** 
changed: [host30]
changed: [host29]

TASK [Check if we have enough RAM] ************************************************************************************************************************************************************************
Thursday 08 September 2022  23:05:56 +0300 (0:00:01.301)       0:00:11.047 **** 
ok: [host29] => {
    "msg": "Check if RAM > 1024"
}
ok: [host30] => {
    "msg": "Check if RAM > 1024"
}

TASK [Check if we have enough HDD] ************************************************************************************************************************************************************************
Thursday 08 September 2022  23:05:56 +0300 (0:00:00.066)       0:00:11.113 **** 
ok: [host29] => {
    "msg": "Check if HDD space > 5120"
}
ok: [host30] => {
    "msg": "Check if HDD space > 5120"
}

PLAY RECAP ************************************************************************************************************************************************************************************************
host29                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host30                     : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 08 September 2022  23:05:56 +0300 (0:00:00.066)       0:00:11.180 **** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 9.74s
Check SUDO with NOPASSWD --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.30s
Check if we have enough HDD ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.07s
Check if we have enough RAM ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds

ansible-playbook test2.yaml
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
[WARNING]: Found variable using reserved name: connection

PLAY [localhost] ******************************************************************************************************************************************************************************************

TASK [testing : Check connections to public repositories] *************************************************************************************************************************************************
Thursday 08 September 2022  23:06:27 +0300 (0:00:00.015)       0:00:00.015 **** 
ok: [localhost] => (item={'url': 'https://packages.debian.org/'})
ok: [localhost] => (item={'url': 'https://centos.pkgs.org/'})
ok: [localhost] => (item={'url': 'https://pypi.org/project/pip/'})

TASK [testing : Check connection to docker hub registry] **************************************************************************************************************************************************
Thursday 08 September 2022  23:06:36 +0300 (0:00:09.503)       0:00:09.519 **** 
ok: [localhost] => (item=https://hub.docker.com/_/registry)

TASK [testing : Print output] *****************************************************************************************************************************************************************************
Thursday 08 September 2022  23:06:37 +0300 (0:00:01.082)       0:00:10.601 **** 
ok: [localhost] => (item=200) => {
    "msg": "Status: 200"
}

PLAY RECAP ************************************************************************************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 08 September 2022  23:06:37 +0300 (0:00:00.034)       0:00:10.636 **** 
=============================================================================== 
testing : Check connections to public repositories ------------------------------------------------------------------------------------------------------------------------------------------------- 9.50s
testing : Check connection to docker hub registry -------------------------------------------------------------------------------------------------------------------------------------------------- 1.08s
testing : Print output ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
```