## Homework assignment 06.Ansible.Workshop

>Note: This code (executing of playbooks) you can retry with your Ansible directory. This code independent from path in my own PC.
Execution history of homework.
```bash 
  566  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/
  567  mkdir 06.Ansible.Workshop
  568  cd 06.Ansible.Workshop
  569  cp -r ../05.Ansible.start ./
  570  rmdir -r 05.Ansible.start
  571  rmdir -r ./05.Ansible.start/*
  572  rm -r ./05.Ansible.start/*
  573  rmdir 05.Ansible.start
  574  cp -rp ../05.Ansible.start ./
  575  rm -r ./05.Ansible.start/*
  576  rmdir 05.Ansible.start
  577  cp -r ../05.Ansible.start/* ./*
  578  cp -r ../05.Ansible.start ./*
  579  rm -r ./*
  580  rmdir ./*
  581  cd ../
  582  cp -r 05.Ansible.start/* 06.Ansible.Workshop/
  583  rm install_htop.yml hello.yaml add_user.yml
  584  cd 06.Ansible.Workshop
  585  rm install_htop.yml hello.yaml add_user.yml
  586  rm -r ./vars ./group_vars
  587  vim inv.yml
  588  vim mysql.yaml
  589  vim web-server.yaml
  590  mkdir templates html
  591  ls
  592  cd html
  593  vim site1.html
  594  cp site1.html site2.html
  595  ls
  596  vim site2.html
  597  cd ../temlates
  598  ls
  599  cd ../templates
  600  ls
  601  vim web-server.conf.j2
  602  cd ../
  603  ssh root@192.168.201.6
  604  ssh-copy-id  root@192.168.201.6
  605  logout
  606  ssh root@192.168.201.6
  607  vim inv,yml
  608  vim ../inv,yml
  609  rm ../inv,yml inv.yml
  610  rm  inv.yml
  611  ls
  612  rm inv,yml
  613  ls
  614  vim inv.yml
  615  ansible-playbook -i inv.yml web-server.yaml
  616  vim web-server.yaml
  617  vim inv.yml
  618  ls
  619  ansible -i inv.yaml -m ping mysql, -u root --ask-pass
  620  ansible -i inv.yaml -m ping mysql, -u root
  621  ansible -i inv.yaml -m ping mysql, -u root --ask-pass
  622  ansible -i inv.yml -m ping mysql, -u root --ask-pass
  623  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql, -u root --ask-pass
  624  ansible -i inv.yml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql, -u root --ask-pass
  625  ansible-playbook -i inv.yml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  626  ansible-playbook -i inv.yml web-server.yaml
  627  vim  web-server.yaml
  628  ansible-playbook -i inv.yml web-server.yaml
  629  cd templates
  630  ls
  631  web-server.conf.j2
  632  vim web-server.conf.j2
  633  cd ../
  634  vim  web-server.yaml
  635  cd templates
  636  ls
  637  vim web-server.conf.j2
  638  ansible-playbook --syntax-check web-server.conf.j2
  639  cd ../
  640  ansible-playbook --syntax-check web-server.yaml
  641  vim inv.yml
  642  vim ansible.cfg
  643  vim inv.yml
  644  ansible-playbook -i inv.yml web-server.yaml
  645  vim inv.yml
  646  ansible-playbook -i inv.yml web-server.yaml
  647  cd templates
  648  ls
  649  vim web-server.conf.j2
  650  vim web-server.yaml
  651  rm web-server.yaml
  652  cd ../
  653  vim web-server.yaml
  654  ansible-playbook -i inv.yml web-server.yaml
  655  vim web-server.yaml
  656  ansible-playbook -i inv.yml web-server.yaml
  657  vim web-server.yaml
  658  ansible-playbook -i inv.yml web-server.yaml
  659  vim web-server.yaml
  660  ansible-playbook -i inv.yml web-server.yaml
  661  vim web-server.yaml
  662  ansible-playbook -i inv.yml web-server.yaml
  663  vim web-server.yaml
  664  ansible-playbook -i inv.yml web-server.yaml
  665  vim web-server.yaml
  666  ansible-playbook -i inv.yml web-server.yaml
  667  vim web-server.yaml
  668  ansible-playbook -i inv.yml web-server.yaml
  669  cd /DEVOPS/Repo/sa.it-academy.by/Uladzislau_Krejzo/06.Ansible.Workshop/
  670  ansible-playbook -i inv.yml web-server.yaml
  671  vim  web-server.yaml
  672  ansible-playbook -i inv.yml web-server.yaml
  673  vim  web-server.yaml
  674  ansible-playbook -i inv.yml web-server.yaml
  675  vim  web-server.yaml
  676  ssh root@192.168.201.6
  677  ansible-playbook -i inv.yml web-server.yaml
  678  history > README.md
```

# Ansible files

