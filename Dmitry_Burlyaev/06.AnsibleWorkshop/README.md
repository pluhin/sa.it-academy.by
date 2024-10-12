## 06. Ansible Workshop

#Homework Assignment 1: Configuration Management

1.Choose a web server software (e.g., Nginx) for configuration management.

Nginx was selected as web server selected

2.Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates).

- name: Install Nginx using ansible
  hosts: webservers
  become: true
- hosts: mysql
  tasks:
    - name: install nginx
      ansible.builtin.apt:
        name: nginx
        state: latest
        update_cache: yes
 
    - name: Check version
      shell: |
        htop --version
      register: out

    - debug:
        msg: "{{ out.stdout_lines }}"


3.Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost.
```bush
#NgnixInstall.yaml

- name: Install and configure Nginx web server on all workers
  hosts: db_nginx
  become: yes
  vars:
    virtualhosts:
      - server_name: "example1.com"
        name: "example1.com"
        ip: "127.0.0.1"
        document_root: "/var/www/example1"
        virtual_ip: "0.0.0.0"
      - server_name: "example2.com"
        name: "example1.com"
        ip: "127.0.0.1"
        document_root: "/var/www/example2"
        virtual_ip: "0.0.0.0"

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Ensure Nginx is started and enabled
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Backup existing /etc/hosts file
      command: cp /etc/hosts /etc/hosts.bak
      when: ansible_os_family == "Debian"  # Modify this condition based on your environment
      ignore_errors: yes  # Ignore error if file doesn't exist

    - name: Remove existing /etc/hosts file if it exists
      file:
        path: /etc/hosts
        state: absent
      ignore_errors: yes  # Ignore error if file doesn't exist

    - name: Manage /etc/hosts file Template
      template:
        src: hosts.j2
        dest: /etc/hosts
        owner: root
        group: root
        mode: '0644'

    - name: Ensure the document root directories exist with correct permissions
      file:
        path: "{{ item.document_root }}"
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'
      loop: "{{ virtualhosts }}"

    - name: Create Nginx virtual host configurations
      template:
        src: nginx_vhost.j2
        dest: "/etc/nginx/sites-available/{{ item.server_name }}"
      loop: "{{ virtualhosts }}"
      vars:
        server_name: "{{ item.server_name }}"  # Ensure server_name is correctly defined
        document_root: "{{ item.document_root }}"  # Ensure document_root is correctly passed
        virtual_ip: "{{ item.virtual_ip }}"  # Set virtual IP from the item

    - name: Enable virtual hosts by symlinking to sites-enabled
      file:
        src: "/etc/nginx/sites-available/{{ item.server_name }}"
        dest: "/etc/nginx/sites-enabled/{{ item.server_name }}"
        state: link
        force: yes
      loop: "{{ virtualhosts }}"

    - name: Remove default Nginx configuration (optional, ensures no conflicts)
      file:
        path: "/etc/nginx/sites-enabled/default"
        state: absent
        force: yes

    - name: Deploy HTML files with correct ownership and permissions
      template:
        src: index.html.j2
        dest: "{{ item.document_root }}/index.html"
        owner: www-data
        group: www-data
        mode: '0644'
      loop: "{{ virtualhosts }}"
    - name: Test Nginx configuration
      command: nginx -t
      register: nginx_test  # No need for failed_when, Nginx will return a non-zero rc on failure

    - name: Reload Nginx to apply new configuration
      service:
        name: nginx
        state: reloaded

    - name: Wait for Nginx to be fully reloaded
      wait_for:
        port: 80
        state: started
        delay: 5

    - name: Check content on site pages for each virtual host
      uri:
        url: "http://{{ item.server_name }}"
      register: check_example
      loop: "{{ virtualhosts }}"

    - name: Debug output of site checks
      debug:
        var: check_example
```

# inv.yaml

```bush
invNginx.yaml
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    mysql:
      ansible_host: 192.168.201.2

db_nginx:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    Nginx:
      ansible_host: 192.168.202.3
      virtual_ips:
         - 192.168.1.102
         - 192.168.1.103


all_workers:
  children:
    work_sa:
      hosts:
        host03:
          ansible_host: 192.168.202.3
          virtual_ip: 192.168.1.100
        host04:
          ansible_host: 192.168.202.4
          virtual_ip: 192.168.1.101

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

# ansible.cfg
```bush
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

# HTML Template

