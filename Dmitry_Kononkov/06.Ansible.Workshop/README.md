## Homework Assignment 1

### Command:

```bash
ansible-playbook -i inv.yaml nginx.yaml 
``` 

### Output:

```
root@ubuntu-focal:~/06.Ansible.Workshop# ansible-playbook -i inv.yaml nginx.yaml 
[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names to new standard, use callbacks_enabled instead. This feature will be removed from 
ansible-core in version 2.15. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
[DEPRECATION WARNING]: "include" is deprecated, use include_tasks/import_tasks instead. This feature will be removed in version 2.16. Deprecation warnings can 
be disabled by setting deprecation_warnings=False in ansible.cfg.

PLAY [work_host] ************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************
Sunday 04 February 2024  19:34:27 +0000 (0:00:00.015)       0:00:00.015 ******* 
ok: [work_01]

TASK [Update Debian.] *******************************************************************************************************************************************
Sunday 04 February 2024  19:34:28 +0000 (0:00:01.472)       0:00:01.489 ******* 
ok: [work_01]

TASK [install updates] ******************************************************************************************************************************************
Sunday 04 February 2024  19:34:29 +0000 (0:00:00.992)       0:00:02.482 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Install on Debian.] ************************************************************************************************************************
Sunday 04 February 2024  19:34:29 +0000 (0:00:00.042)       0:00:02.524 ******* 
ok: [work_01]

TASK [nginx : NGINX. Enable and start service on Debian.] *******************************************************************************************************
Sunday 04 February 2024  19:34:32 +0000 (0:00:02.455)       0:00:04.980 ******* 
ok: [work_01]

TASK [nginx : NGINX. Install packages on RedHat.] ***************************************************************************************************************
Sunday 04 February 2024  19:34:33 +0000 (0:00:00.726)       0:00:05.706 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Enable and start service RedHat.] **********************************************************************************************************
Sunday 04 February 2024  19:34:33 +0000 (0:00:00.027)       0:00:05.733 ******* 
skipping: [work_01]

TASK [nginx : HTTPS. Enable firewall port on RedHat.] ***********************************************************************************************************
Sunday 04 February 2024  19:34:33 +0000 (0:00:00.032)       0:00:05.765 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Reload service firewalld on RedHat.] *******************************************************************************************************
Sunday 04 February 2024  19:34:33 +0000 (0:00:00.026)       0:00:05.792 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Make dir for sites.] ***********************************************************************************************************************
Sunday 04 February 2024  19:34:33 +0000 (0:00:00.028)       0:00:05.821 ******* 
ok: [work_01] => (item=/var/www)
ok: [work_01] => (item=/var/www/example.com)
ok: [work_01] => (item=/var/www/example.com/html)
ok: [work_01] => (item=/var/www/test.com)
ok: [work_01] => (item=/var/www/test.com/html)
ok: [work_01] => (item=/etc/nginx/sites-available)

TASK [nginx : Copy first page to Example.] **********************************************************************************************************************
Sunday 04 February 2024  19:34:35 +0000 (0:00:01.894)       0:00:07.716 ******* 
ok: [work_01] => (item={'src': 'index.htm', 'dest': '/var/www/example.com/html'})
ok: [work_01] => (item={'src': 'index.html', 'dest': '/var/www/test.com/html'})

TASK [nginx : NGINX. Create sites.com.] *************************************************************************************************************************
Sunday 04 February 2024  19:34:36 +0000 (0:00:01.653)       0:00:09.370 ******* 
ok: [work_01] => (item=example.com)
ok: [work_01] => (item=test.com)

TASK [nginx : NGINX. Remove default site.] **********************************************************************************************************************
Sunday 04 February 2024  19:34:38 +0000 (0:00:01.528)       0:00:10.898 ******* 
ok: [work_01]

TASK [nginx : Templates.] ***************************************************************************************************************************************
Sunday 04 February 2024  19:34:38 +0000 (0:00:00.319)       0:00:11.218 ******* 
ok: [work_01]

TASK [nginx : Check template.] **********************************************************************************************************************************
Sunday 04 February 2024  19:34:39 +0000 (0:00:00.580)       0:00:11.798 ******* 
ok: [work_01]

TASK [nginx : Print out1] ***************************************************************************************************************************************
Sunday 04 February 2024  19:34:39 +0000 (0:00:00.432)       0:00:12.230 ******* 
ok: [work_01] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.100.112     example.com",
        "192.168.100.112     test.com"
    ]
}

TASK [nginx : Check content to the sites.] **********************************************************************************************************************
Sunday 04 February 2024  19:34:39 +0000 (0:00:00.032)       0:00:12.263 ******* 
ok: [work_01] => (item={'name': 'example.com', 'ip': '192.168.100.112'})
ok: [work_01] => (item={'name': 'test.com', 'ip': '192.168.100.112'})

TASK [nginx : Print out.] ***************************************************************************************************************************************
Sunday 04 February 2024  19:34:40 +0000 (0:00:01.028)       0:00:13.291 ******* 
ok: [work_01] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n    <head>\n        <title>Welcome to Example.com!</title>\n    </head>\n    <body>\n        <h1>Success!  The example.com server block is working!</h1>\n    </body>\n</html>",
                "content_length": "175",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 04 Feb 2024 19:34:40 GMT",
                "elapsed": 0,
                "etag": "\"65bfe5ff-af\"",
                "failed": false,
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
                        "url": "http://example.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.100.112",
                    "name": "example.com"
                },
                "last_modified": "Sun, 04 Feb 2024 19:31:11 GMT",
                "msg": "OK (175 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://example.com"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<html>\n    <head>\n        <title>Welcome to Test.com!</title>\n    </head>\n    <body>\n        <h1>Success!  The test.com server block is working!</h1>\n    </body>\n</html>",
                "content_length": "169",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 04 Feb 2024 19:34:40 GMT",
                "elapsed": 0,
                "etag": "\"65bfe600-a9\"",
                "failed": false,
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
                        "url": "http://test.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.100.112",
                    "name": "test.com"
                },
                "last_modified": "Sun, 04 Feb 2024 19:31:12 GMT",
                "msg": "OK (169 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://test.com"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP ******************************************************************************************************************************************************
work_01                    : ok=13   changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0   

Sunday 04 February 2024  19:34:40 +0000 (0:00:00.054)       0:00:13.346 ******* 
=============================================================================== 
nginx : NGINX. Install on Debian. ------------------------------------------------------------------------------------------------------------------------ 2.46s
nginx : NGINX. Make dir for sites. ----------------------------------------------------------------------------------------------------------------------- 1.89s
nginx : Copy first page to Example. ---------------------------------------------------------------------------------------------------------------------- 1.65s
nginx : NGINX. Create sites.com. ------------------------------------------------------------------------------------------------------------------------- 1.53s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------ 1.47s
nginx : Check content to the sites. ---------------------------------------------------------------------------------------------------------------------- 1.03s
Update Debian. ------------------------------------------------------------------------------------------------------------------------------------------- 0.99s
nginx : NGINX. Enable and start service on Debian. ------------------------------------------------------------------------------------------------------- 0.73s
nginx : Templates. --------------------------------------------------------------------------------------------------------------------------------------- 0.58s
nginx : Check template. ---------------------------------------------------------------------------------------------------------------------------------- 0.43s
nginx : NGINX. Remove default site. ---------------------------------------------------------------------------------------------------------------------- 0.32s
nginx : Print out. --------------------------------------------------------------------------------------------------------------------------------------- 0.05s
install updates ------------------------------------------------------------------------------------------------------------------------------------------ 0.04s
nginx : Print out1 --------------------------------------------------------------------------------------------------------------------------------------- 0.03s
nginx : NGINX. Enable and start service RedHat. ---------------------------------------------------------------------------------------------------------- 0.03s
nginx : NGINX. Reload service firewalld on RedHat. ------------------------------------------------------------------------------------------------------- 0.03s
nginx : NGINX. Install packages on RedHat. --------------------------------------------------------------------------------------------------------------- 0.03s
nginx : HTTPS. Enable firewall port on RedHat. ----------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 13 seconds
```