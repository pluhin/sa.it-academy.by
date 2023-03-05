# Prepare to install Nginx
## Create ansilbe.cfg
```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
## Create inv.yml
```bash
worker_host:
  vars:
    ansible_user: root
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
  hosts:
    host1:
      ansible_host: 192.168.201.1
```
## Create group_vars and vars.yml
```bash
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
```
# Create playbook to Full install Nginx
## Install nginx server
```bash
- hosts: worker_host
  become: yes
  become_method: sudo
  tasks:
    - name: Update cache & Full system update
      apt:
       update_cache: true
       upgrade: dist
       cache_valid_time: 3600
       force_apt_get: true
    - name: Install nginx
      apt:
       pkg: nginx
      become: yes
```
## Setup Nginx for two virtualhosts using templates
### Create website.j2 and pasted the next text
```bash
server {
    server_name {{ item }};
    access_log /var/log/nginx/{{ item }}_access.log;
    error_log /var/log/nginx/{{ item }}_error.log;
    root /var/www/{{ item }};

    location / {

                index  index.html index.htm;
    }
}
```
### Updated playbook
```bash
- hosts: worker_host
  become: yes
  become_method: sudo
  vars:
  - sitelist:
    - "www.test1.by"
    - "www.test2.by"
  tasks:
    - name: Update cache & Full system update
      apt:
       update_cache: true
       upgrade: dist
       cache_valid_time: 3600
       force_apt_get: true
    - name: Install nginx
      apt:
       pkg: nginx
      become: yes
    - name: Create dir for virtualhosts
      file:
        path: /var/www/{{ item }}
        state: directory
      become: yes
      with_items: "{{ sitelist }}"
    - name: Create nginx config files
      template:
        src: "website.j2"
        dest: "/etc/nginx/sites-enabled/{{ item }}.conf"
      become: yes
      with_items: "{{ sitelist }}"
```
## Create and add index.html files, with unique data inside (host name and FQDN) for each virtualhost
### Create index.j2 and pasted the next text
```bash
<!DOCTYPE html>

<html lang="ru">
<head>
<meta charset="UTF-8">
</head>
<body>
        <h1>{{ item }}</h1>
</body>
</html>
```
### Updated playbook
```bash
- hosts: worker_host
  become: yes
  become_method: sudo
  vars:
  - sitelist:
    - "www.test1.by"
    - "www.test2.by"
  tasks:
    - name: Update cache & Full system update
      apt:
       update_cache: true
       upgrade: dist
       cache_valid_time: 3600
       force_apt_get: true
    - name: Install nginx
      apt:
       pkg: nginx
      become: yes
    - name: Create dir for virtualhosts
      file:
        path: /var/www/{{ item }}
        state: directory
      become: yes
      with_items: "{{ sitelist }}"
    - name: Create nginx config files
      template:
        src: "website.j2"
        dest: "/etc/nginx/sites-enabled/{{ item }}.conf"
      become: yes
      with_items: "{{ sitelist }}"
    - name: Add index file
      template:
        src: "index.j2"
        dest: "/var/www/{{ item }}/index.html"
      become: yes
      with_items: "{{ sitelist }}"
