##Playbook recap
```
dkeldanovich@dkeldanovich-ubuntu:~/ansible/06.Ansible.Workshop$ ansible-playbook -i inv.yaml deploy_nginx.yaml

PLAY [db_10] ***********************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [db_10]

TASK [Validate] ********************************************************************************************************************************************************
ok: [db_10] => {
    "msg": [
        "first site: first.com",
        "second site: second.com"
    ]
}

TASK [Add redirect to hosts file] **************************************************************************************************************************************
changed: [db_10]

TASK [Display the file] ********************************************************                                                                                        ********************************************************************************                                                                                        *****************************************************************************
changed: [db_10]

TASK [debug] ********************************************************************************************************************************************************************************************************************************
ok: [db_10] => {
    "msg": [
        "127.0.0.1\tlocalhost",
        "::1\t\tlocalhost ip6-localhost ip6-loopback",
        "ff02::1\t\tip6-allnodes",
        "ff02::2\t\tip6-allrouters",
        "# --- BEGIN PVE ---",
        "192.168.201.10 ws-10.it-academy.local ws-10",
        "# --- END PVE ---",
        "127.0.0.1 first.com",
        "127.0.0.1 second.com"
    ]
}

TASK [ensure nginx is at the latest version] ************************************************************************************************************************************************************************************************
ok: [db_10]

TASK [start nginx] **************************************************************************************************************************************************************************************************************************
ok: [db_10]

TASK [copy the nginx config file and restart nginx] *****************************************************************************************************************************************************************************************
ok: [db_10]

TASK [create symlink] ***********************************************************************************************************************************************************************************************************************
ok: [db_10]

TASK [copy the content of the web site] *****************************************************************************************************************************************************************************************************
ok: [db_10]

TASK [restart nginx] ************************************************************************************************************************************************************************************************************************
changed: [db_10]

TASK [Check page, status 200] ***************************************************************************************************************************************************************************************************************
ok: [db_10] => (item=first.com)
ok: [db_10] => (item=second.com)

TASK [Check content] ************************************************************************************************************************************************************************************************************************
ok: [db_10] => (item={'content': '<html>\n<head>\n<title>06.Workshop</title>\n</head>\n<body>\n<p>www.first.com<br>IP:192.168.201.3</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://first.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Thu, 09 Feb 2023 22:45:35 GMT', 'content_type': 'text/html', 'content_length': '113', 'last_modified': 'Thu, 09 Feb 2023 21:12:01 GMT', 'connection': 'close', 'etag': '"63e561a1-71"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (113 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://first.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'first.com', 'ansible_loop_var': 'item'}) => {
    "msg": "<html>\n<head>\n<title>06.Workshop</title>\n</head>\n<body>\n<p>www.first.com<br>IP:192.168.201.3</p>\n</body>\n</html>\n"
}
ok: [db_10] => (item={'content': '<html>\n<head>\n<title>06.Workshop</title>\n</head>\n<body>\n<p>www.second.com<br>IP:192.168.201.3</p>\n</body>\n</html>\n\n', 'redirected': False, 'url': 'http://second.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Thu, 09 Feb 2023 22:45:36 GMT', 'content_type': 'text/html', 'content_length': '115', 'last_modified': 'Thu, 09 Feb 2023 21:12:02 GMT', 'connection': 'close', 'etag': '"63e561a2-73"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (115 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://second.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'second.com', 'ansible_loop_var': 'item'}) => {
    "msg": "<html>\n<head>\n<title>06.Workshop</title>\n</head>\n<body>\n<p>www.second.com<br>IP:192.168.201.3</p>\n</body>\n</html>\n\n"
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
db_10                      : ok=13   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

