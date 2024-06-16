# Home task 06. Ansible Workshop

inv.yaml
```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host05:
          ansible_host: 192.168.202.5

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

ansible.cfg
```yaml
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

nginx.yaml
```yaml
- hosts: all_workers
  vars:
    app_packages:
      - nginx
    site1_name: "{{ site1_name | default('Mysite1.by') }}"
    site2_name: "{{ site2_name | default('Mysite2.by') }}"
  pre_tasks:

  - name: Validate
    debug:
      msg:
       - "nginx host: {{ ansible_host }}"
       - "site1 name: {{ site1_name }}"
       - "site2 name: {{ site2_name }}"
    tags: always
  tasks:

  - name: Nginx. Install packages
    apt:
      name: "{{ app_packages }}"
      state: latest
      update_cache: true
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install

  - name: Add site folders
    ansible.builtin.file:
      path: "/var/www/{{ item }}/html"
      state: directory
      mode: '0755'
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Add page html for sites
    ansible.builtin.template:
      src: mytemplate.html
      dest: "/var/www/{{ item }}/html/{{ item }}.html"
      owner: root
      group: root
      mode: '0755'
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Add folders for configs
    ansible.builtin.file:
      path: "/etc/nginx/sites-available/{{ item }}"
      state: directory
      mode: '0755'
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Add config 
    ansible.builtin.template:
      src: myhost.conf.j2
      dest: "/etc/nginx/sites-available/{{ item }}/{{ item }}.conf"
      owner: root
      group: root
      mode: '0755'
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Add sites in hosts
    ansible.builtin.shell:
      cmd: grep -q www.{{ item }} /etc/hosts || echo 127.0.0.1 www.{{ item }} >> /etc/hosts;
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Add symbolic-link 
    ansible.builtin.file:
      src: /etc/nginx/sites-available/{{ item }}
      dest: /etc/nginx/sites-enabled/{{ item }}
      state: link
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"

  - name: Check connection to site
    ansible.builtin.uri:
      url: http://www.{{ item }}
      return_content: true
    with_items:
    - "{{ site1_name }}"
    - "{{ site2_name }}"
```

myhost.conf.j2
```yaml
server {
  listen 127.0.0.1:80;

  root /var/www/{{ item }}/html;
  index {{ item }}.html {{ item }}.htm;

  server_name {{ item }} www.{{ item }};

  location / {
    try_files $uri =404;
  }
}
```

mytemplate.html
```yaml
<!DOCTYPE html>
<html>
    <head>
        <title>This is {{ item }}</title>
    </head>
    <body>
        <p>My site content.</p>
    </body>
</html>
```

Run:
```bash
ansible-playbook -i inv.yaml nginx.yaml -e "site1_name=Mysite1.by site2_name=Mysite2.by" -u root
```

Result:
```bash
PLAY [all_workers] ******************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************
Воскресенье 16 июня 2024  15:56:30 +0000 (0:00:00.006)       0:00:00.006 ******
ok: [host05]

TASK [Validate] *********************************************************************************************************
Воскресенье 16 июня 2024  15:56:32 +0000 (0:00:02.014)       0:00:02.020 ******
ok: [host05] => {
    "msg": [
        "nginx host: 192.168.202.5",
        "site1 name: Mysite1.by",
        "site2 name: Mysite2.by"
    ]
}

TASK [Nginx. Install packages] ******************************************************************************************
Воскресенье 16 июня 2024  15:56:32 +0000 (0:00:00.033)       0:00:02.054 ******
changed: [host05]

TASK [Add site folders] *************************************************************************************************
Воскресенье 16 июня 2024  15:56:44 +0000 (0:00:12.378)       0:00:14.432 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Add page html for sites] ******************************************************************************************
Воскресенье 16 июня 2024  15:56:45 +0000 (0:00:01.320)       0:00:15.752 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Add folders for configs] ******************************************************************************************
Воскресенье 16 июня 2024  15:56:48 +0000 (0:00:02.417)       0:00:18.170 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Add config] *******************************************************************************************************
Воскресенье 16 июня 2024  15:56:49 +0000 (0:00:01.211)       0:00:19.381 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Add sites in hosts] ***********************************************************************************************
Воскресенье 16 июня 2024  15:56:51 +0000 (0:00:02.244)       0:00:21.626 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Add symbolic-link] ************************************************************************************************
Воскресенье 16 июня 2024  15:56:52 +0000 (0:00:01.209)       0:00:22.836 ******
changed: [host05] => (item=Mysite1.by)
changed: [host05] => (item=Mysite2.by)

TASK [Check connection to site] *****************************************************************************************
Воскресенье 16 июня 2024  15:56:54 +0000 (0:00:01.205)       0:00:24.041 ******
ok: [host05] => (item=Mysite1.by)
ok: [host05] => (item=Mysite2.by)

PLAY RECAP **************************************************************************************************************
host05                     : ok=10   changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Воскресенье 16 июня 2024  15:56:55 +0000 (0:00:01.436)       0:00:25.478 ******
===============================================================================
Nginx. Install packages ----------------------------------------------------------------------------------------- 12.38s
Add page html for sites ------------------------------------------------------------------------------------------ 2.42s
Add config ------------------------------------------------------------------------------------------------------- 2.24s
Gathering Facts -------------------------------------------------------------------------------------------------- 2.01s
Check connection to site ----------------------------------------------------------------------------------------- 1.44s
Add site folders ------------------------------------------------------------------------------------------------- 1.32s
Add folders for configs ------------------------------------------------------------------------------------------ 1.21s
Add sites in hosts ----------------------------------------------------------------------------------------------- 1.21s
Add symbolic-link ------------------------------------------------------------------------------------------------ 1.21s
Validate --------------------------------------------------------------------------------------------------------- 0.03s
Playbook run took 0 days, 0 hours, 0 minutes, 25 seconds
vmuser@vm2:~/06.Ansible.WorkShop$
```