# Ansible ad-hoc

### Check content of /etc/hosts

```
ansible prod -m shell -a "cat /etc/hosts"

host25 | CHANGED | rc=0 >>
127.0.1.1       LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.25 sa-centos-25.it-academy.local sa-centos-25
# --- END PVE ---

host26 | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.26 sa-ubuntu-26.it-academy.local sa-ubuntu-26
# --- END PVE ---
```

### install nginx service centos

```
ansible host25 -m shell -a "yum install epel-release -y"
ansible host25 -m yum -a "name=nginx state=latest"

host25 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "changes": {
        "installed": [],
        "updated": []
    },
    "msg": "",
    "rc": 0,
    "results": [
        "All packages providing nginx are up to date",
        ""
    ]
}
```
### install nginx service ubuntu
```
ansible host26 -m shell -a "apt-get install nginx -y"
ansible host26 -m apt -a "name=nginx state=latest"
host26 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1653053156,
    "cache_updated": false,
    "changed": false
}
```

### upload nginx config centos

```
ansible host25 -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html"
host25 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "checksum": "794703bb8f7797b5906e75daf81adebade6e2363",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "mode": "0644",
    "owner": "root",
    "path": "/usr/share/nginx/html/index.html",
    "size": 187,
    "state": "file",
    "uid": 0
}
```


### upload nginx config ubuntu

```
ansible host26 -m copy -a "src=index.html dest=/var/www/html/index.html"
host26 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "checksum": "794703bb8f7797b5906e75daf81adebade6e2363",
    "dest": "/var/www/html/index.html",
    "gid": 0,
    "group": "root",
    "mode": "0644",
    "owner": "root",
    "path": "/var/www/html/index.html",
    "size": 187,
    "state": "file",
    "uid": 0
}
```

### restart nginx service

```
ansible prod -m service -a "name=nginx state=restarted"
host25 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        }
}
host26 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
    }
}
```
### restart nginx service

```
ansible prod -m shell -a "curl http://localhost"
host25 | CHANGED | rc=0 >>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
    <h1>This page was created by Nikolai from Ansible</h1>
  </body>
</html>  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   187  100   187    0     0  22187      0 --:--:-- --:--:-- --:--:-- 23375
host26 | CHANGED | rc=0 >>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>My test page</title>
  </head>
  <body>
    <h1>This page was created by Nikolai from Ansible</h1>
  </body>
</html>  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   187  100   187    0     0  46750      0 --:--:-- --:--:-- --:--:-- 46750

```
# Ansible playbook

```
ansible-playbook playbook.yaml

PLAY [first playbook] ***********************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [host25]
ok: [host26]

TASK [OS/Version] ***************************************************************************************************************************************************************************************************************************
ok: [host25] => {
    "msg": "CentOS/7.7"
}
ok: [host26] => {
    "msg": "Ubuntu/18.04"
}

TASK [Mount points] *************************************************************************************************************************************************************************************************************************
ok: [host25] => (item={'block_used': 481078, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4646750, 'size_available': 19033088000, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop24', 'inode_used': 23507, 'block_size': 4096, 'inode_available': 1287213}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 19GB",
        "Used space: 1GB"
    ]
}
ok: [host26] => (item={'mount': '/', 'device': '/dev/loop25', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18822713344, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4595389, 'block_used': 532439, 'inode_total': 1310720, 'inode_available': 1283921, 'inode_used': 26799, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 19GB",
        "Used space: 2GB"
    ]
}

TASK [Check RAM] ****************************************************************************************************************************************************************************************************************************
ok: [host25] => {
    "msg": [
        "RAM capacity: 2048MB",
        "RAM free: 1633MB"
    ]
}
ok: [host26] => {
    "msg": [
        "RAM capacity: 2048MB",
        "RAM free: 1570MB"
    ]
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
host25                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host26                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```