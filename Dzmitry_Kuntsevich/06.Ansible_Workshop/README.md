#Defining the target host:

##inv.yaml

```yaml
webserver:
  hosts:
    192.168.56.101:
      ansible_user: admin2
      ansible_ssh_private_key_file: ~/.ssh/id_ed25519
```

#Parameters for virtual hosts

##vars.yaml

```yaml
nginx_vhosts:
  - name: site1
    domain: site1.example.com
    port: 80
    root: /var/www/site1
  - name: site2
    domain: site2.example.com
    port: 80
    root: /var/www/site2
```
##templates/site1.conf.j2 (аналогично для site2.conf.j2):

```yaml
server {
    listen {{ item.port }};
    server_name {{ item.domain }};

    root {{ item.root }};
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

##templates/index.html.j2:

```yaml
<!DOCTYPE html>
<html>
<body>
    <h1>Served by Nginx on {{ item.domain }}<h1>
</body>
</html>
```

##playbook.yaml:

```yaml
  hosts: webserver
  become: true
  vars_files:
    - vars.yaml

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: latest
        update_cache: yes

    - name: Create web directories
      file:
        path: "{{ item.root }}"
        state: directory
        mode: 0755
      loop: "{{ nginx_vhosts }}"

    - name: Deploy HTML files
      template:
        src: templates/index.html.j2
        dest: "{{ item.root }}/index.html"
      loop: "{{ nginx_vhosts }}"

    - name: Configure virtual hosts
      template:
        src: "templates/{{ item.name }}.conf.j2"
        dest: "/etc/nginx/sites-available/{{ item.domain }}.conf"
      loop: "{{ nginx_vhosts }}"
      notify: Restart Nginx

    - name: Enable sites
      file:
        src: "/etc/nginx/sites-available/{{ item.domain }}.conf"
        dest: "/etc/nginx/sites-enabled/{{ item.domain }}.conf"
        state: link
      loop: "{{ nginx_vhosts }}"
      notify: Restart Nginx

    - name: Remove default config
      file:
        path: "/etc/nginx/sites-enabled/default"
        state: absent
      notify: Restart Nginx

  handlers:
    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
```

```
admin@Ubuntu-server:~/06.Ansible$ ansible-playbook -i inv.yaml playbook.yaml --ask-become-pass
BECOME password:

PLAY [webserver] ****************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************
ok: [192.168.56.101]

TASK [Install Nginx] ************************************************************************************************
ok: [192.168.56.101]

TASK [Create web directories] ***************************************************************************************
ok: [192.168.56.101] => (item={'name': 'site1', 'domain': 'site1.example.com', 'port': 80, 'root': '/var/www/site1'})
ok: [192.168.56.101] => (item={'name': 'site2', 'domain': 'site2.example.com', 'port': 80, 'root': '/var/www/site2'})

TASK [Deploy HTML files] ********************************************************************************************
ok: [192.168.56.101] => (item={'name': 'site1', 'domain': 'site1.example.com', 'port': 80, 'root': '/var/www/site1'})
ok: [192.168.56.101] => (item={'name': 'site2', 'domain': 'site2.example.com', 'port': 80, 'root': '/var/www/site2'})

TASK [Configure virtual hosts] **************************************************************************************
ok: [192.168.56.101] => (item={'name': 'site1', 'domain': 'site1.example.com', 'port': 80, 'root': '/var/www/site1'})
ok: [192.168.56.101] => (item={'name': 'site2', 'domain': 'site2.example.com', 'port': 80, 'root': '/var/www/site2'})

TASK [Enable sites] *************************************************************************************************
ok: [192.168.56.101] => (item={'name': 'site1', 'domain': 'site1.example.com', 'port': 80, 'root': '/var/www/site1'})
ok: [192.168.56.101] => (item={'name': 'site2', 'domain': 'site2.example.com', 'port': 80, 'root': '/var/www/site2'})

TASK [Remove default config] ****************************************************************************************
ok: [192.168.56.101]

PLAY RECAP **********************************************************************************************************
192.168.56.101             : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

#Checking the operation of sites

##check_websites.yaml

```yaml
  name: Get Website Content
  hosts: localhost
  gather_facts: false
  vars:
    sites_to_check:
      - "http://site1.example.com"
      - "http://site2.example.com"

  tasks:
    - name: Fetch website content
      uri:
        url: "{{ item }}"
        method: GET
        return_content: yes
      register: website_content
      loop: "{{ sites_to_check }}"


    - name: Display website content
      debug:
        var: website_content

```


```
admin@Ubuntu-server:~/06.Ansible$ ansible-playbook check_websites.yaml

PLAY [Get Website Content] ******************************************************************************************

TASK [Fetch website content] ****************************************************************************************
ok: [localhost] => (item=http://site1.example.com)
ok: [localhost] => (item=http://site2.example.com)

TASK [Display website content] **************************************************************************************
ok: [localhost] => {
    "website_content": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<body>\n    <h1>Served by Nginx on site1.example.com<h1>\n</body>\n</html>\n",
                "content_length": "95",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Fri, 11 Jul 2025 14:33:22 GMT",
                "elapsed": 0,
                "etag": "\"68710e26-5f\"",
                "failed": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://site1.example.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "http://site1.example.com",
                "last_modified": "Fri, 11 Jul 2025 13:14:14 GMT",
                "msg": "OK (95 bytes)",
                "redirected": false,
                "server": "nginx/1.24.0 (Ubuntu)",
                "status": 200,
                "url": "http://site1.example.com"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<!DOCTYPE html>\n<html>\n<body>\n    <h1>Served by Nginx on site2.example.com<h1>\n</body>\n</html>\n",
                "content_length": "95",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Fri, 11 Jul 2025 14:33:22 GMT",
                "elapsed": 0,
                "etag": "\"68710e27-5f\"",
                "failed": false,
                "invocation": {
                    "module_args": {
                        "attributes": null,
                        "body": null,
                        "body_format": "raw",
                        "ca_path": null,
                        "ciphers": null,
                        "client_cert": null,
                        "client_key": null,
                        "creates": null,
                        "decompress": true,
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
                        "unredirected_headers": [],
                        "unsafe_writes": false,
                        "url": "http://site2.example.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": "http://site2.example.com",
                "last_modified": "Fri, 11 Jul 2025 13:14:15 GMT",
                "msg": "OK (95 bytes)",
                "redirected": false,
                "server": "nginx/1.24.0 (Ubuntu)",
                "status": 200,
                "url": "http://site2.example.com"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP **********************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
