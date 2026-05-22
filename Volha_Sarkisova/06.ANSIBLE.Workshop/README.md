**NGINX
kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/06.ANSIBLE.Workshop$ ansible-playbook -i inv.yaml nginx-setup.yaml -u root

PLAY [Simple Nginx setup with two virtual hosts] ***********************************************************************

TASK [Gathering Facts] *************************************************************************************************

ok: [pg]

TASK [Install Nginx] ***************************************************************************************************
ok: [pg]

TASK [Start Nginx] *****************************************************************************************************
ok: [pg]

TASK [Create web directories] ******************************************************************************************
ok: [pg] => (item=site1)
ok: [pg] => (item=site2)

TASK [Create index page for site1] *************************************************************************************
Origin: /mnt/c/Users/99-SarkisovaOV/06.ANSIBLE.Workshop/nginx-setup.yml:40:18

38     - name: Create index page for site1
39       copy:
40         content: |
                    ^ column 18

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [pg]

TASK [Create index page for site2] *************************************************************************************
[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /mnt/c/Users/99-SarkisovaOV/06.ANSIBLE.Workshop/nginx-setup.yml:57:18

55     - name: Create index page for site2
56       copy:
57         content: |
                    ^ column 18

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [pg]

TASK [Configure virtual host for site1] ********************************************************************************
ok: [pg]

TASK [Configure virtual host for site2] ********************************************************************************
ok: [pg]

TASK [Enable site1] ****************************************************************************************************
ok: [pg]

TASK [Enable site2] ****************************************************************************************************
ok: [pg]

TASK [Remove default site] *********************************************************************************************
ok: [pg]

TASK [Reload Nginx] ****************************************************************************************************
changed: [pg]

TASK [Check if site1 is working] ***************************************************************************************
ok: [pg]

TASK [Check if site2 is working] ***************************************************************************************
ok: [pg]

TASK [Show success message] ********************************************************************************************
ok: [pg] => {
    "msg": "========================================\n✅ Nginx successfully configured!\n===================================
	=====\nSite 1: http://192.168.202.14:8081\nSite 2: http://192.168.202.14:8082\n========================================\n"
}

PLAY RECAP *************************************************************************************************************
pg                         : ok=15   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0




kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/06.ANSIBLE.Workshop$ ssh root@192.168.201.7
root@ws-7:~# curl http://192.168.202.14:8081
<html>
<body>
  <h1>Site 1</h1>
  <p>Hostname: sa-14</p>
  <p>FQDN: sa-14.it-academy.local</p>
  <p>IP Address: 192.168.202.14</p>
  <p>Port: 8081</p>
  <hr>
  <p>Deployed by Ansible on 2026-05-22</p>
</body>
</html>
root@ws-7:~# curl http://192.168.202.14:8082
<html>
<body>
  <h1>Site 2</h1>
  <p>Hostname: sa-14</p>
  <p>FQDN: sa-14.it-academy.local</p>
  <p>IP Address: 192.168.202.14</p>
  <p>Port: 8082</p>
  <hr>
  <p>Deployed by Ansible on 2026-05-22</p>
</body>
</html>