```
## Check deployment/validate functionality of virtualhosts
### Updated playbook
```bash
- hosts: worker_host
  become: yes
  become_method: sudo
  vars:
  - sitelist:
    - "www.test1.by"
    - "www.test2.by"
  tasks:
    - name: Update cache & Full system update
      apt:
       update_cache: true
       upgrade: dist
       cache_valid_time: 3600
       force_apt_get: true
    - name: Install nginx
      apt:
       pkg: nginx
      become: yes
    - name: Create dir for virtualhosts
      file:
        path: /var/www/{{ item }}
        state: directory
      become: yes
      with_items: "{{ sitelist }}"
    - name: Create nginx config files
      template:
        src: "website.j2"
        dest: "/etc/nginx/sites-enabled/{{ item }}.conf"
      become: yes
      with_items: "{{ sitelist }}"
    - name: Add index file
      template:
        src: "index.j2"
        dest: "/var/www/{{ item }}/index.html"
      become: yes
      with_items: "{{ sitelist }}"
    - name: Check that a page of site "www.test1.by" returns a status 200 and fail if the content - "www.test1.by" is not in the page contents
      ansible.builtin.uri:
       url: http://www.test1.by/index.html
       return_content: true
      register: this
      failed_when: "'www.test1.by' not in this.content"
    - name: Check that a page of site "www.test2.by" returns a status 200 and fail if the content - "www.test2.by" is not in the page contents
      ansible.builtin.uri:
       url: http://www.test2.by/index.html
       return_content: true
      register: this
      failed_when: "'www.test2.by' not in this.content"
  handlers:
  - name: nginxrestart
    service:
       name: "nginx"
       state: "restarted"
    become: yes
```
# Output after running playbook:
```bash
server@server:~/ansible_nginx$ sudo ansible-playbook -i inv.yml inst_nginx.yml

PLAY [worker_host] **************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************
Sunday 05 March 2023  14:00:50 +0000 (0:00:00.024)       0:00:00.024 **********
ok: [host1]

TASK [Update cache & Full system update] ****************************************************************************************************************
Sunday 05 March 2023  14:00:53 +0000 (0:00:03.875)       0:00:03.899 **********
ok: [host1]

TASK [Install nginx] ************************************************************************************************************************************
Sunday 05 March 2023  14:00:56 +0000 (0:00:02.401)       0:00:06.301 **********
ok: [host1]

TASK [Create dir for virtualhosts] **********************************************************************************************************************
Sunday 05 March 2023  14:00:57 +0000 (0:00:01.533)       0:00:07.834 **********
ok: [host1] => (item=www.test1.by)
ok: [host1] => (item=www.test2.by)

TASK [Create nginx config files] ************************************************************************************************************************
Sunday 05 March 2023  14:01:01 +0000 (0:00:03.756)       0:00:11.591 **********
ok: [host1] => (item=www.test1.by)
ok: [host1] => (item=www.test2.by)

TASK [Add index file] ***********************************************************************************************************************************
Sunday 05 March 2023  14:01:06 +0000 (0:00:04.407)       0:00:16.000 **********
ok: [host1] => (item=www.test1.by)
ok: [host1] => (item=www.test2.by)

TASK [Check that a page of site "www.test1.by" returns a status 200 and fail if the content - "www.test1.by" is not in the page contents] ***************
Sunday 05 March 2023  14:01:11 +0000 (0:00:05.732)       0:00:21.733 **********
ok: [host1]

TASK [Check that a page of site "www.test2.by" returns a status 200 and fail if the content - "www.test2.by" is not in the page contents] ***************
Sunday 05 March 2023  14:01:13 +0000 (0:00:01.538)       0:00:23.272 **********
ok: [host1]

PLAY RECAP **********************************************************************************************************************************************
host1                      : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 05 March 2023  14:01:14 +0000 (0:00:01.187)       0:00:24.459 **********
===============================================================================
Add index file ----------------------------------------------------------------------------------------------------------------------------------- 5.73s
Create nginx config files ------------------------------------------------------------------------------------------------------------------------ 4.41s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------- 3.87s
Create dir for virtualhosts ---------------------------------------------------------------------------------------------------------------------- 3.76s
Update cache & Full system update ---------------------------------------------------------------------------------------------------------------- 2.40s
Check that a page of site "www.test1.by" returns a status 200 and fail if the content - "www.test1.by" is not in the page contents --------------- 1.54s
Install nginx ------------------------------------------------------------------------------------------------------------------------------------ 1.53s
Check that a page of site "www.test2.by" returns a status 200 and fail if the content - "www.test2.by" is not in the page contents --------------- 1.19s
Playbook run took 0 days, 0 hours, 0 minutes, 24 seconds

```
