# history commands

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible-inventory -i inv.yaml --graph


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
@all:
  |--@ungrouped:
  |--@db_all:
  |  |--mysql
```

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible-inventory -i inv.yaml --host mysql


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
{
    "ansible_host": "192.168.201.3",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510\""
}
```

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible -i inv.yaml -m ping db_all -u root


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
mysql | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql  -u root


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
mysql | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDzfjKmDsmFl/aZA/RobUGhqrdymvbBnyW/eaOO5df+S+ZaDhzefMYzJaND8gfLFL2+0U6YpFR022dKpT5M7Tcv4gRSeif1XfrdcoUU6k1Q4ahV0WaOIooMWLJ9kcwYUvumHv36btv68qC9SJgMfvPo+QRjTKQNiSFTnefI7qFnfdWhyjdRyc76vAHWIxnxc6IxzBs8A1A7Dma3gHNpnu5O70AOfbFkModjZRc6zw7lzUCLt7Cdn68vl1gVL076srvfVdVpcytGi0o2ri0Ks9TAO98F+B7oCaoSODHTV1Wvi60oUDi/vhoDXWZcIIAMzuUPC7NrnoKLtX/9iW8oQyMXDTIk7bpH8sh/+9zU9o8662yngDrono+fZguTsTZp89KMH7FgPDt8vjvSg2LHtRUE8HnJ3VS8XXfqwm3FwVBmAwGkIj//fy3HbReLPV6XnQ0W/LNQhugvByBudGUxhOwQjiGil2bXgtiXr04+Uw1I1XR3cJX8MfsB28jgn3cXrS0= zhivushko_av@DESKTOP-NGTG70N",
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true
}
```

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zhiv -e user_db=zhiv -e pass_db=admin -u root


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir

PLAY [mysql] ************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [Validate] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql] => {
    "msg": [
        "DB host: 192.168.201.3",
        "DB name: zhiv",
        "DB user: zhiv",
        "DB pass: admin"
    ]
}

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
mysql                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

```bash
⋊> /m/c/s/m/A/06.Ansible.worshop on 7bb1595a  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zhiv -e user_db=zhiv -e pass_db=admin -u root


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.worshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir

PLAY [mysql] ************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [Validate] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql] => {
    "msg": [
        "DB host: 192.168.201.3",
        "DB name: zhiv",
        "DB user: zhiv",
        "DB pass: admin"
    ]
}

TASK [MySQL. Install packages] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [mysql]

TASK [MySQL. add bind-address] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [mysql]

TASK [Check variable] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql] => {
    "msg": {
        "changed": true,
        "diff": {
            "after": "",
            "after_header": "/etc/mysql/my.cnf (content)",
            "before": "",
            "before_header": "/etc/mysql/my.cnf (content)"
        },
        "failed": false,
        "gid": 0,
        "group": "root",
        "mode": "0644",
        "msg": "section and option added",
        "owner": "root",
        "path": "/etc/mysql/my.cnf",
        "size": 720,
        "state": "file",
        "uid": 0
    }
}

TASK [restart mysql if necessary] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [mysql]

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
mysql                      : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

```bash
⋊> /m/c/s/m/A/06.Ansible.workshop on 7bb1595a  ansible-playbook -i inv.yaml mysql.yaml -e name_db=zhiv -e user_db=zhiv -e pass_db=admin -u root


[WARNING]: Ansible is being run in a world writable directory (/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop), ignoring it as an ansible.cfg source. For more information see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir

PLAY [mysql] ************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [Validate] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql] => {
    "msg": [
        "DB host: 192.168.201.3",
        "DB name: zhiv",
        "DB user: zhiv",
        "DB pass: admin"
    ]
}

TASK [MySQL. Install packages] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [MySQL. add bind-address] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [Check variable] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql] => {
    "msg": {
        "changed": false,
        "diff": {
            "after": "",
            "after_header": "/etc/mysql/my.cnf (content)",
            "before": "",
            "before_header": "/etc/mysql/my.cnf (content)"
        },
        "failed": false,
        "gid": 0,
        "group": "root",
        "mode": "0644",
        "msg": "OK",
        "owner": "root",
        "path": "/etc/mysql/my.cnf",
        "size": 720,
        "state": "file",
        "uid": 0
    }
}

TASK [restart mysql if necessary] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************
skipping: [mysql]

TASK [Test connect] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [mysql_db] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

TASK [Create user zhiv for zhiv] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [mysql]

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
mysql                      : ok=8    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```

