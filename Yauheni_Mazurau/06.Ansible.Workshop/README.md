# 06. Ansible Workshop

Web server software - Nginx. The data for configuring Nginx is in the files nginx.conf.j2, index.html.j2 in the derrictory 06.Ansible.Workshop/templates. Variables are taken from a file 06.Ansible.Workshop/vars/main.yaml. 

main.yaml
```yaml

php_version: "7.4"
sites_config:
  - name: emazurov1
    domain: emazurov1.com
    root: /var/www/emazurov1
    url: emazurov1.com
  - name: emazurov2
    domain: emazurov2.com
    root: /var/www/emazurov2
    url: emazurov2.com

```

nginx.conf.j2

```j2

server {
  listen 80;
  server_name {{ item.domain }};
  root {{ item.root }};
  location / {
    index index.html;
  }
}

```

index.html.j2

```j2

<!DOCTYPE html>
<html>
<head>
  <title>Welcome to {{ item.domain }}</title>
</head>
<body>
  <h1>Welcome to {{ item.domain }}</h1>
  <p>This is the default page for the site {{ item.domain }}.</p>
  <p>This website is hosted on {{ ansible_fqdn }}.</p>
</body>
</html>

```

nginx_install.yaml

```yaml

- name: Install LEMP
  hosts: all_workers
  become: true

  vars_files:
    - ~/06.Ansible.Workshop/vars/main.yaml
  # vars:
  #   - php_version: "7.4"

  tasks:
    - name: Updating the package list
      apt:
        update_cache: yes

    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Starting the service Nginx
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Install MySQL
      apt:
        name: mysql-server
        state: present

    - name: Starting the service MySQL
      service:
        name: mysql
        state: started
        enabled: yes

    - name: Installation of PHP and necessary modules
      apt:
        name: "{{ item }}"
        state: present
      loop:
        - php-fpm
        - php-mysql
        - php-gd
        - php-cli
        - php-common
        - php-curl

    - name: Setting PHP-FPM
      lineinfile:
        path: /etc/php/{{ php_version }}/fpm/php.ini
        line: "{{ item.key }} = {{ item.value }}"
      loop:
        - { key: 'cgi.fix_pathinfo', value: '0' }
        - { key: 'upload_max_filesize', value: '2M' }
        - { key: 'max_execution_time', value: '30' }        
      notify:        
        - resrestarted PHP-FPM
              

    - name: Creating directories for sites
      file:
        path: "{{ item.root }}"
        state: directory
        mode: '0755'
      loop: "{{ sites_config }}"

    - name: Creating configurations for sites
      template:
        src: templates/nginx.conf.j2
        dest: "/etc/nginx/sites-available/{{ item.name }}"
      loop: "{{ sites_config }}"
      notify:
        - restarted Nginx

    - name: Symbolic reference to the site configuration
      file:
        src: "/etc/nginx/sites-available/{{ item.name }}"
        dest: "/etc/nginx/sites-enabled/{{ item.name }}"
        state: link
      loop: "{{ sites_config }}"
      notify:
        - restarted Nginx

    - name: Create index.html for each site
      template:
        src: index.html.j2
        dest: "{{ item.root }}/index.html"
      with_items: "{{ sites_config }}"

    - name: Add sites to /etc/hosts
      lineinfile:
        path: /etc/hosts
        line: "{{ ansible_default_ipv4.address }} {{ item.url }}"
        state: present
      loop: "{{ sites_config }}"

    - name: Remove old HTML files
      file:
        path: /var/www/html
        state: absent

    # - name: Check content to the sites
    #   uri:
    #     url: "{{ item }}"
    #     return_content: yes
    #   with_items:
    #    - emazurov1.com
    #    - emazurov2.com
    #   #loop: "{{ sites_config }}"    
    #   register: this
    #   failed_when: "This website is hosted on"
    #   tags:
    #   - tests

    # - name: Send HTTP request to the website
    #   uri:
    #     url: "{{ item.url }}"
    #     return_content: yes
    #   loop: "{{ sites_config }}"
    #   register: website_response

    # - name: Check if the website is available
    #   fail:
    #     msg: "Website is not accessible"
    #   when: website_response.status != 200

  handlers:
    - name: restarted PHP-FPM
      service:
        name: php{{ php_version }}-fpm
        state: restarted

    - name: restarted Nginx
      service:
        name: nginx
        state: restarted

```



