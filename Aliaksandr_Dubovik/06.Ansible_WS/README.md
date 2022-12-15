# Play YAML

```

aliaksandr@aloaksandr:~/06.Ansible_ws$ ansible-playbook -i inv.yaml nginx.yaml -u root

PLAY [dbs] *******************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************
Wednesday 14 December 2022  03:19:33 +0000 (0:00:00.015)       0:00:00.015 ****
ok: [db_7]

TASK [Nginx installed] *******************************************************************************************************
Wednesday 14 December 2022  03:19:35 +0000 (0:00:02.148)       0:00:02.163 ****
ok: [db_7]

TASK [Version nginx] *********************************************************************************************************
Wednesday 14 December 2022  03:19:38 +0000 (0:00:02.889)       0:00:05.053 ****
changed: [db_7]

TASK [Version nginx] *********************************************************************************************************
Wednesday 14 December 2022  03:19:39 +0000 (0:00:00.796)       0:00:05.849 ****
ok: [db_7] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}

TASK [Check if folder exists sites-available] ********************************************************************************
Wednesday 14 December 2022  03:19:39 +0000 (0:00:00.039)       0:00:05.889 ****
ok: [db_7]

TASK [Check if folder exists sites-enabled] **********************************************************************************
Wednesday 14 December 2022  03:19:40 +0000 (0:00:00.879)       0:00:06.768 ****
ok: [db_7]

TASK [Create folder for index.html] ******************************************************************************************
Wednesday 14 December 2022  03:19:40 +0000 (0:00:00.693)       0:00:07.462 ****
ok: [db_7] => (item=site1.com)
ok: [db_7] => (item=site2.com)

TASK [Config file] ***********************************************************************************************************
Wednesday 14 December 2022  03:19:42 +0000 (0:00:01.398)       0:00:08.861 ****
ok: [db_7] => (item=site1.com)
ok: [db_7] => (item=site2.com)

TASK [Create index.html] *****************************************************************************************************
Wednesday 14 December 2022  03:19:44 +0000 (0:00:02.053)       0:00:10.914 ****
ok: [db_7] => (item=site1.com)
ok: [db_7] => (item=site2.com)

TASK [Add to 'enabled' sites] ************************************************************************************************
Wednesday 14 December 2022  03:19:46 +0000 (0:00:02.288)       0:00:13.203 ****
changed: [db_7] => (item=site1.com)
changed: [db_7] => (item=site2.com)

TASK [Adding hosts to the hosts file] ****************************************************************************************
Wednesday 14 December 2022  03:19:47 +0000 (0:00:01.303)       0:00:14.506 ****
changed: [db_7] => (item=site1.com)
changed: [db_7] => (item=site2.com)

TASK [Restart nginx] *********************************************************************************************************
Wednesday 14 December 2022  03:19:49 +0000 (0:00:01.311)       0:00:15.818 ****
changed: [db_7]

TASK [check connection] ******************************************************************************************************
Wednesday 14 December 2022  03:19:50 +0000 (0:00:01.178)       0:00:16.997 ****
ok: [db_7] => (item=site1.com)
ok: [db_7] => (item=site2.com)

TASK [Check info] ************************************************************************************************************
Wednesday 14 December 2022  03:19:52 +0000 (0:00:01.752)       0:00:18.749 ****
ok: [db_7] => {
    "msg": "All items completed"
}

PLAY RECAP *******************************************************************************************************************
db_7                       : ok=14   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 14 December 2022  03:19:52 +0000 (0:00:00.089)       0:00:18.839 ****
===============================================================================
Nginx installed ------------------------------------------------------------------------------------------------------- 2.89s
Create index.html ----------------------------------------------------------------------------------------------------- 2.29s
Gathering Facts ------------------------------------------------------------------------------------------------------- 2.15s
Config file ----------------------------------------------------------------------------------------------------------- 2.05s
check connection ------------------------------------------------------------------------------------------------------ 1.75s
Create folder for index.html ------------------------------------------------------------------------------------------ 1.40s
Adding hosts to the hosts file ---------------------------------------------------------------------------------------- 1.31s
Add to 'enabled' sites ------------------------------------------------------------------------------------------------ 1.30s
Restart nginx --------------------------------------------------------------------------------------------------------- 1.18s
Check if folder exists sites-available -------------------------------------------------------------------------------- 0.88s
Version nginx --------------------------------------------------------------------------------------------------------- 0.80s
Check if folder exists sites-enabled ---------------------------------------------------------------------------------- 0.69s
Check info ------------------------------------------------------------------------------------------------------------ 0.09s
Version nginx --------------------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 18 seconds

```

## NGNIX.YAML

```yaml

- hosts: dbs
  become: true
 
  vars:
    sites: [ 'site1.com', 'site2.com' ] 

  tasks:
   
  
  - name: Nginx installed
    apt:
      name: nginx
      state: latest
      update_cache: true
    tags: install_nginx

  - name: Version nginx
    command: nginx -v
    register: version_nginx
    tags: install_nginx

  - name: Version nginx
    ansible.builtin.debug:
      msg: "{{ version_nginx.stderr }}"
    tags: install_nginx

  - name: Check if folder exists sites-available
    ansible.builtin.stat: 
     path: /etc/nginx/sites-available/
    register: available 

  - name: Check if folder exists sites-enabled
    ansible.builtin.stat:
     path: /etc/nginx/sites-enabled/
    register: enabled

  - name: Create folder for index.html
    file:
      path: /var/www/{{item}}/html/
      owner: root
      state: directory
      mode: 0755
    loop:
      "{{sites}}"

  - name: Config file
    template:
      src: ./templates/nginx.conf.j2
      dest: /etc/nginx/sites-available/{{ item }}.conf
    loop:
      "{{sites}}"

  - name: Create index.html
    template:       
      src: ./templates/index.html.j2
      dest: /var/www/{{ item }}/html/index.html
    loop: "{{sites}}"

  - name: Add to 'enabled' sites
    ansible.builtin.shell: |
        ln -s /etc/nginx/sites-available/{{ item }}.conf  /etc/nginx/sites-enabled/
    loop: "{{sites}}"
    failed_when: false     

  - name: Adding hosts to the hosts file
    ansible.builtin.shell:
      grep -q "{{ item }}" /etc/hosts || echo "127.0.0.1 {{ item }}" >> /etc/hosts;
    loop: "{{sites}}"

  - name: Restart nginx
    service:
      name: nginx
      state: restarted    

  - name: check connection
    uri:
      url: "http://{{ item }}"
      return_content: yes
    register: code_200
    failed_when: "'Hi' not in code_200.content"
    loop:
        "{{sites}}"

  - name: Check info
    debug:
        msg: "{{ code_200.msg }}"  
```