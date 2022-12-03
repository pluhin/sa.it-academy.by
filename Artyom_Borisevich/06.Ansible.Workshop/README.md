# 06. Ansible.Workshop

## Create Ansible Playbook to install Nginx server and setup two virtual hosts. Playbook should meet the following requirements:

* Install nginx server
* Setup Nginx for two virtualhosts using templates
* Create and add index.html files, with unique data inside (host name and FQDN) for each virtualhost
* Check deployment/validate functionality of virtualhosts

## Ansible playbook

```bash
artem@serverart:~/06.Ansible.workshop$ ansible-playbook -i inv.yaml nginx.yaml

PLAY [dbs] *************************************************************************

TASK [Gathering Facts] *************************************************************
Saturday 03 December 2022  13:46:38 -0500 (0:00:00.010)       0:00:00.010 *****
ok: [db_18]

TASK [Validate] ********************************************************************
Saturday 03 December 2022  13:46:42 -0500 (0:00:03.914)       0:00:03.925 *****
ok: [db_18] => {
    "msg": [
        "first site: first.com",
        "second site: second.com"
    ]
}

TASK [Add redirect to hosts file] **************************************************
Saturday 03 December 2022  13:46:42 -0500 (0:00:00.059)       0:00:03.984 *****
changed: [db_18]

TASK [Display the file] ************************************************************
Saturday 03 December 2022  13:46:43 -0500 (0:00:00.986)       0:00:04.970 *****
changed: [db_18]

TASK [debug] ***********************************************************************
Saturday 03 December 2022  13:46:45 -0500 (0:00:01.857)       0:00:06.827 *****
ok: [db_18] => {
    "msg": [
        "127.0.0.1\tlocalhost",
        "::1\t\tlocalhost ip6-localhost ip6-loopback",
        "ff02::1\t\tip6-allnodes",
        "ff02::2\t\tip6-allrouters",
        "# --- BEGIN PVE ---",
        "192.168.201.3 ws-3.it-academy.local ws-3",
        "# --- END PVE ---",
        "127.0.0.1 first.com",
        "127.0.0.1 second.com"
    ]
}

TASK [ensure nginx is at the latest version] ***************************************
Saturday 03 December 2022  13:46:45 -0500 (0:00:00.032)       0:00:06.860 *****
ok: [db_18]

TASK [start nginx] *****************************************************************
Saturday 03 December 2022  13:46:46 -0500 (0:00:01.558)       0:00:08.418 *****
ok: [db_18]

TASK [copy the nginx config file and restart nginx] ********************************
Saturday 03 December 2022  13:46:47 -0500 (0:00:01.143)       0:00:09.562 *****
ok: [db_18]

TASK [create symlink] **************************************************************
Saturday 03 December 2022  13:46:49 -0500 (0:00:01.485)       0:00:11.048 *****
ok: [db_18]

TASK [copy the content of the web site] ********************************************
Saturday 03 December 2022  13:46:50 -0500 (0:00:00.814)       0:00:11.863 *****
ok: [db_18]

TASK [restart nginx] ***************************************************************
Saturday 03 December 2022  13:46:52 -0500 (0:00:02.441)       0:00:14.304 *****
changed: [db_18]

TASK [Check page, status 200] ******************************************************
Saturday 03 December 2022  13:46:53 -0500 (0:00:01.001)       0:00:15.306 *****
ok: [db_18] => (item=first.com)
ok: [db_18] => (item=second.com)

TASK [Check content] ***************************************************************
Saturday 03 December 2022  13:46:55 -0500 (0:00:01.920)       0:00:17.226 *****
ok: [db_18] => (item={'content': '<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n    <title>ANSIBLE WORKSHOP</title>\r\n</head>\r\n<body>\r\n<h2 style="color: #2e6c80;">www.first.com</h2>\r\n<h2 style="color: #2e6c80;">IP:192.168.201.3</h2>\r\n<h2 style="color: #2e6c80;">This a page for the first virtual host</h2>\r\n</body>\r\n</html>', 'redirected': False, 'url': 'http://first.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Sat, 03 Dec 2022 18:47:02 GMT', 'content_type': 'text/html', 'content_length': '313', 'last_modified': 'Sat, 03 Dec 2022 16:33:38 GMT', 'connection': 'close', 'etag': '"638b7a62-139"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (313 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://first.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'first.com', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>ANSIBLE WORKSHOP</title>\r\n</head>\r\n<body>\r\n<h2 style=\"color: #2e6c80;\">www.first.com</h2>\r\n<h2 style=\"color: #2e6c80;\">IP:192.168.201.3</h2>\r\n<h2 style=\"color: #2e6c80;\">This a page for the first virtual host</h2>\r\n</body>\r\n</html>"
}
ok: [db_18] => (item={'content': '<!DOCTYPE html>\r\n<html lang="en">\r\n<head>\r\n    <meta charset="UTF-8">\r\n    <title>ANSIBLE WORKSHOP</title>\r\n</head>\r\n<body>\r\n<h2 style="color: #2e6c80;">www.second.com</h2>\r\n<h2 style="color: #2e6c80;">IP:192.168.201.3</h2>\r\n<h2 style="color: #2e6c80;">This a page for the second virtual host</h2>\r\n</body>\r\n</html>', 'redirected': False, 'url': 'http://second.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Sat, 03 Dec 2022 18:47:03 GMT', 'content_type': 'text/html', 'content_length': '315', 'last_modified': 'Sat, 03 Dec 2022 09:04:50 GMT', 'connection': 'close', 'etag': '"638b1132-13b"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (315 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://second.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'second.com', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <meta charset=\"UTF-8\">\r\n    <title>ANSIBLE WORKSHOP</title>\r\n</head>\r\n<body>\r\n<h2 style=\"color: #2e6c80;\">www.second.com</h2>\r\n<h2 style=\"color: #2e6c80;\">IP:192.168.201.3</h2>\r\n<h2 style=\"color: #2e6c80;\">This a page for the second virtual host</h2>\r\n</body>\r\n</html>"
}

PLAY RECAP *************************************************************************
db_18                      : ok=13   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 03 December 2022  13:46:55 -0500 (0:00:00.062)       0:00:17.289 *****
===============================================================================
Gathering Facts ------------------------------------------------------------- 3.91s
copy the content of the web site -------------------------------------------- 2.44s
Check page, status 200 ------------------------------------------------------ 1.92s
Display the file ------------------------------------------------------------ 1.86s
ensure nginx is at the latest version --------------------------------------- 1.56s
copy the nginx config file and restart nginx -------------------------------- 1.49s
start nginx ----------------------------------------------------------------- 1.14s
restart nginx --------------------------------------------------------------- 1.00s
Add redirect to hosts file -------------------------------------------------- 0.99s
create symlink -------------------------------------------------------------- 0.81s
Check content --------------------------------------------------------------- 0.06s
Validate -------------------------------------------------------------------- 0.06s
debug ----------------------------------------------------------------------- 0.03s
```