## Homework Assignment 1: Configuration Management

1. Choose a web server software (e.g., Nginx) for configuration management.

```nginx
server {
    listen 80;
    listen [::]:80;

    index index.html;
    server_name {{ item }};


    location / {
        root /var/www/{{ item }};
        try_files $uri $uri/ =404;
    }
}
```

1. Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates).

```yaml
---
- name: Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates)
  hosts: host05
  vars:
    site_name:
      - example_first.io
      - example_second.io

  tasks:
# NGINX install
    - name: install Nginx
      apt:
        name: nginx
        state: latest
        update_cache: yes
      when:
        ansible_os_family == "Debian"
      notify: Start Nginx
    
    - name: Create site dir
      file:
        path: "/var/www/{{ item }}"
        state: directory
      loop: "{{ site_name }}"

# HTML
    - name: Create HTML
      template:
        src: "../templates/index.html.j2"
        dest: "/var/www/{{ item }}/index.html"
      loop: "{{ site_name }}"

# NGINX config
    - name: Sets Nginx conf file
      template:
        src: "../templates/nginx.conf.j2"
        dest: "/etc/nginx/sites-available/{{ item }}"
      loop: "{{ site_name }}"
    
    - name: Enables new site
      file:
        src: "/etc/nginx/sites-available/{{ item }}"
        dest: "/etc/nginx/sites-enabled/{{ item }}"
        state: link
      loop: "{{ site_name }}"
      notify: Reload Nginx

    - name: Removes "default" site
      file:
        path: "/etc/nginx/sites-enabled/default"
        state: absent
      notify: Reload Nginx

# VHosts add
    - name: Add site to virtual host
      lineinfile:
        path: "/etc/hosts"
        line: "127.0.0.1 {{ item }}"
        state: present
      loop: "{{ site_name }}"
      notify: Restart Nginx

    # - name: Open tcp port 80
    #   ufw:
    #     state: enabled
    #     rule: allow
    #     port: '80'
    #     proto: tcp

    - name: Check that you can connect (GET) to a page and it returns a status 200
      uri:
        url: http://{{ item }}
        return_content: true
      loop: "{{ site_name }}"
      register: out
      failed_when: out.status != 200

    - name: Debug 200 code
      debug:
        msg: "{{ item.content }}"
      with_items: "{{ out.results }}"

    # - name: Check that a page returns a status 200 and fail if the word AWESOME is not in the page contents
    #   uri:
    #     url: http://{{ item }}
    #     return_content: true
    #   register: this
    #   failed_when: >
    #     this.status != 200 or
    #     "'<!DOCTYPE html>' not in this.content"
    #   loop: "{{ site_name }}"

  handlers:
    - name: Start Nginx
      systemd:
        name: nginx
        enabled: yes
        state: started
        
    - name: Reload Nginx
      service:
        name: nginx
        state: reloaded

    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
```

1. Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>{{ item }}</title>
</head>
<body>
    <h1>Hostname: {{ ansible_hostname }}, {{ item }} hosted {{ ansible_fqdn }}</h1>
    <h2>awesome</h2>
</body>
</html>
```

1. Run the playbook and ensure the web server is installed, configured, and serving the HTML file.

```bash
⋊> /m/c/s/my-study on 7bb1595a  ansible-playbook -i ./Artem_Zhivushko/05.Ansible.start/playbook/inv.yaml ./Artem_Zhivushko/06.Ansible.workshop/playbooks/nginx.yaml -u root


PLAY [Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates)] **********************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05]

TASK [install Nginx] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [host05]

TASK [Create site dir] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [host05] => (item=example_first.io)
changed: [host05] => (item=example_second.io)

