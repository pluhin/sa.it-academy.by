# 06.Ansible_workshop

## nginx_task.yaml

```yaml
---
- hosts: dbs
  vars:
    sites: [ 'site1.local', 'site2.local' ] 

  pre_tasks:
    - name: Validate
      debug:
        msg:
          - "Site: {{ item }}"
      loop: "{{ sites }}"     

  tasks:
    - name: Prepare. Install packages
      ansible.builtin.apt:
        name: nginx
        state: latest
        update_cache: true
    
    - name: Check nginx version
      ansible.builtin.command: nginx -v
      register: nginx_version

    - name: Show nginx version
      ansible.builtin.debug:
        msg: "{{ nginx_version.stderr }}"
    - name: start nginx
      service:
          name: nginx
          state: started   

    - name: Check status nginx 
      ansible.builtin.shell: systemctl status nginx
      register: nginx_status
    

    - name: Show nginx status    
      ansible.builtin.debug:
        msg: "{{ nginx_status.stdout_lines }}"

    - name : Check if exists folder 'sites-available'
      ansible.builtin.shell: ls /etc/nginx/sites-available/
      register: folder

    - name: Show folder
      ansible.builtin.debug:
        msg: "{{folder.stdout_lines}}"     

    - name : Check if exists folder 'sites-enabled'
      ansible.builtin.shell: ls /etc/nginx/sites-available/
      register: folder

    - name: Show folder
      ansible.builtin.debug:
        msg: "{{folder.stdout_lines}}" 

    - name: Create folders for each site
      ansible.builtin.file:
        path: "/var/www/{{ item }}/html"
        owner: www-data
        group: www-data
        mode: 0755
        state: directory
      loop: "{{ sites }}"
    - name: Change owner of www folder
      ansible.builtin.file:
        path: "/var/www"
        owner: www-data
        group: www-data
        mode: 0755
        state: directory
        recurse: true

    - name: Creating config file using the template
      ansible.builtin.template:
        src: ./templates/nginx.conf.j2
        dest: /etc/nginx/sites-available/{{ item }}
      loop: "{{ sites }}"

    - name: Create index.html for each sites using the template
      ansible.builtin.template:
        src: ./templates/index.html.j2
        dest: /var/www/{{ item }}/index.html
      loop: "{{ sites }}"
    - name: Restart nginx
      service:
        name: nginx
        state: restarted

    - name: Adding hosts to the hosts file
      ansible.builtin.shell: |
        if ! grep -q '127.0.0.1 {{ item }}' /etc/hosts; then echo "127.0.0.1 {{ item }}"  >> /etc/hosts; fi
      loop: "{{ sites }}"
        
    - name: Check sites returns a status 200 
      ansible.builtin.uri:
        url: http://{{ item }}
        return_content: yes
      register: status_200
      failed_when: "'This is' not in status_200.content"
      loop: "{{ sites }}"

    - name: Showing results of checking status 200
      ansible.builtin.debug:
        msg:
          - "_____________________________________" 
          - "Server: {{ item.server }} --- Address: {{ item.url }} ---HTML status: {{ item.status }}"
          - "_____________________________________"
      with_items: "{{ status_200.results }}"
      loop_control:
        label: "{{ item.url }}"
```
## Output of nginx_task.yaml

