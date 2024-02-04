# 06. Ansible Workshop

## playbook for nginx installation
```yaml
---
- name: Install and Configure Nginx
  hosts: all
  become: yes

  tasks:
  - name: Install Nginx
    apt:
      name: nginx
      state: latest
      update_cache: yes

  - name: Start Nginx and Enable at Boot
    service:
      name: nginx
      state: started
      enabled: yes

```
Run the playbook

```bash
skefil@skefil:~/ansible-playbooks$ ansible-playbook nginx_setup.yml

```

Output

```bash

PLAY [Install and Configure Nginx] ******************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Install Nginx] ********************************************************************************************************************
ok: [192.168.202.2]
changed: [192.168.202.1]

TASK [Start Nginx and Enable at Boot] ***************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

PLAY RECAP ******************************************************************************************************************************
192.168.202.1              : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.168.202.2              : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Templates
## playbook 
```yaml
---
- name: Install and Configure Nginx
  hosts: all
  become: yes

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: latest
        update_cache: yes

    - name: Start Nginx and Enable at Boot
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Create directories for VirtualHosts
      file:
        path: "{{ item }}"
        state: directory
        mode: '0755'
      loop:
        - /var/www/vhost1
        - /var/www/vhost2

    - name: Setup VirtualHost 1
      ansible.builtin.template:
        src: templates/nginx_vhost.j2
        dest: /etc/nginx/sites-available/vhost1.conf
      vars:
        vhost:
          server_name: vhost1.example.com
          document_root: /var/www/vhost1

    - name: Setup VirtualHost 2
      ansible.builtin.template:
        src: templates/nginx_vhost.j2
        dest: /etc/nginx/sites-available/vhost2.conf
      vars:
        vhost:
          server_name: vhost2.example.com
          document_root: /var/www/vhost2

    - name: Enable VirtualHosts
      file:
        src: "/etc/nginx/sites-available/{{ item }}"
        dest: "/etc/nginx/sites-enabled/{{ item }}"
        state: link
        force: yes
      loop:
        - vhost1.conf
        - vhost2.conf

    - name: Copy index files for VirtualHosts
      ansible.builtin.template:
        src: templates/index{{ item }}.html.j2
        dest: "/var/www/vhost{{ item }}/index.html"
      loop:
        - 1
        - 2
      notify: restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted

```
Output

```bash

skefil@skefil:~/ansible-playbooks$ ansible-playbook nginx_setup.yml

PLAY [Install and Configure Nginx] *********************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Install Nginx] ***********************************************************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Start Nginx and Enable at Boot] ******************************************************************************************************************************
ok: [192.168.202.2]
ok: [192.168.202.1]

TASK [Create directories for VirtualHosts] *************************************************************************************************************************
ok: [192.168.202.1] => (item=/var/www/vhost1)
ok: [192.168.202.2] => (item=/var/www/vhost1)
ok: [192.168.202.1] => (item=/var/www/vhost2)
ok: [192.168.202.2] => (item=/var/www/vhost2)

TASK [Setup VirtualHost 1] *****************************************************************************************************************************************
ok: [192.168.202.2]
ok: [192.168.202.1]

TASK [Setup VirtualHost 2] *****************************************************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Enable VirtualHosts] *****************************************************************************************************************************************
ok: [192.168.202.2] => (item=vhost1.conf)
ok: [192.168.202.1] => (item=vhost1.conf)
ok: [192.168.202.2] => (item=vhost2.conf)
ok: [192.168.202.1] => (item=vhost2.conf)

TASK [Copy index files for VirtualHosts] ***************************************************************************************************************************
changed: [192.168.202.1] => (item=1)
changed: [192.168.202.2] => (item=1)
changed: [192.168.202.1] => (item=2)
changed: [192.168.202.2] => (item=2)

RUNNING HANDLER [restart nginx] ************************************************************************************************************************************
changed: [192.168.202.1]
changed: [192.168.202.2]

PLAY RECAP *********************************************************************************************************************************************************
192.168.202.1              : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.168.202.2              : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Install and Configure Nginx with Virtual Hosts and Check Availability
## !!! 04.02.2024 playbook revisions were made based on :
## pluhin's comments 8 hours ago: 
## "Please use one template file, 1 and 2 numbers can be fetched from variables, or more simply: you can use {{ ansible_hostname }} - it will be unique content for your tests."

