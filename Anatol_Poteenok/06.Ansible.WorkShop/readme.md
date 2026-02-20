

run command

```
ansible-playbook -i inv.yaml site.yaml -u root
```

result

```
PLAY [Install and configure Nginx with virtualhosts] *******************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************
Monday 09 February 2026  20:51:29 +0000 (0:00:00.009)       0:00:00.009 *******
[WARNING]: Host 'nginx' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [nginx]

TASK [Install Nginx] ***************************************************************************************************************************************
Monday 09 February 2026  20:51:31 +0000 (0:00:02.031)       0:00:02.041 *******
ok: [nginx]

TASK [Create web root directory] ***************************************************************************************************************************
Monday 09 February 2026  20:51:35 +0000 (0:00:03.478)       0:00:05.519 *******
ok: [nginx]

TASK [Deploy index.html from template] *********************************************************************************************************************
Monday 09 February 2026  20:51:35 +0000 (0:00:00.719)       0:00:06.239 *******
[WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /home/user/06AnsibleNginx/templates/index.html.j2

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [nginx]

TASK [Deploy Nginx vhost config] ***************************************************************************************************************************
Monday 09 February 2026  20:51:37 +0000 (0:00:01.248)       0:00:07.488 *******
[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /home/user/06AnsibleNginx/templates/vhost.conf.j2

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [nginx]

TASK [Enable site] *****************************************************************************************************************************************
Monday 09 February 2026  20:51:38 +0000 (0:00:01.145)       0:00:08.634 *******
ok: [nginx]

TASK [Remove default site] *********************************************************************************************************************************
Monday 09 February 2026  20:51:38 +0000 (0:00:00.611)       0:00:09.246 *******
ok: [nginx]

TASK [Restart Nginx] ***************************************************************************************************************************************
Monday 09 February 2026  20:51:39 +0000 (0:00:00.602)       0:00:09.848 *******
changed: [nginx]

TASK [Verify site is reachable with uri] *******************************************************************************************************************
Monday 09 February 2026  20:51:40 +0000 (0:00:01.053)       0:00:10.901 *******
ok: [nginx]

TASK [Check that HTML contains hostname and FQDN] **********************************************************************************************************
Monday 09 February 2026  20:51:41 +0000 (0:00:00.756)       0:00:11.658 *******
[WARNING]: Jinja constant strings should not contain embedded templates. This feature will be disabled by default in ansible-core 2.23.
Origin: /home/user/06AnsibleNginx/site.yaml:60:13

58       assert:
59         that:
60           - "'{{ inventory_hostname }}' in site_response.content"
               ^ column 13

Use inline expressions, for example: `when: "{{ a_var }}" == 42` becomes `when: a_var == 42`

[WARNING]: Jinja constant strings should not contain embedded templates. This feature will be disabled by default in ansible-core 2.23.
Origin: /home/user/06AnsibleNginx/site.yaml:61:13

59         that:
60           - "'{{ inventory_hostname }}' in site_response.content"
61           - "'{{ ansible_fqdn }}' in site_response.content"
               ^ column 13

Use inline expressions, for example: `when: "{{ a_var }}" == 42` becomes `when: a_var == 42`

[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /home/user/06AnsibleNginx/site.yaml:61:13

59         that:
60           - "'{{ inventory_hostname }}' in site_response.content"
61           - "'{{ ansible_fqdn }}' in site_response.content"
               ^ column 13

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [nginx] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *************************************************************************************************************************************************
nginx                      : ok=10   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


TASKS RECAP ************************************************************************************************************************************************
Monday 09 February 2026  20:51:41 +0000 (0:00:00.022)       0:00:11.680 *******
===============================================================================
Install Nginx --------------------------------------------------------------------------------------------------------------------------------------- 3.48s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------- 2.03s
Deploy index.html from template --------------------------------------------------------------------------------------------------------------------- 1.25s
Deploy Nginx vhost config --------------------------------------------------------------------------------------------------------------------------- 1.15s
Restart Nginx --------------------------------------------------------------------------------------------------------------------------------------- 1.05s
Verify site is reachable with uri ------------------------------------------------------------------------------------------------------------------- 0.76s
Create web root directory --------------------------------------------------------------------------------------------------------------------------- 0.72s
Enable site ----------------------------------------------------------------------------------------------------------------------------------------- 0.61s
Remove default site --------------------------------------------------------------------------------------------------------------------------------- 0.60s
Check that HTML contains hostname and FQDN ---------------------------------------------------------------------------------------------------------- 0.02s

PLAYBOOK RECAP *********************************************************************************************************************************************
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds
```



# project_files

*site.yaml

```
- name: Install and configure Nginx with virtualhosts
  hosts: all
  become: true

  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present
        update_cache: yes

    - name: Create web root directory
      file:
        path: "/var/www/{{ inventory_hostname }}"
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'

    - name: Deploy index.html from template
      template:
        src: index.html.j2
        dest: "/var/www/{{ inventory_hostname }}/index.html"
        owner: www-data
        group: www-data
        mode: '0644'

    - name: Deploy Nginx vhost config
      template:
        src: vhost.conf.j2
        dest: "/etc/nginx/sites-available/{{ inventory_hostname }}.conf"

    - name: Enable site
      file:
        src: "/etc/nginx/sites-available/{{ inventory_hostname }}.conf"
        dest: "/etc/nginx/sites-enabled/{{ inventory_hostname }}.conf"
        state: link
        force: yes

    - name: Remove default site
      file:
        path: /etc/nginx/sites-enabled/default
        state: absent

    - name: Restart Nginx
      service:
        name: nginx
        state: restarted
        enabled: true

    - name: Verify site is reachable with uri
      uri:
        url: "http://{{ ansible_host }}"
        return_content: yes
      register: site_response

    - name: Check that HTML contains hostname and FQDN
      assert:
        that:
          - "'{{ inventory_hostname }}' in site_response.content"
          - "'{{ ansible_fqdn }}' in site_response.content"	  
```

./templates/vhost.conf.j2
		
	```
	server {
    listen 80;
    server_name {{ inventory_hostname }} {{ ansible_fqdn }};

    root /var/www/{{ inventory_hostname }};
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
	```
	
	./templates/index.html.j2
	
	```
<!DOCTYPE html>
<html>
<head>
    <title>{{ inventory_hostname }}</title>
</head>
<body>
    <h1>Welcome to {{ inventory_hostname }}</h1>
    <p>FQDN: {{ ansible_fqdn }}</p>
    <p>IP: {{ ansible_host }}</p>
</body>
</html>
	```