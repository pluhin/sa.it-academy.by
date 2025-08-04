# CONFIGS

## ansible.cfg

```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

## inv.yaml

```bash
db_all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"'
  hosts:
    mysql:
      ansible_host: 192.168.201.3
```

## vars.yaml

```bash
nginx_vhosts:
  - name: VHOST01
    domain: vhost01.com
    root: /var/www/vhost01
    port: 80

  - name: VHOST02
    domain: vhost02.com
    root: /var/www/vhost02
    port: 8080
```

## nginx_vhost.conf.j2

```bash
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

## index.html.j2

```bash
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to {{ item.name }} ({{ item.domain }}) {% if item.name == 'VHOST01' %}THIS IS TEST PAGE01{% elif item.name == 'VHOST02' %}THIS IS TEST PAGE02{% endif %}</title>
</head>
<body>
    <h1>Hello from {{ item.name }} at {{ item.domain }}</h1>
    <p>Document root: {{ item.root }}</p>
    {% if item.name == 'VHOST01' %}
        <p>THIS IS TEST PAGE01</p>
    {% elif item.name == 'VHOST02' %}
        <p>THIS IS TEST PAGE02</p>
    {% endif %}
</body>
</html>
```

# HA1

## PLAYBOOK

```bash
- name: Install and configure nginx with virtual hosts
  hosts: db_all
  become: yes

  vars_files:
    - vars.yaml

  tasks:

    - name: Ensure nginx is installed
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Create root directories for each site
      file:
        path: "{{ item.root }}"
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'
      loop: "{{ nginx_vhosts }}"

    - name: Create index.html with unique content per host
      template:
        src: index.html.j2
        dest: "{{ item.root }}/index.html"
        owner: www-data
        group: www-data
        mode: '0644'
      loop: "{{ nginx_vhosts }}"
      loop_control:
        loop_var: item

    - name: Deploy nginx config for each virtual host
      template:
        src: nginx_vhost.conf.j2
        dest: "/etc/nginx/sites-available/{{ item.name }}"
        owner: root
        group: root
        mode: '0644'
      loop: "{{ nginx_vhosts }}"

    - name: Enable virtual hosts by creating symlinks
      file:
        src: "/etc/nginx/sites-available/{{ item.name }}"
        dest: "/etc/nginx/sites-enabled/{{ item.name }}"
        state: link
      loop: "{{ nginx_vhosts }}"

    - name: Remove default nginx site if exists
      file:
        path: /etc/nginx/sites-enabled/default
 	state: absent

    - name: Ensure nginx is started and enabled
      service:
        name: nginx
        state: restarted
        enabled: yes

    - name: Verify that nginx returns correct page on port 80 (vhost01)
      uri:
        url: "http://localhost:80"
        return_content: yes
      register: vhost01_response
      failed_when: >
        (nginx_vhosts[0].name not in vhost01_response.content) and
        (nginx_vhosts[0].domain not in vhost01_response.content)

    - name: Show nginx page content from vhost01 (port 80)
      debug:
        msg: "Content from localhost:80: {{ vhost01_response.content | truncate(300, True) }}"

    - name: Verify that nginx returns correct page on port 8080 (vhost02)
      uri:
        url: "http://localhost:8080"
        return_content: yes
      register: vhost02_response
      failed_when: >
        (nginx_vhosts[1].name not in vhost02_response.content) and
        (nginx_vhosts[1].domain not in vhost02_response.content)

    - name: Show nginx page content from vhost02 (port 8080)
      debug:
        msg: "Content from localhost:8080: {{ vhost02_response.content | truncate(300, True) }}"
```

## RESULT

