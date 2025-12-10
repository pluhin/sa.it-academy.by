## Homework Assignment 1: Configuration Management
Description: playbook installs and starts nginx with N virtual hosts with configuration and index.html files created from templates

Playbook: *ansible_project/playbooks/up_nginx.yml*

Templates: *ansible_project/templates/**

Possible arguments: *group, nginx-port*

Run command example:
```
ansible-playbook -i inventory.yml playbooks/up_nginx.yml -u root -e group=host13
```
Outpur example:
```
PLAY [Homework Assignment 1: Configuration Management] *******************************************************************************************************************************************************************************

TASK [Print debug info] **************************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:10 +0100 (0:00:00.031)       0:00:00.031 ***** 
ok: [host13] => {
    "msg": "Starting nginx configuration on host host13”"
}

TASK [Install Nginx] *****************************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:10 +0100 (0:00:00.014)       0:00:00.046 ***** 
ok: [host13]

TASK [Create nginx configurations from template for hosts] ***************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:13 +0100 (0:00:03.096)       0:00:03.142 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Create links to configs] *******************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:18 +0100 (0:00:05.421)       0:00:08.564 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Create nginx data directory] ***************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:21 +0100 (0:00:03.135)       0:00:11.699 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Create index.html from template and copy to the data directory for each host] **************************************************************************************************************************************************
Thursday 20 November 2025  14:45:25 +0100 (0:00:03.084)       0:00:14.783 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Disable default site] **********************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:30 +0100 (0:00:05.203)       0:00:19.987 ***** 
ok: [host13]

TASK [Add web server names to /etc/hosts] ********************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:31 +0100 (0:00:01.513)       0:00:21.500 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Restart nginx] *****************************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:34 +0100 (0:00:03.124)       0:00:24.624 ***** 
changed: [host13]

TASK [Verify that nginx is running] **************************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:38 +0100 (0:00:03.788)       0:00:28.413 ***** 
ok: [host13]

TASK [Send request to each host and check that returned page contains correct data] **************************************************************************************************************************************************
Thursday 20 November 2025  14:45:42 +0100 (0:00:03.954)       0:00:32.368 ***** 
ok: [host13] => (item=webserver1-itacademy.com)
ok: [host13] => (item=webserver2-itacademy.com)

TASK [Print page response from each host] ********************************************************************************************************************************************************************************************
Thursday 20 November 2025  14:45:46 +0100 (0:00:03.502)       0:00:35.871 ***** 
ok: [host13] => (item=webserver1-itacademy.com) => {
    "msg": "webserver1-itacademy.com: <html>\n  <head>\n    <title> Hello from host 192.168.202.13 from virtual host webserver1-itacademy.com</title>\n  </head>\n  <body>\n  <h1> Hello form host 192.168.202.13 from virtual host webserver1-itacademy.com</h1>\n  <p>Ngnix by ansible</p>\n  </body>\n</html>\n"
}
ok: [host13] => (item=webserver2-itacademy.com) => {
    "msg": "webserver2-itacademy.com: <html>\n  <head>\n    <title> Hello from host 192.168.202.13 from virtual host webserver2-itacademy.com</title>\n  </head>\n  <body>\n  <h1> Hello form host 192.168.202.13 from virtual host webserver2-itacademy.com</h1>\n  <p>Ngnix by ansible</p>\n  </body>\n</html>\n"
}

PLAY RECAP ***************************************************************************************************************************************************************************************************************************
host13                     : ok=12   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
