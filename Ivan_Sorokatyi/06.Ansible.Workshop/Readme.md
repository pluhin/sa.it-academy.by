# 06.AnsibleWorkshop

## Result playbook

```bash
ansible-playbook  new_playbook.yaml

PLAY [all_workers] **************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:39 +0000 (0:00:00.010)       0:00:00.010 ***********
ok: [host41]
ok: [host42]

TASK [Update apt cache and install Nginx] ***************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:41 +0000 (0:00:02.346)       0:00:02.357 ***********
ok: [host41]
ok: [host42]

TASK [Start Nginx and boot] *****************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:44 +0000 (0:00:02.567)       0:00:04.924 ***********
ok: [host42]
ok: [host41]

TASK [Prepare. Install packages] ************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:45 +0000 (0:00:01.098)       0:00:06.023 ***********
ok: [host41]
ok: [host42]

TASK [Enable and start service nginx] *******************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:47 +0000 (0:00:02.037)       0:00:08.061 ***********
ok: [host41]
ok: [host42]

TASK [Copy nginx.conf.j2] *******************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:48 +0000 (0:00:00.878)       0:00:08.940 ***********
ok: [host42] => (item=site.by)
ok: [host41] => (item=site.by)
ok: [host42] => (item=site2.by)
ok: [host41] => (item=site2.by)

TASK [restart nginx] ************************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:50 +0000 (0:00:02.489)       0:00:11.429 ***********
changed: [host42]
changed: [host41]

TASK [host] *********************************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:51 +0000 (0:00:00.921)       0:00:12.350 ***********
changed: [host42] => (item=site.by)
changed: [host41] => (item=site.by)
changed: [host42] => (item=site2.by)
changed: [host41] => (item=site2.by)

TASK [Create folder for pages] **************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:53 +0000 (0:00:01.484)       0:00:13.835 ***********
ok: [host41] => (item=site.by)
ok: [host42] => (item=site.by)
ok: [host41] => (item=site2.by)
ok: [host42] => (item=site2.by)

TASK [Copy page] ****************************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:54 +0000 (0:00:01.399)       0:00:15.234 ***********
ok: [host41] => (item=site.by)
ok: [host42] => (item=site.by)
ok: [host41] => (item=site2.by)
ok: [host42] => (item=site2.by)

TASK [restart nginx] ************************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:56 +0000 (0:00:02.285)       0:00:17.519 ***********
changed: [host41]
changed: [host42]

TASK [Check site connection] ****************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:57 +0000 (0:00:00.939)       0:00:18.459 ***********
ok: [host41] => (item=site.by)
ok: [host42] => (item=site.by)
ok: [host41] => (item=site2.by)
ok: [host42] => (item=site2.by)

TASK [print info] ***************************************************************************************************************************************************************************************************************************
Среда 08 марта 2023  20:04:59 +0000 (0:00:01.595)       0:00:20.054 ***********
ok: [host41] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<head>\n<title>site.by</title>\n</head>\n<body>\n<h1> WELCOME TO site.by </h1>\n</body>\n</html>",
                "content_length": "113",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 08 Mar 2023 20:04:58 GMT",
                "elapsed": 0,
                "etag": "\"6408d326-71\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "url": "http://site.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "site.by",
                "last_modified": "Wed, 08 Mar 2023 18:25:42 GMT",
                "msg": "OK (113 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://site.by"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<head>\n<title>site2.by</title>\n</head>\n<body>\n<h1> WELCOME TO site2.by </h1>\n</body>\n</html>",
                "content_length": "115",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 08 Mar 2023 20:04:59 GMT",
                "elapsed": 0,
                "etag": "\"6408d327-73\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "url": "http://site2.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "site2.by",
                "last_modified": "Wed, 08 Mar 2023 18:25:43 GMT",
                "msg": "OK (115 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://site2.by"
            }
        ],
        "skipped": false
    }
}
ok: [host42] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<head>\n<title>site.by</title>\n</head>\n<body>\n<h1> WELCOME TO site.by </h1>\n</body>\n</html>",
                "content_length": "113",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 08 Mar 2023 20:04:58 GMT",
                "elapsed": 0,
                "etag": "\"6408d326-71\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "url": "http://site.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "site.by",
                "last_modified": "Wed, 08 Mar 2023 18:25:42 GMT",
                "msg": "OK (113 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://site.by"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<head>\n<title>site2.by</title>\n</head>\n<body>\n<h1> WELCOME TO site2.by </h1>\n</body>\n</html>",
                "content_length": "115",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Wed, 08 Mar 2023 20:04:59 GMT",
                "elapsed": 0,
                "etag": "\"6408d327-73\"",
                "failed": false,
                "failed_when_result": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "url": "http://site2.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "site2.by",
                "last_modified": "Wed, 08 Mar 2023 18:25:43 GMT",
                "msg": "OK (115 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://site2.by"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
host41                     : ok=13   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host42                     : ok=13   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Среда 08 марта 2023  20:04:59 +0000 (0:00:00.144)       0:00:20.198 ***********
===============================================================================
Update apt cache and install Nginx --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.57s
Copy nginx.conf.j2 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.49s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.35s
Copy page ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.29s
Prepare. Install packages ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.04s
Check site connection ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.59s
host --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.48s
Create folder for pages -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.40s
Start Nginx and boot ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.10s
restart nginx ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.94s
restart nginx ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.92s
Enable and start service nginx ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.88s
print info --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.14s

```