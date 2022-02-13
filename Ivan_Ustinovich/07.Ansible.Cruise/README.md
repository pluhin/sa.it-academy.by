# 07.Ansible.Cruise - Ivan_Ustinovich

## ansible playbook install Nginx 

```bash
ansible-playbook -i inventory.yaml web.yaml
```
```bash
PLAY [web_hosts] *****************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************
ok: [host21]
ok: [host22]

TASK [webservers : Include deploy for Debian systems] ****************************************************************
skipping: [host21]
included: /home/ivan/Documents/ansible/roles/webservers/tasks/nginx_deb.yaml for host22

TASK [webservers : Nginx. Install packages] **************************************************************************
ok: [host22]

TASK [webservers : Nginx. Enable and start service] ******************************************************************
ok: [host22]

TASK [webservers : Nginx. Remove welcome file] ***********************************************************************
ok: [host22]

TASK [webservers : Templates] ****************************************************************************************
ok: [host22]

TASK [webservers : Copy first page] **********************************************************************************
ok: [host22]

TASK [webservers : Include deploy for RedHat systems] ****************************************************************
skipping: [host22]
included: /home/ivan/Documents/ansible/roles/webservers/tasks/nginx_rh.yaml for host21

TASK [webservers : Nginx. Install packages] **************************************************************************
changed: [host21]

TASK [webservers : Nginx. Remove welcome file] ***********************************************************************
ok: [host21]

TASK [webservers : Nginx. Enable and start service] ******************************************************************
changed: [host21]

TASK [webservers : Nginx. Enable firewall port] **********************************************************************
changed: [host21]

TASK [webservers : Nginx. reload service firewalld] ******************************************************************
changed: [host21]

TASK [webservers : Templates] ****************************************************************************************
changed: [host21]

TASK [webservers : Copy first page] **********************************************************************************
changed: [host21]

TASK [webservers : Check connection to Localhost] ********************************************************************
ok: [host22]
ok: [host21]

TASK [webservers : print out] ****************************************************************************************
ok: [host21] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}
ok: [host22] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

TASK [webservers : Templates] ****************************************************************************************
ok: [host22]
changed: [host21]

TASK [webservers : Check template] ***********************************************************************************
ok: [host21]
ok: [host22]

TASK [webservers : print out] ****************************************************************************************
ok: [host21] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.21   local-cent.site",
        "192.168.202.22   local-deb.site"
    ]
}
ok: [host22] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.21   local-cent.site",
        "192.168.202.22   local-deb.site"
    ]
}

TASK [webservers : Check content to the sites] ***********************************************************************
ok: [host21] => (item={'name': 'local-cent.site', 'ip': '192.168.202.21'})
ok: [host22] => (item={'name': 'local-cent.site', 'ip': '192.168.202.21'})
ok: [host22] => (item={'name': 'local-deb.site', 'ip': '192.168.202.22'})
ok: [host21] => (item={'name': 'local-deb.site', 'ip': '192.168.202.22'})

TASK [webservers : print out] ****************************************************************************************
ok: [host21] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 13 Feb 2022 21:53:58 GMT",
                "elapsed": 0,
                "etag": "\"62097df2-16\"",
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
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.21",
                    "name": "local-cent.site"
                },
                "last_modified": "Sun, 13 Feb 2022 21:53:54 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 13 Feb 2022 21:53:59 GMT",
                "elapsed": 0,
                "etag": "\"62097c71-16\"",
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
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.22",
                    "name": "local-deb.site"
                },
                "last_modified": "Sun, 13 Feb 2022 21:47:29 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ]
    }
}
ok: [host22] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 13 Feb 2022 21:53:58 GMT",
                "elapsed": 0,
                "etag": "\"62097df2-16\"",
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
                        "url": "http://local-cent.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.21",
                    "name": "local-cent.site"
                },
                "last_modified": "Sun, 13 Feb 2022 21:53:54 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.20.1",
                "status": 200,
                "url": "http://local-cent.site"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "Ansible managed host!\n",
                "content_length": "22",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 13 Feb 2022 21:53:59 GMT",
                "elapsed": 0,
                "etag": "\"62097c71-16\"",
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
                        "url": "http://local-deb.site",
                        "url_password": null,
                        "url_username": null,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "ip": "192.168.202.22",
                    "name": "local-deb.site"
                },
                "last_modified": "Sun, 13 Feb 2022 21:47:29 GMT",
                "msg": "OK (22 bytes)",
                "redirected": false,
                "server": "nginx/1.14.0 (Ubuntu)",
                "status": 200,
                "url": "http://local-deb.site"
            }
        ]
    }
}

RUNNING HANDLER [webservers : restart nginx] *************************************************************************
changed: [host21]

PLAY RECAP ***********************************************************************************************************
host21                     : ok=17   changed=8    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host22                     : ok=14   changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```
### Test

```bash
ansible-playbook -i inventory.yaml task2.yaml
```
```bash
PLAY [web_hosts] *****************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************
ok: [host21]
ok: [host22]

TASK [task2 : Check SUDO with NOPASSWD] ******************************************************************************
ok: [host21]
ok: [host22]

TASK [task2 : Check access to repositories] **************************************************************************
ok: [host21] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host22] => (item=http://archive.ubuntu.com/ubuntu)
ok: [host21] => (item=https://deb.debian.org/debian)
ok: [host22] => (item=https://deb.debian.org/debian)
ok: [host22] => (item=https://cloud.centos.org/centos)
ok: [host21] => (item=https://cloud.centos.org/centos)
ok: [host22] => (item=https://pypi.org/simple)
ok: [host21] => (item=https://pypi.org/simple)

TASK [task2 : Check access to the Docker Hub] ************************************************************************
ok: [host21]
ok: [host22]

TASK [task2 : Check Mount point] *************************************************************************************
ok: [host21] => (item={'block_used': 474337, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4653491, 'size_available': 19060699136, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop20', 'inode_used': 22182, 'block_size': 4096, 'inode_available': 1288538}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4653491,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 474337,
        "device": "/dev/loop20",
        "fstype": "ext4",
        "inode_available": 1288538,
        "inode_total": 1310720,
        "inode_used": 22182,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19060699136,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 90.75 % of disk space."
}
ok: [host22] => (item={'mount': '/', 'device': '/dev/loop21', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18976497664, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4632934, 'block_used': 494894, 'inode_total': 1310720, 'inode_available': 1289141, 'inode_used': 21579, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4632934,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 494894,
        "device": "/dev/loop21",
        "fstype": "ext4",
        "inode_available": 1289141,
        "inode_total": 1310720,
        "inode_used": 21579,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18976497664,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "Available 90.35 % of disk space."
}

TASK [task2 : Check RAM] *********************************************************************************************
ok: [host21] => {
    "changed": false,
    "msg": "OK. Available 82.28% of RAM."
}
ok: [host22] => {
    "changed": false,
    "msg": "OK. Available 88.28% of RAM."
}

PLAY RECAP ***********************************************************************************************************
host21                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host22                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```