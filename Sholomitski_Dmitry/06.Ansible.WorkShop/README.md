## 06.AnsibleWorkshop

#### Nginx playbook

[link to playbook](nginx.yaml)

#### Index.html file template

[Index file](templates/index.j2)

#### Nginx conf file template

[Nginx conf file](templates/vhost.conf.j2)

### Result on local virtual PC

``` bash
xaos@ancible20:~/ansible$ ansible-playbook nginx.yaml

PLAY [Install and configure Nginx with two virtual hosts] ************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
Saturday 04 January 2025  19:51:34 +0000 (0:00:00.004)       0:00:00.004 ******
ok: [web_21]
ok: [web_22]

TASK [Validate] ******************************************************************************************************************
Saturday 04 January 2025  19:51:36 +0000 (0:00:01.602)       0:00:01.607 ******
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'}) => {
    "msg": [
        "host: 192.168.56.21",
        "http://www.vhost1.local"
    ]
}
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'}) => {
    "msg": [
        "host: 192.168.56.21",
        "http://www.vhost2.local"
    ]
}
ok: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'}) => {
    "msg": [
        "host: 192.168.56.22",
        "http://www.vhost1.local"
    ]
}
ok: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'}) => {
    "msg": [
        "host: 192.168.56.22",
        "http://www.vhost2.local"
    ]
}

TASK [Install Nginx] *************************************************************************************************************
Saturday 04 January 2025  19:51:36 +0000 (0:00:00.041)       0:00:01.649 ******
ok: [web_21]
changed: [web_22]

TASK [Start and enable Nginx service] ********************************************************************************************
Saturday 04 January 2025  19:51:44 +0000 (0:00:07.732)       0:00:09.381 ******
ok: [web_21]
ok: [web_22]

TASK [Create directories for virtual hosts] **************************************************************************************
Saturday 04 January 2025  19:51:44 +0000 (0:00:00.414)       0:00:09.796 ******
changed: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
changed: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

TASK [Generate HTML files for each virtual host] *********************************************************************************
Saturday 04 January 2025  19:51:45 +0000 (0:00:00.436)       0:00:10.232 ******
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
changed: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
changed: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

TASK [Create Nginx virtual host configuration files] *****************************************************************************
Saturday 04 January 2025  19:51:45 +0000 (0:00:00.757)       0:00:10.990 ******
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
changed: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
changed: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

TASK [Restart nginx service] *****************************************************************************************************
Saturday 04 January 2025  19:51:46 +0000 (0:00:00.687)       0:00:11.677 ******
changed: [web_21]
changed: [web_22]

TASK [Add host name to hosts file] ***********************************************************************************************
Saturday 04 January 2025  19:51:46 +0000 (0:00:00.346)       0:00:12.024 ******
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
changed: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
changed: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

TASK [Check that you can connect (GET) to a page and it returns a status 200] ****************************************************
Saturday 04 January 2025  19:51:47 +0000 (0:00:00.425)       0:00:12.450 ******
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

TASK [Check that a page returns successfully but fail if websites names  is not in the page contents] ****************************
Saturday 04 January 2025  19:51:47 +0000 (0:00:00.592)       0:00:13.042 ******
[WARNING]: conditional statements should not include jinja2 templating delimiters such as {{ }} or {% %}. Found: this is failed
or "{{ item.server_name }}" not in this.content
ok: [web_22] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_21] => (item={'server_name': 'vhost1.local', 'document_root': '/var/www/vhost1'})
ok: [web_22] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})
ok: [web_21] => (item={'server_name': 'vhost2.local', 'document_root': '/var/www/vhost2'})

PLAY RECAP ***********************************************************************************************************************
web_21                     : ok=11   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web_22                     : ok=11   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 04 January 2025  19:51:48 +0000 (0:00:00.554)       0:00:13.597 ******
===============================================================================
Install Nginx ------------------------------------------------------------------------------------------------------------- 7.73s
Gathering Facts ----------------------------------------------------------------------------------------------------------- 1.60s
Generate HTML files for each virtual host --------------------------------------------------------------------------------- 0.76s
Create Nginx virtual host configuration files ----------------------------------------------------------------------------- 0.69s
Check that you can connect (GET) to a page and it returns a status 200 ---------------------------------------------------- 0.59s
Check that a page returns successfully but fail if websites names  is not in the page contents ---------------------------- 0.55s
Create directories for virtual hosts -------------------------------------------------------------------------------------- 0.44s
Add host name to hosts file ----------------------------------------------------------------------------------------------- 0.43s
Start and enable Nginx service -------------------------------------------------------------------------------------------- 0.41s
Restart nginx service ----------------------------------------------------------------------------------------------------- 0.35s
Validate ------------------------------------------------------------------------------------------------------------------ 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 13 seconds
```

### Result on remote virtual PCc

```bash
Saturday 04 January 2025  20:23:20 +0000 (0:00:15.946)       0:02:56.129 ******
===============================================================================
Create Nginx virtual host configuration files ---------------------------------------------------------------------------- 34.34s
Generate HTML files for each virtual host -------------------------------------------------------------------------------- 32.00s
Gathering Facts ---------------------------------------------------------------------------------------------------------- 16.70s
Add host name to hosts file ---------------------------------------------------------------------------------------------- 15.99s
Check that a page returns successfully but fail if websites names  is not in the page contents --------------------------- 15.95s
Check that you can connect (GET) to a page and it returns a status 200 --------------------------------------------------- 15.90s
Create directories for virtual hosts ------------------------------------------------------------------------------------- 14.61s
Install Nginx ------------------------------------------------------------------------------------------------------------ 13.03s
Restart nginx service ----------------------------------------------------------------------------------------------------- 9.38s
Start and enable Nginx service -------------------------------------------------------------------------------------------- 8.15s
Validate ------------------------------------------------------------------------------------------------------------------ 0.07s
Playbook run took 0 days, 0 hours, 2 minutes, 56 seconds
```
