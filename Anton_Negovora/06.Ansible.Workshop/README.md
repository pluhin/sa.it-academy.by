# 06.Asnsible workshop

## Playbook

### nginx.yaml

```bash
- hosts: db_all
  become: yes
  tasks:
    - name: Install nginx server
      apt:
        name: nginx
        state: latest
        update_cache: yes
    - name: Create sites directory
      ansible.builtin.file:
        path: "/var/www/{{ item }}/html"
        state: directory
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name: Create html for sites
      ansible.builtin.template:
        src: template.html
        dest: "/var/www/{{ item }}/html/{{ item }}.html"
        owner: root
        group: root
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name:  Create directory for configs
      ansible.builtin.file:
        path: "/etc/nginx/sites-available/{{ item }}"
        state: directory
        mode: '0755'
      with_items:
      - "site1"
      - "site2"       
    - name: Add config 
      ansible.builtin.template:
        src: host.conf
        dest: "/etc/nginx/sites-available/{{ item }}/{{ item  }}.conf"
        owner: root
        group: root
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name: Add sites in hosts
      ansible.builtin.shell:
        cmd: grep -q www.{{ item }} /etc/hosts || echo 127.0.0.1 www.{{ item }} >> /etc/hosts;
      with_items:
      - "site1"
      - "site2" 
    - name: Create symbolic link 
      ansible.builtin.file:
        src: /etc/nginx/sites-available/{{ item }}
        dest: /etc/nginx/sites-enabled/{{ item }}
        state: link
      with_items:
      - "site1"
      - "site2"
    - name: Check connection
      ansible.builtin.uri:
        url: http://www.{{ item }}
        return_content: true
      with_items:
      - "site1"
      - "site2"
```

### Result

```bash
root@vm1:/tmp/sa.it-academy.by/Anton_Negovora/06.Ansible.Workshop#
ansible-playbook -i

PLAY [db_all] ************************************************************************

TASK [Gathering Facts] ***************************************************************
Wednesday 22 March 2023  09:35:06 +0000 (0:00:00.043)       0:00:00.043 *******
ok: [host14]

TASK [Install nginx server] **********************************************************
Wednesday 22 March 2023  09:35:08 +0000 (0:00:02.472)       0:00:02.516 *******
ok: [host14]

TASK [Create sites directory] ********************************************************
Wednesday 22 March 2023  09:35:11 +0000 (0:00:02.859)       0:00:05.375 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

TASK [Create html for sites] *********************************************************
Wednesday 22 March 2023  09:35:12 +0000 (0:00:01.491)       0:00:06.867 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

TASK [Create directory for configs] **************************************************
Wednesday 22 March 2023  09:35:15 +0000 (0:00:02.214)       0:00:09.081 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

TASK [Add config] ********************************************************************
Wednesday 22 March 2023  09:35:16 +0000 (0:00:01.229)       0:00:10.311 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

TASK [Add sites in hosts] ************************************************************
Wednesday 22 March 2023  09:35:18 +0000 (0:00:02.132)       0:00:12.443 *******
changed: [host14] => (item=site1)
changed: [host14] => (item=site2)

TASK [Create symbolic link] **********************************************************
Wednesday 22 March 2023  09:35:20 +0000 (0:00:01.487)       0:00:13.930 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

TASK [Check connection] **************************************************************
Wednesday 22 March 2023  09:35:21 +0000 (0:00:01.247)       0:00:15.178 *******
ok: [host14] => (item=site1)
ok: [host14] => (item=site2)

PLAY RECAP ***************************************************************************
host14                     : ok=9    changed=1    unreachable=0    failed=0    skipped

Wednesday 22 March 2023  09:35:23 +0000 (0:00:01.747)       0:00:16.925 *******
===============================================================================
Install nginx server -----------------------------------------------------------------
Gathering Facts ----------------------------------------------------------------------
Create html for sites ----------------------------------------------------------------
Add config ---------------------------------------------------------------------------
Check connection ---------------------------------------------------------------------
Create sites directory ---------------------------------------------------------------
Add sites in hosts -------------------------------------------------------------------
Create symbolic link -----------------------------------------------------------------
Create directory for configs ---------------------------------------------------------
Playbook run took 0 days, 0 hours, 0 minutes, 16 seconds
```
