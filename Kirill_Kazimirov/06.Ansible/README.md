# 1. Homework Assignment 1: Configuration Management
## 1. Choose a web server software (e.g., Nginx) for configuration management.

Nginx

## 2. Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates).
## 3. Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost.

В рутовой папке, откуда будет запускаться ansible, необходимо создать папку templates и положить туда настройки для playbook
static-site-config.conf.j2
```
server {
  listen 80;
  server_name {{ item.server_name }};
  root {{ item.document_root }};

  location / {
    index index.html;
  }
}
```
index.html.j2
```
<html>
<head>
  <title>{{ item.name }}</title>
</head>
<body>
  <h1>Hello from {{ ansible_hostname }}!</h1>
  <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```
Сам playbook
```
- name: Install Nginx with sites
  hosts: all_workers
  become: true
  vars:
   nginxhosts:
      - name: host1
        server_name: www.host1.com

        document_root: /var/www/host1
      - name: virtualhost2
        server_name: www.host2.com
        document_root: /var/www/host2

  tasks:
    - name: Install Nginx web server
      apt:
        name: nginx
        state: present

    - name: Create nginxhost directories
      file:
        path: "{{ item.document_root }}"
        state: directory
      with_items: "{{ nginxhosts }}"

    - name: Configure Nginx hosts
      template:
        src: static-site-config.conf.j2
        dest: /etc/nginx/sites-available/{{ item.name }}
      with_items: "{{ nginxhosts }}"

    - name: Enable nginxhosts
      file:
        src: /etc/nginx/sites-available/{{ item.name }}
        dest: /etc/nginx/sites-enabled/{{ item.name }}
        state: link
      with_items: "{{ nginxhosts }}"

    - name: Create index.html for hosts
      template:
        src: index.html.j2
        dest: "{{ item.document_root }}/index.html"
      with_items: "{{ nginxhosts }}"
    - name: Restart Nginx service
      service:
        name: nginx
        state: restarted
```

inv.yaml
```
all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.1
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

ansible.cfg

```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
## 4. Run the playbook and ensure the web server is installed, configured, and serving the HTML file.
```
root@ubuntudev:~/06.Ansible# ansible-playbook -i inv.yaml nginxinstall.yaml -u root

PLAY [Install Nginx with sites] ****************************************************************************************
TASK [Gathering Facts] *************************************************************************************************Friday 07 June 2024  17:16:48 +0000 (0:00:00.012)       0:00:00.012 ***********
ok: [host1]

TASK [Install Nginx web server] ****************************************************************************************Friday 07 June 2024  17:16:52 +0000 (0:00:04.225)       0:00:04.237 ***********
ok: [host1]

TASK [Create nginxhost directories] ************************************************************************************Friday 07 June 2024  17:16:55 +0000 (0:00:02.651)       0:00:06.889 ***********
ok: [host1] => (item={'name': 'host1', 'server_name': 'www.host1.com', 'document_root': '/var/www/host1'})
ok: [host1] => (item={'name': 'virtualhost2', 'server_name': 'www.host2.com', 'document_root': '/var/www/host2'})

TASK [Configure Nginx hosts] *******************************************************************************************Friday 07 June 2024  17:16:59 +0000 (0:00:03.471)       0:00:10.361 ***********
ok: [host1] => (item={'name': 'host1', 'server_name': 'www.host1.com', 'document_root': '/var/www/host1'})
ok: [host1] => (item={'name': 'virtualhost2', 'server_name': 'www.host2.com', 'document_root': '/var/www/host2'})

TASK [Enable nginxhosts] ***********************************************************************************************Friday 07 June 2024  17:17:05 +0000 (0:00:05.958)       0:00:16.319 ***********
ok: [host1] => (item={'name': 'host1', 'server_name': 'www.host1.com', 'document_root': '/var/www/host1'})
ok: [host1] => (item={'name': 'virtualhost2', 'server_name': 'www.host2.com', 'document_root': '/var/www/host2'})

TASK [Create index.html for hosts] *************************************************************************************Friday 07 June 2024  17:17:08 +0000 (0:00:03.427)       0:00:19.747 ***********
changed: [host1] => (item={'name': 'host1', 'server_name': 'www.host1.com', 'document_root': '/var/www/host1'})
changed: [host1] => (item={'name': 'virtualhost2', 'server_name': 'www.host2.com', 'document_root': '/var/www/host2'})

TASK [Restart Nginx service] *******************************************************************************************Friday 07 June 2024  17:17:15 +0000 (0:00:06.809)       0:00:26.556 ***********
changed: [host1]

PLAY RECAP *************************************************************************************************************host1                      : ok=7    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Friday 07 June 2024  17:17:17 +0000 (0:00:02.347)       0:00:28.903 ***********
===============================================================================
Create index.html for hosts ------------------------------------------------------------------------------------- 6.81s
Configure Nginx hosts ------------------------------------------------------------------------------------------- 5.96s
Gathering Facts ------------------------------------------------------------------------------------------------- 4.23s
Create nginxhost directories ------------------------------------------------------------------------------------ 3.47s
Enable nginxhosts ----------------------------------------------------------------------------------------------- 3.43s
Install Nginx web server ---------------------------------------------------------------------------------------- 2.65s
Restart Nginx service ------------------------------------------------------------------------------------------- 2.35s
Playbook run took 0 days, 0 hours, 0 minutes, 28 seconds
```
