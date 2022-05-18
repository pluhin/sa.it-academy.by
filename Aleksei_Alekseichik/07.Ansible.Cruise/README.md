## Ansible Playbook with role(s) to install Nginx
___
``` bash
vagrant@Debian11:~/ansible08$ ansible-playbook -i inventory.yaml web.yaml

PLAY [nginx_test] **************************************************************

TASK [Gathering Facts] *********************************************************
Wednesday 18 May 2022  19:53:25 +0000 (0:00:00.023)       0:00:00.024 *********
ok: [host1]
ok: [host2]

TASK [webserver : Include deploy for Debian systems] ***************************
Wednesday 18 May 2022  19:53:28 +0000 (0:00:02.621)       0:00:02.645 *********
skipping: [host1]
included: /home/vagrant/ansible08/roles/webserver/tasks/nginx_deb.yaml for host2

TASK [webserver : Nginx install] ***********************************************
Wednesday 18 May 2022  19:53:28 +0000 (0:00:00.073)       0:00:02.718 *********
ok: [host2]

TASK [webserver : Enable and start service] ************************************
Wednesday 18 May 2022  19:53:34 +0000 (0:00:05.720)       0:00:08.439 *********
ok: [host2]

TASK [webserver : Include deploy for RedHat systems] ***************************
Wednesday 18 May 2022  19:53:35 +0000 (0:00:00.949)       0:00:09.389 *********
skipping: [host2]
included: /home/vagrant/ansible08/roles/webserver/tasks/nginx_rh.yaml for host1

TASK [webserver : Epel install] ************************************************
Wednesday 18 May 2022  19:53:35 +0000 (0:00:00.066)       0:00:09.455 *********
ok: [host1]

TASK [webserver : Nginx install packages] **************************************
Wednesday 18 May 2022  19:53:48 +0000 (0:00:13.069)       0:00:22.525 *********
ok: [host1]

TASK [webserver : Nginx enable and start service] ******************************
Wednesday 18 May 2022  19:53:59 +0000 (0:00:10.901)       0:00:33.426 *********
ok: [host1]

TASK [webserver : Enable firewall port] ****************************************
Wednesday 18 May 2022  19:53:59 +0000 (0:00:00.753)       0:00:34.180 *********
ok: [host1]

TASK [webserver : Copy index.html] *********************************************
Wednesday 18 May 2022  19:54:00 +0000 (0:00:01.006)       0:00:35.186 *********
changed: [host1]
changed: [host2]

TASK [webserver : Remove default config] ***************************************
Wednesday 18 May 2022  19:54:02 +0000 (0:00:01.526)       0:00:36.712 *********
ok: [host1]
ok: [host2]

TASK [webserver : Copy my config] **********************************************
Wednesday 18 May 2022  19:54:03 +0000 (0:00:00.840)       0:00:37.553 *********
ok: [host1]
ok: [host2]

TASK [webserver : Check connection to Localhost] *******************************
Wednesday 18 May 2022  19:54:04 +0000 (0:00:01.185)       0:00:38.738 *********
ok: [host1]
ok: [host2]

TASK [webserver : print out] ***************************************************
Wednesday 18 May 2022  19:54:05 +0000 (0:00:00.792)       0:00:39.531 *********
ok: [host1] => {
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
ok: [host2] => {
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

TASK [webserver : Templates] ***************************************************
Wednesday 18 May 2022  19:54:05 +0000 (0:00:00.052)       0:00:39.584 *********
ok: [host1]
ok: [host2]

TASK [webserver : Check content to the sites] **********************************
Wednesday 18 May 2022  19:54:06 +0000 (0:00:01.322)       0:00:40.906 *********
ok: [host1] => (item={'name': 'rh-local1.site', 'ip': '192.168.202.1'})
ok: [host2] => (item={'name': 'rh-local1.site', 'ip': '192.168.202.1'})
ok: [host1] => (item={'name': 'ubuntu-local1.site', 'ip': '192.168.202.2'})
ok: [host2] => (item={'name': 'ubuntu-local1.site', 'ip': '192.168.202.2'})
ok: [host1] => (item={'name': 'rh-local2.site', 'ip': '192.168.202.1'})
ok: [host2] => (item={'name': 'rh-local2.site', 'ip': '192.168.202.1'})
ok: [host1] => (item={'name': 'ubuntu-local2.site', 'ip': '192.168.202.2'})
ok: [host2] => (item={'name': 'ubuntu-local2.site', 'ip': '192.168.202.2'})

TASK [webserver : print out] ***************************************************
Wednesday 18 May 2022  19:54:09 +0000 (0:00:03.272)       0:00:44.179 *********
ok: [host1] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:07 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://rh-local1.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.1",
                    "name": "rh-local1.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://rh-local1.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:08 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://ubuntu-local1.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.2",
                    "name": "ubuntu-local1.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu-local1.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:08 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://rh-local2.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.1",
                    "name": "rh-local2.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://rh-local2.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:09 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://ubuntu-local2.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.2",
                    "name": "ubuntu-local2.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu-local2.site"
            }
        ],
        "skipped": false
    }
}
ok: [host2] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:07 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://rh-local1.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.1",
                    "name": "rh-local1.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://rh-local1.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:08 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://ubuntu-local1.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.2",
                    "name": "ubuntu-local1.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu-local1.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:09 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://rh-local2.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.1",
                    "name": "rh-local2.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://rh-local2.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h3> Hi (by AA): </h3>\n",
                "content_length": "23",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 18 May 2022 19:54:09 GMT",
                "elapsed": 0,
                "etag": "\"62854ed9-17\"",
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
                        "url": "http://ubuntu-local2.site",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.2",
                    "name": "ubuntu-local2.site"
                },
                "last_modified": "Wed, 18 May 2022 19:54:01 GMT",
                "msg": "OK (23 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu-local2.site"
            }
        ],
        "skipped": false
    }
}

RUNNING HANDLER [webserver : Restart nginx] ************************************
Wednesday 18 May 2022  19:54:10 +0000 (0:00:00.093)       0:00:44.273 *********
changed: [host1]
changed: [host2]

PLAY RECAP *********************************************************************
host1                      : ok=15   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host2                      : ok=13   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Wednesday 18 May 2022  19:54:11 +0000 (0:00:00.945)       0:00:45.218 *********
===============================================================================
webserver : Epel install ----------------------------------------------- 13.07s
webserver : Nginx install packages ------------------------------------- 10.90s
webserver : Nginx install ----------------------------------------------- 5.72s
webserver : Check content to the sites ---------------------------------- 3.27s
Gathering Facts --------------------------------------------------------- 2.62s
webserver : Copy index.html --------------------------------------------- 1.53s
webserver : Templates --------------------------------------------------- 1.32s
webserver : Copy my config ---------------------------------------------- 1.19s
webserver : Enable firewall port ---------------------------------------- 1.01s
webserver : Enable and start service ------------------------------------ 0.95s
webserver : Restart nginx ----------------------------------------------- 0.94s
webserver : Remove default config --------------------------------------- 0.84s
webserver : Check connection to Localhost ------------------------------- 0.79s
webserver : Nginx enable and start service ------------------------------ 0.75s
webserver : print out --------------------------------------------------- 0.09s
webserver : Include deploy for Debian systems --------------------------- 0.07s
webserver : Include deploy for RedHat systems --------------------------- 0.07s
webserver : print out --------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 45 seconds

```
___
## Testing role

