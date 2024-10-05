# Homework Assignment 1: Configuration Management

1. Choose a web server software (e.g., Nginx) for configuration management.
  * Nginx
2. Write an Ansible playbook to install and configure the chosen web server on a remote host (two virtualhosts using templates).
```bash
fadeev@kirill:~/ans_nginx$ cat inv.yaml
all_web:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.20.53 -p 32510"'
  hosts:
    nginx:
      ansible_host: 192.168.202.21

fadeev@kirill:~/ans_nginx$ cat nginx.yaml
- hosts: nginx

  vars:
    server_name: "{{ s_name }}"
    root: /var/www/"{{ s_name }}"

  pre_tasks:
  - name: Validate
    debug:
      msg:
       - "Virtual server: {{ item }}"
       - "Root: /var/www/{{ item }}"
    loop: "{{ server_name }}"

  tasks:
  - name: Update apt package index
    ansible.builtin.apt:
     update_cache: yes

  - name: Install Nginx
    ansible.builtin.apt:
     name: nginx
     state: latest
     state: present

  - name: Add hosts
    ansible.builtin.lineinfile:
      path: /etc/hosts
      line: "{{ ansible_host }} {{ item }}.local"
    loop: "{{ s_name }}"

  - name: Create document roots for virtual hosts
    ansible.builtin.file:
     path: /var/www/{{ item }}
     state: directory
     owner: www-data
     group: www-data
     mode: '0755'
    loop: "{{ server_name }}"

  - name: Create virtual host configuration files
    ansible.builtin.template:
     src: nginx_vhost.j2
     dest: /etc/nginx/sites-available/{{ item }}.conf
    loop: "{{ server_name }}"

  - name: Enable virtual host configuration
    ansible.builtin.file:
     src: /etc/nginx/sites-available/{{ item }}.conf
     dest: /etc/nginx/sites-enabled/{{ item }}.conf
     state: link
    loop: "{{ server_name }}"

  - name: Remove default Nginx configuration
    ansible.builtin.file:
     path: /etc/nginx/sites-enabled/default
     state: absent
     force: yes

  - name: Test Nginx configuration
    ansible.builtin.command: nginx -t
    register: nginx_test
    ignore_errors: yes

  - name: Fail if Nginx configuration is invalid
    ansible.builtin.fail:
     msg: "Nginx configuration is invalid"
    when: nginx_test.rc != 0

  - name: Create HTML page
    ansible.builtin.template:
     src: nginx_html.j2
     dest: /var/www/{{ item }}/index.html
    loop: "{{ server_name }}"


  - name: Reload Nginx
    ansible.builtin.service:
     name: nginx
     state: reloaded

  - name: Check that a page returns successfully but fail if the word 'prod' is not in the page contents
    ansible.builtin.uri:
      url: http://{{ item }}.local
      return_content: true
    register: content
    failed_when: "'prod' not in content.content"
    loop: "{{ server_name }}"


--- Template for config file---
fadeev@kirill:~/ans_nginx$ cat templates/nginx_vhost.j2
server {
listen 80;
server_name {{ item }}.local;

root /var/www/{{ item }};
index index.html;

location / {
try_files $uri $uri/ =404;
}
}
```
3. Include tasks to create a simple HTML file served by the web server, with unique data inside (host name and FQDN) for each virtualhost.
```bash
 - name: Create HTML page
    template:
     src: nginx_html.j2
     dest: /var/www/{{ item }}/index.html
    loop: "{{ server_name }}"

---Template for HTML page---
fadeev@kirill:~/ans_nginx$ cat templates/nginx_html.j2
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Results</title>
</head>

<body>
  <h1>This is page for {{ item }} site.</h1>
</body>
</html>

```
4. Run the playbook and ensure the web server is installed, configured, and serving the HTML file.
```bash
fadeev@kirill:~/ans_nginx$ ansible-playbook -i inv.yaml nginx.yaml -e '{"s_name":[prod,sales]}' -u root
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/06.Ansible.workshop/img/1.jpg)  

![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/06.Ansible.workshop/img/2.jpg)  
Последняя проверка проводилась на наличие слова, которе есть только в одном хосте.