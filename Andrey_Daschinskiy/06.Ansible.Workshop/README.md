###Ansible Workshop
I do the following steps locally on my virtual machine.

1.Structured the project.

```bash
06.Ansible.Workshop/
├── inventory.ini    
├── playbook.yml
├── templates/
│   ├── vhost.conf.j2
│   └── index.html.j2
└── README.md
```
2.Created inventory.ini
```bash
[webservers]
web1 ansible_host=[IP_ADDRESS]

[all:vars]
ansible_user=root
ansible_ssh_pass=[PASSWORD]
ansible_become_pass=[PASSWORD]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o ProxyCommand="sshpass -p [PASSWORD] ssh -W %h:%p -p 32510 jump_sa@[IP_ADDRESS]"'
```

3.Created playbook.yml
Provided as a separate file.

4.Config templates
vhost.conf.j2
```bash
server {
    listen {{ item.port }};
    server_name {{ item.name }};

    root /var/www/{{ item.name }}/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```
index.html.j2
```bash
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to {{ item.name }}</title>
</head>
<body>
    <h1>Hello from {{ ansible_hostname }}!</h1>
    <p>FQDN: {{ ansible_fqdn }}</p>
    <p>Served by Nginx on port {{ item.port }}</p>
</body>
</html>
```
Check the work with the command:
```bash
ansible-playbook -i inventory.ini playbook.yml
```
An error was displayed when executing the command:
```bash
fatal: [web1]: FAILED! => {"changed": false, "msg": "Unable to start service nginx: Job for nginx.service failed because the control process exited with error code.\nSee \"systemctl status nginx.service\" and \"journalctl -xe\" for details.\n
```
Reason: port 80 was occupied by the Apache service. 
I changed it to 8080. 
Repeated the command, the result:

```bash
PLAY [Configure Nginx with two virtual hosts] *******************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************
ok: [web1]

TASK [Install Nginx] ********************************************************************************************************************************
ok: [web1]

TASK [Create directories for virtual hosts] *********************************************************************************************************
ok: [web1] => (item={'name': 'site1.example.com', 'port': 8888})
ok: [web1] => (item={'name': 'site2.example.com', 'port': 8889})

TASK [Deploy virtual host configs] ******************************************************************************************************************
ok: [web1] => (item={'name': 'site1.example.com', 'port': 8888})
ok: [web1] => (item={'name': 'site2.example.com', 'port': 8889})

TASK [Enable sites] *********************************************************************************************************************************
ok: [web1] => (item={'name': 'site1.example.com', 'port': 8888})
ok: [web1] => (item={'name': 'site2.example.com', 'port': 8889})

TASK [Deploy index.html] ****************************************************************************************************************************
ok: [web1] => (item={'name': 'site1.example.com', 'port': 8888})
ok: [web1] => (item={'name': 'site2.example.com', 'port': 8889})

PLAY RECAP ******************************************************************************************************************************************
web1                       : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

Check if HTML is available via curl query:
```bash
curl http://[Ansible_workshop_target_node_IP_ADDRESS]:8888/8889
```
Result:
```bash
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to site1.example.com</title>
</head>
<body>
    <h1>Hello from ws-4!</h1>
    <p>FQDN: ws-4.it-academy.local</p>
    <p>Served by Nginx on port 8888</p>
</body>
</html>
```
Same result for port 8889
