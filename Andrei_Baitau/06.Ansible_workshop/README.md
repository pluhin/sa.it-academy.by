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

    - name: Check if folder exists sites-available/
      ansible.builtin.stat: 
       path: /etc/nginx/sites-available/
      register: available 

    - name: Print a debug message
      ansible.builtin.debug:
       msg: "sites-available isn't defined (path doesn't exist)"
      when: available.stat.islnk is not defined

    - name: Print a debug message
      ansible.builtin.debug:
       msg: "sites-available is defined (path must exist)"
      when: available.stat.islnk is defined

    - name: Check if folder exists sites-enabled/
      ansible.builtin.stat:
       path: /etc/nginx/sites-enabled/
      register: enabled

    - name: Print a debug message
      ansible.builtin.debug:
       msg: "sites-enabled isn't defined (path doesn't exist)"
      when: enabled.stat.islnk is not defined

    - name: Print a debug message
      ansible.builtin.debug:
       msg: "sites-enabled is defined (path must exist)"
      when: available.stat.islnk is defined
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
        dest: /etc/nginx/sites-available/{{ item }}.conf
      loop: "{{ sites }}"

    - name: Create index.html for each sites using the template
      ansible.builtin.template:
        src: ./templates/index.html.j2
        dest: /var/www/{{ item }}/html/index.html
      loop: "{{ sites }}"
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
        enabled: true

    - name: Add to 'enabled' sites
      ansible.builtin.shell: |
        ln -s /etc/nginx/sites-available/{{ item }}.conf  /etc/nginx/sites-enabled/
      loop: "{{ sites }}"
      failed_when: false     

    - name: Adding hosts to the hosts file
      ansible.builtin.shell: |
        if ! grep -q '127.0.0.1 {{ item }}' /etc/hosts; then echo "127.0.0.1 {{ item }} {{ 'www.' + item }}" >> /etc/hosts; fi
      loop: "{{ sites }}"
      tags: hosts
        
    - name: Check sites returns a status 200 
      ansible.builtin.uri:
        url: http://www.{{ item }}
        return_content: yes
      register: status_200
      failed_when: "'By Andrei' not in status_200.content"
      loop: "{{ sites }}"

    - name: Showing results of checking status 200
      ansible.builtin.debug:
        msg:
          - "_____________________________________" 
          - "Server: {{ item.server }} --- Address: {{ item.url }} ---HTTP status: {{ item.status }}"
          - "_____________________________________"
      with_items: "{{ status_200.results }}"
      loop_control:
        label: "{{ item.url }}"
```
## Output of nginx_task.yaml

```bash

PLAY [dbs] *********************************************************************

TASK [Gathering Facts] *********************************************************
Sunday 04 December 2022  17:06:30 +0000 (0:00:00.010)       0:00:00.010 *******
ok: [db_1]

TASK [Validate] ****************************************************************
Sunday 04 December 2022  17:06:32 +0000 (0:00:02.094)       0:00:02.104 *******
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

TASK [Prepare. Install packages] ***********************************************
Sunday 04 December 2022  17:06:32 +0000 (0:00:00.065)       0:00:02.169 *******
ok: [db_1]

TASK [Check nginx version] *****************************************************
Sunday 04 December 2022  17:06:35 +0000 (0:00:02.721)       0:00:04.891 *******
changed: [db_1]

TASK [Show nginx version] ******************************************************
Sunday 04 December 2022  17:06:35 +0000 (0:00:00.642)       0:00:05.533 *******
ok: [db_1] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}

TASK [start nginx] *************************************************************
Sunday 04 December 2022  17:06:35 +0000 (0:00:00.028)       0:00:05.562 *******
ok: [db_1]

TASK [Check status nginx] ******************************************************
Sunday 04 December 2022  17:06:36 +0000 (0:00:00.913)       0:00:06.476 *******
changed: [db_1]

TASK [Show nginx status] *******************************************************
Sunday 04 December 2022  17:06:37 +0000 (0:00:00.564)       0:00:07.041 *******
ok: [db_1] => {
    "msg": [
        "● nginx.service - A high performance web server and a reverse proxy server",
        "     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)",
        "     Active: active (running) since Sun 2022-12-04 16:54:57 UTC; 11min ago",
        "       Docs: man:nginx(8)",
        "    Process: 66796 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "    Process: 66798 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)",
        "   Main PID: 66799 (nginx)",
        "      Tasks: 3 (limit: 309018)",
        "     Memory: 3.1M",
        "        CPU: 23ms",
        "     CGroup: /system.slice/nginx.service",
        "             ├─66799 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;",
        "             ├─66800 nginx: worker process",
        "             └─66801 nginx: worker process",
        "",
        "Dec 04 16:54:57 ws-1 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "Dec 04 16:54:57 ws-1 systemd[1]: Started A high performance web server and a reverse proxy server."
    ]
}

