## 06.AnsibleWorkshop

### nginx_vhost.j2

```bash
server {
    listen 80;
    server_name {{ item.hostname }};

    root {{ item.document_root }};
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### index.html.j2

```bash 
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to {{ item.hostname }}</title>
</head>
<body>
    <h1>Welcome to {{ item.hostname }}</h1>
    <p>Hostname: {{ item.hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```


### nginx_playbook.yml

```bash 
---
- name: Install and configure Nginx web server
  hosts: all_workers
  become: yes
  vars:
    vhosts:
      - hostname: host1.agd.com
        document_root: /var/www/vhost1
      - hostname: host2.agd.com
        document_root: /var/www/vhost2
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Create document roots for virtual hosts
      file:
        path: "{{ item.document_root }}"
        state: directory
      loop: "{{ vhosts }}"

    - name: Create virtual host configuration files
      template:
        src: nginx_vhost.j2
        dest: "/etc/nginx/sites-available/{{ item.hostname }}"
      loop: "{{ vhosts }}"

    - name: Enable virtual hosts
      file:
        src: "/etc/nginx/sites-available/{{ item.hostname }}"
        dest: "/etc/nginx/sites-enabled/{{ item.hostname }}"
        state: link
      loop: "{{ vhosts }}"
      notify: Restart Nginx

    - name: Create HTML files for virtual hosts
      template:
        src: index.html.j2
        dest: "{{ item.document_root }}/index.html"
      loop: "{{ vhosts }}"

    - name: Check Nginx availability on remote hosts
      uri:
        url: "http://{{ item.hostname }}"
        return_content: yes
      loop: "{{ vhosts }}"
      register: result

    - name: Debug content of the pages
      debug:
        msg: "Host: {{ result_item.item.hostname }} - Status: {{ result_item.status }}"
      loop: "{{ result.results }}"
      loop_control:
        loop_var: result_item

  handlers:
    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
```


### Result nginx_playbook 

```bash
> ansible-playbook -i inv.yaml nginx_playbook.yml -u root --ask-pass
SSH password: 

PLAY [Install and configure Nginx web server] ************************************************************************

TASK [Gathering Facts] ***********************************************************************************************
Thursday 02 January 2025  07:46:43 +0000 (0:00:00.009)       0:00:00.009 ****** 
ok: [host6]
ok: [host5]

TASK [Install Nginx] *************************************************************************************************
Thursday 02 January 2025  07:46:48 +0000 (0:00:04.345)       0:00:04.355 ****** 
ok: [host6]
ok: [host5]

TASK [Create document roots for virtual hosts] ***********************************************************************
Thursday 02 January 2025  07:46:52 +0000 (0:00:04.103)       0:00:08.458 ****** 
ok: [host6] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host5] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host6] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})
ok: [host5] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})

TASK [Create virtual host configuration files] ***********************************************************************
Thursday 02 January 2025  07:46:58 +0000 (0:00:06.711)       0:00:15.170 ****** 
ok: [host5] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host6] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host5] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})
ok: [host6] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})

TASK [Enable virtual hosts] ******************************************************************************************
Thursday 02 January 2025  07:47:08 +0000 (0:00:09.978)       0:00:25.149 ****** 
ok: [host5] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host6] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host5] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})
ok: [host6] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})

TASK [Create HTML files for virtual hosts] ***************************************************************************
Thursday 02 January 2025  07:47:15 +0000 (0:00:06.441)       0:00:31.590 ****** 
ok: [host5] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host6] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host5] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})
ok: [host6] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})

TASK [Check Nginx availability on remote hosts] **********************************************************************
Thursday 02 January 2025  07:47:25 +0000 (0:00:09.952)       0:00:41.542 ****** 
ok: [host6] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host5] => (item={'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'})
ok: [host6] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})
ok: [host5] => (item={'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'})

