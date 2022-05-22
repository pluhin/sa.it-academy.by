## check content of /etc/hosts file

```bash
root@de64:~/ansible_h# ansible -i inventory.yaml -m shell -a "cat /etc/hosts" all_workers
host4 | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.4 sa-ubuntu-4.it-academy.local sa-ubuntu-4
# --- END PVE ---
host3 | CHANGED | rc=0 >>
127.0.1.1       LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.3 sa-centos-3.it-academy.local sa-centos-3
# --- END PVE ---
```

## install nginx service

```bash
root@de64:~/ansible_h# ansible -i inventory.yaml -m yum -a "name=epel-release state=present" host3
host3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "epel-release"
        ]
    },
    "msg": "",
    "rc": 0,
    "results": [
        "Loaded <...installation log...> Complete!\n"
    ]
}

root@de64:~/ansible_h# ansible -i inventory.yaml -m yum -a "name=nginx state=latest" host3
host3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "changes": {
        "installed": [
            "nginx"
        ],
        "updated": []
    },
    "msg": <...installation log...>,
    "rc": 0,
    "results": [
        "Loaded <...installation log...> Complete!\n"
    ]
}

root@de64:~/ansible_h# ansible -i inventory.yaml -m apt -a "name=nginx state=latest" host4
host4 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652969020,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": <...installation log...>,
    "stdout_lines": [
        <...installation log...>
    ]
}
```

## upload nginx config for virtual host

```bash
root@de64:~/ansible_h# ansible -i inventory.yaml -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" all_workers
host3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "d41d8cd98f00b204e9800998ecf8427e",
    "mode": "0644",
    "owner": "root",
    "size": 0,
    "src": "/root/.ansible/tmp/ansible-tmp-1652969940.732371-2670-249444785927806/source",
    "state": "file",
    "uid": 0
}
host4 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "da39a3ee5e6b4b0d3255bfef95601890afd80709",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "d41d8cd98f00b204e9800998ecf8427e",
    "mode": "0644",
    "owner": "root",
    "size": 0,
    "src": "/root/.ansible/tmp/ansible-tmp-1652969917.315124-2640-213864659497830/source",
    "state": "file",
    "uid": 0
}
```

## restart nginx service

```bash
root@de64:~/ansible_h# ansible -i inventory.yaml -m service -a "name=nginx state=restarted" all_workers
host4 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        <...status...>    }
}
host3 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": {
        <...status...>
    }
}
```

## test it

```bash
root@de64:~/ansible_h# ansible -i inventory.yaml -m shell -a "curl -I http://localhost:80" all_workers
host4 | CHANGED | rc=0 >>
HTTP/1.1 200 OK
Server: nginx/1.14.0 (Ubuntu)
Date: Thu, 19 May 2022 14:28:31 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Thu, 19 May 2022 14:11:03 GMT
Connection: keep-alive
ETag: "62864ff7-264"
Accept-Ranges: bytes  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   612    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
host3 | CHANGED | rc=0 >>
HTTP/1.1 200 OK
Server: nginx/1.20.1
Date: Thu, 19 May 2022 14:28:34 GMT
Content-Type: text/html
Content-Length: 0
Last-Modified: Thu, 19 May 2022 14:19:05 GMT
Connection: keep-alive
ETag: "628651d9-0"
Accept-Ranges: bytes  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
```