```bash
PLAY [dbs] ***********************************************************************************

TASK [Gathering Facts] ***********************************************************************
Sunday 04 December 2022  09:44:51 +0000 (0:00:00.010)       0:00:00.010 *******
ok: [db_1]

TASK [Validate] ******************************************************************************
Sunday 04 December 2022  09:44:53 +0000 (0:00:01.960)       0:00:01.970 *******
ok: [db_1] => (item=site1.local) => {
    "msg": [
        "Site: site1.local"
    ]
}
ok: [db_1] => (item=site2.local) => {
    "msg": [
        "Site: site2.local"
    ]
}

TASK [Prepare. Install packages] *************************************************************
Sunday 04 December 2022  09:44:53 +0000 (0:00:00.068)       0:00:02.039 *******
ok: [db_1]

TASK [Check nginx version] *******************************************************************
Sunday 04 December 2022  09:44:56 +0000 (0:00:02.712)       0:00:04.751 *******
changed: [db_1]

TASK [Show nginx version] ********************************************************************
Sunday 04 December 2022  09:44:56 +0000 (0:00:00.671)       0:00:05.423 *******
ok: [db_1] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}

TASK [start nginx] ***************************************************************************
Sunday 04 December 2022  09:44:56 +0000 (0:00:00.050)       0:00:05.474 *******
ok: [db_1]

TASK [Check status nginx] ********************************************************************
Sunday 04 December 2022  09:44:57 +0000 (0:00:00.971)       0:00:06.446 *******
changed: [db_1]

TASK [Show nginx status] *********************************************************************
Sunday 04 December 2022  09:44:58 +0000 (0:00:00.568)       0:00:07.015 *******
ok: [db_1] => {
    "msg": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Sun 2022-12-04 09:40:30 UTC; 4min 28s ago",
        "       Docs: man:nginx(8)",
        "    Process: 30381 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 30383 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 30384 (nginx)",
        "      Tasks: 3 (limit: 309018)",
        "     Memory: 3.1M",
        "        CPU: 21ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─30384 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─30385 nginx: worker process",
        "             └─30386 nginx: worker process",
        "",
        "Dec 04 09:40:30 ws-1 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Dec 04 09:40:30 ws-1 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Check if exists folder 'sites-available'] **********************************************
Sunday 04 December 2022  09:44:58 +0000 (0:00:00.036)       0:00:07.051 *******
changed: [db_1]

TASK [Show folder] ***************************************************************************
Sunday 04 December 2022  09:44:59 +0000 (0:00:00.608)       0:00:07.660 *******
ok: [db_1] => {
    "msg": [
        "default",
        "site1.local",
        "site2.local"
    ]
}

TASK [Check if exists folder 'sites-enabled'] ************************************************
Sunday 04 December 2022  09:44:59 +0000 (0:00:00.036)       0:00:07.696 *******
changed: [db_1]

TASK [Show folder] ***************************************************************************
Sunday 04 December 2022  09:44:59 +0000 (0:00:00.570)       0:00:08.266 *******
ok: [db_1] => {
    "msg": [
        "default",
        "site1.local",
        "site2.local"
    ]
}

TASK [Create folders for each site] **********************************************************
Sunday 04 December 2022  09:44:59 +0000 (0:00:00.035)       0:00:08.302 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Change owner of www folder] ************************************************************
Sunday 04 December 2022  09:45:00 +0000 (0:00:01.233)       0:00:09.536 *******
ok: [db_1]

TASK [Creating config file using the template] ***********************************************
Sunday 04 December 2022  09:45:01 +0000 (0:00:00.575)       0:00:10.111 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Create index.html for each sites using the template] ***********************************
Sunday 04 December 2022  09:45:03 +0000 (0:00:01.850)       0:00:11.962 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Restart nginx] *************************************************************************
Sunday 04 December 2022  09:45:05 +0000 (0:00:01.819)       0:00:13.781 *******
changed: [db_1]

TASK [Adding hosts to the hosts file] ********************************************************
Sunday 04 December 2022  09:45:05 +0000 (0:00:00.777)       0:00:14.558 *******
changed: [db_1] => (item=site1.local)
changed: [db_1] => (item=site2.local)

TASK [Check sites returns a status 200] ******************************************************
Sunday 04 December 2022  09:45:07 +0000 (0:00:01.102)       0:00:15.661 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Showing results of checking status 200] ************************************************
Sunday 04 December 2022  09:45:08 +0000 (0:00:01.388)       0:00:17.050 *******
ok: [db_1] => (item=http://site1.local) => {
    "msg": [
        "_____________________________________",
        "Server: nginx/1.18.0 (Ubuntu) --- Address: http://site1.local ---HTML status: 200",
        "_____________________________________"
    ]
}
ok: [db_1] => (item=http://site2.local) => {
    "msg": [
        "_____________________________________",
        "Server: nginx/1.18.0 (Ubuntu) --- Address: http://site2.local ---HTML status: 200",
        "_____________________________________"
    ]
}

PLAY RECAP ***********************************************************************************
db_1                       : ok=20   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 04 December 2022  09:45:08 +0000 (0:00:00.086)       0:00:17.136 *******
===============================================================================
Prepare. Install packages ------------------------------------------------------------- 2.71s
Gathering Facts ----------------------------------------------------------------------- 1.96s
Creating config file using the template ----------------------------------------------- 1.85s
Create index.html for each sites using the template ----------------------------------- 1.82s
Check sites returns a status 200 ------------------------------------------------------ 1.39s
Create folders for each site ---------------------------------------------------------- 1.23s
Adding hosts to the hosts file -------------------------------------------------------- 1.10s
start nginx --------------------------------------------------------------------------- 0.97s
Restart nginx ------------------------------------------------------------------------- 0.78s
Check nginx version ------------------------------------------------------------------- 0.67s
Check if exists folder 'sites-available' ---------------------------------------------- 0.61s
Change owner of www folder ------------------------------------------------------------ 0.58s
Check if exists folder 'sites-enabled' ------------------------------------------------ 0.57s
Check status nginx -------------------------------------------------------------------- 0.57s
Showing results of checking status 200 ------------------------------------------------ 0.09s
Validate ------------------------------------------------------------------------------ 0.07s
Show nginx version -------------------------------------------------------------------- 0.05s
Show nginx status --------------------------------------------------------------------- 0.04s
Show folder --------------------------------------------------------------------------- 0.04s
Show folder --------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 17 seconds

```
### Nginx conf file

```bash
server {
    listen 80;
    listen [::]:80;
    server_name {{ item }}

    root /var/www/{{ item }}/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### index.html temlate 

```html
<html>
<head>
<title>This is {{ item }}.</title>
</head>
<body>
<h2>This is page of{{ item }} domain </h2>
<h2>Hostname : {{ ansible_facts.hostname }} </h2>
</body>
</html>

```