```bush
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ item.server_name }}</title>
</head>
<body>
    <h1>Welcome to {{ item.server_name }}</h1>
    <p>This page is served from host: {{ ansible_hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>

```
# Nginx Virtual Host Template
```bush
server {
    listen {{ virtual_ip }}:80;
    server_name {{ server_name }} www.{{ server_name }};

    root {{ document_root }};
    index index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    error_page 404 /404.html;

    location = /404.html {
        internal;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        internal;
    }

    # Deny access to hidden files
    location ~ /\. {
        deny all;
    }
}
```
#

# hosts.j2
```bush
### Ansible managed
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.3 sa-3.it-academy.local sa-3
# --- END PVE ---

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

{% if virtualhosts is defined %}
{% for var in virtualhosts %}
{{ var.ip }}   {{ var.server_name }}  # Redirecting to localhost
{% endfor %}
{% endif %}

##{% if virtualhosts is defined %}
##{% for var in virtualhosts %}
##{{ var.ip }}   {{ var.name }}
##127.0.0.1   example1.com  # Redirecting to localhost
##127.0.0.1   example2.com  # Redirecting to localhost
##{% endfor %}
##{% endif %}
```

4.Run the playbook and ensure the web server is installed, configured, and serving the HTML file.
```bush
[vboxuser3@VM3 06.Ansible.workshop]$ ansible-playbook -i invNginx.yaml NgnixInstall.yaml -u root

PLAY [Install and configure Nginx web server on all workers] *************************************************

TASK [Gathering Facts] ***************************************************************************************
Thursday 10 October 2024  22:01:53 +0300 (0:00:00.006)       0:00:00.006 ******
ok: [Nginx]

TASK [Install Nginx] *****************************************************************************************
Thursday 10 October 2024  22:01:58 +0300 (0:00:04.598)       0:00:04.605 ******
ok: [Nginx]

TASK [Ensure Nginx is started and enabled] *******************************************************************
Thursday 10 October 2024  22:02:01 +0300 (0:00:03.275)       0:00:07.880 ******
ok: [Nginx]

TASK [Backup existing /etc/hosts file] ***********************************************************************
Thursday 10 October 2024  22:02:03 +0300 (0:00:02.103)       0:00:09.983 ******
fatal: [Nginx]: FAILED! => {"changed": true, "cmd": ["cp", "/etc/hosts", "/etc/hosts.bak"], "delta": "0:00:00.003420", "end": "2024-10-10 19:02:05.368617", "msg": "non-zero return code", "rc": 1, "start": "2024-10-10 19:02:05.365197", "stderr": "cp: cannot stat '/etc/hosts': No such file or directory", "stderr_lines": ["cp: cannot stat '/etc/hosts': No such file or directory"], "stdout": "", "stdout_lines": []}
...ignoring

TASK [Remove existing /etc/hosts file if it exists] **********************************************************
Thursday 10 October 2024  22:02:05 +0300 (0:00:01.862)       0:00:11.846 ******
ok: [Nginx]

TASK [Manage /etc/hosts file Template] ***********************************************************************
Thursday 10 October 2024  22:02:07 +0300 (0:00:01.782)       0:00:13.629 ******
changed: [Nginx]

TASK [Ensure the document root directories exist with correct permissions] ***********************************
Thursday 10 October 2024  22:02:11 +0300 (0:00:03.639)       0:00:17.269 ******
ok: [Nginx] => (item={'server_name': 'example1.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example1', 'virtual_ip': '0.0.0.0'})
ok: [Nginx] => (item={'server_name': 'example2.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example2', 'virtual_ip': '0.0.0.0'})

TASK [Create Nginx virtual host configurations] **************************************************************
Thursday 10 October 2024  22:02:14 +0300 (0:00:03.574)       0:00:20.843 ******
ok: [Nginx] => (item={'server_name': 'example1.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example1', 'virtual_ip': '0.0.0.0'})
ok: [Nginx] => (item={'server_name': 'example2.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example2', 'virtual_ip': '0.0.0.0'})

TASK [Enable virtual hosts by symlinking to sites-enabled] ***************************************************
Thursday 10 October 2024  22:02:20 +0300 (0:00:05.768)       0:00:26.612 ******
changed: [Nginx] => (item={'server_name': 'example1.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example1', 'virtual_ip': '0.0.0.0'})
changed: [Nginx] => (item={'server_name': 'example2.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example2', 'virtual_ip': '0.0.0.0'})

TASK [Remove default Nginx configuration (optional, ensures no conflicts)] ***********************************
Thursday 10 October 2024  22:02:24 +0300 (0:00:03.577)       0:00:30.190 ******
ok: [Nginx]

TASK [Deploy HTML files with correct ownership and permissions] **********************************************
Thursday 10 October 2024  22:02:25 +0300 (0:00:01.757)       0:00:31.947 ******
changed: [Nginx] => (item={'server_name': 'example1.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example1', 'virtual_ip': '0.0.0.0'})
changed: [Nginx] => (item={'server_name': 'example2.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example2', 'virtual_ip': '0.0.0.0'})

TASK [Test Nginx configuration] ******************************************************************************
Thursday 10 October 2024  22:02:32 +0300 (0:00:07.066)       0:00:39.014 ******
changed: [Nginx]

TASK [Reload Nginx to apply new configuration] ***************************************************************
Thursday 10 October 2024  22:02:34 +0300 (0:00:01.914)       0:00:40.928 ******
changed: [Nginx]

TASK [Wait for Nginx to be fully reloaded] *******************************************************************
Thursday 10 October 2024  22:02:36 +0300 (0:00:01.891)       0:00:42.820 ******
ok: [Nginx]

TASK [Check content on site pages for each virtual host] *****************************************************
Thursday 10 October 2024  22:02:43 +0300 (0:00:06.882)       0:00:49.702 ******
ok: [Nginx] => (item={'server_name': 'example1.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example1', 'virtual_ip': '0.0.0.0'})
ok: [Nginx] => (item={'server_name': 'example2.com', 'name': 'example1.com', 'ip': '127.0.0.1', 'document_root': '/var/www/example2', 'virtual_ip': '0.0.0.0'})

TASK [Debug output of site checks] ***************************************************************************
Thursday 10 October 2024  22:02:47 +0300 (0:00:03.996)       0:00:53.698 ******
ok: [Nginx] => {
    "check_example": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content_length": "311",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 10 Oct 2024 19:02:45 GMT",
                "elapsed": 0,
                "etag": "\"670824c3-137\"",
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
                        "return_content": false,
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
                        "url": "http://example1.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "document_root": "/var/www/example1",
                    "ip": "127.0.0.1",
                    "name": "example1.com",
                    "server_name": "example1.com",
                    "virtual_ip": "0.0.0.0"
                },
                "last_modified": "Thu, 10 Oct 2024 19:02:27 GMT",
                "msg": "OK (311 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://example1.com"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content_length": "311",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Thu, 10 Oct 2024 19:02:47 GMT",
                "elapsed": 0,
                "etag": "\"670824c7-137\"",
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
                        "return_content": false,
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
                        "url": "http://example2.com",
                        "url_password": null,
                        "url_username": null,
                        "use_gssapi": false,
                        "use_netrc": true,
                        "use_proxy": true,
                        "validate_certs": true
                    }
                },
                "item": {
                    "document_root": "/var/www/example2",
                    "ip": "127.0.0.1",
                    "name": "example1.com",
                    "server_name": "example2.com",
                    "virtual_ip": "0.0.0.0"
                },
                "last_modified": "Thu, 10 Oct 2024 19:02:31 GMT",
                "msg": "OK (311 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://example2.com"
            }
        ],
        "skipped": false
    }
}

PLAY RECAP ***************************************************************************************************
Nginx                      : ok=16   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1

Thursday 10 October 2024  22:02:47 +0300 (0:00:00.066)       0:00:53.765 ******
===============================================================================
Deploy HTML files with correct ownership and permissions ---------------------------------------------- 7.07s
Wait for Nginx to be fully reloaded ------------------------------------------------------------------- 6.88s
Create Nginx virtual host configurations -------------------------------------------------------------- 5.77s
Gathering Facts --------------------------------------------------------------------------------------- 4.60s
Check content on site pages for each virtual host ----------------------------------------------------- 4.00s
Manage /etc/hosts file Template ----------------------------------------------------------------------- 3.64s
Enable virtual hosts by symlinking to sites-enabled --------------------------------------------------- 3.58s
Ensure the document root directories exist with correct permissions ----------------------------------- 3.57s
Install Nginx ----------------------------------------------------------------------------------------- 3.28s
Ensure Nginx is started and enabled ------------------------------------------------------------------- 2.10s
Test Nginx configuration ------------------------------------------------------------------------------ 1.91s
Reload Nginx to apply new configuration --------------------------------------------------------------- 1.89s
Backup existing /etc/hosts file ----------------------------------------------------------------------- 1.86s
Remove existing /etc/hosts file if it exists ---------------------------------------------------------- 1.78s
Remove default Nginx configuration (optional, ensures no conflicts) ----------------------------------- 1.76s
Debug output of site checks --------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 53 seconds
```

Your playbook put into folder 06.Ansible Workshop and create file README.md with description and prepare PR (Pull Request)