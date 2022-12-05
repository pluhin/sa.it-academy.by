### 06.AnsibleWS


## Playbook output

```bash

pavelogs@ubuntu20:~/06.AnsibleWS$ ansible-playbook -i inv.yaml playnginx.yaml -u root

PLAY [all_workers] ********************************************************************************************************************************

TASK [Gathering Facts] ****************************************************************************************************************************
Monday 05 December 2022  12:26:06 +0000 (0:00:00.014)       0:00:00.014 *******
ok: [host27]

TASK [Install Nginx] ******************************************************************************************************************************
Monday 05 December 2022  12:26:08 +0000 (0:00:02.486)       0:00:02.501 *******
ok: [host27]

TASK [Enable and start service nginx] *************************************************************************************************************
Monday 05 December 2022  12:26:10 +0000 (0:00:01.499)       0:00:04.001 *******
ok: [host27]

TASK [Copy nginx.conf.j2] *************************************************************************************************************************
Monday 05 December 2022  12:26:11 +0000 (0:00:01.309)       0:00:05.311 *******
ok: [host27] => (item=vh1.by)
ok: [host27] => (item=vh2.by)

TASK [restart nginx] ******************************************************************************************************************************
Monday 05 December 2022  12:26:14 +0000 (0:00:02.651)       0:00:07.962 *******
changed: [host27]

TASK [add vh's to hosts] **************************************************************************************************************************
Monday 05 December 2022  12:26:15 +0000 (0:00:00.936)       0:00:08.899 *******
changed: [host27] => (item=vh1.by)
changed: [host27] => (item=vh2.by)

TASK [copy index.html to dest host] ***************************************************************************************************************
Monday 05 December 2022  12:26:16 +0000 (0:00:01.574)       0:00:10.474 *******
ok: [host27] => (item=vh1.by)
ok: [host27] => (item=vh2.by)

TASK [restart nginx] ******************************************************************************************************************************
Monday 05 December 2022  12:26:19 +0000 (0:00:02.290)       0:00:12.765 *******
changed: [host27]

TASK [check index.html] ***************************************************************************************************************************
Monday 05 December 2022  12:26:20 +0000 (0:00:00.974)       0:00:13.740 *******
ok: [host27] => (item=vh1.by)
ok: [host27] => (item=vh2.by)

TASK [print info] *********************************************************************************************************************************
Monday 05 December 2022  12:26:21 +0000 (0:00:01.713)       0:00:15.454 *******
ok: [host27] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<h1>HELLO, this is host vh1.by <h1>\n</body>\n</html>\n",
                "content_length": "134",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 05 Dec 2022 12:26:22 GMT",
                "elapsed": 0,
                "etag": "\"638ddf7f-86\"",
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
                        "url": "http://vh1.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "vh1.by",
                "last_modified": "Mon, 05 Dec 2022 12:09:35 GMT",
                "msg": "OK (134 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://vh1.by"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n</head>\n<body>\n<h1>HELLO, this is host vh2.by <h1>\n</body>\n</html>\n",
                "content_length": "134",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 05 Dec 2022 12:26:22 GMT",
                "elapsed": 0,
                "etag": "\"638ddf81-86\"",
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
                        "url": "http://vh2.by",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "vh2.by",
                "last_modified": "Mon, 05 Dec 2022 12:09:37 GMT",
                "msg": "OK (134 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://vh2.by"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP ****************************************************************************************************************************************
host27                     : ok=10   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Monday 05 December 2022  12:26:22 +0000 (0:00:00.105)       0:00:15.559 *******
===============================================================================
Copy nginx.conf.j2 ------------------------------------------------------------------------------------------------------------------------- 2.65s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------- 2.49s
copy index.html to dest host --------------------------------------------------------------------------------------------------------------- 2.29s
check index.html --------------------------------------------------------------------------------------------------------------------------- 1.71s
add vh's to hosts -------------------------------------------------------------------------------------------------------------------------- 1.58s
Install Nginx ------------------------------------------------------------------------------------------------------------------------------ 1.50s
Enable and start service nginx ------------------------------------------------------------------------------------------------------------- 1.31s
restart nginx ------------------------------------------------------------------------------------------------------------------------------ 0.98s
restart nginx ------------------------------------------------------------------------------------------------------------------------------ 0.94s
print info --------------------------------------------------------------------------------------------------------------------------------- 0.11s
Playbook run took 0 days, 0 hours, 0 minutes, 15 seconds

```