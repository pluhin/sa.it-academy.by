## 06.Ansible.

---

### Configuration Management

---

1. Choose a web server software (e.g., Nginx) for configuration management:

```
Nginx
```

2. Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates):

- ansible.cfg:

```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

- inv.yml:

```yml
all_workers:
  children:
    work_sa:
      hosts:
        sites:
          ansible_host: 192.168.202.11
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
- createsites.yml:

```yml
- name: Install Nginx web-servers
  hosts: sites
  become: true
  vars:
    virtualhosts:
      - name: virtualhost1
        server_name: www.virtualhost1.com
        url: http://www.virtualhost1.com
        document_root: /var/www/virtualhost1
      - name: virtualhost2
        server_name: www.virtualhost2.com
        url: http://www.virtualhost2.com
        document_root: /var/www/virtualhost2

  tasks:
    - name: Install Nginx web server
      apt:
        name: nginx
        state: present

    - name: Create virtualhost directories
      file:
        path: "{{ item.document_root }}"
        state: directory
      with_items: "{{ virtualhosts }}"

    - name: Configure Nginx virtualhosts
      template:
        src: nginx-virtualhost.conf.j2
        dest: /etc/nginx/sites-available/{{ item.name }}
      with_items: "{{ virtualhosts }}"

    - name: Enable virtualhosts
      file:
        src: /etc/nginx/sites-available/{{ item.name }}
        dest: /etc/nginx/sites-enabled/{{ item.name }}
        state: link
      with_items: "{{ virtualhosts }}"

    - name: Create index.html for virtualhosts
      template:
        src: index.html.j2
        dest: "{{ item.document_root }}/index.html"
      with_items: "{{ virtualhosts }}"

    - name: Restart Nginx service
      service:
        name: nginx
        state: restarted
    - name: Print virtual hosts content
      uri:
        url: "{{ item.url }}"
        return_content: yes
      register: result
      with_items: "{{ virtualhosts }}"
      failed_when: result.status != 200
    - debug:
        msg: "{{ item.content }}"
      with_items: "{{ result.results }}"
```

3. Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost:

- nginx-virtualhost.conf.j2:

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

- index.html.j2:

```html
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

4. Run the playbook and ensure the web server is installed, configured, and serving the HTML file:

```bash
vshvedov@vshvedov:~/06.Ansible$ ansible-playbook -i inv.yml createsites.yml -u root
```

- Output

```
PLAY [Install Nginx web-servers] *********************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************
Thursday 06 June 2024  10:33:37 +0000 (0:00:00.013)       0:00:00.013 *********
ok: [sites]

TASK [Install Nginx web server] **********************************************************************************************************************************
Thursday 06 June 2024  10:33:40 +0000 (0:00:02.864)       0:00:02.877 *********
ok: [sites]

TASK [Create virtualhost directories] ****************************************************************************************************************************
Thursday 06 June 2024  10:33:42 +0000 (0:00:02.016)       0:00:04.893 *********
ok: [sites] => (item={'name': 'virtualhost1', 'server_name': 'www.virtualhost1.com', 'url': 'http://www.virtualhost1.com', 'document_root': '/var/www/virtualhost1'})
ok: [sites] => (item={'name': 'virtualhost2', 'server_name': 'www.virtualhost2.com', 'url': 'http://www.virtualhost2.com', 'document_root': '/var/www/virtualhost2'})

TASK [Configure Nginx virtualhosts] ******************************************************************************************************************************
Thursday 06 June 2024  10:33:44 +0000 (0:00:02.049)       0:00:06.943 *********
ok: [sites] => (item={'name': 'virtualhost1', 'server_name': 'www.virtualhost1.com', 'url': 'http://www.virtualhost1.com', 'document_root': '/var/www/virtualhost1'})
ok: [sites] => (item={'name': 'virtualhost2', 'server_name': 'www.virtualhost2.com', 'url': 'http://www.virtualhost2.com', 'document_root': '/var/www/virtualhost2'})

TASK [Enable virtualhosts] ***************************************************************************************************************************************
Thursday 06 June 2024  10:33:47 +0000 (0:00:03.176)       0:00:10.119 *********
ok: [sites] => (item={'name': 'virtualhost1', 'server_name': 'www.virtualhost1.com', 'url': 'http://www.virtualhost1.com', 'document_root': '/var/www/virtualhost1'})
ok: [sites] => (item={'name': 'virtualhost2', 'server_name': 'www.virtualhost2.com', 'url': 'http://www.virtualhost2.com', 'document_root': '/var/www/virtualhost2'})

TASK [Create index.html for virtualhosts] ************************************************************************************************************************
Thursday 06 June 2024  10:33:49 +0000 (0:00:01.840)       0:00:11.959 *********
ok: [sites] => (item={'name': 'virtualhost1', 'server_name': 'www.virtualhost1.com', 'url': 'http://www.virtualhost1.com', 'document_root': '/var/www/virtualhost1'})
ok: [sites] => (item={'name': 'virtualhost2', 'server_name': 'www.virtualhost2.com', 'url': 'http://www.virtualhost2.com', 'document_root': '/var/www/virtualhost2'})

TASK [Restart Nginx service] *************************************************************************************************************************************
Thursday 06 June 2024  10:33:52 +0000 (0:00:02.972)       0:00:14.932 *********
changed: [sites]

PLAY RECAP *******************************************************************************************************************************************************
sites                      : ok=7    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 06 June 2024  10:33:54 +0000 (0:00:01.797)       0:00:16.730 *********
===============================================================================
Configure Nginx virtualhosts ------------------------------------------------------------------------------------------------------------------------------ 3.17s
Create index.html for virtualhosts ------------------------------------------------------------------------------------------------------------------------ 2.97s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------- 2.86s
Create virtualhost directories ---------------------------------------------------------------------------------------------------------------------------- 2.05s
Install Nginx web server ---------------------------------------------------------------------------------------------------------------------------------- 2.02s
Enable virtualhosts --------------------------------------------------------------------------------------------------------------------------------------- 1.84s
Restart Nginx service ------------------------------------------------------------------------------------------------------------------------------------- 1.80s
Playbook run took 0 days, 0 hours, 0 minutes, 16 seconds
```