
PLAY [web_servers] ***********************************************************************************************************************************
Wednesday 15 May 2019  14:53:11 +0300 (0:00:00.184)       0:00:00.184 ********* 
Wednesday 15 May 2019  14:53:11 +0300 (0:00:00.013)       0:00:00.198 ********* 

TASK [Gathering Facts] *******************************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:13 +0300 (0:00:01.778)       0:00:01.976 ********* 

TASK [web : Debian. Install nginx] *******************************************************************************************************************
skipping: [sacentvag]
Wednesday 15 May 2019  14:53:13 +0300 (0:00:00.031)       0:00:02.008 ********* 

TASK [web : Debian. Install nginx. Enable and start] *************************************************************************************************
skipping: [sacentvag]
Wednesday 15 May 2019  14:53:13 +0300 (0:00:00.035)       0:00:02.044 ********* 

TASK [Gathering Facts] *******************************************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:15 +0300 (0:00:01.765)       0:00:03.809 ********* 

TASK [web : Debian. Install nginx] *******************************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:16 +0300 (0:00:01.177)       0:00:04.987 ********* 

TASK [web : Debian. Install nginx. Enable and start] *************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:16 +0300 (0:00:00.556)       0:00:05.543 ********* 

TASK [web : Centos. Install nginx] *******************************************************************************************************************
skipping: [saubvag]
Wednesday 15 May 2019  14:53:16 +0300 (0:00:00.043)       0:00:05.587 ********* 

TASK [web : Nginx. Start] ****************************************************************************************************************************
skipping: [saubvag]
Wednesday 15 May 2019  14:53:16 +0300 (0:00:00.045)       0:00:05.633 ********* 

TASK [web : Setup. index.html] ***********************************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:17 +0300 (0:00:01.068)       0:00:06.701 ********* 

TASK [web : Testing. wait for] ***********************************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:18 +0300 (0:00:00.417)       0:00:07.119 ********* 

TASK [web : Testing. curl] ***************************************************************************************************************************
ok: [saubvag]
Wednesday 15 May 2019  14:53:18 +0300 (0:00:00.615)       0:00:07.734 ********* 

TASK [web : debug] ***********************************************************************************************************************************
ok: [saubvag] => (item={'status': 200, 'content_length': '123', 'cookies': {}, 'date': 'Wed, 15 May 2019 11:53:18 GMT', 'url': 'http://192.168.100.220', 'changed': False, 'server': 'nginx/1.4.6 (Ubuntu)', 'content': '<!DOCTYPE html>\n<html>\n<body>\n\n<h1>Welcome to the board NGINX, comrates!</h1>\n<p>Finally we are here!</p>\n\n</body>\n</html>\n', 'connection': 'close', 'last_modified': 'Wed, 15 May 2019 08:44:22 GMT', 'etag': '"5cdbd166-7b"', 'content_type': 'text/html', 'msg': 'OK (123 bytes)', 'redirected': False, 'accept_ranges': 'bytes', 'cookies_string': '', 'failed': False}) => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<!DOCTYPE html>\n<html>\n<body>\n\n<h1>Welcome to the board NGINX, comrates!</h1>\n<p>Finally we are here!</p>\n\n</body>\n</html>\n",
        "content_length": "123",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 15 May 2019 11:53:18 GMT",
        "etag": "\"5cdbd166-7b\"",
        "failed": false,
        "last_modified": "Wed, 15 May 2019 08:44:22 GMT",
        "msg": "OK (123 bytes)",
        "redirected": false,
        "server": "nginx/1.4.6 (Ubuntu)",
        "status": 200,
        "url": "http://192.168.100.220"
    }
}
ok: [saubvag] => (item={'elapsed': 0, 'search_regex': None, 'state': 'started', 'path': None, 'port': 80, 'failed': False, 'changed': False}) => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

TASK [web : Centos. Install nginx] *******************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:20 +0300 (0:00:01.908)       0:00:09.643 ********* 

TASK [web : Nginx. Start] ****************************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:21 +0300 (0:00:00.886)       0:00:10.530 ********* 

TASK [web : Setup. index.html] ***********************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:22 +0300 (0:00:01.083)       0:00:11.613 ********* 

TASK [web : Testing. wait for] ***********************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:23 +0300 (0:00:00.468)       0:00:12.082 ********* 

TASK [web : Testing. curl] ***************************************************************************************************************************
ok: [sacentvag]
Wednesday 15 May 2019  14:53:23 +0300 (0:00:00.518)       0:00:12.600 ********* 

TASK [web : debug] ***********************************************************************************************************************************
ok: [sacentvag] => (item={'status': 200, 'content_length': '123', 'cookies': {}, 'date': 'Wed, 15 May 2019 11:53:23 GMT', 'url': 'http://192.168.100.220', 'changed': False, 'server': 'nginx/1.4.6 (Ubuntu)', 'content': '<!DOCTYPE html>\n<html>\n<body>\n\n<h1>Welcome to the board NGINX, comrates!</h1>\n<p>Finally we are here!</p>\n\n</body>\n</html>\n', 'connection': 'close', 'last_modified': 'Wed, 15 May 2019 08:44:22 GMT', 'etag': '"5cdbd166-7b"', 'content_type': 'text/html', 'msg': 'OK (123 bytes)', 'redirected': False, 'accept_ranges': 'bytes', 'cookies_string': '', 'failed': False}) => {
    "msg": {
        "accept_ranges": "bytes",
        "changed": false,
        "connection": "close",
        "content": "<!DOCTYPE html>\n<html>\n<body>\n\n<h1>Welcome to the board NGINX, comrates!</h1>\n<p>Finally we are here!</p>\n\n</body>\n</html>\n",
        "content_length": "123",
        "content_type": "text/html",
        "cookies": {},
        "cookies_string": "",
        "date": "Wed, 15 May 2019 11:53:23 GMT",
        "etag": "\"5cdbd166-7b\"",
        "failed": false,
        "last_modified": "Wed, 15 May 2019 08:44:22 GMT",
        "msg": "OK (123 bytes)",
        "redirected": false,
        "server": "nginx/1.4.6 (Ubuntu)",
        "status": 200,
        "url": "http://192.168.100.220"
    }
}
ok: [sacentvag] => (item={'elapsed': 0, 'search_regex': None, 'state': 'started', 'path': None, 'port': 80, 'failed': False, 'changed': False}) => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

PLAY RECAP *******************************************************************************************************************************************
sacentvag                  : ok=7    changed=0    unreachable=0    failed=0   
saubvag                    : ok=7    changed=0    unreachable=0    failed=0   

Wednesday 15 May 2019  14:53:23 +0300 (0:00:00.086)       0:00:12.687 ********* 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------- 1.78s
web : Debian. Install nginx ------------------------------------------------------------------------------------------------------------------- 1.18s
web : Setup. index.html ----------------------------------------------------------------------------------------------------------------------- 1.08s
web : Nginx. Start ---------------------------------------------------------------------------------------------------------------------------- 0.89s
web : Debian. Install nginx. Enable and start ------------------------------------------------------------------------------------------------- 0.56s
web : Testing. curl --------------------------------------------------------------------------------------------------------------------------- 0.52s
web : Testing. wait for ----------------------------------------------------------------------------------------------------------------------- 0.47s
web : debug ----------------------------------------------------------------------------------------------------------------------------------- 0.09s
web : Centos. Install nginx ------------------------------------------------------------------------------------------------------------------- 0.04s
