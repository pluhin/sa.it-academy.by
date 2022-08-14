## 06. Ansible start

### Ansible ad-hoc

```bash
# check content of /etc/hosts file:
ansible -i inventory.yaml -m shell -a "cat /etc/hosts" all_workers -u root
# install nginx service:
ansible -i inventory.yaml -m shell -a "apt update && apt install -y nginx && systemctl status nginx" host30 -u root
ansible -i inventory.yaml -m shell -a "dnf update && dnf install -y nginx && systemctl enable nginx && systemctl start nginx && systemctl status nginx" host29 -u root
# upload nginx config for virtual host:
ansible -i inventory.yaml -m ansible.builtin.copy -a "src=~/tmp/virtual_hosts.conf dest=/etc/nginx/conf.d/virtual_hosts.conf" all_workers -u root
# restart nginx service:
ansible -i inventory.yaml -m shell -a "systemctl restart nginx && systemctl status nginx" all_workers -u root
# test it:
ansible -i inventory.yaml -m shell -a "netstat -tulpn | grep :80" all_workers -u root #or
ansible -i inventory.yaml -m shell -a "ss -tulpn | grep :80" all_workers -u root #or
ansible -i inventory.yaml -m shell -a "sudo lsof -i -P | grep :80" all_workers -u root #or
```
### Output of ansible commands (Ansible ad-hoc):

```bash
# check content of /etc/hosts file:
host29 | CHANGED | rc=0 >>
127.0.1.1	LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.29 sa-centos-29.it-academy.local sa-centos-29
# --- END PVE ---
host30 | CHANGED | rc=0 >>
127.0.0.1	localhost
::1		localhost ip6-localhost ip6-loopback
ff02::1		ip6-allnodes
ff02::2		ip6-allrouters
# --- BEGIN PVE ---
192.168.202.30 sa-ubuntu-30.it-academy.local sa-ubuntu-30
# --- END PVE ---

# upload nginx config for virtual host:
host29 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "574333dfec08824ad8743bd4b697fc346e882eae",
    "dest": "/etc/nginx/conf.d/virtual_hosts.conf",
    "gid": 0,
    "group": "root",
    "md5sum": "f44c444b979c358f7b44e2a0b6049d1c",
    "mode": "0644",
    "owner": "root",
    "size": 423,
    "src": "/root/.ansible/tmp/ansible-tmp-1660511446.386132-327712-83427597630967/source",
    "state": "file",
    "uid": 0
}
host30 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "574333dfec08824ad8743bd4b697fc346e882eae",
    "dest": "/etc/nginx/conf.d/virtual_hosts.conf",
    "gid": 0,
    "group": "root",
    "md5sum": "f44c444b979c358f7b44e2a0b6049d1c",
    "mode": "0644",
    "owner": "root",
    "size": 423,
    "src": "/root/.ansible/tmp/ansible-tmp-1660511446.422299-327714-192177937878362/source",
    "state": "file",
    "uid": 0
}

# restart nginx service:
host29 | CHANGED | rc=0 >>
● nginx.service - The nginx HTTP and reverse proxy server
   Loaded: loaded (/usr/lib/systemd/system/nginx.service; enabled; vendor preset: disabled)
   Active: active (running) since Sun 2022-08-14 21:10:59 UTC; 7ms ago
  Process: 8312 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
  Process: 8310 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
  Process: 8309 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
 Main PID: 8313 (nginx)
    Tasks: 3 (limit: 1648100)
   Memory: 5.0M
   CGroup: /system.slice/nginx.service
           ├─8313 nginx: master process /usr/sbin/nginx
           ├─8314 nginx: worker process
           └─8315 nginx: worker process

Aug 14 21:10:59 sa-centos-29 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Aug 14 21:10:59 sa-centos-29 nginx[8310]: nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
Aug 14 21:10:59 sa-centos-29 nginx[8310]: nginx: configuration file /etc/nginx/nginx.conf test is successful
Aug 14 21:10:59 sa-centos-29 systemd[1]: nginx.service: Failed to parse PID from file /run/nginx.pid: Invalid argument
Aug 14 21:10:59 sa-centos-29 systemd[1]: Started The nginx HTTP and reverse proxy server.
host30 | CHANGED | rc=0 >>
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2022-08-14 21:10:59 UTC; 5ms ago
       Docs: man:nginx(8)
    Process: 22260 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 22262 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 22263 (nginx)
      Tasks: 3 (limit: 309018)
     Memory: 3.3M
        CPU: 25ms
     CGroup: /system.slice/nginx.service
             ├─22263 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
             ├─22264 nginx: worker process
             └─22265 nginx: worker process

Aug 14 21:10:59 sa-ubuntu-30 systemd[1]: Starting A high performance web server and a reverse proxy server...
Aug 14 21:10:59 sa-ubuntu-30 systemd[1]: Started A high performance web server and a reverse proxy server.

# test it:
host29 | CHANGED | rc=0 >>
tcp   LISTEN 0      511          0.0.0.0:80        0.0.0.0:*    users:(("nginx",pid=8315,fd=10),("nginx",pid=8314,fd=10),("nginx",pid=8313,fd=10))
tcp   LISTEN 0      511             [::]:80           [::]:*    users:(("nginx",pid=8315,fd=11),("nginx",pid=8314,fd=11),("nginx",pid=8313,fd=11))
host30 | CHANGED | rc=0 >>
tcp     LISTEN   0        511              0.0.0.0:80            0.0.0.0:*       users:(("nginx",pid=22265,fd=10),("nginx",pid=22264,fd=10),("nginx",pid=22263,fd=10))
tcp     LISTEN   0        511                 [::]:80               [::]:*       users:(("nginx",pid=22265,fd=11),("nginx",pid=22264,fd=11),("nginx",pid=22263,fd=11))
```

### Output of ansible commands (Ansible playbook):

```bash
PLAY [all_workers] **********************************************************************************

TASK [Gathering Facts] ******************************************************************************
Monday 15 August 2022  01:26:30 +0300 (0:00:00.011)       0:00:00.011 ********* 
ok: [host29]
ok: [host30]

TASK [OS/version] ***********************************************************************************
Monday 15 August 2022  01:26:35 +0300 (0:00:04.674)       0:00:04.686 ********* 
ok: [host29] => {
    "msg": "CentOS | 8.5"
}
ok: [host30] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/total/available] ******************************************************************
Monday 15 August 2022  01:26:35 +0300 (0:00:00.050)       0:00:04.736 ********* 
ok: [host29] => {
    "msg": "/ | 20957446144 | 4622914"
}
ok: [host30] => {
    "msg": "/ | 20957446144 | 4563616"
}

TASK [RAM total/used/free] **************************************************************************
Monday 15 August 2022  01:26:35 +0300 (0:00:00.053)       0:00:04.790 ********* 
ok: [host29] => {
    "msg": "2048 | 554 | 1494"
}
ok: [host30] => {
    "msg": "2048 | 1966 | 82"
}

PLAY RECAP ******************************************************************************************
host29                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host30                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 15 August 2022  01:26:35 +0300 (0:00:00.070)       0:00:04.860 ********* 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------ 4.67s
RAM total/used/free -------------------------------------------------------------------------- 0.07s
Mount point/total/available ------------------------------------------------------------------ 0.05s
OS/version ----------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```