# Homework Assignment: 08. Ansible Workshop


## Homework Assignment 1: Configuration Management

### Project Directory Structure
```
08.Ansible.Workshop/
├── inventory.yml
├── playbook.yml
├── templates/
│   ├── index.html.j2
│   └── nginx_vhost.conf.j2
└── README.md
```

### Playbook Overview
This playbook automates the deployment and configuration management of an **Nginx web server** across remote target environments.

### Key Objectives & Actions:
* **Package Management:** Installs the Nginx web server from system repositories and ensures system package caches are updated.
* **Directory Provisioning:** Creates isolated document root directories (`/var/www/...`) with correct permissions for two separate virtual hosts: `site1.local` and `site2.local`.
* **Dynamic Content Delivery:** Generates customized `index.html` landing pages for each site using Jinja2 templates. Each page dynamically pulls and renders target host metrics: **Host Name** (`ansible_hostname`) and **FQDN** (`ansible_fqdn`).
* **Safe Configuration Deployment:** Provisions dedicated Nginx server blocks. It embeds an automated syntax validation check (`nginx -t`) to test config safety before overwriting live files, eliminating potential service downtime.
* **Site Activation:** Enables new configurations via symbolic links, deactivates the default Nginx landing page, and restarts the web service securely.
* **End-to-End Self-Testing:** Performs automated HTTP verification requests against both newly deployed virtual hosts at the end of the run, printing a clear status uptime report (HTTP 200 OK) directly into the execution console.


### How to Run the Playbook
Execute the following command from your control node to provision the remote targets defined in your YAML inventory:

