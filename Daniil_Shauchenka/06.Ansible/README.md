```
lancaster@home:~/homework_6$ ansible-playbook -i inventory playbook.yml

PLAY [Install and configure Nginx] ********************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]

TASK [Install Nginx] **********************************************************************************************************************************************************************************************
ok: [web2]
ok: [web1]

TASK [Create web root directories] ********************************************************************************************************************************************************************************
ok: [web1] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
ok: [web2] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
ok: [web2] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})
ok: [web1] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})

TASK [Create index.html for each vhost] ***************************************************************************************************************************************************************************
ok: [web1] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
ok: [web2] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
ok: [web1] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})
ok: [web2] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})

TASK [Deploy Nginx config] ****************************************************************************************************************************************************************************************
ok: [web1]
ok: [web2]

TASK [Deploy virtual hosts] ***************************************************************************************************************************************************************************************
changed: [web2] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
changed: [web1] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
changed: [web1] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})
changed: [web2] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})

TASK [Enable sites] ***********************************************************************************************************************************************************************************************
changed: [web2] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
changed: [web1] => (item={'server_name': 'sa-17.it-academy.local', 'root': '/var/www/sa-17'})
changed: [web2] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})
changed: [web1] => (item={'server_name': 'sa-18.it-academy.local', 'root': '/var/www/sa-18'})

TASK [Restart Nginx] **********************************************************************************************************************************************************************************************
changed: [web1]
changed: [web2]

PLAY RECAP ********************************************************************************************************************************************************************************************************
web1                       : ok=8    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
web2                       : ok=8    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

lancaster@home:~/homework_6$

jump_sa@jump:~$ curl "Host: sa-17.it-academy.local"  http://192.168.202.17
<html>
  <body>
    <h1>Hello from sa-17.it-academy.local</h1>
    <p>Hostname: web1</p>
  </body>
</html>

jump_sa@jump:~$ curl "Host: sa-18.it-academy.local" http://192.168.202.18
<html>
  <body>
    <h1>Hello from sa-18.it-academy.local</h1>
    <p>Hostname: web2</p>
  </body>
</html>

```
