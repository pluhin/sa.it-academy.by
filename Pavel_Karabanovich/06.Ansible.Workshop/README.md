### Homework 06.Ansible Workshop by Karabanovich_Pavel


#### Create ansible.cfg

```bash

[defaults]
#inventory     = ~/sa.it-academy.by/Pavel_Karabanovich/06.Ansible.Workshop
#inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer

```

#### Create inv.yaml

```bash
web-servers:
  vars:
    ansible_user: root
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
  hosts:
    host8:
      ansible_host: 192.168.201.8

```


#### Create nginx.yaml
```bash
---
- name: Install and configure nginx with two virtual hosts
  hosts: web-servers
  become: true
  become_method: sudo

  vars:
    vhosts:
      - name: example.com
        fqdn: www.example.com
        index_content: "Hello, example.com!"
      - name: test.com
        fqdn: www.test.com
        index_content: "Hello, test.com!"

  tasks:
    - name: Install  nginx
      apt:
        name: nginx
        state: latest
      become: yes

    - name: Create directory for virtual hosts
      file:
        path: "/var/www/{{ item.name }}"
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        state: directory
        mode: 0755
      with_items: "{{ vhosts }}"

    - name: Permissions
      ansible.builtin.file:
        path: /var/www
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        state: directory
        mode: 0755
        recurse: yes


    - name: Set up hosts
      template:
        src: "templates/nginx-vhost.j2"
        dest: "/etc/nginx/sites-available/{{ item.name }}"
      with_items: "{{ vhosts }}"

    - name: Create index files
      template:
        src: "templates/index.j2"
        dest: "/var/www/{{ item.name }}/index.html"
      with_items: "{{ vhosts }}"

    - name: Enable virtual hosts
      file:
        src: "/etc/nginx/sites-available/{{ item.name }}"
        dest: "/etc/nginx/sites-enabled/{{ item.name }}"
        state: link
      with_items: "{{ vhosts }}"
      notify: Reload Nginx

    - name: Send HTTP request to the website
      uri:
        url: "http://example.com"
        return_content: yes
      register: result

    - name: Check if the website is available
      debug:
        msg: "The website is {{ 'available' if 'HELLO' in result.content else 'not available' }}"

    - name: Send HTTP request to the website
      uri:
        url: "http://test.com"
        return_content: yes
      register: result

    - name: Check if the website is available
      debug:
        msg: "The website is {{ 'available' if 'HELLO' in result.content else 'not available' }}"

  handlers:
    - name: Reload Nginx
      service:
        name: nginx
        state: restarted


```


#### Create ~/sa.it-academy.by/Pavel_Karabanovich/06.Ansible.Workshop/templates/nginx-vhost.j2

```bash

server {
    listen 80;
    listen [::]:80;
    server_name {{ item.fqdn }};
    root /var/www/{{ item.name }};

    access_log /var/log/nginx/{{ item.name }}.access.log;
    error_log /var/log/nginx/{{ item.name }}.error.log;

    location / {
        try_files $uri $uri/ =404;
    }
}



```

#### Create ~/sa.it-academy.by/Pavel_Karabanovich/06.Ansible.Workshop/templates/index.j2

```bash

<html>
  <head>
    <title>{{ item.name }}</title>
  </head>
  <body>
    <h1>{{ item.name }}</h1>
    <p>{{ "HELLO" }}</p>
  </body>
</html>

```





#### Command history

```bash

ansible-playbook -i inv.yaml nginx.yaml


```
