ansible-playbook -i inv2.yml inst.yml >> README.md



PLAY [Install nginx] ***********************************************************

TASK [Gathering Facts] *********************************************************
ok: [host3]

TASK [Ensure Nginx is installed] ***********************************************
ok: [host3]

TASK [Ensure web root directories exist] ***************************************
ok: [host3] => (item={'server_name': '06.sa1-academy.net', 'root': '/var/www/ms1'})
ok: [host3] => (item={'server_name': '06.sa2-academy.net', 'root': '/var/www/sa'})

TASK [Get hostname and FQDN] ***************************************************
ok: [host3]

TASK [Create index.html for each vhost] ****************************************
ok: [host3] => (item={'server_name': '06.sa1-academy.net', 'root': '/var/www/ms1'})
ok: [host3] => (item={'server_name': '06.sa2-academy.net', 'root': '/var/www/sa'})

TASK [Create Nginx config for each vhost] **************************************
ok: [host3] => (item={'server_name': '06.sa1-academy.net', 'root': '/var/www/ms1'})
ok: [host3] => (item={'server_name': '06.sa2-academy.net', 'root': '/var/www/sa'})

TASK [Enable vhost by creating symlink] ****************************************
ok: [host3] => (item={'server_name': '06.sa1-academy.net', 'root': '/var/www/ms1'})
ok: [host3] => (item={'server_name': '06.sa2-academy.net', 'root': '/var/www/sa'})

TASK [Remove default nginx config] *********************************************
ok: [host3]

TASK [Test nginx configuration] ************************************************
changed: [host3]

TASK [Reload nginx] ************************************************************
changed: [host3]

PLAY RECAP *********************************************************************
host3                      : ok=10   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