```bash
PLAY [Install and configure nginx with virtual hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************
Monday 04 August 2025  13:28:59 +0000 (0:00:00.018)       0:00:00.018 *********
[WARNING]: Platform linux on host mysql is using the discovered Python interpreter at /usr/bin/python3.8, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [mysql]

TASK [Ensure nginx is installed] ************************************************************************************************************************************************************
Monday 04 August 2025  13:29:06 +0000 (0:00:07.397)       0:00:07.416 *********
ok: [mysql]

TASK [Create root directories for each site] ************************************************************************************************************************************************
Monday 04 August 2025  13:29:13 +0000 (0:00:06.754)       0:00:14.170 *********
ok: [mysql] => (item={'name': 'VHOST01', 'domain': 'vhost01.com', 'root': '/var/www/vhost01', 'port': 80})
ok: [mysql] => (item={'name': 'VHOST02', 'domain': 'vhost02.com', 'root': '/var/www/vhost02', 'port': 8080})

TASK [Create index.html with unique content per host] ***************************************************************************************************************************************
Monday 04 August 2025  13:29:23 +0000 (0:00:09.758)       0:00:23.929 *********
changed: [mysql] => (item={'name': 'VHOST01', 'domain': 'vhost01.com', 'root': '/var/www/vhost01', 'port': 80})
changed: [mysql] => (item={'name': 'VHOST02', 'domain': 'vhost02.com', 'root': '/var/www/vhost02', 'port': 8080})

TASK [Deploy nginx config for each virtual host] ********************************************************************************************************************************************
Monday 04 August 2025  13:29:41 +0000 (0:00:18.378)       0:00:42.308 *********
ok: [mysql] => (item={'name': 'VHOST01', 'domain': 'vhost01.com', 'root': '/var/www/vhost01', 'port': 80})
ok: [mysql] => (item={'name': 'VHOST02', 'domain': 'vhost02.com', 'root': '/var/www/vhost02', 'port': 8080})

TASK [Enable virtual hosts by creating symlinks] ********************************************************************************************************************************************
Monday 04 August 2025  13:29:56 +0000 (0:00:14.631)       0:00:56.939 *********
ok: [mysql] => (item={'name': 'VHOST01', 'domain': 'vhost01.com', 'root': '/var/www/vhost01', 'port': 80})
ok: [mysql] => (item={'name': 'VHOST02', 'domain': 'vhost02.com', 'root': '/var/www/vhost02', 'port': 8080})

TASK [Remove default nginx site if exists] **************************************************************************************************************************************************
Monday 04 August 2025  13:30:06 +0000 (0:00:10.003)       0:01:06.943 *********
ok: [mysql]

TASK [Ensure nginx is started and enabled] **************************************************************************************************************************************************
Monday 04 August 2025  13:30:10 +0000 (0:00:04.677)       0:01:11.621 *********
changed: [mysql]

TASK [Verify that nginx returns correct page on port 80 (vhost01)] **************************************************************************************************************************
Monday 04 August 2025  13:30:15 +0000 (0:00:05.206)       0:01:16.827 *********
ok: [mysql]

TASK [Show nginx page content from vhost01 (port 80)] ***************************************************************************************************************************************
Monday 04 August 2025  13:30:20 +0000 (0:00:04.931)       0:01:21.759 *********
ok: [mysql] => {
    "msg": "Content from localhost:80: <!DOCTYPE html>\n<html>\n<head>\n    <title>Welcome to VHOST01 (vhost01.com) THIS IS TEST PAGE01</title>\n</head>\n<body>\n    <h1>Hello from VHOST01 at vhost01.com</h1>\n    <p>Document root: /var/www/vhost01</p>\n            <p>THIS IS TEST PAGE01</p>\n    </body>\n</html>\n"
}

TASK [Verify that nginx returns correct page on port 8080 (vhost02)] ************************************************************************************************************************
Monday 04 August 2025  13:30:20 +0000 (0:00:00.060)       0:01:21.820 *********
ok: [mysql]

TASK [Show nginx page content from vhost02 (port 8080)] *************************************************************************************************************************************
Monday 04 August 2025  13:30:25 +0000 (0:00:04.911)       0:01:26.731 *********
ok: [mysql] => {
    "msg": "Content from localhost:8080: <!DOCTYPE html>\n<html>\n<head>\n    <title>Welcome to VHOST02 (vhost02.com) THIS IS TEST PAGE02</title>\n</head>\n<body>\n    <h1>Hello from VHOST02 at vhost02.com</h1>\n    <p>Document root: /var/www/vhost02</p>\n            <p>THIS IS TEST PAGE02</p>\n    </body>\n</html>\n"
}

PLAY RECAP **********************************************************************************************************************************************************************************
mysql                      : ok=12   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Monday 04 August 2025  13:30:25 +0000 (0:00:00.048)       0:01:26.779 *********
===============================================================================
Create index.html with unique content per host -------------------------------------------------------------------------------------------------------------------------------------- 18.38s
Deploy nginx config for each virtual host ------------------------------------------------------------------------------------------------------------------------------------------- 14.63s
Enable virtual hosts by creating symlinks ------------------------------------------------------------------------------------------------------------------------------------------- 10.00s
Create root directories for each site ------------------------------------------------------------------------------------------------------------------------------------------------ 9.76s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 7.40s
Ensure nginx is installed ------------------------------------------------------------------------------------------------------------------------------------------------------------ 6.75s
Ensure nginx is started and enabled -------------------------------------------------------------------------------------------------------------------------------------------------- 5.21s
Verify that nginx returns correct page on port 80 (vhost01) -------------------------------------------------------------------------------------------------------------------------- 4.93s
Verify that nginx returns correct page on port 8080 (vhost02) ------------------------------------------------------------------------------------------------------------------------ 4.91s
Remove default nginx site if exists -------------------------------------------------------------------------------------------------------------------------------------------------- 4.68s
Show nginx page content from vhost01 (port 80) --------------------------------------------------------------------------------------------------------------------------------------- 0.06s
Show nginx page content from vhost02 (port 8080) ------------------------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 1 minutes, 26 seconds

```

