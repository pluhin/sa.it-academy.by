# 06. AnsibleWorkshop
---
## Create file 'ansible.cfg'
---
```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
---
## Create file 'inventary.yaml'
---
```bash
server:
  vars:
    ansible_user: root
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
  hosts:
    host4:
      ansible_host: 192.168.201.4
```
---
## Create file 'index.j2'
---
```bash
<!DOCTYPE html>
<html>
    <head>
        <title>{{ item }}</title>
    </head>
    <body>
        <p>This is content from {{ item }}</p>
    </body>
</html>
```
---
## Create file 'site_config.j2'
---
```bash
server {
       listen 80;

       server_name {{ item }};

       root /var/www/{{ item }}/html;
       index index.html index.htm;

       location / {
               try_files $uri $uri/ =404;
       }
}
```
---
## Create playbook 'server.yaml'
---
```bash
---
- hosts: server
  become: true

  tasks:
  - name: nginx. Install packages
    apt:
      name: "nginx"
      state: latest
      update_cache: yes
    tags: install

  - name: make dir for site
    ansible.builtin.file:
        path: "/var/www/{{ item }}/html"
        state: directory
        mode: '0755'
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"

  - name: add html for site
    ansible.builtin.template:
        src: index.j2
        dest: "/var/www/{{ item }}/html/index.html"
        owner: root
        group: root
        mode: '0755'
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"

  - name: add config file to site-available
    ansible.builtin.template:
      src: site_config.j2
      dest: /etc/nginx/sites-available/{{ item }}
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"

  - name: creat syblink for site
    file:
      src: /etc/nginx/sites-available/{{ item }}
      dest: /etc/nginx/sites-enabled/{{ item }}
      state: link
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"

  - name: restart nginx
    service:
      name: nginx
      state: restarted
      enabled: true
    tags: restart

  - name: add domain name in file 'hosts'
    shell: |
      grep -q {{ item }} /etc/hosts || echo 127.0.0.1 {{ item }} >> /etc/hosts;
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"

  - name: Check sites. Return status 200
    ansible.builtin.uri:
      url: http://{{ item }}
      return_content: true
    register: this
    failed_when: "'content' not in this.content"
    with_items:
      - "firsttestsite.by"
      - "secondtestsite.by"
```
---
## Result playbook
---
```bash
vitali@vitali-VirtualBox:~/Course/06.AnsibleWorkshop$ ansible-playbook -i inventary.yaml server.yaml

PLAY [server] ******************************************************************

TASK [Gathering Facts] *********************************************************
Аўторак 07 сакавіка 2023  23:33:40 +0300 (0:00:00.074)       0:00:00.074 ******
ok: [host4]

TASK [nginx. Install packages] *************************************************
Аўторак 07 сакавіка 2023  23:33:45 +0300 (0:00:05.116)       0:00:05.191 ******
ok: [host4]

TASK [make dir for site] *******************************************************
Аўторак 07 сакавіка 2023  23:33:49 +0300 (0:00:04.200)       0:00:09.392 ******
ok: [host4] => (item=firsttestsite.by)
ok: [host4] => (item=secondtestsite.by)

TASK [add html for site] *******************************************************
Аўторак 07 сакавіка 2023  23:33:52 +0300 (0:00:03.217)       0:00:12.610 ******
ok: [host4] => (item=firsttestsite.by)
ok: [host4] => (item=secondtestsite.by)

TASK [add config file to site-available] ***************************************
Аўторак 07 сакавіка 2023  23:33:57 +0300 (0:00:04.366)       0:00:16.976 ******
ok: [host4] => (item=firsttestsite.by)
ok: [host4] => (item=secondtestsite.by)

TASK [creat syblink for site] **************************************************
Аўторак 07 сакавіка 2023  23:34:00 +0300 (0:00:03.433)       0:00:20.410 ******
ok: [host4] => (item=firsttestsite.by)
ok: [host4] => (item=secondtestsite.by)

TASK [restart nginx] ***********************************************************
Аўторак 07 сакавіка 2023  23:34:03 +0300 (0:00:02.358)       0:00:22.769 ******
changed: [host4]

TASK [add domain name in file 'hosts'] *****************************************
Аўторак 07 сакавіка 2023  23:34:06 +0300 (0:00:03.527)       0:00:26.297 ******
changed: [host4] => (item=firsttestsite.by)
changed: [host4] => (item=secondtestsite.by)

TASK [Check sites. Return status 200] ******************************************
Аўторак 07 сакавіка 2023  23:34:09 +0300 (0:00:03.246)       0:00:29.545 ******
ok: [host4] => (item=firsttestsite.by)
ok: [host4] => (item=secondtestsite.by)

PLAY RECAP *********************************************************************
host4                      : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Аўторак 07 сакавіка 2023  23:34:13 +0300 (0:00:03.740)       0:00:33.286 ******
===============================================================================
Gathering Facts --------------------------------------------------------- 5.12s
add html for site ------------------------------------------------------- 4.37s
nginx. Install packages ------------------------------------------------- 4.20s
Check sites. Return status 200 ------------------------------------------ 3.74s
restart nginx ----------------------------------------------------------- 3.53s
add config file to site-available --------------------------------------- 3.43s
add domain name in file 'hosts' ----------------------------------------- 3.25s
make dir for site ------------------------------------------------------- 3.22s
creat syblink for site -------------------------------------------------- 2.36s
Playbook run took 0 days, 0 hours, 0 minutes, 33 seconds
```