TASK [Create HTML] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option
failed: [host05] (item=example_first.io) => {"ansible_loop_var": "item", "changed": false, "item": "example_first.io", "msg": "Could not find or access 'Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2'\nSearched in:\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/templates/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/templates/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2 on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option
failed: [host05] (item=example_second.io) => {"ansible_loop_var": "item", "changed": false, "item": "example_second.io", "msg": "Could not find or access 'Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2'\nSearched in:\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/templates/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/templates/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2\n\t/mnt/c/src/my-study/Artem_Zhivushko/06.Ansible.workshop/playbooks/Artem_Zhivushko/06.Ansible.workshop/templates/index.html.j2 on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
host05                     : ok=3    changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
```

```bash
⋊> /m/c/s/my-study on 7bb1595a  ansible-playbook -i ./Artem_Zhivushko/05.Ansible.start/playbook/inv.yaml ./Artem_Zhivushko/06.Ansible.workshop/playbooks/nginx.yaml -u root


PLAY [Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates)] **********************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05]

TASK [install Nginx] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05]

TASK [Create site dir] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Create HTML] ******************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Sets Nginx conf file] *********************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Enables new site] *************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Removes "default" site] *******************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05]

TASK [Add site to virtual host] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Check that you can connect (GET) to a page and it returns a status 200] *******************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item=example_first.io)
ok: [host05] => (item=example_second.io)

TASK [Debug 200 code] ***************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host05] => (item={'content': '<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n    <title>example_first.io</title>\n</head>\n<body>\n    <h1>Hostname: sa-5, example_first.io hosted sa-5.it-academy.local</h1>\n    <h2>awesome</h2>\n</body>\n</html>', 'redirected': False, 'url': 'http://example_first.io', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Tue, 06 Feb 2024 20:42:44 GMT', 'content_type': 'text/html', 'content_length': '229', 'last_modified': 'Tue, 06 Feb 2024 19:35:27 GMT', 'connection': 'close', 'etag': '"65c289ff-e5"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (229 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://example_first.io', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'example_first.io', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>example_first.io</title>\n</head>\n<body>\n    <h1>Hostname: sa-5, example_first.io hosted sa-5.it-academy.local</h1>\n    <h2>awesome</h2>\n</body>\n</html>"
}
ok: [host05] => (item={'content': '<!DOCTYPE html>\n<html lang="en">\n<head>\n    <meta charset="UTF-8">\n    <title>example_second.io</title>\n</head>\n<body>\n    <h1>Hostname: sa-5, example_second.io hosted sa-5.it-academy.local</h1>\n    <h2>awesome</h2>\n</body>\n</html>', 'redirected': False, 'url': 'http://example_second.io', 'status': 200, 'server': 'nginx/1.18.0 (Ubuntu)', 'date': 'Tue, 06 Feb 2024 20:42:45 GMT', 'content_type': 'text/html', 'content_length': '231', 'last_modified': 'Tue, 06 Feb 2024 19:35:28 GMT', 'connection': 'close', 'etag': '"65c28a00-e7"', 'accept_ranges': 'bytes', 'cookies_string': '', 'cookies': {}, 'msg': 'OK (231 bytes)', 'elapsed': 0, 'changed': False, 'invocation': {'module_args': {'url': 'http://example_second.io', 'return_content': True, 'force': False, 'http_agent': 'ansible-httpget', 'use_proxy': True, 'validate_certs': True, 'force_basic_auth': False, 'use_gssapi': False, 'body_format': 'raw', 'method': 'GET', 'follow_redirects': 'safe', 'status_code': [200], 'timeout': 30, 'headers': {}, 'remote_src': False, 'unredirected_headers': [], 'decompress': True, 'use_netrc': True, 'unsafe_writes': False, 'url_username': None, 'url_password': None, 'client_cert': None, 'client_key': None, 'dest': None, 'body': None, 'src': None, 'creates': None, 'removes': None, 'unix_socket': None, 'ca_path': None, 'ciphers': None, 'mode': None, 'owner': None, 'group': None, 'seuser': None, 'serole': None, 'selevel': None, 'setype': None, 'attributes': None}}, 'failed': False, 'failed_when_result': False, 'item': 'example_second.io', 'ansible_loop_var': 'item'}) => {
    "msg": "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>example_second.io</title>\n</head>\n<body>\n    <h1>Hostname: sa-5, example_second.io hosted sa-5.it-academy.local</h1>\n    <h2>awesome</h2>\n</body>\n</html>"
}

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
host05                     : ok=10   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
