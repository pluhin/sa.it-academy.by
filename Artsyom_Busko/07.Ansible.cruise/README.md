# 07.Ansible.cruise


## Playbook webserver.yaml
```bash
ansible-playbook -i inventory.yaml webserver.yaml
```
### Result
```
PLAY [all_workers] *************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************
Monday 22 August 2022  22:42:05 +0000 (0:00:00.008)       0:00:00.008 *********
ok: [host1]
ok: [host2]

TASK [webserver : Include deploy for Debian systems] ***************************************************************************************************************************
Monday 22 August 2022  22:42:07 +0000 (0:00:01.977)       0:00:01.985 *********
skipping: [host1]
included: /root/07.Ansible/roles/webserver/tasks/http_deb.yaml for host2

TASK [webserver : NGINX. Install packages] *************************************************************************************************************************************
Monday 22 August 2022  22:42:07 +0000 (0:00:00.063)       0:00:02.048 *********
ok: [host2]

TASK [webserver : NGINX. Enable and start service] *****************************************************************************************************************************
Monday 22 August 2022  22:42:09 +0000 (0:00:02.140)       0:00:04.189 *********
ok: [host2]

TASK [webserver : Include deploy for RedHat systems] ***************************************************************************************************************************
Monday 22 August 2022  22:42:10 +0000 (0:00:00.790)       0:00:04.980 *********
skipping: [host2]
included: /root/07.Ansible/roles/webserver/tasks/http_rh.yaml for host1

TASK [webserver : NGINX. Install packages] *************************************************************************************************************************************
Monday 22 August 2022  22:42:10 +0000 (0:00:00.043)       0:00:05.023 *********
ok: [host1]

TASK [webserver : NGINX. Enable and start service] *****************************************************************************************************************************
Monday 22 August 2022  22:42:11 +0000 (0:00:01.249)       0:00:06.273 *********
ok: [host1]

TASK [webserver : NGINX. Enable firewall port] *********************************************************************************************************************************
Monday 22 August 2022  22:42:12 +0000 (0:00:00.716)       0:00:06.989 *********
ok: [host1] => (item=80/tcp)
ok: [host1] => (item=8080/tcp)

TASK [webserver : Template index.html] *****************************************************************************************************************************************
Monday 22 August 2022  22:42:14 +0000 (0:00:01.659)       0:00:08.649 *********
changed: [host2] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
changed: [host1] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
changed: [host2] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})
changed: [host1] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})

TASK [webserver : Template nginx.conf] *****************************************************************************************************************************************
Monday 22 August 2022  22:42:16 +0000 (0:00:02.183)       0:00:10.833 *********
changed: [host2] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
changed: [host1] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
changed: [host2] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})
changed: [host1] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})

TASK [webserver : Check content to the sites] **********************************************************************************************************************************
Monday 22 August 2022  22:42:18 +0000 (0:00:02.076)       0:00:12.909 *********
ok: [host2] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
ok: [host1] => (item={'name': 'local-cent.site', 'ip': '192.168.202.1'})
ok: [host2] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})
ok: [host1] => (item={'name': 'local-deb.site', 'ip': '192.168.202.2'})

TASK [webserver : print out] ***************************************************************************************************************************************************
Monday 22 August 2022  22:42:19 +0000 (0:00:01.320)       0:00:14.229 *********
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
                "content": "<h1>Hello from local-deb.site</h1>\n",
                "content_length": "35",
                "content_type": "text/html; charset=UTF-8",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 22 Aug 2022 22:42:18 GMT",
                "elapsed": 0,
                "etag": "\"23-5e6dc28d3a14f\"",
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
                    "ip": "192.168.202.1",
                    "name": "local-cent.site"
                },
                "last_modified": "Mon, 22 Aug 2022 22:42:15 GMT",
                "msg": "OK (35 bytes)",
                "redirected": false,
                "server": "Apache/2.4.37 (centos)",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hello from local-deb.site</h1>\n",
                "content_length": "35",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 22 Aug 2022 22:42:19 GMT",
                "elapsed": 0,
                "etag": "\"23-5e6dc28d15f29\"",
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
                    "ip": "192.168.202.2",
                    "name": "local-deb.site"
                },
                "last_modified": "Mon, 22 Aug 2022 22:42:15 GMT",
                "msg": "OK (35 bytes)",
                "redirected": false,
                "server": "Apache/2.4.41 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
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
                "content": "<h1>Hello from local-deb.site</h1>\n",
                "content_length": "35",
                "content_type": "text/html; charset=UTF-8",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 22 Aug 2022 22:42:18 GMT",
                "elapsed": 0,
                "etag": "\"23-5e6dc28d3a14f\"",
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
                    "ip": "192.168.202.1",
                    "name": "local-cent.site"
                },
                "last_modified": "Mon, 22 Aug 2022 22:42:15 GMT",
                "msg": "OK (35 bytes)",
                "redirected": false,
                "server": "Apache/2.4.37 (centos)",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Hello from local-deb.site</h1>\n",
                "content_length": "35",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 22 Aug 2022 22:42:19 GMT",
                "elapsed": 0,
                "etag": "\"23-5e6dc28d15f29\"",
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
                    "ip": "192.168.202.2",
                    "name": "local-deb.site"
                },
                "last_modified": "Mon, 22 Aug 2022 22:42:15 GMT",
                "msg": "OK (35 bytes)",
                "redirected": false,
                "server": "Apache/2.4.41 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP *********************************************************************************************************************************************************************
host1                      : ok=9    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host2                      : ok=8    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Monday 22 August 2022  22:42:19 +0000 (0:00:00.072)       0:00:14.301 *********
===============================================================================
webserver : Template index.html ----------------------------------------------------------------------------------------------------------------------------------------- 2.18s
webserver : NGINX. Install packages ------------------------------------------------------------------------------------------------------------------------------------- 2.14s
webserver : Template nginx.conf ----------------------------------------------------------------------------------------------------------------------------------------- 2.08s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------------------------- 1.98s
webserver : NGINX. Enable firewall port --------------------------------------------------------------------------------------------------------------------------------- 1.66s
webserver : Check content to the sites ---------------------------------------------------------------------------------------------------------------------------------- 1.32s
webserver : NGINX. Install packages ------------------------------------------------------------------------------------------------------------------------------------- 1.25s
webserver : NGINX. Enable and start service ----------------------------------------------------------------------------------------------------------------------------- 0.79s
webserver : NGINX. Enable and start service ----------------------------------------------------------------------------------------------------------------------------- 0.72s
webserver : print out --------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
webserver : Include deploy for Debian systems --------------------------------------------------------------------------------------------------------------------------- 0.06s
webserver : Include deploy for RedHat systems --------------------------------------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 14 seconds

```

