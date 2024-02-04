# 06.Ansible Workshop
---

## Homework Assignment 1: Configuration Management

```bash
ch /home/06.Ansible.Workshop
mkdir group_vars/all_workers/
```

vim inv_server.yaml

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host7:
          ansible_host: 192.168.202.7
        host8:
          ansible_host: 192.168.202.8
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

ansible-vault create group_vars/all_workers/vars.yaml

```yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
```

```bash
mkdir html
```

vim html/site1.html

```bash
<!DOCTYPE html>
<html>
<head>
    <title>Site one</title>
</head>
<body>
    <h1>Hello from Site one</h1>
    <p>Host name: {{ ansible_hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```

vim html/site2.html

```html
<!DOCTYPE html>
<html>
<head>
    <title>Site two</title>
</head>
<body>
    <h1>Hello from Site two</h1>
    <p>Host name: {{ ansible_hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```

```bash
mkdir templates
```

```jinja2
server {
  listen 80;
  listen [::]:80;
  server_name {{ item }};
  root /var/www/{{ item }}/html/;

  location / {
      index index.html index.htm index.nginx-debian.html;
      try_files $uri.html $uri $uri/ =404;
  }

  access_log /var/log/nginx/{{ item }}_access.log;
  error_log /var/log/nginx/{{ item }}_error.log;

}
```

vim install_nginx.yaml

```yaml
- hosts: all_workers
  become: true

  vars:
    vhost_name:
      - site1
      - site2

  tasks:
  - name: Update app list
    apt:
      update_cache: yes
    tags: install

  - name: Check existence nginx
    stat:
      path: /etc/nginx/nginx.conf
    register: nginx_installed
    ignore_errors: yes
    tags: install

  - name: Install nginx
    apt:
      name: nginx
      state: latest
    when: not nginx_installed.stat.exists
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install

  - name: Create directory for vhost
    file:
      path: "/var/www/{{ item }}/html/"
      mode: 0755
      state: directory
    loop: "{{ vhost_name }}"
    tags: config

  - name: Template config for nginx
    ansible.builtin.template:
      src: templates/nginx-site.conf.j2
      dest: "/etc/nginx/sites-available/{{ item }}"
      mode: 0755
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Link config in nginx settings
    file:
      src: /etc/nginx/sites-available/{{ item }}
      dest: "/etc/nginx/sites-enabled/{{ item }}"
      state: link
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Using html
    ansible.builtin.template:
      src: html/{{ item }}.html
      dest: "/var/www/{{ item }}/html/index.html"
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Add sites to hosts
    shell: |
      grep -q {{ item }} /etc/hosts || echo 127.0.0.1 {{ item }} >> /etc/hosts;
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Run systemctl for check before status command
    ansible.builtin.command: systemctl status nginx.service
    register: nginx_status
    changed_when: false
    failed_when: "nginx_status.rc not in [0, 3]"
    tags: restart

  - name: Display Nginx service status before
    ansible.builtin.debug:
      var: nginx_status.stdout_lines
    tags: restart

  - name: Restart nginx
    service:
      name: nginx
      state: restarted
    tags: restart

  - name: Run systemctl for check after status command
    ansible.builtin.command: systemctl status nginx.service
    register: nginx_status
    changed_when: false
    failed_when: "nginx_status.rc not in [0, 3]"
    tags: restart

  - name: Display Nginx service status after
    ansible.builtin.debug:
      var: nginx_status.stdout_lines
    tags: restart

  - name: Check sites
    ansible.builtin.uri:
      url: "http://{{ item }}"
      return_content: true
    register: export
    loop: "{{ vhost_name }}"
    failed_when: export.status != 200
    tags: check

  - name: Message results
    ansible.builtin.debug:
      msg: "{{ item.content }}"
    with_items: "{{ export.results }}"
    tags: check
```

```bash
ansible-playbook -i inv_server.yaml install_nginx.yaml -u root --ask-vault-pass
```

Output

