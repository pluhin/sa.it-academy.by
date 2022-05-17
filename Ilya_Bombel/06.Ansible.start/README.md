# 06.Ansible.start homework

## Create the following ansible ad-hoc commands
* check content of /etc/hosts file
```bash
ansible -i inventory2.yaml -m shell -a "cat /etc/hosts" all_workers2
host9 | CHANGED | rc=0 >>
127.0.1.1       LXC_NAME
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
# --- BEGIN PVE ---
192.168.202.9 sa-centos-9.it-academy.local sa-centos-9
# --- END PVE ---
host10 | CHANGED | rc=0 >>
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# --- BEGIN PVE ---
192.168.202.10 sa-ubuntu-10.it-academy.local sa-ubuntu-10
# --- END PVE ---
```

* install nginx service
```bash
# install on host9 (CentOS | 7.7)
# Nginx is not available in the standard repositories of CentOS. You need first to enable the EPEL repo to install nginx.
ansible -i inventory2.yaml -m yum -a "name=epel-release state=present" host9
host9 | CHANGED => {
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
    "results": [ #here are your results
    ]
}
ansible -i inventory2.yaml -m yum -a "name=nginx state=latest" host9
host9 | CHANGED => {
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
    "msg": "warning: /var/cache/yum/x86_64/7/epel/packages/nginx-filesystem-1.20.1-9.el7.noarch.rpm: Header V4 RSA/SHA256 Signature, key ID 352c64e5: NOKEY\nImporting GPG key 0x352C64E5:\n Userid     : \"Fedora EPEL (7) <epel@fedoraproject.org>\"\n Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5\n Package    : epel-release-7-11.noarch (@extras)\n From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7\n",
    "rc": 0,
    "results": [ #here are your results
    ]
}

# install on host10 (Ubuntu | 18.04)
ansible -i inventory2.yaml -m apt -a "name=nginx state=latest" host10
host10 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652209495,
    "cache_updated": false,
    "changed": false
```

* upload nginx config for virtual host
```bash
ansible -i inventory2.yaml -m copy -a "src=index.html dest=/usr/share/nginx/html/index.html" all_workers2
host9 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "checksum": "886fcec0e4723278cc8ba72a5b7fa9de9382ec27",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "467eb9f6af1df884cc3e98bd31a1d6ad",
    "mode": "0644",
    "owner": "root",
    "size": 232,
    "src": "/root/.ansible/tmp/ansible-tmp-1652703445.9741797-10389-50041769720525/source",
    "state": "file",
    "uid": 0
}
host10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "886fcec0e4723278cc8ba72a5b7fa9de9382ec27",
    "dest": "/usr/share/nginx/html/index.html",
    "gid": 0,
    "group": "root",
    "md5sum": "467eb9f6af1df884cc3e98bd31a1d6ad",
    "mode": "0644",
    "owner": "root",
    "size": 232,
    "src": "/root/.ansible/tmp/ansible-tmp-1652703509.993968-10412-71149113045569/source",
    "state": "file",
    "uid": 0
}
```

* restart nginx service
```bash
ansible -i inventory2.yaml -m service -a "name=nginx state=restarted" all_workers2
host9 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": { #your ngnix service status here
    }
host10 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "name": "nginx",
    "state": "started",
    "status": { #your ngnix service status here
    }
}
```

* test it
```bash
ansible -i inventory2.yaml -m shell -a "curl -I http://127.0.0.1:80" all_workers2
host10 | CHANGED | rc=0 >>
HTTP/1.1 200 OK
Server: nginx/1.14.0 (Ubuntu)
Date: Mon, 16 May 2022 16:34:25 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Mon, 16 May 2022 11:04:30 GMT
Connection: keep-alive
ETag: "62822fbe-264"
Accept-Ranges: bytes  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   612    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
host9 | CHANGED | rc=0 >>
HTTP/1.1 200 OK
Server: nginx/1.20.1
Date: Mon, 16 May 2022 16:34:26 GMT
Content-Type: text/html
Content-Length: 232
Last-Modified: Mon, 16 May 2022 12:17:26 GMT
Connection: keep-alive
ETag: "628240d6-e8"
Accept-Ranges: bytes  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0   232    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
```

## Playbook to display parameters from remote hosts
* OS/version
* Mount point/capacity/used
* RAM/capacity/free

```bash
vagrant@bullseye:~/ansible_ws$ ansible-playbook -i inventory2.yaml play.yaml

PLAY [all_workers2] ************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************
Monday 16 May 2022  10:31:18 +0000 (0:00:00.010)       0:00:00.010 ************
ok: [host9]
ok: [host10]

TASK [set_fact] ****************************************************************************************************************
Monday 16 May 2022  10:31:20 +0000 (0:00:02.112)       0:00:02.122 ************
ok: [host9]
ok: [host10]

TASK [set_fact] ****************************************************************************************************************
Monday 16 May 2022  10:31:21 +0000 (0:00:00.091)       0:00:02.214 ************
ok: [host9]
ok: [host10]

TASK [set_fact] ****************************************************************************************************************
Monday 16 May 2022  10:31:21 +0000 (0:00:00.086)       0:00:02.300 ************
ok: [host9]
ok: [host10]

TASK [OS] **********************************************************************************************************************
Monday 16 May 2022  10:31:21 +0000 (0:00:00.087)       0:00:02.387 ************
ok: [host9] => {
    "msg": "CentOS | 7.7"
}
ok: [host10] => {
    "msg": "Ubuntu | 18.04"
}

TASK [Mount] *******************************************************************************************************************
Monday 16 May 2022  10:31:21 +0000 (0:00:00.067)       0:00:02.455 ************
ok: [host9] => {
    "msg": "point / capacity 21.0 GB used 1.9 GB"
}
ok: [host10] => {
    "msg": "point / capacity 21.0 GB used 2.2 GB"
}

TASK [RAM] *********************************************************************************************************************
Monday 16 May 2022  10:31:21 +0000 (0:00:00.099)       0:00:02.555 ************
ok: [host9] => {
    "msg": "capacity 2048MB free 1791MB"
}
ok: [host10] => {
    "msg": "capacity 2048MB free 1859MB"
}

PLAY RECAP *********************************************************************************************************************
host10                     : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host9                      : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```