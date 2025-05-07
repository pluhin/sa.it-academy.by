```bash
ansible-playbook -i inv.yaml installation.yaml --ask-pass
```

```bash
PLAY [Installation nginx with templates] ****************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************************
ok: [host_23]
ok: [host_24]

TASK [Installation nginx] *******************************************************************************************************************************************************************************************************************************
ok: [host_23]
ok: [host_24]

TASK [Create home directory] ****************************************************************************************************************************************************************************************************************************
changed: [host_24] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})

TASK [Deploy vhost config] ******************************************************************************************************************************************************************************************************************************
changed: [host_23] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})

TASK [Create html page] *********************************************************************************************************************************************************************************************************************************
changed: [host_24] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})

TASK [Add virtual host] *********************************************************************************************************************************************************************************************************************************
changed: [host_23] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-1', 'fqdn': 'it-academy-1-1'})
changed: [host_23] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})
changed: [host_24] => (item={'hostname': 'it-academy-vhost-2', 'fqdn': 'it-academy-2-2'})

TASK [Reload Nginx] *************************************************************************************************************************************************************************************************************************************
changed: [host_23]
changed: [host_24]

TASK [Check work of website] ****************************************************************************************************************************************************************************************************************************
ok: [host_23] => (item=it-academy-vhost-1)
ok: [host_24] => (item=it-academy-vhost-1)
ok: [host_23] => (item=it-academy-vhost-2)
ok: [host_24] => (item=it-academy-vhost-2)

TASK [Show response] ************************************************************************************************************************************************************************************************************************************
ok: [host_23] => {
    "site_response.results": [
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>Hello!</title>\n  </head>\n  <body>\n    <header>\n      <h1>Hostname: it-academy-vhost-1</h1>\n      <p>FQDN: it-academy-1-1</p>\n    </header>\n  </body>\n</html>\n",
            "content_length": "200",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 14 Apr 2025 19:40:35 GMT",
            "elapsed": 0,
            "etag": "\"67fd649f-c8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
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
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "it-academy-1-1",
                "hostname": "it-academy-vhost-1"
            },
            "last_modified": "Mon, 14 Apr 2025 19:40:15 GMT",
            "msg": "OK (200 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        },
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>Hello!</title>\n  </head>\n  <body>\n    <header>\n      <h1>Hostname: it-academy-vhost-1</h1>\n      <p>FQDN: it-academy-1-1</p>\n    </header>\n  </body>\n</html>\n",
            "content_length": "200",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 14 Apr 2025 19:40:38 GMT",
            "elapsed": 0,
            "etag": "\"67fd649f-c8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
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
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "it-academy-2-2",
                "hostname": "it-academy-vhost-2"
            },
            "last_modified": "Mon, 14 Apr 2025 19:40:15 GMT",
            "msg": "OK (200 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        }
    ]
}
ok: [host_24] => {
    "site_response.results": [
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>Hello!</title>\n  </head>\n  <body>\n    <header>\n      <h1>Hostname: it-academy-vhost-1</h1>\n      <p>FQDN: it-academy-1-1</p>\n    </header>\n  </body>\n</html>\n",
            "content_length": "200",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 14 Apr 2025 19:40:35 GMT",
            "elapsed": 0,
            "etag": "\"67fd649f-c8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
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
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "it-academy-1-1",
                "hostname": "it-academy-vhost-1"
            },
            "last_modified": "Mon, 14 Apr 2025 19:40:15 GMT",
            "msg": "OK (200 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        },
        {
            "accept_ranges": "bytes",
            "ansible_loop_var": "item",
            "changed": false,
            "connection": "close",
            "content": "<!DOCTYPE html>\n<html>\n  <head>\n    <title>Hello!</title>\n  </head>\n  <body>\n    <header>\n      <h1>Hostname: it-academy-vhost-1</h1>\n      <p>FQDN: it-academy-1-1</p>\n    </header>\n  </body>\n</html>\n",
            "content_length": "200",
            "content_type": "text/html",
            "cookies": {},
            "cookies_string": "",
            "date": "Mon, 14 Apr 2025 19:40:38 GMT",
            "elapsed": 0,
            "etag": "\"67fd649f-c8\"",
            "failed": false,
            "invocation": {
                "module_args": {
                    "attributes": null,
                    "body": null,
                    "body_format": "raw",
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
                    "unsafe_writes": false,
                    "url": "http://localhost/index.html",
                    "url_password": null,
                    "url_username": null,
                    "use_proxy": true,
                    "validate_certs": true
                }
            },
            "item": {
                "fqdn": "it-academy-2-2",
                "hostname": "it-academy-vhost-2"
            },
            "last_modified": "Mon, 14 Apr 2025 19:40:15 GMT",
            "msg": "OK (200 bytes)",
            "redirected": false,
            "server": "nginx/1.18.0 (Ubuntu)",
            "status": 200,
            "url": "http://localhost/index.html"
        }
    ]
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************************
host_23                    : ok=14   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_24                    : ok=14   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```