```bash
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Friday 02 February 2024  20:20:36 +0000 (0:00:00.025)       0:00:00.025 *******
ok: [host8]
ok: [host7]

TASK [Update app list] ***************************************************************************************************************************************
Friday 02 February 2024  20:20:38 +0000 (0:00:02.348)       0:00:02.374 *******
ok: [host7]
ok: [host8]

TASK [Check existence nginx] *********************************************************************************************************************************
Friday 02 February 2024  20:20:41 +0000 (0:00:02.639)       0:00:05.013 *******
ok: [host7]
ok: [host8]

TASK [Install nginx] *****************************************************************************************************************************************
Friday 02 February 2024  20:20:42 +0000 (0:00:01.224)       0:00:06.238 *******
skipping: [host7]
skipping: [host8]

TASK [Create directory for vhost] ****************************************************************************************************************************
Friday 02 February 2024  20:20:42 +0000 (0:00:00.062)       0:00:06.300 *******
ok: [host7] => (item=site1)
ok: [host8] => (item=site1)
ok: [host7] => (item=site2)
ok: [host8] => (item=site2)

TASK [Template config for nginx] *****************************************************************************************************************************
Friday 02 February 2024  20:20:44 +0000 (0:00:02.225)       0:00:08.526 *******
ok: [host7] => (item=site1)
ok: [host8] => (item=site1)
ok: [host8] => (item=site2)
ok: [host7] => (item=site2)

TASK [Link config in nginx settings] *************************************************************************************************************************
Friday 02 February 2024  20:20:48 +0000 (0:00:03.942)       0:00:12.468 *******
ok: [host7] => (item=site1)
ok: [host8] => (item=site1)
ok: [host7] => (item=site2)
ok: [host8] => (item=site2)

TASK [Using html] ********************************************************************************************************************************************
Friday 02 February 2024  20:20:50 +0000 (0:00:02.195)       0:00:14.663 *******
changed: [host7] => (item=site1)
changed: [host8] => (item=site1)
changed: [host7] => (item=site2)
changed: [host8] => (item=site2)

TASK [Add sites to hosts] ************************************************************************************************************************************
Friday 02 February 2024  20:20:55 +0000 (0:00:04.343)       0:00:19.007 *******
changed: [host7] => (item=site1)
changed: [host8] => (item=site1)
changed: [host8] => (item=site2)
changed: [host7] => (item=site2)

TASK [Run systemctl for check before status command] *********************************************************************************************************
Friday 02 February 2024  20:20:58 +0000 (0:00:03.775)       0:00:22.782 *******
ok: [host7]
ok: [host8]

TASK [Display Nginx service status before] *******************************************************************************************************************
Friday 02 February 2024  20:21:01 +0000 (0:00:02.994)       0:00:25.777 *******
ok: [host7] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Fri 2024-02-02 19:25:26 UTC; 55min ago",
        "       Docs: man:nginx(8)",
        "    Process: 144 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 167 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 168 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 10.1M",
        "        CPU: 34ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─168 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─169 nginx: worker process",
        "             └─170 nginx: worker process",
        "",
        "Feb 02 19:25:26 sa-7 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Feb 02 19:25:26 sa-7 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}
ok: [host8] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Fri 2024-02-02 19:25:36 UTC; 55min ago",
        "       Docs: man:nginx(8)",
        "    Process: 144 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 167 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 168 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 10.1M",
        "        CPU: 30ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─168 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─169 nginx: worker process",
        "             └─170 nginx: worker process",
        "",
        "Feb 02 19:25:36 sa-8 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Feb 02 19:25:36 sa-8 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Restart nginx] *****************************************************************************************************************************************
Friday 02 February 2024  20:21:01 +0000 (0:00:00.054)       0:00:25.831 *******
changed: [host7]
changed: [host8]

TASK [Run systemctl for check after status command] **********************************************************************************************************
Friday 02 February 2024  20:21:03 +0000 (0:00:01.607)       0:00:27.438 *******
ok: [host8]
ok: [host7]

TASK [Display Nginx service status after] ********************************************************************************************************************
Friday 02 February 2024  20:21:04 +0000 (0:00:01.074)       0:00:28.513 *******
ok: [host7] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Fri 2024-02-02 20:21:03 UTC; 1s ago",
        "       Docs: man:nginx(8)",
        "    Process: 17256 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 17258 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 17259 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 3.1M",
        "        CPU: 29ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─17259 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─17260 nginx: worker process",
        "             └─17261 nginx: worker process",
        "",
        "Feb 02 20:21:03 sa-7 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Feb 02 20:21:03 sa-7 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}
ok: [host8] => {
    "nginx_status.stdout_lines": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Fri 2024-02-02 20:21:03 UTC; 1s ago",
        "       Docs: man:nginx(8)",
        "    Process: 17151 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 17153 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 17154 (nginx)",
        "      Tasks: 3 (limit: 463850)",
        "     Memory: 3.1M",
        "        CPU: 25ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─17154 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─17155 nginx: worker process",
        "             └─17156 nginx: worker process",
        "",
        "Feb 02 20:21:03 sa-8 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Feb 02 20:21:03 sa-8 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Check sites] *******************************************************************************************************************************************
Friday 02 February 2024  20:21:04 +0000 (0:00:00.052)       0:00:28.566 *******
ok: [host8] => (item=site1)
ok: [host7] => (item=site1)
ok: [host8] => (item=site2)
ok: [host7] => (item=site2)

TASK [Message results] ***************************************************************************************************************************************
Friday 02 February 2024  20:21:07 +0000 (0:00:02.398)       0:00:30.964 *******
ok: [host7] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: sa-7</p>\n    <p>FQDN: sa-7.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://site1', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Fri, 02 Feb 2024 20:21:05 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Fri, 02 Feb 2024 20:20:51 GMT', 'connection': 'close', 'etag': '"65bd4ea3-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site1', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'site1', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: sa-7</p>\n    <p>FQDN: sa-7.it-academy.local</p>\n</body>\n</html>\n"
}
ok: [host7] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: sa-7</p>\n    <p>FQDN: sa-7.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://site2', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Fri, 02 Feb 2024 20:21:06 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Fri, 02 Feb 2024 20:20:53 GMT', 'connection': 'close', 'etag': '"65bd4ea5-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site2', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'site2', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: sa-7</p>\n    <p>FQDN: sa-7.it-academy.local</p>\n</body>\n</html>\n"
}
ok: [host8] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: sa-8</p>\n    <p>FQDN: sa-8.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://site1', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Fri, 02 Feb 2024 20:21:05 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Fri, 02 Feb 2024 20:20:51 GMT', 'connection': 'close', 'etag': '"65bd4ea3-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site1', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'site1', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site one</title>\n</head>\n<body>\n    <h1>Hello from Site one</h1>\n    <p>Host name: sa-8</p>\n    <p>FQDN: sa-8.it-academy.local</p>\n</body>\n</html>\n"
}
ok: [host8] => (item={'content': '<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: sa-8</p>\n    <p>FQDN: sa-8.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://site2', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Fri, 02 Feb 2024 20:21:06 GMT', 'content_type': 'text/html', 'content_length': '188', 'last_modified': 'Fri, 02 Feb 2024 20:20:53 GMT', 'connection': 'close', 'etag': '"65bd4ea5-bc"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (188 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://site2', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'site2', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html>\n<head>\n    <title>Site two</title>\n</head>\n<body>\n    <h1>Hello from Site two</h1>\n    <p>Host name: sa-8</p>\n    <p>FQDN: sa-8.it-academy.local</p>\n</body>\n</html>\n"
}

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=15   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host8                      : ok=15   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Friday 02 February 2024  20:21:07 +0000 (0:00:00.133)       0:00:31.097 *******
===============================================================================
Using html -------------------------------------------------------------------------------------------------------------------------------------------- 4.34s
Template config for nginx ----------------------------------------------------------------------------------------------------------------------------- 3.94s
Add sites to hosts ------------------------------------------------------------------------------------------------------------------------------------ 3.78s
Run systemctl for check before status command --------------------------------------------------------------------------------------------------------- 2.99s
Update app list --------------------------------------------------------------------------------------------------------------------------------------- 2.64s
Check sites ------------------------------------------------------------------------------------------------------------------------------------------- 2.40s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.35s
Create directory for vhost ---------------------------------------------------------------------------------------------------------------------------- 2.23s
Link config in nginx settings ------------------------------------------------------------------------------------------------------------------------- 2.20s
Restart nginx ----------------------------------------------------------------------------------------------------------------------------------------- 1.61s
Check existence nginx --------------------------------------------------------------------------------------------------------------------------------- 1.22s
Run systemctl for check after status command ---------------------------------------------------------------------------------------------------------- 1.08s
Message results --------------------------------------------------------------------------------------------------------------------------------------- 0.13s
Install nginx ----------------------------------------------------------------------------------------------------------------------------------------- 0.06s
Display Nginx service status before ------------------------------------------------------------------------------------------------------------------- 0.05s
Display Nginx service status after -------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 31 seconds
```