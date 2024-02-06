## 06.Ansible.Workshop

---

### 1. Configuration Management

---

- Choose a web server software (e.g., Nginx) for configuration management. 
  
    `Nginx`


- Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates).

    ```yaml
    # Install
    
    - name: Check if Nginx configuration directory exists
      stat:
        path: /etc/nginx
      register: nginx_config
      tags: installation
    
    - name: Install Nginx
      apt:
        name: nginx
        state: present
      when: not nginx_config.stat.exists
      tags: installation
    
    - name: Ensure Nginx is enabled
      service:
        name: nginx
        state: started
        enabled: yes
      tags: installation
    ```
    
    ```yaml
    # Configure Nginx virtual hosts
    
    - name: Upload Nginx template config
      template:
        src: ../templates/nginx_static_site.conf.j2
        dest: "/etc/nginx/sites-available/{{ item }}"
      loop: "{{ site_name }}"
      tags: deployment

    - name: Make virtual hosts enabled
      file:
        src: "/etc/nginx/sites-available/{{ item }}"
        dest: "/etc/nginx/sites-enabled/{{ item }}"
        state: link
      loop: "{{ site_name }}"
      tags: deployment
  
    - name: Add virtual hosts to /etc/hosts
      lineinfile:
        path: /etc/hosts
        line: "127.0.0.1 {{ item }}"
        state: present
      loop: "{{ site_name }}"
      tags: nginx  
    ```
  
    `Nginx configuration template`

    ```
    server {
        listen 80;
        server_name {{ item }};
        root /var/www/{{ item }};
        index index.html;
    
        location / {
            try_files $uri $uri/ =404;
        }
    }
    ```

- Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost.

    ```yaml
    # Prepare directories for sites
    
    - name: Create html files directory
      file:
        path: "/var/www/{{ item }}"
        state: directory
      loop: "{{ site_name }}"
      tags: deployment
    ```
    
    ```yaml
    # Generate html files from template and move to prepared directories
    
    - name: Create HTML files for virtual hosts
      template:
        src: ../templates/host_details_site.html.j2
        dest: "/var/www/{{ item }}/index.html"
      loop: "{{ site_name }}"
      tags: deployment
    ```

    ```html
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>{{ item }}</title>
    </head>
    <body>
        <h1>Hostname is {{ ansible_hostname }}</h1>
        <h2>This is the {{ item }} hosted on {{ ansible_fqdn }}.</h2>
    </body>
    </html>
    ```
  
- Run the playbook and ensure the web server is installed, configured, and serving the HTML file.
    
    ```bash
    ansible-playbook -i inventories/main.yaml playbooks/deploy_nginx.yaml -u root
    ```
    
    ```bash
    # Playbook logs
  
    PLAY [Deploy Nginx Sites] ***********************************************************************************************************************************************************************************
    
    TASK [Gathering Facts] **************************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:43 +0300 (0:00:00.008)       0:00:00.008 *******
    ok: [host3]
    
    TASK [Check if Nginx configuration directory exists] ********************************************************************************************************************************************************
    Monday 05 February 2024  01:06:44 +0300 (0:00:01.317)       0:00:01.326 *******
    ok: [host3]
    
    TASK [Install Nginx] ****************************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:45 +0300 (0:00:00.434)       0:00:01.761 *******
    skipping: [host3]
    
    TASK [Ensure Nginx is enabled] ******************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:45 +0300 (0:00:00.016)       0:00:01.778 *******
    ok: [host3]
    
    TASK [Create html files directory] **************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:45 +0300 (0:00:00.671)       0:00:02.449 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Upload Nginx template config] *************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:46 +0300 (0:00:00.848)       0:00:03.297 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Create HTML files for virtual hosts] ******************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:48 +0300 (0:00:01.383)       0:00:04.681 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Make virtual hosts enabled] ***************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:49 +0300 (0:00:01.372)       0:00:06.054 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Add virtual hosts to /etc/hosts] **********************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:50 +0300 (0:00:00.765)       0:00:06.819 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Restart nginx] ****************************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:51 +0300 (0:00:00.791)       0:00:07.611 *******
    changed: [host3]
    
    TASK [Ping virtual hosts] ***********************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:51 +0300 (0:00:00.655)       0:00:08.266 *******
    ok: [host3] => (item=first_site)
    ok: [host3] => (item=second_site)
    
    TASK [Debug virtual hosts] **********************************************************************************************************************************************************************************
    Monday 05 February 2024  01:06:52 +0300 (0:00:01.018)       0:00:09.285 *******
    ok: [host3] => (item={'content': '<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n    <title>first_site</title>\n</head>\n<body>\n    <h1>Hostname is sa-3</h1>\n    <h2>This is the first_site hosted on sa-3.it-academy.local.</h2>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://first_site/index.html', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Sun, 04 Feb 2024 22:06:52 GMT', 'content_type': 'text/html', 'content_length': '227', 'last_modified': 'Sun, 04 Feb 2024 22:06:09 GMT', 'connection': 'close', 'etag': '"65c00a51-e3"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (227 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://first_site/index.html', 'status_code': [200], 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': 'first_site', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>first_site</title>\n</head>\n<body>\n    <h1>Hostname is sa-3</h1>\n    <h2>This is the first_site hosted on sa-3.it-academy.local.</h2>\n</body>\n</html>\n"
    }
    ok: [host3] => (item={'content': '<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n    <title>second_site</title>\n</head>\n<body>\n    <h1>Hostname is sa-3</h1>\n    <h2>This is the second_site hosted on sa-3.it-academy.local.</h2>\n</body>\n</html>\n', 'redirected': False, 'url': 'http://second_site/index.html', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Sun, 04 Feb 2024 22:06:52 GMT', 'content_type': 'text/html', 'content_length': '229', 'last_modified': 'Sun, 04 Feb 2024 22:06:10 GMT', 'connection': 'close', 'etag': '"65c00a52-e5"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (229 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://second_site/index.html', 'status_code': [200], 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'item': 'second_site', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>second_site</title>\n</head>\n<body>\n    <h1>Hostname is sa-3</h1>\n    <h2>This is the second_site hosted on sa-3.it-academy.local.</h2>\n</body>\n</html>\n"
    }
    
    PLAY RECAP **************************************************************************************************************************************************************************************************
    host3                      : ok=11   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
    
    Monday 05 February 2024  01:06:52 +0300 (0:00:00.044)       0:00:09.330 *******
    =============================================================================== 
    Upload Nginx template config ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.38s
    Create HTML files for virtual hosts ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.37s
    Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.32s
    Ping virtual hosts ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.02s
    Create html files directory -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.85s
    Add virtual hosts to /etc/hosts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.79s
    Make virtual hosts enabled --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.77s
    Ensure Nginx is enabled ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.67s
    Restart nginx ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.66s
    Check if Nginx configuration directory exists -------------------------------------------------------------------------------------------------------------------------------------------------------- 0.43s
    Debug virtual hosts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.04s
    Install Nginx ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.02s
    Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds
    ```