```yaml
---
- name: Install and Configure Nginx with Virtual Hosts and Check Availability
  hosts: all
  become: yes

  vars:
    vhost_domains:
      - vhost1.example.com
      - vhost2.example.com

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: latest
        update_cache: yes

    - name: Start Nginx and Enable at Boot
      service:
        name: nginx
        state: started
        enabled: yes

    - name: Create directories for VirtualHosts
      file:
        path: "/var/www/{{ item }}"
        state: directory
        mode: '0755'
      loop: "{{ vhost_domains }}"

    - name: Setup VirtualHost for each domain
      ansible.builtin.template:
        src: templates/nginx_vhost.j2
        dest: "/etc/nginx/sites-available/{{ item }}.conf"
      vars:
        server_name: "{{ item }}"
        document_root: "/var/www/{{ item }}"
      loop: "{{ vhost_domains }}"

    - name: Enable VirtualHosts
      file:
        src: "/etc/nginx/sites-available/{{ item }}.conf"
        dest: "/etc/nginx/sites-enabled/{{ item }}.conf"
        state: link
        force: yes
      loop: "{{ vhost_domains }}"

    - name: Copy index file for each VirtualHost
      ansible.builtin.template:
        src: "templates/index.html.j2"
        dest: "/var/www/{{ item }}/index.html"
      vars:
        server_name: "{{ item }}"
      loop: "{{ vhost_domains }}"
      notify: restart nginx

  handlers:
    - name: restart nginx
      service:
        name: nginx
        state: restarted

    - name: Check each vhost availability
      uri:
        url: "http://{{ item }}"
        return_content: yes
      register: response
      loop: "{{ vhost_domains }}"
      ignore_errors: yes

    - name: Print each vhost page content
      debug:
        msg: "VHost {{ item.item }} response: {{ item.response.content | default('N/A') }}"
      loop: "{{ response.results }}"
      when: response.results is defined

```
Output

```bash
skefil@skefil:~/ansible-playbooks$ ansible-playbook nginx_setup.yml

PLAY [Install and Configure Nginx with Virtual Hosts and Check Availability] *********************************************

TASK [Gathering Facts] ***************************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Install Nginx] *****************************************************************************************************
ok: [192.168.202.2]
ok: [192.168.202.1]

TASK [Start Nginx and Enable at Boot] ************************************************************************************
ok: [192.168.202.1]
ok: [192.168.202.2]

TASK [Create directories for VirtualHosts] *******************************************************************************
changed: [192.168.202.2] => (item=vhost1.example.com)
changed: [192.168.202.1] => (item=vhost1.example.com)
changed: [192.168.202.1] => (item=vhost2.example.com)
changed: [192.168.202.2] => (item=vhost2.example.com)

TASK [Setup VirtualHost for each domain] *********************************************************************************
changed: [192.168.202.1] => (item=vhost1.example.com)
changed: [192.168.202.2] => (item=vhost1.example.com)
changed: [192.168.202.2] => (item=vhost2.example.com)
changed: [192.168.202.1] => (item=vhost2.example.com)

TASK [Enable VirtualHosts] ***********************************************************************************************
ok: [192.168.202.2] => (item=vhost1.example.com)
ok: [192.168.202.1] => (item=vhost1.example.com)
ok: [192.168.202.2] => (item=vhost2.example.com)
ok: [192.168.202.1] => (item=vhost2.example.com)

TASK [Copy index file for each VirtualHost] ******************************************************************************
changed: [192.168.202.1] => (item=vhost1.example.com)
changed: [192.168.202.2] => (item=vhost1.example.com)
changed: [192.168.202.1] => (item=vhost2.example.com)
changed: [192.168.202.2] => (item=vhost2.example.com)

RUNNING HANDLER [restart nginx] ******************************************************************************************
changed: [192.168.202.2]
changed: [192.168.202.1]

PLAY RECAP ***************************************************************************************************************
192.168.202.1              : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.168.202.2              : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```