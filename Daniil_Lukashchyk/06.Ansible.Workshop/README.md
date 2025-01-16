# Ansible Workshop

## Inventory file - inv.yaml
```yaml
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    sites:
      ansible_host: 192.168.202.23
```
## Playbook file - install_nginx.yaml
```yaml
- name: Install Nginx web-servers
  hosts: sites
  become: true
  vars:
    virtualhosts:
      - name: lukashchyk1
        server_name: www.lukashchyk1.com
        url: http://www.lukashchyk1.com
        document_root: /var/www/lukashchyk1
      - name: lukashchyk2
        server_name: www.lukashchyk2.com
        url: http://www.lukashchyk2.com
        document_root: /var/www/lukashchyk2

  tasks:
    - name: Install Nginx web server
      apt:
        name: nginx
        state: present

    - name: Create virtualhost directories
      file:
        path: "{{ item.document_root }}"
        state: directory
      with_items: "{{ virtualhosts }}"

    - name: Configure Nginx virtualhosts
      template:
        src: templates/nginx_site.conf.j2
        dest: /etc/nginx/sites-available/{{ item.name }}
      with_items: "{{ virtualhosts }}"

    - name: Enable virtualhosts
      file:
        src: /etc/nginx/sites-available/{{ item.name }}
        dest: /etc/nginx/sites-enabled/{{ item.name }}
        state: link
      with_items: "{{ virtualhosts }}"

    - name: Create index.html for virtualhosts
      template:
        src: temlates/index.html.j2
        dest: "{{ item.document_root }}/index.html"
      with_items: "{{ virtualhosts }}"

    - name: Add sites to /etc/hosts
      lineinfile:
        path: /etc/hosts
        line: "{{ ansible_default_ipv4.address }} {{ item.url }}"
        state: present
      loop: "{{ virtualhosts }}"

    - name: Restart Nginx service
      service:
        name: nginx
        state: restarted
    - name: Print virtual hosts content
      uri:
        url: "{{ item.url }}"
        return_content: yes
      register: result
      with_items: "{{ virtualhosts }}"
      failed_when: result.status != 200
    - debug:
        msg: "{{ item.content }}"
      with_items: "{{ result.results }}"
```

## FIle nginx_site.conf.j2
```
server {
  listen 80;
  server_name {{ item.server_name }};
  root {{ item.document_root }};

  location / {
    index index.html;
  }
}
```

## File index.html.j2
```html
<html>
<head>
  <title>{{ item.name }}</title>
</head>
<body>
  <h1>Hello from {{ ansible_hostname }}!</h1>
  <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```

### Result

