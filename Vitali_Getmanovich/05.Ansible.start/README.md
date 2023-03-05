# 05.Ansible.start
## Install
---
### Install Ansible 
---
```bash
  1 sudo apt update
  2 sudo apt install python3-pip
  3 sudo pip3 install ansible
  4 ansible --version
  
  ansible [core 2.14.3]
  config file = None
  configured module search path = ['/home/vitali/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/vitali/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```
---
### Setup ansible config file
---
```bash
  5 mkdir -p 05.Ansible.start
  6 ls -l
  7 cd 05.Ansible.start/
  8 vim ansible.cfg
  9 cat ansible.cfg
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
  10 ansible --version
  ansible [core 2.14.3]
  config file = /home/vitali/Course/05.Ansible.start/ansible.cfg
  configured module search path = ['/home/vitali/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/vitali/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
  ```
---
### Setup ssh environment
---
```
10 vim inventary.yaml
11 cat inventary.yaml
all_workers:
  children:
    work_sa:
      hosts:
        host7:
          ansible_host: 192.168.202.7
        host8:
          ansible_host: 192.168.202.8
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa

12 ssh-copy-id jump_sa@178.124.206.53
13 ssh jump_sa@178.124.206.53
jump_sa@jump:~$ 
14 cd ~
15 cd .ssh
16 vim config
17 cat config
Host ec_bastion
    User jump_sa
    HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
    ProxyJump ec_bastion

18 ssh root@192.168.202.7
root@sa-7:~#
19 logout
20 ssh root@192.168.202.8
root@sa-8:~#

21 ansible -i inventary.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass

host8 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa .....
    ...................
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true
}

host7 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa.......
    ...................
     "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true

22 ansible -i inventary.yaml -m ping all_workers -u root
host8 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host7 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```
---
## Playbook
---
```bash
23 cat first.yaml
- hosts: all_workers
  #gather_facts: False
  #strategy: free
  #serial: 1
  tasks:
    - name: Print OS/Version
      debug:
        msg:
          - "OS - {{ ansible_distribution }}"
          - "Version - {{ ansible_distribution_version }}"
      tags:
        - OS

    - name: Print mount/capacity/used
      debug:
        msg:
          - "Mount point - {{ item.mount }}"
          - "Total - {{ item.size_total }} MB  "
          - "Used = {{ (item.size_total - item.size_available) }} MB"
      with_items: "{{ ansible_mounts }}"

    - name: Print RAM/capacity/free
      debug:
        msg:
        - "Total  - {{ ansible_memtotal_mb }} MB"
        - "Free  - {{ ansible_memfree_mb }} MB"
      tags:
        - memory
```
---
## Result
---
```bash
24 ansible-playbook -i inventary.yaml first.yaml

PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Пятніца 03 сакавіка 2023  04:13:13 +0300 (0:00:00.091)       0:00:00.091 ******
ok: [host7]
ok: [host8]

TASK [Print OS/Version] ********************************************************
Пятніца 03 сакавіка 2023  04:13:21 +0300 (0:00:07.617)       0:00:07.708 ******
ok: [host7] => {
    "msg": [
        "OS - Ubuntu",
        "Version - 20.04"
    ]
}
ok: [host8] => {
    "msg": [
        "OS - Ubuntu",
        "Version - 20.04"
    ]
}

TASK [Print mount/capacity/used] ***********************************************
Пятніца 03 сакавіка 2023  04:13:21 +0300 (0:00:00.625)       0:00:08.334 ******
ok: [host7] => (item={'mount': '/', 'device': '/dev/loop6', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792368128, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658293, 'block_used': 380354, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point - /",
        "Total - 8350298112 MB  ",
        "Used = 1557929984 MB"
    ]
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop12', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6793162752, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658487, 'block_used': 380160, 'inode_total': 524288, 'inode_available': 496375, 'inode_used': 27913, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point - /",
        "Total - 8350298112 MB  ",
        "Used = 1557135360 MB"
    ]
}

TASK [Print RAM/capacity/free] *************************************************
Пятніца 03 сакавіка 2023  04:13:23 +0300 (0:00:01.406)       0:00:09.741 ******
ok: [host7] => {
    "msg": [
        "Total  - 2048 MB",
        "Free  - 1655 MB"
    ]
}
ok: [host8] => {
    "msg": [
        "Total  - 2048 MB",
        "Free  - 1671 MB"
    ]
}

PLAY RECAP *********************************************************************
host7                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Пятніца 03 сакавіка 2023  04:13:24 +0300 (0:00:01.144)       0:00:10.886 ******
===============================================================================
Gathering Facts --------------------------------------------------------- 7.62s
Print mount/capacity/used ----------------------------------------------- 1.40s
Print RAM/capacity/free ------------------------------------------------- 1.15s
Print OS/Version -------------------------------------------------------- 0.63s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
```