``` bash

vagrant@Debian11:~/ansible08$ ansible-playbook -i inventory.yaml test.yaml

PLAY [nginx_test] **************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************
Wednesday 18 May 2022  20:06:10 +0000 (0:00:00.009)       0:00:00.009 *********
ok: [host1]
ok: [host2]

TASK [test : Check if we have SUDO with NOPASSWD] ******************************************************************************
Wednesday 18 May 2022  20:06:11 +0000 (0:00:01.879)       0:00:01.888 *********
ok: [host1]
ok: [host2]

TASK [test : Check connection repo] ********************************************************************************************
Wednesday 18 May 2022  20:06:12 +0000 (0:00:00.782)       0:00:02.671 *********
ok: [host2] => (item=http://archive.ubuntu.com)
ok: [host1] => (item=http://archive.ubuntu.com)
ok: [host1] => (item=http://mirror.centos.org/centos/)
ok: [host2] => (item=http://mirror.centos.org/centos/)
ok: [host1] => (item=https://pypi.org/simple)
ok: [host2] => (item=https://pypi.org/simple)

TASK [test : Print out] ********************************************************************************************************
Wednesday 18 May 2022  20:06:20 +0000 (0:00:07.951)       0:00:10.623 *********
ok: [host1] => {
    "msg": "All items completed"
}
ok: [host2] => {
    "msg": "All items completed"
}

TASK [test : Check Docker] *****************************************************************************************************
Wednesday 18 May 2022  20:06:20 +0000 (0:00:00.053)       0:00:10.677 *********
ok: [host2]
ok: [host1]

TASK [test : Status connection] ************************************************************************************************
Wednesday 18 May 2022  20:06:22 +0000 (0:00:01.399)       0:00:12.077 *********
ok: [host1] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.48866b43b918c3692626.css\">\n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1459.0.0'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.9472738800348d01a133.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.da4f2f3afa70192d903f.js\"></script>\n</body>\n\n</html>\n"
}
ok: [host2] => {
    "msg": "<!doctype html>\n<html lang=\"en\">\n\n<head>\n  <title>Docker Hub</title>\n  <!-- Google Font -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\n  <link href=\"https://fonts.googleapis.com/css?family=Comfortaa|Open+Sans:300,400,400i,600,600i,700\" rel=\"stylesheet\">\n  <link href=\"https://fonts.googleapis.com/css?family=Poppins:400,500,600,700\" rel=\"stylesheet\">\n  <!-- Google Webmaster -->\n  <meta name=\"google-site-verification\" content=\"uXQNygijkvw9KqUBVhYTJW7Gl1yBUOwdAiuhFCUGsz4\" />\n  <meta name=\"fragment\" content=\"!\">\n  \n  <!-- TrustArc updated snippet, load first to ensure Zero Tracker Load policies -->\n  <script async=\"async\" src=\"https://consent.trustarc.com/notice?domain=docker.com&c=teconsent&js=nj&noticeType=bb&gtm=1\"></script>\n  \n  <script type=\"text/javascript\">window.ASSET_PATH = 'https://d36jcksde1wxzq.cloudfront.net/';</script>\n  \n  <script type=\"text/javascript\">var analyticsQueue = window.analyticsQueue || [];</script>\n  <!-- Optimizely -->\n  <script src=\"https://cdn-pci.optimizely.com/js/17888640141.js\"></script>\n  <!-- Mouseflow: heatmap and recording tool -->\n  <script type=\"text/javascript\" src=\"https://cdn.mouseflow.com/projects/31c8bb38-cfeb-4bd8-a60c-d5650a6d6f23.js\" async=\"\"></script>\n  \n  <!-- Google Tag Manager -->\n  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':\n  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],\n  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=\n  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);\n  })(window,document,'script','dataLayer','GTM-WL2QLG5');</script>\n  \n  <link rel=\"stylesheet\" href=\"https://d36jcksde1wxzq.cloudfront.net/main.48866b43b918c3692626.css\">\n</head>\n\n<body>\n  <div id=\"app\"></div>\n  <script>\n    window.dockerVars = {\n      bugsnagApiKey: 'aebb7f3442de072b3209127919cf37c0',\n      environment: 'production',\n      appVersion: '1459.0.0'\n    };\n    window.recaptchaOptions = {\n      useRecaptchaNet: true\n    };\n  </script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/bugsnag.9472738800348d01a133.js\"></script>\n  <script src=\"https://d36jcksde1wxzq.cloudfront.net/main.da4f2f3afa70192d903f.js\"></script>\n</body>\n\n</html>\n"
}

TASK [test : Check RAM] ********************************************************************************************************
Wednesday 18 May 2022  20:06:22 +0000 (0:00:00.053)       0:00:12.130 *********
fatal: [host1]: FAILED! => {
    "assertion": "ansible_memfree_mb <= 100",
    "changed": false,
    "evaluated_to": false,
    "msg": "You have not enough memory. Available 1320 mb."
}
fatal: [host2]: FAILED! => {
    "assertion": "ansible_memfree_mb <= 100",
    "changed": false,
    "evaluated_to": false,
    "msg": "You have not enough memory. Available 1535 mb."
}

PLAY RECAP *********************************************************************************************************************
host1                      : ok=6    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
host2                      : ok=6    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

Wednesday 18 May 2022  20:06:22 +0000 (0:00:00.043)       0:00:12.174 *********
===============================================================================
test : Check connection repo -------------------------------------------------------------------------------------------- 7.95s
Gathering Facts --------------------------------------------------------------------------------------------------------- 1.88s
test : Check Docker ----------------------------------------------------------------------------------------------------- 1.40s
test : Check if we have SUDO with NOPASSWD ------------------------------------------------------------------------------ 0.78s
test : Print out -------------------------------------------------------------------------------------------------------- 0.05s
test : Status connection ------------------------------------------------------------------------------------------------ 0.05s
test : Check RAM -------------------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 12 seconds

```