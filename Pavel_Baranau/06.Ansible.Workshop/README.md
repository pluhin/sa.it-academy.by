# 06. Ansible Workshop
## index.html.j2
```html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to {{ item.server_name }}</title>
</head>
<body>
    <h1>Welcome to {{ item.server_name }}</h1>
    <p>This is the default index.html page for {{ item.server_name }}.</p>
</body>
</html>
```

## nginx-virtual-host.conf.j2
```jinja2
server {
    listen 80;
    server_name {{ item.server_name }};

    root /var/www/{{ item.server_name }};


    location / {
        index index.html;
    }
}
```

## inv.yaml
```yaml
web:
  hosts:
    web1:
      ansible_host: 192.168.100.99
    site:
      ansible_host: vhost1.com
  vars:
    ansible_user: baranau
```

## vars.yaml
```yaml
ng_virtual_hosts:
  - server_name: vhost1.com
  - server_name: vhost2.com
  - server_name: vhost3.com
```

## nginx.yaml
```yaml
- hosts: web1
  become: yes
  tasks:
    - name: Ping
      ping:

    - name: Update cache
      apt:
        update_cache: yes

    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Ensure Nginx is started and enabled
      systemd:
        name: nginx
        state: started
        enabled: yes

    - name: Create config directory vhost
      file:
        path: /etc/nginx/sites-available
        state: directory

    - name: Create config file vhost
      file:
        path: /var/www/{{ item.server_name }}
        state: directory
      with_items: "{{ ng_virtual_hosts }}"

    - name: Configured vhost
      template:
        src: nginx-virtual-host.conf.j2
        dest: /etc/nginx/sites-available/{{ item.server_name }}
      with_items: "{{ ng_virtual_hosts }}"

    - name: Create index.html
      template:
        src: index.html.j2
        dest: /var/www/{{ item.server_name }}/index.html
      with_items: "{{ ng_virtual_hosts }}"

    - name : Enabled vhost
      file:
        src: /etc/nginx/sites-available/{{ item.server_name }}
        dest: /etc/nginx/sites-enabled/{{ item.server_name }}
        state: link
      with_items: "{{ ng_virtual_hosts  }}"

    - name: Restart Nginx
      service:
        name: nginx
        state: restarted

    - name: Print virtual hosts content
      uri:
        url: "http://{{ item.server_name  }}/index.html"
        return_content: yes
      register: result
      with_items: "{{ ng_virtual_hosts }}"
      failed_when: result.status != 200
    - debug:
        msg: "{{ item.content }}"
      with_items: "{{ result.results }}"
```