TASK [Check if folder exists sites-available/] *********************************
Sunday 04 December 2022  17:06:37 +0000 (0:00:00.031)       0:00:07.072 *******
ok: [db_1]

TASK [Print a debug message] ***************************************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.628)       0:00:07.701 *******
skipping: [db_1]

TASK [Print a debug message] ***************************************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.034)       0:00:07.736 *******
ok: [db_1] => {
    "msg": "sites-available is defined (path must exist)"
}

TASK [Check if folder exists sites-enabled/] ***********************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.039)       0:00:07.775 *******
ok: [db_1]

TASK [Print a debug message] ***************************************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.603)       0:00:08.378 *******
skipping: [db_1]

TASK [Print a debug message] ***************************************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.034)       0:00:08.413 *******
ok: [db_1] => {
    "msg": "sites-enabled is defined (path must exist)"
}

TASK [Create folders for each site] ********************************************
Sunday 04 December 2022  17:06:38 +0000 (0:00:00.035)       0:00:08.449 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Change owner of www folder] **********************************************
Sunday 04 December 2022  17:06:39 +0000 (0:00:01.182)       0:00:09.631 *******
ok: [db_1]

TASK [Creating config file using the template] *********************************
Sunday 04 December 2022  17:06:40 +0000 (0:00:00.542)       0:00:10.173 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Create index.html for each sites using the template] *********************
Sunday 04 December 2022  17:06:42 +0000 (0:00:01.799)       0:00:11.973 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Restart nginx] ***********************************************************
Sunday 04 December 2022  17:06:44 +0000 (0:00:01.839)       0:00:13.812 *******
changed: [db_1]

TASK [Add to 'enabled' sites] **************************************************
Sunday 04 December 2022  17:06:44 +0000 (0:00:00.818)       0:00:14.631 *******
changed: [db_1] => (item=site1.local)
changed: [db_1] => (item=site2.local)

TASK [Adding hosts to the hosts file] ******************************************
Sunday 04 December 2022  17:06:46 +0000 (0:00:01.152)       0:00:15.783 *******
changed: [db_1] => (item=site1.local)
changed: [db_1] => (item=site2.local)

TASK [Check sites returns a status 200] ****************************************
Sunday 04 December 2022  17:06:47 +0000 (0:00:01.106)       0:00:16.889 *******
ok: [db_1] => (item=site1.local)
ok: [db_1] => (item=site2.local)

TASK [Showing results of checking status 200] **********************************
Sunday 04 December 2022  17:06:48 +0000 (0:00:01.446)       0:00:18.336 *******
ok: [db_1] => (item=http://www.site1.local) => {
    "msg": [
        "_____________________________________",
        "Server: nginx/1.18.0 (Ubuntu) --- Address: http://www.site1.local ---HTTP status: 200",
        "_____________________________________"
    ]
}
ok: [db_1] => (item=http://www.site2.local) => {
    "msg": [
        "_____________________________________",
        "Server: nginx/1.18.0 (Ubuntu) --- Address: http://www.site2.local ---HTTP status: 200",
        "_____________________________________"
    ]
}

PLAY RECAP *********************************************************************
db_1                       : ok=21   changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

Sunday 04 December 2022  17:06:48 +0000 (0:00:00.079)       0:00:18.415 *******
===============================================================================
Prepare. Install packages ----------------------------------------------- 2.72s
Gathering Facts --------------------------------------------------------- 2.09s
Create index.html for each sites using the template --------------------- 1.84s
Creating config file using the template --------------------------------- 1.80s
Check sites returns a status 200 ---------------------------------------- 1.45s
Create folders for each site -------------------------------------------- 1.18s
Add to 'enabled' sites -------------------------------------------------- 1.15s
Adding hosts to the hosts file ------------------------------------------ 1.11s
start nginx ------------------------------------------------------------- 0.91s
Restart nginx ----------------------------------------------------------- 0.82s
Check nginx version ----------------------------------------------------- 0.64s
Check if folder exists sites-available/ --------------------------------- 0.63s
Check if folder exists sites-enabled/ ----------------------------------- 0.60s
Check status nginx ------------------------------------------------------ 0.56s
Change owner of www folder ---------------------------------------------- 0.54s
Showing results of checking status 200 ---------------------------------- 0.08s
Validate ---------------------------------------------------------------- 0.07s
Print a debug message --------------------------------------------------- 0.04s
Print a debug message --------------------------------------------------- 0.04s
Print a debug message --------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 18 seconds

```
### Nginx conf file

```bash
server {
    listen 80;
    listen [::]:80;
    server_name {{ item }} {{ 'www.' + item }};
    root /var/www/{{ item }}/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### index.html template 

```html
<html>
<head>
<title>This is {{ item }}.</title>
</head>
<body>
<h2>This is page of {{ item }} domain </h2>
<h2>Hostname : {{ ansible_facts.hostname }} </h2>
<h2>By Andrei Baitau </h2>
</body>
</html>


```