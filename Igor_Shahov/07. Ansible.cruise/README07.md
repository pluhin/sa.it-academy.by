# 07 Ansible play

```
migel@migel:~/.ansible$ ansible-playbook -i inventory.yaml web.yaml --ask-vault-pass
Vault password: 

PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
ok: [centos]
ok: [ubuntu]

TASK [webserver : Include deploy for Debian systems] ***************************
skipping: [centos]
included: /home/migel/.ansible/roles/webserver/tasks/http_deb.yaml for ubuntu

TASK [webserver : Install nginx] ***********************************************
ok: [ubuntu]

TASK [webserver : Nginx Enable] ************************************************
ok: [ubuntu]

TASK [webserver : Nginx restart] ***********************************************
[WARNING]: Consider using the service module rather than running 'service'.  If
you need to use command because service is insufficient you can add 'warn:
false' to this command task or set 'command_warnings=False' in ansible.cfg to
get rid of this message.
changed: [ubuntu]

TASK [webserver : Createing directory] *****************************************
ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.32'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.32'})

TASK [webserver : Copying configuration template] ******************************
ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.32'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.32'})

TASK [webserver : Copy my site] ************************************************
ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.32'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.32'})

TASK [webserver : nginx restart] ***********************************************
changed: [ubuntu]

TASK [webserver : Check content to the sites] **********************************
ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.32'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.32'})

TASK [webserver : print out] ***************************************************
ok: [ubuntu] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Ура! Вы смогли настроить Virtual Host в nginx!</h1>",
                "content_length": "76",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 15 Aug 2022 16:36:49 GMT",
                "elapsed": 0,
                "etag": "\"62f95d5b-4c\"",
                "failed": false,
                "failed_when_result": false,
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
                        "url": "http://ubuntu1.test",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.32",
                    "name": "ubuntu1.test"
                },
                "last_modified": "Sun, 14 Aug 2022 20:38:51 GMT",
                "msg": "OK (76 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Ура! Вы смогли настроить Virtual Host в nginx!</h1>",
                "content_length": "76",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 15 Aug 2022 16:36:49 GMT",
                "elapsed": 0,
                "etag": "\"62f95d5c-4c\"",
                "failed": false,
                "failed_when_result": false,
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
                        "url": "http://ubuntu2.test",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.32",
                    "name": "ubuntu2.test"
                },
                "last_modified": "Sun, 14 Aug 2022 20:38:52 GMT",
                "msg": "OK (76 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu2.test"
            }
        ]
    }
}

TASK [webserver : Include deploy for RedHat systems] ***************************
skipping: [ubuntu]
[WARNING]: packaging Python module unavailable; unable to validate collection
Ansible version requirements
included: /home/migel/.ansible/roles/webserver/tasks/http_rh.yaml for centos

TASK [webserver : Nginx. Install packages] *************************************
ok: [centos]

TASK [webserver : Nginx. Enable and start service] *****************************
ok: [centos]

TASK [webserver : Nginx. Enable firewall port] *********************************
ok: [centos]

TASK [webserver : nginx restart] ***********************************************
changed: [centos]

TASK [webserver : Createing directory] *****************************************
ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.31'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.31'})

TASK [webserver : Copying configuration template] ******************************
ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.31'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.31'})

TASK [webserver : nginx restart] ***********************************************
changed: [centos]

TASK [webserver : Copy my site] ************************************************
ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.31'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.31'})

TASK [webserver : nginx restart] ***********************************************
changed: [centos]

TASK [webserver : Check content to the sites] **********************************
ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.31'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.31'})

TASK [webserver : print out] ***************************************************
ok: [centos] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Ура! Вы смогли настроить Virtual Host в nginx!</h1>",
                "content_length": "76",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 15 Aug 2022 16:37:06 GMT",
                "elapsed": 0,
                "etag": "\"62f95d68-4c\"",
                "failed": false,
                "failed_when_result": false,
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
                        "url": "http://cent1.test",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.31",
                    "name": "cent1.test"
                },
                "last_modified": "Sun, 14 Aug 2022 20:39:04 GMT",
                "msg": "OK (76 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://cent1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<h1>Ура! Вы смогли настроить Virtual Host в nginx!</h1>",
                "content_length": "76",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Mon, 15 Aug 2022 16:37:07 GMT",
                "elapsed": 0,
                "etag": "\"62f95d6a-4c\"",
                "failed": false,
                "failed_when_result": false,
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
                        "url": "http://cent2.test",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.31",
                    "name": "cent2.test"
                },
                "last_modified": "Sun, 14 Aug 2022 20:39:06 GMT",
                "msg": "OK (76 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://cent2.test"
            }
        ]
    }
}

PLAY RECAP *********************************************************************
centos                     : ok=13   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
ubuntu                     : ok=11   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

migel@migel:~/.ansible$ ansible-playbook -i inventory.yaml test.yaml --ask-vault-pass
Vault password: 

PLAY [all_workers] ************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************
ok: [ubuntu]
ok: [centos]

TASK [tests : Check SUDO with NOPASSWD] ***************************************************************************
ok: [ubuntu]
ok: [centos]

TASK [tests : Check connection] ***********************************************************************************
ok: [centos] => (item=https://deb.debian.org/debian)
ok: [ubuntu] => (item=https://deb.debian.org/debian)
ok: [ubuntu] => (item=https://cloud.centos.org/centos)
ok: [centos] => (item=https://cloud.centos.org/centos)
ok: [ubuntu] => (item=https://pypi.org/simple)
ok: [centos] => (item=https://pypi.org/simple)

TASK [tests : Check Dock] *****************************************************************************************
ok: [centos]
ok: [ubuntu]

TASK [tests : Check RAM] ******************************************************************************************
ok: [centos] => {
    "msg": "ram less then 512mb"
}
ok: [ubuntu] => {
    "msg": "ram less then 512mb"
}

TASK [tests : Check HDD] ******************************************************************************************
ok: [centos] => {
    "msg": "HDD less then 10GB"
}
ok: [ubuntu] => {
    "msg": "HDD less then 10GB"
}

PLAY RECAP ********************************************************************************************************
centos                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
