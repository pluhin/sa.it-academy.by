# Homework Assignment 1: Configuration Management

[Inventory](./inv.yaml)

[Playbook](./nginx.yaml)

### Templates

[Site 1](./site1.conf.j2)

[Site 2](./site2.conf.j2)

## Playbook output

```shell
PLAY [Install and configure Nginx] *********************************************

TASK [Gathering Facts] *********************************************************
ok: [nginx_server]

TASK [Install Nginx] ***********************************************************
ok: [nginx_server]

TASK [Manage the Nginx Process] ************************************************
ok: [nginx_server]

TASK [Create directories for the websites] *************************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Create index.html for sites] *********************************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Add entries to /etc/hosts] ***********************************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Template Nginx configuration for sites] **********************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Enable virtual host by creating link for site] ***************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [reload nginx] ************************************************************
changed: [nginx_server]

TASK [Check if Sites are reachable] ********************************************
ok: [nginx_server] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [nginx_server] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Output content of Sites] *************************************************
ok: [nginx_server] => (item={'content': '<h1>Welcome to site1</h1>', 'redirected': False, 'url': 'http://site1.example.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Mon, 07 Apr 2025 16:14:10 GMT', 'content_type': 'text/html', 'content_length': '25', 'last_modified': 'Mon, 07 Apr 2025 15:48:07 GMT', 'connection': 'close', 'etag': '"67f3f3b7-19"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (25 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site1.example.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'site1', 'domain': 'site1.example.com'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Content of Site: <h1>Welcome to site1</h1>"
}
ok: [nginx_server] => (item={'content': '<h1>Welcome to site2</h1>', 'redirected': False, 'url': 'http://site2.example.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Mon, 07 Apr 2025 16:14:11 GMT', 'content_type': 'text/html', 'content_length': '25', 'last_modified': 'Mon, 07 Apr 2025 15:48:08 GMT', 'connection': 'close', 'etag': '"67f3f3b8-19"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (25 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site2.example.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'site2', 'domain': 'site2.example.com'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Content of Site: <h1>Welcome to site2</h1>"
}

PLAY RECAP *********************************************************************
nginx_server               : ok=11   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


```



