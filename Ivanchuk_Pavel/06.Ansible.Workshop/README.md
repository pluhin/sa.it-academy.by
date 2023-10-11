```bash
PLAY [mysql] *******************************************************************

TASK [Gathering Facts] *********************************************************
Среда 11 октября 2023  17:56:11 +0300 (0:00:00.012)       0:00:00.012 ********* 
ok: [mysql]

TASK [Update app list] *********************************************************
Среда 11 октября 2023  17:56:13 +0300 (0:00:02.477)       0:00:02.489 ********* 
ok: [mysql]

TASK [Check existence nginx] ***************************************************
Среда 11 октября 2023  17:56:15 +0300 (0:00:02.072)       0:00:04.562 ********* 
ok: [mysql]

TASK [Install nginx] ***********************************************************
Среда 11 октября 2023  17:56:16 +0300 (0:00:00.925)       0:00:05.488 ********* 
skipping: [mysql]

TASK [Create directory for vhost] **********************************************
Среда 11 октября 2023  17:56:16 +0300 (0:00:00.053)       0:00:05.541 ********* 
ok: [mysql] => (item=sait1)
ok: [mysql] => (item=sait2)

TASK [Template config for nginx] ***********************************************
Среда 11 октября 2023  17:56:18 +0300 (0:00:01.613)       0:00:07.154 ********* 
ok: [mysql] => (item=sait1)
ok: [mysql] => (item=sait2)

TASK [Link config in nginx settings] *******************************************
Среда 11 октября 2023  17:56:21 +0300 (0:00:02.579)       0:00:09.734 ********* 
ok: [mysql] => (item=sait1)
ok: [mysql] => (item=sait2)

TASK [Using html] **************************************************************
Среда 11 октября 2023  17:56:22 +0300 (0:00:01.519)       0:00:11.253 ********* 
ok: [mysql] => (item=sait1)
ok: [mysql] => (item=sait2)

TASK [Add sites to hosts] ******************************************************
Среда 11 октября 2023  17:56:25 +0300 (0:00:02.608)       0:00:13.862 ********* 
changed: [mysql] => (item=sait1)
changed: [mysql] => (item=sait2)

TASK [Run systemctl for check before status command] ***************************
Среда 11 октября 2023  17:56:26 +0300 (0:00:01.692)       0:00:15.554 ********* 
ok: [mysql]

TASK [Display Nginx service status before] *************************************
Среда 11 октября 2023  17:56:27 +0300 (0:00:00.826)       0:00:16.381 ********* 
ok: [mysql] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Wed 2023-10-11 14:54:06 UTC; 2min 20s ago",
        "       Docs: man:nginx(8)",
        "    Process: 30542 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 30544 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 30545 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 3.1M",
        "        CPU: 22ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─30545 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─30546 nginx: worker process",
        "             └─30547 nginx: worker process",
        "",
        "Oct 11 14:54:06 ws-3 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Oct 11 14:54:06 ws-3 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Restart nginx] ***********************************************************
Среда 11 октября 2023  17:56:27 +0300 (0:00:00.038)       0:00:16.419 ********* 
changed: [mysql]

TASK [Run systemctl for check after status command] ****************************
Среда 11 октября 2023  17:56:29 +0300 (0:00:01.303)       0:00:17.723 ********* 
ok: [mysql]

TASK [Display Nginx service status after] **************************************
Среда 11 октября 2023  17:56:29 +0300 (0:00:00.822)       0:00:18.545 ********* 
ok: [mysql] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Wed 2023-10-11 14:56:28 UTC; 829ms ago",
        "       Docs: man:nginx(8)",
        "    Process: 31248 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 31250 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 31251 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 3.1M",
        "        CPU: 23ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─31251 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─31252 nginx: worker process",
        "             └─31253 nginx: worker process",
        "",
        "Oct 11 14:56:28 ws-3 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Oct 11 14:56:28 ws-3 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Check sites] *************************************************************
Среда 11 октября 2023  17:56:29 +0300 (0:00:00.040)       0:00:18.586 ********* 
ok: [mysql] => (item=sait1)
ok: [mysql] => (item=sait2)

TASK [Message results] *********************************************************
Среда 11 октября 2023  17:56:31 +0300 (0:00:01.893)       0:00:20.480 ********* 
ok: [mysql] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: ws-3</p>\n    <p>FQDN: ws-3.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://sait1', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Wed, 11 Oct 2023 14:56:30 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Wed, 11 Oct 2023 13:00:13 GMT', 'connection': 'close', 'etag': '"65269c5d-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://sait1', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'sait1', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: ws-3</p>\n    <p>FQDN: ws-3.it-academy.local</p>\n</body>\n</html>\n"
}
ok: [mysql] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: ws-3</p>\n    <p>FQDN: ws-3.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://sait2', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Wed, 11 Oct 2023 14:56:31 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Wed, 11 Oct 2023 13:00:15 GMT', 'connection': 'close', 'etag': '"65269c5f-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://sait2', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'sait2', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: ws-3</p>\n    <p>FQDN: ws-3.it-academy.local</p>\n</body>\n</html>\n"
}

PLAY RECAP *********************************************************************
mysql                      : ok=15   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Среда 11 октября 2023  17:56:31 +0300 (0:00:00.115)       0:00:20.596 ********* 
=============================================================================== 
Using html -------------------------------------------------------------- 2.61s
Template config for nginx ----------------------------------------------- 2.58s
Gathering Facts --------------------------------------------------------- 2.48s
Update app list --------------------------------------------------------- 2.07s
Check sites ------------------------------------------------------------- 1.89s
Add sites to hosts ------------------------------------------------------ 1.69s
Create directory for vhost ---------------------------------------------- 1.61s
Link config in nginx settings ------------------------------------------- 1.52s
Restart nginx ----------------------------------------------------------- 1.30s
Check existence nginx --------------------------------------------------- 0.93s
Run systemctl for check before status command --------------------------- 0.83s
Run systemctl for check after status command ---------------------------- 0.82s
Message results --------------------------------------------------------- 0.12s
Install nginx ----------------------------------------------------------- 0.05s
Display Nginx service status after -------------------------------------- 0.04s
Display Nginx service status before ------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 20 seconds
```