Ansible Playbook web-server.yaml
```bash 
- hosts: mysql
  become: yes
  vars:
    vhost_name:
      - site1
      - site2
  tasks: 
  - name: Update app list 
    apt: 
      update_cache: yes
    tags: install

  - name: Check existence nginx
    stat:
      path: /etc/nginx/nginx.conf
    register: nginx_installed
    ignore_errors: yes
    tags: install

  - name: Install nginx
    apt:
      name: nginx
      state: latest
    when: not nginx_installed.stat.exists
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install

  - name: Create directory for vhost
    file:
      path: "/var/www/{{ item }}/html/"
      owner: "{{ ansible_env.SUDO_USER }}"
      group: "{{ ansible_env.SUDO_USER }}"
      mode: 0755
      state: directory
    loop: "{{ vhost_name }}"
    tags: config

  - name: Template config for nginx
    ansible.builtin.template: 
      src: "{{ playbook_dir }}/templates/web-server.conf.j2"
      dest: "/etc/nginx/sites-available/{{ item }}"
      owner: "{{ ansible_env.SUDO_USER }}"
      group: "{{ ansible_env.SUDO_USER }}"
      mode: 0755
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Link config in nginx settings
    file: 
      src: /etc/nginx/sites-available/{{ item }}
      dest: "/etc/nginx/sites-enabled/{{ item }}"
      state: link
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Using html
    ansible.builtin.template:
      src: "{{ playbook_dir }}/html/{{ item }}.html"
      dest: "/var/www/{{ item }}/html/index.html"
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Add sites to hosts
    shell: |
      grep -q {{ item }} /etc/hosts || echo 127.0.0.1 {{ item }} >> /etc/hosts;
    loop: "{{ vhost_name }}"
    tags: nginx

  - name: Run systemctl for check before status command
    ansible.builtin.command: systemctl status nginx.service
    register: nginx_status
    changed_when: false
    failed_when: "nginx_status.rc not in [0, 3]"
    tags: restart

  - name: Display Nginx service status before
    ansible.builtin.debug:
      var: nginx_status.stdout_lines
    tags: restart

  - name: Restart nginx
    service:
      name: nginx
      state: restarted
    tags: restart

  - name: Run systemctl for check after status command
    ansible.builtin.command: systemctl status nginx.service
    register: nginx_status
    changed_when: false
    failed_when: "nginx_status.rc not in [0, 3]"
    tags: restart
  
  - name: Display Nginx service status after
    ansible.builtin.debug:
      var: nginx_status.stdout_lines
    tags: restart

  - name: Check sites
    ansible.builtin.uri:
      url: "http://{{ item }}"
      return_content: true
    register: export
    loop: "{{ vhost_name }}"
    failed_when: export.status != 200
    tags: check

  - name: Message results
    ansible.builtin.debug:
      msg: "{{ item.content }}"
    with_items: "{{ export.results }}"
    tags: check
```
mysql.yaml
```bash

- hosts: mysql
  vars:
    app_packages:
      - mysql-server
      - mysql-client
      - python3-pymysql
      - python3-mysqldb
    db_name: "{{ name_db | default('test') }}"
    db_user: "{{ user_db | default('test') }}"
    db_pass: "{{ pass_db | default('test') }}"
  pre_tasks:
  - name: Validate
    tags: always
    debug:
      msg:
       - "DB host: {{ ansible_host }}"
       - "DB name: {{ db_name }}"
       - "DB user: {{ db_user }}"
       - "DB pass: {{ db_pass }}"
  tasks:
  - name: MySQL. Install packages
    apt:
      name: "{{ app_packages }}"
      state: latest
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install
  - name: MySQL. add bind-address
    ini_file:
      dest: /etc/mysql/my.cnf
      section: mysqld
      option: "bind-address"
      value: "{{ ansible_host }}"
    register: restart_needed
  - name: Check variable
    debug:
      msg: "{{ restart_needed }}"
  - name: restart mysql if necessary
    command: service mysql restart
    when: restart_needed.changed

  - name: Test connect
    wait_for:
      host: "{{ ansible_host }}"
      port: 3306
      timeout: 3
  - name: Test connect
    wait_for:
      host: "{{ ansible_host }}"
      port: 3306
      timeout: 3
  - name: "Remove {{ db_name }} database"
    mysql_db:
      name: "{{ db_name }}"
      state: absent
      login_unix_socket: /var/run/mysqld/mysqld.sock
    tags: never
  - name: "Remove {{ db_user }} user"
    mysql_user:
      name: "{{ db_user }}"
      host: "%"
      state: absent
      login_unix_socket: /run/mysqld/mysqld.sock
    tags: never
  - mysql_db:
      name: "{{ db_name }}"
      encoding: utf8
      collation: utf8_bin
      login_unix_socket: /var/run/mysqld/mysqld.sock

  - name: "Create user {{ db_user }} for {{ db_name }}" 
    mysql_user:
      name: "{{ db_user }}"
      host: "%"
      password: "{{ db_pass }}"
      priv: "{{ db_name }}.*:ALL"
      login_unix_socket: /var/run/mysqld/mysqld.sock
    no_log: yes
```

inv.yml

```bash

all:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  hosts:
    mysql:
      ansible_host: 192.168.201.6
```
ansible.cfg
```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
templates/web-server.conf.j2
```bash
server {
  listen 80;
  listen [::]:80;
  server_name {{ item }};
  root /var/www/{{ item }}/html/;
  
  location / {
      index index.html index.htm index.nginx-debian.html;
      try_files $uri.html $uri $uri/ =404;
  }

  access_log /var/log/nginx/{{ item }}_access.log;
  error_log /var/log/nginx/{{ item }}_error.log;

}
```
# HTML Pages
First page site1.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>Site one</title>
</head>
<body>
    <h1>Site one Ansible workshop</h1>
    <p>Host name: {{ ansible_hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```
Second page site2.html
```html
<!DOCTYPE html>
<html>
<head>
    <title>Site 2</title>
</head>
<body>
    <h1>Site two Ansible workshop</h1>
    <p>Host name: {{ ansible_hostname }}</p>
    <p>FQDN: {{ ansible_fqdn }}</p>
</body>
</html>
```
