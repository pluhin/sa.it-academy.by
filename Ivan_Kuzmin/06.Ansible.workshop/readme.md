# **05.Ansible.worksop**
## **Result**
```bash
root@ubuntu:~/06.ansible.workshop# ansible-playbook -i inv.yaml dz.yaml

PLAY [db_all] *******************************************************************

TASK [Gathering Facts] **********************************************************
Thursday 09 March 2023  07:29:17 +0000 (0:00:00.025)       0:00:00.025 ********
ok: [host10]

TASK [Apt update Install Nginx] *************************************************
Thursday 09 March 2023  07:29:19 +0000 (0:00:02.513)       0:00:02.538 ********
ok: [host10]

TASK [mkdir site1,site2] ********************************************************
Thursday 09 March 2023  07:29:29 +0000 (0:00:10.147)       0:00:12.685 ********
ok: [host10] => (item=site1)
ok: [host10] => (item=site2)

TASK [make html for site1,site2] ************************************************
Thursday 09 March 2023  07:29:31 +0000 (0:00:01.543)       0:00:14.229 ********
changed: [host10] => (item=site1)
changed: [host10] => (item=site2)

TASK [mkdir site1, site2] *******************************************************
Thursday 09 March 2023  07:29:36 +0000 (0:00:04.746)       0:00:18.975 ********
ok: [host10] => (item=site1)
ok: [host10] => (item=site2)

TASK [add config site1,site2] ***************************************************
Thursday 09 March 2023  07:29:37 +0000 (0:00:01.355)       0:00:20.330 ********
ok: [host10] => (item=site1)
changed: [host10] => (item=site2)

TASK [Add sites in hosts] *******************************************************
Thursday 09 March 2023  07:29:40 +0000 (0:00:02.675)       0:00:23.005 ********
changed: [host10]

TASK [symbolic link site1,site2] ************************************************
Thursday 09 March 2023  07:29:41 +0000 (0:00:00.875)       0:00:23.881 ********
ok: [host10] => (item=site1)
ok: [host10] => (item=site2)

TASK [Check site1, site2] *******************************************************
Thursday 09 March 2023  07:29:42 +0000 (0:00:01.353)       0:00:25.235 ********
ok: [host10] => (item=site1)
ok: [host10] => (item=site2)

PLAY RECAP **********************************************************************
host10                     : ok=9    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 09 March 2023  07:29:44 +0000 (0:00:01.630)       0:00:26.866 ********
===============================================================================
Apt update Install Nginx ------------------------------------------------ 10.15s
make html for site1,site2 ------------------------------------------------ 4.75s
add config site1,site2 --------------------------------------------------- 2.67s
Gathering Facts ---------------------------------------------------------- 2.51s
Check site1, site2 ------------------------------------------------------- 1.63s
mkdir site1,site2 -------------------------------------------------------- 1.54s
mkdir site1, site2 ------------------------------------------------------- 1.36s
symbolic link site1,site2 ------------------------------------------------ 1.35s
Add sites in hosts ------------------------------------------------------- 0.88s
Playbook run took 0 days, 0 hours, 0 minutes, 26 seconds
root@ubuntu:~/06.ansible.workshop#
```
### **Playbook**
```bash
- hosts: db_all
  become: yes
  tasks:
    - name: Apt update Install Nginx
      apt:
        name: nginx
        state: latest
        update_cache: yes
    - name: mkdir site1,site2
      ansible.builtin.file:
        path: "/var/www/{{ item }}/html"
        state: directory
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name: make html for site1,site2
      ansible.builtin.template:
        src: template.html
        dest: "/var/www/{{ item }}/html/index.html"
        owner: root
        group: root
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name:  mkdir site1, site2
      ansible.builtin.file:
        path: "/etc/nginx/sites-available/{{ item }}"
        state: directory
        mode: '0755'
      with_items:
      - "site1"
      - "site2"       
    - name: add config site1,site2
      ansible.builtin.template:
        src: virthost.conf
        dest: "/etc/nginx/sites-available/{{ item }}/{{ item  }}.conf"
        owner: root
        group: root
        mode: '0755'
      with_items:
      - "site1"
      - "site2"
    - name: Add sites in hosts
      ansible.builtin.shell:
        # cmd: echo "127.0.0.1 site1 site2 www.site1  www.site2"  >> /etc/hosts;
        cmd: grep -q site1  /etc/hosts || echo "127.0.0.1 site1 www.site1 site2 www.site2" >> /etc/hosts;   
    - name: symbolic link site1,site2
      ansible.builtin.file:
        src: /etc/nginx/sites-available/{{ item }}
        dest: /etc/nginx/sites-enabled/{{ item }}
        state: link
      with_items:
      - "site1"
      - "site2"
    - name: Check site1, site2
      ansible.builtin.uri:
        url: http://www.{{ item }}
        return_content: true
      with_items:
      - "site1"
      - "site2"
```