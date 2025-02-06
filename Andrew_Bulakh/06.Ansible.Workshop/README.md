# 06. Ansible Workshop

## index.html.j2
```bash
<html>
<head>
    <title>{{ hostname }}</title>
</head>
<body>
    <h1>Это {{ hostname }}!</h1>
    <p>Полное доменное имя: {{ full_domain_name }}</p>
</body>
</html>
```

## nginx_conf.j2
```bash
server {
    listen 80;
    server_name {{ item.domain }};

    location / {
        root /var/www/{{ item.hostname }};
        index index.html;
    }
}
```
## setup_nginx.yaml
```bash
- name: Install and configure Nginx
  hosts: myserver
  become: yes
  vars:
    sites:
      - { hostname: "site1", domain: "site1.example.com" }
      - { hostname: "site2", domain: "site2.example.com" }

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Create directories for virtual hosts
      file:
        path: "/var/www/{{ item.hostname }}"
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'
      loop: "{{ sites }}"

    - name: Create HTML files for virtual hosts
      template:
        src: index.html.j2
        dest: "/var/www/{{ item.hostname }}/index.html"
      loop: "{{ sites }}"
      vars:
        full_domain_name: "{{ item.domain }}"
        hostname: "{{ item.hostname }}"

    - name: Configure Nginx for virtual hosts
      template:
        src: nginx_conf.j2
        dest: "/etc/nginx/sites-available/{{ item.hostname }}.conf"
      loop: "{{ sites }}"

    - name: Enable Nginx sites
      service:
        name: nginx
        state: restarted
```

## Result
```bash
        $ansible-playbook -i inv.yaml setup_nginx.yaml -u root

PLAY [Install and configure Nginx] **********************************************************************************

TASK [Gathering Facts] **********************************************************************************************
Tuesday 07 January 2025  16:09:18 +0300 (0:00:00.005)       0:00:00.005 *******
[WARNING]: Platform linux on host myserver is using the discovered Python interpreter at /usr/bin/python3.8, but
future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [myserver]

TASK [Install Nginx] ************************************************************************************************
Tuesday 07 January 2025  16:09:23 +0300 (0:00:04.594)       0:00:04.600 *******
ok: [myserver]

TASK [Create directories for virtual hosts] *************************************************************************
Tuesday 07 January 2025  16:09:27 +0300 (0:00:04.251)       0:00:08.851 *******
ok: [myserver] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [myserver] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Create HTML files for virtual hosts] **************************************************************************
Tuesday 07 January 2025  16:09:32 +0300 (0:00:04.684)       0:00:13.536 *******
ok: [myserver] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [myserver] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Configure Nginx for virtual hosts] ****************************************************************************
Tuesday 07 January 2025  16:09:39 +0300 (0:00:07.159)       0:00:20.695 *******
ok: [myserver] => (item={'hostname': 'site1', 'domain': 'site1.example.com'})
ok: [myserver] => (item={'hostname': 'site2', 'domain': 'site2.example.com'})

TASK [Enable Nginx sites] *******************************************************************************************
Tuesday 07 January 2025  16:09:46 +0300 (0:00:07.129)       0:00:27.824 *******
changed: [myserver]

PLAY RECAP **********************************************************************************************************
myserver                   : ok=6    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 07 January 2025  16:09:49 +0300 (0:00:02.691)       0:00:30.516 *******
===============================================================================
Create HTML files for virtual hosts -------------------------------------------------------------------------- 7.16s
Configure Nginx for virtual hosts ---------------------------------------------------------------------------- 7.13s
Create directories for virtual hosts ------------------------------------------------------------------------- 4.68s
Gathering Facts ---------------------------------------------------------------------------------------------- 4.59s
Install Nginx ------------------------------------------------------------------------------------------------ 4.25s
Enable Nginx sites ------------------------------------------------------------------------------------------- 2.69s
Playbook run took 0 days, 0 hours, 0 minutes, 30 seconds
```