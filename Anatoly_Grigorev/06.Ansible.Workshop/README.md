# Homework Assignment 1: Configuration Management

[Inventory](./inv.yaml)

[Playbook](./nginx.yaml)

### Templates

[Site 1](./site1.conf.j2)

[Site 2](./site2.conf.j2)

## Playbook output

```shell
PLAY [Install and configure Nginx] ***********************************************************************************

TASK [Gathering Facts] ***********************************************************************************************
ok: [nginx_server]

TASK [Install Nginx] *************************************************************************************************
ok: [nginx_server]

TASK [Manage the Nginx Process] **************************************************************************************
ok: [nginx_server]

TASK [Create directories for the websites] ***************************************************************************
ok: [nginx_server] => (item=/var/www/site1)
ok: [nginx_server] => (item=/var/www/site2)

TASK [Create index.html for site1] ***********************************************************************************
ok: [nginx_server]

TASK [Create index.html for site2] ***********************************************************************************
ok: [nginx_server]

TASK [Add entries to /etc/hosts] *************************************************************************************
ok: [nginx_server] => (item=site1.example.com)
ok: [nginx_server] => (item=site2.example.com)

TASK [Template Nginx configuration for site1] ************************************************************************
changed: [nginx_server]

TASK [Template Nginx configuration for site2] ************************************************************************
changed: [nginx_server]

TASK [Enable virtual host by creating link for site1] ****************************************************************
changed: [nginx_server]

TASK [Enable virtual host by creating link for site2] ****************************************************************
changed: [nginx_server]

TASK [reload nginx] **************************************************************************************************
changed: [nginx_server]

TASK [Check if Site 1 is reachable] **********************************************************************************
ok: [nginx_server]

TASK [Check if Site 2 is reachable] **********************************************************************************
ok: [nginx_server]

TASK [Output content of Site 1] **************************************************************************************
ok: [nginx_server] => {
    "msg": "Content of Site 1: <h1>Welcome to Site 1</h1>"
}

TASK [Output content of Site 2] **************************************************************************************
ok: [nginx_server] => {
    "msg": "Content of Site 2: <h1>Welcome to Site 2</h1>"
}

TASK [Assert that Site 1 is working] *********************************************************************************
ok: [nginx_server] => {
    "changed": false,
    "msg": "All assertions passed"
}

TASK [Assert that Site 2 is working] *********************************************************************************
ok: [nginx_server] => {
    "changed": false,
    "msg": "All assertions passed"
}

RUNNING HANDLER [reload nginx] ***************************************************************************************
changed: [nginx_server]

PLAY RECAP ***********************************************************************************************************
nginx_server               : ok=19   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```