```shell
burpee@burpee:~/06.Ansible.Workshop$ ansible-playbook -i inv.yaml install_nginx.yaml -u root

PLAY [Install Nginx web-servers] *******************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************
Понедельник 13 января 2025  16:29:21 +0300 (0:00:00.007)       0:00:00.007 **** 
ok: [sites]

TASK [Install Nginx web server] ********************************************************************************************************************************
Понедельник 13 января 2025  16:29:24 +0300 (0:00:03.031)       0:00:03.039 **** 
ok: [sites]

TASK [Create virtualhost directories] **************************************************************************************************************************
Понедельник 13 января 2025  16:29:26 +0300 (0:00:01.675)       0:00:04.715 **** 
ok: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
ok: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [Configure Nginx virtualhosts] ****************************************************************************************************************************
Понедельник 13 января 2025  16:29:28 +0300 (0:00:01.745)       0:00:06.461 **** 
ok: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
ok: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [Enable virtualhosts] *************************************************************************************************************************************
Понедельник 13 января 2025  16:29:31 +0300 (0:00:02.783)       0:00:09.244 **** 
ok: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
ok: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [Create index.html for virtualhosts] **********************************************************************************************************************
Понедельник 13 января 2025  16:29:32 +0300 (0:00:01.689)       0:00:10.934 **** 
ok: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
ok: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [Add sites to /etc/hosts] *********************************************************************************************************************************
Понедельник 13 января 2025  16:29:35 +0300 (0:00:02.684)       0:00:13.618 **** 
changed: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
changed: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [Restart Nginx service] ***********************************************************************************************************************************
Понедельник 13 января 2025  16:29:37 +0300 (0:00:01.710)       0:00:15.329 **** 
changed: [sites]

TASK [Print virtual hosts content] *****************************************************************************************************************************
Понедельник 13 января 2025  16:29:38 +0300 (0:00:01.357)       0:00:16.687 **** 
ok: [sites] => (item={'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'})
ok: [sites] => (item={'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'})

TASK [debug] ***************************************************************************************************************************************************
Понедельник 13 января 2025  16:29:40 +0300 (0:00:01.855)       0:00:18.542 **** 
ok: [sites] => (item={'content': '<html>\n<head>\n  <title>lukashchyk1</title>\n</head>\n<body>\n  <h1>Hello from sa-23!</h1>\n  <p>FQDN: sa-23.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://www.lukashchyk1.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Mon, 13 Jan 2025 13:29:39 GMT', 'content_type': 'text/html', 'content_length': '141', 'last_modified': 'Mon, 13 Jan 2025 13:09:27 GMT', 'connection': 'close', 'etag': '"67851087-8d"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (141 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://www.lukashchyk1.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': {'name': 'lukashchyk1', 'server_name': 'www.lukashchyk1.com', 'url': 'http://www.lukashchyk1.com', 'document_root': '/var/www/lukashchyk1'}, 'ansible_loop_var': 'item'}) => {
    "msg": "<html>\n<head>\n  <title>lukashchyk1</title>\n</head>\n<body>\n  <h1>Hello from sa-23!</h1>\n  <p>FQDN: sa-23.it-academy.local</p>\n</body>\n</html>\n"
}
ok: [sites] => (item={'content': '<html>\n<head>\n  <title>lukashchyk2</title>\n</head>\n<body>\n  <h1>Hello from sa-23!</h1>\n  <p>FQDN: sa-23.it-academy.local</p>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://www.lukashchyk2.com', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Mon, 13 Jan 2025 13:29:40 GMT', 'content_type': 'text/html', 'content_length': '141', 'last_modified': 'Mon, 13 Jan 2025 13:09:29 GMT', 'connection': 'close', 'etag': '"67851089-8d"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (141 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://www.lukashchyk2.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': {'name': 'lukashchyk2', 'server_name': 'www.lukashchyk2.com', 'url': 'http://www.lukashchyk2.com', 'document_root': '/var/www/lukashchyk2'}, 'ansible_loop_var': 'item'}) => {
    "msg": "<html>\n<head>\n  <title>lukashchyk2</title>\n</head>\n<body>\n  <h1>Hello from sa-23!</h1>\n  <p>FQDN: sa-23.it-academy.local</p>\n</body>\n</html>\n"
}

PLAY RECAP *****************************************************************************************************************************************************
sites                      : ok=10   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Понедельник 13 января 2025  16:29:40 +0300 (0:00:00.081)       0:00:18.624 **** 
=============================================================================== 
Gathering Facts ----------------------------------------------------------------------------------------------------------------------------------------- 3.03s
Configure Nginx virtualhosts ---------------------------------------------------------------------------------------------------------------------------- 2.78s
Create index.html for virtualhosts ---------------------------------------------------------------------------------------------------------------------- 2.68s
Print virtual hosts content ----------------------------------------------------------------------------------------------------------------------------- 1.86s
Create virtualhost directories -------------------------------------------------------------------------------------------------------------------------- 1.75s
Add sites to /etc/hosts --------------------------------------------------------------------------------------------------------------------------------- 1.71s
Enable virtualhosts ------------------------------------------------------------------------------------------------------------------------------------- 1.69s
Install Nginx web server -------------------------------------------------------------------------------------------------------------------------------- 1.68s
Restart Nginx service ----------------------------------------------------------------------------------------------------------------------------------- 1.36s
debug --------------------------------------------------------------------------------------------------------------------------------------------------- 0.08s
Playbook run took 0 days, 0 hours, 0 minutes, 18 seconds
```