## Playbook test.yaml
```bash
ansible-playbook -i inventory.yaml test.yaml
```
### result
```
PLAY [all_workers] *************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************
Monday 22 August 2022  22:40:28 +0000 (0:00:00.008)       0:00:00.008 *********
ok: [host1]
ok: [host2]

TASK [test : Check SUDO with NOPASSWD] *****************************************************************************************************************************************
Monday 22 August 2022  22:40:29 +0000 (0:00:01.914)       0:00:01.922 *********
fatal: [host1]: FAILED! => {"changed": false, "module_stderr": "Shared connection to 192.168.202.1 closed.\r\n", "module_stdout": "/bin/sh: sudo: command not found\r\n", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}
ok: [host2]

TASK [test : Check connections to public repositories] *************************************************************************************************************************
Monday 22 August 2022  22:40:30 +0000 (0:00:00.661)       0:00:02.584 *********
ok: [host2] => (item=https://deb.debian.org/debian)
ok: [host2] => (item=https://cloud.centos.org/centos)
ok: [host2] => (item=https://pypi.org/simple)

TASK [test : Check connection Docker hub] **************************************************************************************************************************************
Monday 22 August 2022  22:40:36 +0000 (0:00:05.716)       0:00:08.300 *********
ok: [host2]

TASK [test : Check RAM] ********************************************************************************************************************************************************
Monday 22 August 2022  22:40:37 +0000 (0:00:01.120)       0:00:09.421 *********
ok: [host2] => (item={'mount': '/', 'device': '/dev/loop1', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18746671104, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4576824, 'block_used': 539740, 'inode_total': 1310720, 'inode_available': 1281618, 'inode_used': 29102, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4576824,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 539740,
        "device": "/dev/loop1",
        "fstype": "ext4",
        "inode_available": 1281618,
        "inode_total": 1310720,
        "inode_used": 29102,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18746671104,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Check HDD] ********************************************************************************************************************************************************
Monday 22 August 2022  22:40:37 +0000 (0:00:00.049)       0:00:09.470 *********
ok: [host2] => (item={'mount': '/', 'device': '/dev/loop1', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 20957446144, 'size_available': 18746671104, 'block_size': 4096, 'block_total': 5116564, 'block_available': 4576824, 'block_used': 539740, 'inode_total': 1310720, 'inode_available': 1281618, 'inode_used': 29102, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4576824,
        "block_size": 4096,
        "block_total": 5116564,
        "block_used": 539740,
        "device": "/dev/loop1",
        "fstype": "ext4",
        "inode_available": 1281618,
        "inode_total": 1310720,
        "inode_used": 29102,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18746671104,
        "size_total": 20957446144,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************************************************************************************************************
host1                      : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
host2                      : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Monday 22 August 2022  22:40:37 +0000 (0:00:00.069)       0:00:09.539 *********
===============================================================================
test : Check connections to public repositories ------------------------------------------------------------------------------------------------------------------------- 5.72s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------------------------- 1.91s
test : Check connection Docker hub -------------------------------------------------------------------------------------------------------------------------------------- 1.12s
test : Check SUDO with NOPASSWD ----------------------------------------------------------------------------------------------------------------------------------------- 0.66s
test : Check HDD -------------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
test : Check RAM -------------------------------------------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds

```