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
Monday 05 February 2024  19:13:10 +0000 (0:00:00.023)       0:00:00.023 ******* 
ok: [work_01]

TASK [nginx : Update Debian.] ***********************************************************************************************************************************
Monday 05 February 2024  19:13:12 +0000 (0:00:02.029)       0:00:02.053 ******* 
ok: [work_01]

TASK [nginx : NGINX. Install on Debian.] ************************************************************************************************************************
Monday 05 February 2024  19:13:13 +0000 (0:00:00.997)       0:00:03.051 ******* 
ok: [work_01]

TASK [nginx : NGINX. Enable and start service on Debian.] *******************************************************************************************************
Monday 05 February 2024  19:13:15 +0000 (0:00:02.541)       0:00:05.593 ******* 
ok: [work_01]

TASK [nginx : NGINX. Remove default site.] **********************************************************************************************************************
Monday 05 February 2024  19:13:16 +0000 (0:00:00.790)       0:00:06.383 ******* 
ok: [work_01]

TASK [nginx : install updates] **********************************************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.457)       0:00:06.841 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Install packages on RedHat.] ***************************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.030)       0:00:06.871 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Enable and start service RedHat.] **********************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.031)       0:00:06.902 ******* 
skipping: [work_01]

TASK [nginx : HTTPS. Enable firewall port on RedHat.] ***********************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.037)       0:00:06.940 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Reload service firewalld on RedHat.] *******************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.029)       0:00:06.970 ******* 
skipping: [work_01]

TASK [nginx : NGINX. Make dir for sites.] ***********************************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.031)       0:00:07.001 ******* 
ok: [work_01] => (item=/var/www/example.com/html)
ok: [work_01] => (item=/var/www/test.com/html)

TASK [nginx : Templates index .] ********************************************************************************************************************************
Monday 05 February 2024  19:13:17 +0000 (0:00:00.644)       0:00:07.646 ******* 
ok: [work_01] => (item=example.com)
ok: [work_01] => (item=test.com)

TASK [nginx : Templates conf .] *********************************************************************************************************************************
Monday 05 February 2024  19:13:19 +0000 (0:00:01.261)       0:00:08.908 ******* 
changed: [work_01] => (item=example.com)
changed: [work_01] => (item=test.com)

TASK [nginx : Enabling Ubuntu sites] ****************************************************************************************************************************
Monday 05 February 2024  19:13:20 +0000 (0:00:01.374)       0:00:10.282 ******* 
changed: [work_01] => (item=example.com)
changed: [work_01] => (item=test.com)
[WARNING]: Cannot set fs attributes on a non-existent symlink target. follow should be set to False to avoid this.

TASK [nginx : Templates.] ***************************************************************************************************************************************
Monday 05 February 2024  19:13:21 +0000 (0:00:00.626)       0:00:10.909 ******* 
ok: [work_01]

TASK [nginx : Check template.] **********************************************************************************************************************************
Monday 05 February 2024  19:13:21 +0000 (0:00:00.609)       0:00:11.518 ******* 
ok: [work_01]

TASK [nginx : Print out1] ***************************************************************************************************************************************
Monday 05 February 2024  19:13:22 +0000 (0:00:00.452)       0:00:11.970 ******* 
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
Monday 05 February 2024  19:13:22 +0000 (0:00:00.030)       0:00:12.000 ******* 
ok: [work_01] => (item={'name': 'example.com', 'ip': '192.168.100.112'})
ok: [work_01] => (item={'name': 'test.com', 'ip': '192.168.100.112'})

TASK [nginx : Print out.] ***************************************************************************************************************************************
Monday 05 February 2024  19:13:23 +0000 (0:00:01.071)       0:00:13.072 ******* 
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
                "content": "### Ansible managed\n\n<html>\n    <head>\n        <title>Welcome to example.com</title>\n    </head>\n    <body>\n        <h1>Success!  The example.com server block is working!</h1>\n    </body>\n</html>",
                "content_length": "195",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 05 Feb 2024 19:13:21 GMT",
                "elapsed": 0,
                "etag": "\"65c12a7e-c3\"",
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
                "last_modified": "Mon, 05 Feb 2024 18:35:42 GMT",
                "msg": "OK (195 bytes)",
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
                "content": "### Ansible managed\n\n<html>\n    <head>\n        <title>Welcome to test.com</title>\n    </head>\n    <body>\n        <h1>Success!  The test.com server block is working!</h1>\n    </body>\n</html>",
                "content_length": "189",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 05 Feb 2024 19:13:21 GMT",
                "elapsed": 0,
                "etag": "\"65c12a7f-bd\"",
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
                "last_modified": "Mon, 05 Feb 2024 18:35:43 GMT",
                "msg": "OK (189 bytes)",
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
work_01                    : ok=14   changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0   

Monday 05 February 2024  19:13:23 +0000 (0:00:00.063)       0:00:13.136 ******* 
=============================================================================== 
nginx : NGINX. Install on Debian. ------------------------------------------------------------------------------------------------------------------------ 2.54s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------ 2.03s
nginx : Templates conf . --------------------------------------------------------------------------------------------------------------------------------- 1.37s
nginx : Templates index . -------------------------------------------------------------------------------------------------------------------------------- 1.26s
nginx : Check content to the sites. ---------------------------------------------------------------------------------------------------------------------- 1.07s
nginx : Update Debian. ----------------------------------------------------------------------------------------------------------------------------------- 1.00s
nginx : NGINX. Enable and start service on Debian. ------------------------------------------------------------------------------------------------------- 0.79s
nginx : NGINX. Make dir for sites. ----------------------------------------------------------------------------------------------------------------------- 0.64s
nginx : Enabling Ubuntu sites ---------------------------------------------------------------------------------------------------------------------------- 0.63s
nginx : Templates. --------------------------------------------------------------------------------------------------------------------------------------- 0.61s
nginx : NGINX. Remove default site. ---------------------------------------------------------------------------------------------------------------------- 0.46s
nginx : Check template. ---------------------------------------------------------------------------------------------------------------------------------- 0.45s
nginx : Print out. --------------------------------------------------------------------------------------------------------------------------------------- 0.06s
nginx : NGINX. Enable and start service RedHat. ---------------------------------------------------------------------------------------------------------- 0.04s
nginx : NGINX. Install packages on RedHat. --------------------------------------------------------------------------------------------------------------- 0.03s
nginx : NGINX. Reload service firewalld on RedHat. ------------------------------------------------------------------------------------------------------- 0.03s
nginx : HTTPS. Enable firewall port on RedHat. ----------------------------------------------------------------------------------------------------------- 0.03s
nginx : install updates ---------------------------------------------------------------------------------------------------------------------------------- 0.03s
nginx : Print out1 --------------------------------------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 13 seconds
```