# 06.Ansible.Workshop

## Homework Assignment 1: Configuration Management

**Command for running playbook and ouput**:

```bash
ansible-playbook -i inv.yaml nginx_playbook.yaml -u root

PLAY [Install and configure Nginx with two virtual hosts] ********************************************************

TASK [Gathering Facts] *******************************************************************************************
Friday 03 January 2025  08:14:19 +0000 (0:00:00.011)       0:00:00.011 ******** 
[WARNING]: Platform linux on host webservers is using the discovered Python interpreter at /usr/bin/python3.8,
but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [webservers]

TASK [Ensure Nginx is installed] *********************************************************************************
Friday 03 January 2025  08:14:22 +0000 (0:00:02.366)       0:00:02.377 ******** 
changed: [webservers]

TASK [Create directories for virtual hosts] **********************************************************************
Friday 03 January 2025  08:14:25 +0000 (0:00:02.930)       0:00:05.308 ******** 
changed: [webservers] => (item={'server_name': 'first-site.com', 'root': '/var/www/first-site.com', 'port': 8081})
changed: [webservers] => (item={'server_name': 'second-site.com', 'root': '/var/www/second-site.com', 'port': 8082})

TASK [Create HTML files for virtual hosts using template] ********************************************************
Friday 03 January 2025  08:14:26 +0000 (0:00:01.444)       0:00:06.752 ******** 
changed: [webservers] => (item={'server_name': 'first-site.com', 'root': '/var/www/first-site.com', 'port': 8081})
changed: [webservers] => (item={'server_name': 'second-site.com', 'root': '/var/www/second-site.com', 'port': 8082})

TASK [Deploy Nginx configuration for virtual hosts] **************************************************************
Friday 03 January 2025  08:14:29 +0000 (0:00:02.724)       0:00:09.477 ******** 
changed: [webservers] => (item={'server_name': 'first-site.com', 'root': '/var/www/first-site.com', 'port': 8081})
changed: [webservers] => (item={'server_name': 'second-site.com', 'root': '/var/www/second-site.com', 'port': 8082})

TASK [Enable virtual hosts] **************************************************************************************
Friday 03 January 2025  08:14:31 +0000 (0:00:02.391)       0:00:11.869 ******** 
changed: [webservers] => (item={'server_name': 'first-site.com', 'root': '/var/www/first-site.com', 'port': 8081})
changed: [webservers] => (item={'server_name': 'second-site.com', 'root': '/var/www/second-site.com', 'port': 8082})

TASK [Remove default Nginx configuration] ************************************************************************
Friday 03 January 2025  08:14:33 +0000 (0:00:01.289)       0:00:13.158 ******** 
changed: [webservers]

TASK [Restart Nginx to apply changes] ****************************************************************************
Friday 03 January 2025  08:14:33 +0000 (0:00:00.695)       0:00:13.854 ******** 
changed: [webservers]

PLAY RECAP *******************************************************************************************************
webservers                 : ok=8    changed=7    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Friday 03 January 2025  08:14:34 +0000 (0:00:01.244)       0:00:15.098 ******** 
=============================================================================== 
Ensure Nginx is installed --------------------------------------------------------------------------------- 2.93s
Create HTML files for virtual hosts using template -------------------------------------------------------- 2.72s
Deploy Nginx configuration for virtual hosts -------------------------------------------------------------- 2.39s
Gathering Facts ------------------------------------------------------------------------------------------- 2.37s
Create directories for virtual hosts ---------------------------------------------------------------------- 1.44s
Enable virtual hosts -------------------------------------------------------------------------------------- 1.29s
Restart Nginx to apply changes ---------------------------------------------------------------------------- 1.24s
Remove default Nginx configuration ------------------------------------------------------------------------ 0.70s
Playbook run took 0 days, 0 hours, 0 minutes, 15 seconds
```

**Cheking**:
```bash
root@ws-5:~# curl localhost:8081
```

```html
<html>
<head>
    <title>Welcome to first-site.com</title>
</head>
<body>
    <h1>Host: webservers</h1>
    <h2>FQDN: ws-5.it-academy.local</h2>
</body>
</html>
```

```bash
root@ws-5:~# curl localhost:8082
```
```html
<html>
<head>
    <title>Welcome to second-site.com</title>
</head>
<body>
    <h1>Host: webservers</h1>
    <h2>FQDN: ws-5.it-academy.local</h2>
</body>
</html>
```