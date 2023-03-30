# 06. Ansible Workshop

## playbook for nginx installation
```yaml

- name: Install and configure Nginx with virtual hosts
  hosts: web_all
  vars:
    app_packages:
      - nginx
    virtual_hosts:
      - name: "site1.com"
        server_name: "site1.com"
        path_site: "/var/www/site1.com"
      - name: "site2.com"
        server_name: "site2.com"
        path_site: "/var/www/site2.com"  
  tasks:
    - name: Create virtual hosts directories
      file:
        path: "{{ item.path_site }}"
        state: directory
      loop: "{{ virtual_hosts }}"
    - name: Install packages
      apt:
        name: "{{ app_packages }}"
        state: latest
        update_cache: yes
      environment:
        DEBIAN_FRONTEND: noninteractive
      tags:
        - install
    - name: Create index.html files with unique data for each virtual host
      template:
        src: templates/index.html.j2
        dest: "{{ item.path_site}}/index.html"
        owner: root
        group: root
        mode: '0755'
      loop: "{{ virtual_hosts }}"
      tags:
       - index
    - name: Create virtual host configs from template
      template:
        src: templates/virtualhost.conf.j2
        dest: /etc/nginx/sites-available/{{item.name}}
        mode: '0755'
      loop: "{{virtual_hosts}}"
      tags:
        - config
    - name: Enable sites
      file:
        src: /etc/nginx/sites-available/{{ item.server_name}}
        dest: /etc/nginx/sites-enabled/{{ item.server_name }}
        state: link
      loop: "{{virtual_hosts }}"
    - name: Add sites to file hosts
      shell: |
        grep -q "{{item.name}}" /etc/hosts || echo "127.0.0.1 {{item.name}}" >> /etc/hosts;
      loop:
        "{{virtual_hosts}}"
      tags:
        - hosts

    - name: Restart nginx
      service:
        name: nginx
        state: restarted
    - name: Check that you can connect (GET) to a page and it returns a status 200
      uri:
        url: http://{{ item.name }}
        return_content: true
      loop: "{{ virtual_hosts }}"

```
## Templates
### index.html
```html
<!DOCTYPE html>
<html>
<head>
	<title>{{ virtual_hosts }} - {{ ansible_fqdn }}</title>
</head>
<body>
	<h1>Welcome to {{ virtual_hosts }}!</h1>
	<p>This is {{ ansible_fqdn }}.</p>
</body>
</html>

```
### The configuration file

```
server {
    listen 80;
    server_name {{item.server_name}};
    root {{ item.path_site }};
    index index.html;
}

```

## Result

```

PLAY [Install and configure Nginx with virtual hosts] **************************

TASK [Gathering Facts] *********************************************************
Thursday 30 March 2023  19:07:10 +0000 (0:00:00.028)       0:00:00.028 ******** 
ok: [host10]
ok: [host9]

TASK [Create virtual hosts directories] ****************************************
Thursday 30 March 2023  19:07:13 +0000 (0:00:03.399)       0:00:03.428 ******** 
changed: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
changed: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

TASK [Install packages] ********************************************************
Thursday 30 March 2023  19:07:16 +0000 (0:00:02.602)       0:00:06.030 ******** 
ok: [host9]
ok: [host10]

TASK [Create index.html files with unique data for each virtual host] **********
Thursday 30 March 2023  19:07:19 +0000 (0:00:03.180)       0:00:09.210 ******** 
changed: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
changed: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

TASK [Create virtual host configs from template] *******************************
Thursday 30 March 2023  19:07:24 +0000 (0:00:04.469)       0:00:13.680 ******** 
changed: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
changed: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

TASK [Enable sites] ************************************************************
Thursday 30 March 2023  19:07:27 +0000 (0:00:03.461)       0:00:17.141 ******** 
ok: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
ok: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
ok: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
ok: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

TASK [Input hosts in html] *****************************************************
Thursday 30 March 2023  19:07:29 +0000 (0:00:01.761)       0:00:18.903 ******** 
changed: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
changed: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
changed: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

TASK [Restart nginx] ***********************************************************
Thursday 30 March 2023  19:07:31 +0000 (0:00:02.158)       0:00:21.061 ******** 
changed: [host9]
changed: [host10]

TASK [Check that you can connect (GET) to a page and it returns a status 200] ***
Thursday 30 March 2023  19:07:33 +0000 (0:00:01.818)       0:00:22.880 ******** 
ok: [host10] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
ok: [host9] => (item={'name': 'site1.com', 'server_name': 'site1.com', 'path_site': '/var/www/site1.com'})
ok: [host9] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})
ok: [host10] => (item={'name': 'site2.com', 'server_name': 'site2.com', 'path_site': '/var/www/site2.com'})

PLAY RECAP *********************************************************************
host10                     : ok=9    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host9                      : ok=9    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 30 March 2023  19:07:35 +0000 (0:00:02.308)       0:00:25.189 ******** 
=============================================================================== 
Create index.html files with unique data for each virtual host ---------- 4.47s
Create virtual host configs from template ------------------------------- 3.46s
Gathering Facts --------------------------------------------------------- 3.40s
Install packages -------------------------------------------------------- 3.18s
Create virtual hosts directories ---------------------------------------- 2.60s
Check that you can connect (GET) to a page and it returns a status 200 --- 2.31s
Input hosts in html ----------------------------------------------------- 2.16s
Restart nginx ----------------------------------------------------------- 1.82s
Enable sites ------------------------------------------------------------ 1.76s
Playbook run took 0 days, 0 hours, 0 minutes, 25 seconds

```