```bash
ansible-playbook -i inventory.yml playbook.yml
PLAY [Homework 1 - Nginx Configuration Management with VirtualHosts] ***********************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Wednesday 09 September 2026  09:30:04 +0000 (0:00:00.015)       0:00:00.015 ***
[WARNING]: Host 'remote_target' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [remote_target]

TASK [Ensure Nginx is installed] ***********************************************************************************************************************
Wednesday 09 September 2026  09:30:10 +0000 (0:00:06.005)       0:00:06.021 ***
ok: [remote_target]

TASK [Create document root directories for virtualhosts] ***********************************************************************************************
Wednesday 09 September 2026  09:30:15 +0000 (0:00:04.286)       0:00:10.308 ***
ok: [remote_target] => (item={'domain': 'site1.local'})
ok: [remote_target] => (item={'domain': 'site2.local'})

TASK [Deploy index.html from Jinja2 template] **********************************************************************************************************
Wednesday 09 September 2026  09:30:20 +0000 (0:00:05.072)       0:00:15.381 ***
[WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /home/max/Project/08.Ansible.Workshop/templates/index.html.j2

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [remote_target] => (item={'domain': 'site1.local'})
ok: [remote_target] => (item={'domain': 'site2.local'})

TASK [Deploy Nginx virtualhost configurations] *********************************************************************************************************
Wednesday 09 September 2026  09:30:27 +0000 (0:00:07.732)       0:00:23.113 ***
ok: [remote_target] => (item={'domain': 'site1.local'})
ok: [remote_target] => (item={'domain': 'site2.local'})

TASK [Enable virtualhost sites via symlink] ************************************************************************************************************
Wednesday 09 September 2026  09:30:34 +0000 (0:00:06.860)       0:00:29.973 ***
ok: [remote_target] => (item={'domain': 'site1.local'})
ok: [remote_target] => (item={'domain': 'site2.local'})

TASK [Run Nginx syntax verification check] *************************************************************************************************************
Wednesday 09 September 2026  09:30:38 +0000 (0:00:04.201)       0:00:34.175 ***
ok: [remote_target]

TASK [Display Nginx Validation Report] *****************************************************************************************************************
Wednesday 09 September 2026  09:30:41 +0000 (0:00:02.404)       0:00:36.579 ***
ok: [remote_target] => {
    "msg": [
        "---------------- NGINX VALIDATION REPORT ----------------",
        [
            "nginx: the configuration file /etc/nginx/nginx.conf syntax is ok",
            "nginx: configuration file /etc/nginx/nginx.conf test is successful"
        ],
        "---------------------------------------------------------"
    ]
}

TASK [Remove default Nginx site configuration] *********************************************************************************************************
Wednesday 09 September 2026  09:30:41 +0000 (0:00:00.035)       0:00:36.615 ***
ok: [remote_target]

TASK [Verify HTTP availability for each VirtualHost] ***************************************************************************************************
Wednesday 09 September 2026  09:30:43 +0000 (0:00:02.358)       0:00:38.973 ***
ok: [remote_target] => (item={'domain': 'site1.local'})
ok: [remote_target] => (item={'domain': 'site2.local'})

TASK [Display Website Status Report] *******************************************************************************************************************
Wednesday 09 September 2026  09:30:47 +0000 (0:00:04.206)       0:00:43.180 ***
ok: [remote_target] => (item=site1.local) => {
    "msg": [
        "================ WEBSITE STATUS REPORT ================",
        "URL: http://site1.local",
        "HTTP Status: 200",
        "Content Verification: Page contains 'Welcome to VirtualHost: site1.local'",
        "======================================================="
    ]
}
ok: [remote_target] => (item=site2.local) => {
    "msg": [
        "================ WEBSITE STATUS REPORT ================",
        "URL: http://site2.local",
        "HTTP Status: 200",
        "Content Verification: Page contains 'Welcome to VirtualHost: site2.local'",
        "======================================================="
    ]
}

PLAY RECAP *********************************************************************************************************************************************
remote_target              : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


TASKS RECAP ********************************************************************************************************************************************
Wednesday 09 September 2026  09:30:47 +0000 (0:00:00.047)       0:00:43.227 ***
===============================================================================
Deploy index.html from Jinja2 template ---------------------------------------------------------------------------------------------------------- 7.73s
Deploy Nginx virtualhost configurations --------------------------------------------------------------------------------------------------------- 6.86s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 6.01s
Create document root directories for virtualhosts ----------------------------------------------------------------------------------------------- 5.07s
Ensure Nginx is installed ----------------------------------------------------------------------------------------------------------------------- 4.29s
Verify HTTP availability for each VirtualHost --------------------------------------------------------------------------------------------------- 4.21s
Enable virtualhost sites via symlink ------------------------------------------------------------------------------------------------------------ 4.20s
Run Nginx syntax verification check ------------------------------------------------------------------------------------------------------------- 2.40s
Remove default Nginx site configuration --------------------------------------------------------------------------------------------------------- 2.36s
Display Website Status Report ------------------------------------------------------------------------------------------------------------------- 0.05s
Display Nginx Validation Report ----------------------------------------------------------------------------------------------------------------- 0.04s

PLAYBOOK RECAP *****************************************************************************************************************************************
Playbook run took 0 days, 0 hours, 0 minutes, 43 seconds


```


### Post-deployment local check

```bash
# Verify the first virtual host configuration
curl -H "Host: site1.local" http://127.0.0.1

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to site1.local</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f9; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #333; }
        span { font-weight: bold; color: #0066cc; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to VirtualHost: site1.local</h1>
        <p>This page is dynamically generated by Ansible.</p>
        <ul>
            <li><strong>Managed Host Name:</strong> <span>sa-7</span></li>
            <li><strong>Managed Host FQDN:</strong> <span>sa-7.it-academy.local</span></li>
        </ul>
    </div>
</body>
</html>


# Verify the second virtual host configuration
curl -H "Host: site2.local" http://127.0.0.1

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome to site2.local</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f9; }
        .container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        h1 { color: #333; }
        span { font-weight: bold; color: #0066cc; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to VirtualHost: site2.local</h1>
        <p>This page is dynamically generated by Ansible.</p>
        <ul>
            <li><strong>Managed Host Name:</strong> <span>sa-7</span></li>
            <li><strong>Managed Host FQDN:</strong> <span>sa-7.it-academy.local</span></li>
        </ul>
    </div>
</body>
</html>

```