TASK [Debug content of the pages] ************************************************************************************
Thursday 02 January 2025  07:47:34 +0000 (0:00:09.066)       0:00:50.608 ****** 
ok: [host5] => (item={'content': '<html>\n<head>\n\t<title>Topic Related Searching at AGD.COM.</title>\n\t<meta name="keywords" content="all good domain, agd, sponsored searching, sponsored search results, search engine, topic related searching, trs" />\n\t<meta name="description" content="The All Good Domain - Topic Related Searching (TRS)" />\n\t<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />\n\t<meta name="robots" content="all" />\n</head>\n\n<BODY bgcolor="FFFFFF" scroll="auto" topmargin="10" leftmargin="10" LINK="FF0000" VLINK="000000" ALINK="000000" MARGINWIDTH="0" MARGINHEIGHT="0">\n<table width="100%"  border="0" cellspacing="0" cellpadding="0">\n\t<td valign="top" bgcolor="#FFFFFF" width="100%"><center><img src="agd.png" height="72" width="550" border="0"></center></td>\n  </tr>\n</table>\n</body>\n</html>', 'redirected': True, 'url': 'http://www.i5.com/agd/', 'status': 200, 'date': 'Thu, 02 Jan 2025 07:47:29 GMT', 'server': 'Apache', 'upgrade': 'h2,h2c', 'connection': 'Upgrade, close', 'last_modified': 'Thu, 19 Nov 2020 23:24:26 GMT', 'etag': '"1720442-31e-5b47e075d7e80"', 'accept_ranges': 'bytes', 'content_length': '798', 'vary': 'Accept-Encoding', 'content_type': 'text/html', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (798 bytes)', 'elapsed': 1, 'changed': False, 'invocation': {'module_args': {'url': 'http://host1.agd.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Host: host1.agd.com - Status: 200"
}
ok: [host5] => (item={'content': '<html>\n<head>\n\t<title>Topic Related Searching at AGD.COM.</title>\n\t<meta name="keywords" content="all good domain, agd, sponsored searching, sponsored search results, search engine, topic related searching, trs" />\n\t<meta name="description" content="The All Good Domain - Topic Related Searching (TRS)" />\n\t<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />\n\t<meta name="robots" content="all" />\n</head>\n\n<BODY bgcolor="FFFFFF" scroll="auto" topmargin="10" leftmargin="10" LINK="FF0000" VLINK="000000" ALINK="000000" MARGINWIDTH="0" MARGINHEIGHT="0">\n<table width="100%"  border="0" cellspacing="0" cellpadding="0">\n\t<td valign="top" bgcolor="#FFFFFF" width="100%"><center><img src="agd.png" height="72" width="550" border="0"></center></td>\n  </tr>\n</table>\n</body>\n</html>', 'redirected': True, 'url': 'http://www.i5.com/agd/', 'status': 200, 'date': 'Thu, 02 Jan 2025 07:47:33 GMT', 'server': 'Apache', 'upgrade': 'h2,h2c', 'connection': 'Upgrade, close', 'last_modified': 'Thu, 19 Nov 2020 23:24:26 GMT', 'etag': '"1720442-31e-5b47e075d7e80"', 'accept_ranges': 'bytes', 'content_length': '798', 'vary': 'Accept-Encoding', 'content_type': 'text/html', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (798 bytes)', 'elapsed': 1, 'changed': False, 'invocation': {'module_args': {'url': 'http://host2.agd.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Host: host2.agd.com - Status: 200"
}
ok: [host6] => (item={'content': '<html>\n<head>\n\t<title>Topic Related Searching at AGD.COM.</title>\n\t<meta name="keywords" content="all good domain, agd, sponsored searching, sponsored search results, search engine, topic related searching, trs" />\n\t<meta name="description" content="The All Good Domain - Topic Related Searching (TRS)" />\n\t<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />\n\t<meta name="robots" content="all" />\n</head>\n\n<BODY bgcolor="FFFFFF" scroll="auto" topmargin="10" leftmargin="10" LINK="FF0000" VLINK="000000" ALINK="000000" MARGINWIDTH="0" MARGINHEIGHT="0">\n<table width="100%"  border="0" cellspacing="0" cellpadding="0">\n\t<td valign="top" bgcolor="#FFFFFF" width="100%"><center><img src="agd.png" height="72" width="550" border="0"></center></td>\n  </tr>\n</table>\n</body>\n</html>', 'redirected': True, 'url': 'http://www.i5.com/agd/', 'status': 200, 'date': 'Thu, 02 Jan 2025 07:47:29 GMT', 'server': 'Apache', 'upgrade': 'h2,h2c', 'connection': 'Upgrade, close', 'last_modified': 'Thu, 19 Nov 2020 23:24:26 GMT', 'etag': '"1720442-31e-5b47e075d7e80"', 'accept_ranges': 'bytes', 'content_length': '798', 'vary': 'Accept-Encoding', 'content_type': 'text/html', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (798 bytes)', 'elapsed': 1, 'changed': False, 'invocation': {'module_args': {'url': 'http://host1.agd.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'host1.agd.com', 'document_root': '/var/www/vhost1'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Host: host1.agd.com - Status: 200"
}
ok: [host6] => (item={'content': '<html>\n<head>\n\t<title>Topic Related Searching at AGD.COM.</title>\n\t<meta name="keywords" content="all good domain, agd, sponsored searching, sponsored search results, search engine, topic related searching, trs" />\n\t<meta name="description" content="The All Good Domain - Topic Related Searching (TRS)" />\n\t<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />\n\t<meta name="robots" content="all" />\n</head>\n\n<BODY bgcolor="FFFFFF" scroll="auto" topmargin="10" leftmargin="10" LINK="FF0000" VLINK="000000" ALINK="000000" MARGINWIDTH="0" MARGINHEIGHT="0">\n<table width="100%"  border="0" cellspacing="0" cellpadding="0">\n\t<td valign="top" bgcolor="#FFFFFF" width="100%"><center><img src="agd.png" height="72" width="550" border="0"></center></td>\n  </tr>\n</table>\n</body>\n</html>', 'redirected': True, 'url': 'http://www.i5.com/agd/', 'status': 200, 'date': 'Thu, 02 Jan 2025 07:47:33 GMT', 'server': 'Apache', 'upgrade': 'h2,h2c', 'connection': 'Upgrade, close', 'last_modified': 'Thu, 19 Nov 2020 23:24:26 GMT', 'etag': '"1720442-31e-5b47e075d7e80"', 'accept_ranges': 'bytes', 'content_length': '798', 'vary': 'Accept-Encoding', 'content_type': 'text/html', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (798 bytes)', 'elapsed': 1, 'changed': False, 'invocation': {'module_args': {'url': 'http://host2.agd.com', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': {'hostname': 'host2.agd.com', 'document_root': '/var/www/vhost2'}, 'ansible_loop_var': 'item'}) => {
    "msg": "Host: host2.agd.com - Status: 200"
}

PLAY RECAP ***********************************************************************************************************
host5                      : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host6                      : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 02 January 2025  07:47:34 +0000 (0:00:00.045)       0:00:50.654 ****** 
=============================================================================== 
Create virtual host configuration files ----------------------------------------------------------------------- 9.98s
Create HTML files for virtual hosts --------------------------------------------------------------------------- 9.95s
Check Nginx availability on remote hosts ---------------------------------------------------------------------- 9.07s
Create document roots for virtual hosts ----------------------------------------------------------------------- 6.71s
Enable virtual hosts ------------------------------------------------------------------------------------------ 6.44s
Gathering Facts ----------------------------------------------------------------------------------------------- 4.35s
Install Nginx ------------------------------------------------------------------------------------------------- 4.10s
Debug content of the pages ------------------------------------------------------------------------------------ 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 50 seconds
```