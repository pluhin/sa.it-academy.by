# НА 1: Configuration Management

# ansible plqybook:

```yml
---
  - name: Install Nginx Web Server on Ubuntu
    hosts: lab2
    vars_files:
      - var/default.yaml

    tasks:
      - name: Unstall nginx
        ansible.builtin.apt:
          name: nginx
          state: latest
          update_cache: true
        tags: download
         
      - name: nginx creating index file
        ansible.builtin.file:
          path: /var/www/{{ item.names }}.com/html
          state: directory
        loop: "{{ hosts_vars }}"
        tags: virtualhosts
        
      - name: index file
        ansible.builtin.copy:      
          dest: /var/www/{{ item.names }}.com/html/index.html
          content: |
            <html>
              <head>
                  <title>{{ item.names }}</title>
              </head>
            </html>
        loop: "{{ hosts_vars }}"
        tags: virtualhosts
                
      - name: nginx creating virtualhosts
        ansible.builtin.template:
            src: example_config.j2
            dest: /etc/nginx/sites-available/{{ item.names }}.com
        loop: "{{ hosts_vars }}"
        tags: virtualhosts
              

      - name: connecting virtual hosts
        ansible.builtin.file:
          src: /etc/nginx/sites-available/{{ item.names }}.com
          dest: /etc/nginx/sites-enabled/{{ item.names }}.com
          state: link
          force: yes
        loop: "{{ hosts_vars }}"
        tags: virtualhosts
        
      - name: nginx restart
        systemd:
          name: nginx
          enabled: yes
          state: restarted
  
      - name: Check that a page returns successfully but fail if the word {{ item.names }} is not in the page contents
        ansible.builtin.uri:
          url: http://{{ item.names }}.com:{{ item.port }}
          status_code: 200
          return_content: true
        loop: "{{ hosts_vars }}"
        register: this
        failed_when: this is failed
        tags: check_hosts
        delegate_to: localhost
      
...
```

### inventory

```yml
lab2:
  hosts:
    192.168.202.14
```
### ansible config
```
[defaults]
inventory=my_inventory.yml
```

### contents of var/default.yaml

```yml
hosts_vars:
 - names: check_host1
   port: 8080
 - names: check_host2
   port: 8081

```

### template example_config.j2

```
server {
        listen {{ item.port }};
        listen [::]:{{ item.port }};

        root /var/www/{{ item.names }}.com/html;
        index index.html index.htm index.nginx-debian.html;

        server_name {{ item.names }}.com www.{{ item.names }}.com;

        location / {
                try_files $uri $uri/ =404;
       }
}
```

## Command output  ansible-playbook nginx_install.yml

```
PLAY [Install Nginx Web Server on Ubuntu] **************************************************************

TASK [Gathering Facts] *********************************************************************************
ok: [192.168.202.14]

TASK [Unstall nginx] ***********************************************************************************
ok: [192.168.202.14]

TASK [nginx creating index file] ***********************************************************************
ok: [192.168.202.14] => (item={'names': 'check_host1', 'port': 8080})
ok: [192.168.202.14] => (item={'names': 'check_host2', 'port': 8081})

TASK [index file] **************************************************************************************
ok: [192.168.202.14] => (item={'names': 'check_host1', 'port': 8080})
ok: [192.168.202.14] => (item={'names': 'check_host2', 'port': 8081})

TASK [nginx creating virtualhosts] *********************************************************************
ok: [192.168.202.14] => (item={'names': 'check_host1', 'port': 8080})
ok: [192.168.202.14] => (item={'names': 'check_host2', 'port': 8081})

TASK [connecting virtual hosts] ************************************************************************
ok: [192.168.202.14] => (item={'names': 'check_host1', 'port': 8080})
ok: [192.168.202.14] => (item={'names': 'check_host2', 'port': 8081})

TASK [nginx restart] ***********************************************************************************
changed: [192.168.202.14]

TASK [Check that a page returns successfully but fail if the word {{ item.names }} is not in the page contents] ***
ok: [192.168.202.14 -> localhost] => (item={'names': 'check_host1', 'port': 8080})
ok: [192.168.202.14 -> localhost] => (item={'names': 'check_host2', 'port': 8081})

PLAY RECAP *********************************************************************************************
192.168.202.14             : ok=8    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```
