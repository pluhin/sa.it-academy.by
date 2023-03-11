# 06.Ansible.Workshop
  
## Preparing

### ansible.cfg

```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### inv.yaml

```bash
all_workers:
  children:
    work_sa:
      vars:
        ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
        ansible_user: root
      hosts:
        host3:
          ansible_host: 192.168.201.3
```

## Playbook ansible 
  
### nginx.yaml 

```bash
---
- hosts: all_workers
  vars:
    app_packages:
      - nginx
    virtual_hosts:
      - nickvab1.by
      - nickvab2.by
  tasks:

  - name: Nginx. Install packages
    apt:
      name: "{{ app_packages }}"
      state: latest
    environment:
      DEBIAN_FRONTEND: noninteractive
    tags: install

  - name: Add dir for virtual hosts
    shell: |
      mkdir -p /var/www/{{ item }}/html
      chown -R "{{ ansible_user }}"  /var/www/{{ item }}/html
    loop: "{{ virtual_hosts }}"
    tags: mkdir

  - name: Template a file to /var/www/virtual_host/html/index.html
    ansible.builtin.template:
      src: ./templates/index.j2
      dest: /var/www/{{ item }}/html/index.html
    loop: "{{ virtual_hosts }}"
    tags: template_index 

  - name: Template a file to /etc/nginx/sites-available/virtual_host
    ansible.builtin.template:
      src: ./templates/virtual_host_config.j2
      dest: /etc/nginx/sites-available/{{ item }}
    loop:
      "{{ virtual_hosts }}"
    tags: template_config

  - name: Add sysmbolic links for virtual hosts
    shell: |
      find /etc/nginx/sites-enabled/ -type l -name {{ item }} || ln -s /etc/nginx/sites-available/{{ item }} /etc/nginx/sites-enabled/
    loop: "{{ virtual_hosts }}"
    tags: link

  - name: Restart service nginx
    service:
      name: nginx
      state: restarted
      enabled: true
    tags: restart

  - name: Add domain name in hosts
    shell: |
      grep -q {{ item }} /etc/hosts || echo 127.0.0.1 {{ item }} >> /etc/hosts;
    loop: "{{ virtual_hosts }}"
    tags: hosts

  - name: Check that sites page returns a status 200
    ansible.builtin.uri:
      url: http://{{ item }}
      return_content: true
    register: this
    failed_when: "'Success' not in this.content"
    loop: "{{ virtual_hosts }}"
    tags: check
```

## Playbook output  

```bash 
root@vnl:/home/vnl/ansible/06.ansible/HW# ansible-playbook -i inv.yaml nginx.yaml 

PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Воскресенье 05 марта 2023  22:56:45 +0300 (0:00:00.075)       0:00:00.075 ***** 
ok: [host3]

TASK [Nginx. Install packages] *******************************************************************************************************************************
Воскресенье 05 марта 2023  22:56:49 +0300 (0:00:04.100)       0:00:04.175 ***** 
ok: [host3]

TASK [Add dir for virtual hosts] *****************************************************************************************************************************
Воскресенье 05 марта 2023  22:56:51 +0300 (0:00:01.874)       0:00:06.050 ***** 
changed: [host3] => (item=nickvab1.by)
changed: [host3] => (item=nickvab2.by)

TASK [Template a file to /var/www/virtual_host/html/index.html] **********************************************************************************************
Воскресенье 05 марта 2023  22:56:53 +0300 (0:00:01.954)       0:00:08.004 ***** 
ok: [host3] => (item=nickvab1.by)
ok: [host3] => (item=nickvab2.by)

TASK [Template a file to /etc/nginx/sites-available/virtual_host] ********************************************************************************************
Воскресенье 05 марта 2023  22:56:57 +0300 (0:00:03.377)       0:00:11.382 ***** 
ok: [host3] => (item=nickvab1.by)
ok: [host3] => (item=nickvab2.by)

TASK [Add sysmbolic links for virtual hosts] *****************************************************************************************************************
Воскресенье 05 марта 2023  22:56:59 +0300 (0:00:02.777)       0:00:14.159 ***** 
changed: [host3] => (item=nickvab1.by)
changed: [host3] => (item=nickvab2.by)

TASK [Restart service nginx] *********************************************************************************************************************************
Воскресенье 05 марта 2023  22:57:01 +0300 (0:00:01.799)       0:00:15.958 ***** 
changed: [host3]

TASK [Add domain name in hosts] ******************************************************************************************************************************
Воскресенье 05 марта 2023  22:57:03 +0300 (0:00:01.919)       0:00:17.878 ***** 
changed: [host3] => (item=nickvab1.by)
changed: [host3] => (item=nickvab2.by)

TASK [Check that sites page returns a status 200] ************************************************************************************************************
Воскресенье 05 марта 2023  22:57:05 +0300 (0:00:01.768)       0:00:19.646 ***** 
ok: [host3] => (item=nickvab1.by)
ok: [host3] => (item=nickvab2.by)

PLAY RECAP ***************************************************************************************************************************************************
host3                      : ok=9    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Воскресенье 05 марта 2023  22:57:07 +0300 (0:00:02.445)       0:00:22.092 ***** 
=============================================================================== 
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 4.10s
Template a file to /var/www/virtual_host/html/index.html ---------------------------------------------------------------------------------------------- 3.38s
Template a file to /etc/nginx/sites-available/virtual_host -------------------------------------------------------------------------------------------- 2.78s
Check that sites page returns a status 200 ------------------------------------------------------------------------------------------------------------ 2.45s
Add dir for virtual hosts ----------------------------------------------------------------------------------------------------------------------------- 1.96s
Restart service nginx --------------------------------------------------------------------------------------------------------------------------------- 1.92s
Nginx. Install packages ------------------------------------------------------------------------------------------------------------------------------- 1.87s
Add sysmbolic links for virtual hosts ----------------------------------------------------------------------------------------------------------------- 1.80s
Add domain name in hosts ------------------------------------------------------------------------------------------------------------------------------ 1.77s
Playbook run took 0 days, 0 hours, 0 minutes, 22 seconds
```
