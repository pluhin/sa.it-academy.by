# Ansible Workshop

This project demonstrates configuration management using Ansible.
The playbook installs and configures Nginx on a remote host, creates two virtual hosts using templates, and deploys dynamic HTML pages containing the hostname and FQDN of the server.

Install curl on the remote host (for HTTP verification)
```bash
ansible -i inventory/hosts servers -a "apt install curl -y"
```

Run the Ansible playbook to install and configure Nginx:

```bash
 ansible-playbook -i inventory/hosts playbooks/nginx.yml
 ```

 ```log
PLAY [Install and configure Nginx with virtual hosts] **************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
[WARNING]: Platform linux on host remote1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for
more information.
ok: [remote1]

TASK [Install nginx] ***********************************************************************************************************************************
ok: [remote1]

TASK [Remove default nginx site] ***********************************************************************************************************************
ok: [remote1]

TASK [Create web root directories] *********************************************************************************************************************
ok: [remote1] => (item={'server_name': 'site1.example.local', 'root': '/var/www/site1'})
ok: [remote1] => (item={'server_name': 'site2.example.local', 'root': '/var/www/site2'})

TASK [Deploy HTML template] ****************************************************************************************************************************
ok: [remote1] => (item={'server_name': 'site1.example.local', 'root': '/var/www/site1'})
ok: [remote1] => (item={'server_name': 'site2.example.local', 'root': '/var/www/site2'})

TASK [Create Nginx vhost configs] **********************************************************************************************************************
ok: [remote1] => (item={'server_name': 'site1.example.local', 'root': '/var/www/site1'})
ok: [remote1] => (item={'server_name': 'site2.example.local', 'root': '/var/www/site2'})

TASK [Enable vhosts] ***********************************************************************************************************************************
ok: [remote1] => (item={'server_name': 'site1.example.local', 'root': '/var/www/site1'})
ok: [remote1] => (item={'server_name': 'site2.example.local', 'root': '/var/www/site2'})

TASK [Test nginx configuration] ************************************************************************************************************************
ok: [remote1]

TASK [Restart nginx] ***********************************************************************************************************************************
changed: [remote1]

TASK [Verify site1 virtual host] ***********************************************************************************************************************
ok: [remote1]

TASK [Verify site2 virtual host] ***********************************************************************************************************************
ok: [remote1]

PLAY RECAP *********************************************************************************************************************************************
remote1                    : ok=11   changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
 ```