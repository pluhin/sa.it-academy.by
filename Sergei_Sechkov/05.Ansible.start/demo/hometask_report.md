
## Information about installed version ansible
```sh
ansible [core 2.14.0]
  config file = /home/frame1/05.Ansible.Local/ansible.cfg
  configured module search path = ['/home/frame1/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/frame1/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```

## Connetcion's config file 
```yml
Host ec_bastion
        User jump_sa
        HostName 178.124.206.53
Host 192.168.201.33 192.168.202.34 192.168.203.15
        ProxyJump ec_bastion
```

## Checked available hosts
```sh
host34 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
db15 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host33 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```
PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Sunday 04 December 2022  18:59:39 +0300 (0:00:00.045)       0:00:00.045 ******* 
ok: [host33]
ok: [db15]
ok: [host34]

TASK [print information about OS] **********************************************
Sunday 04 December 2022  18:59:42 +0300 (0:00:02.565)       0:00:02.610 ******* 
ok: [host33] => {
    "msg": "host33 | Ubuntu | 20.04"
}
ok: [host34] => {
    "msg": "host34 | Ubuntu | 20.04"
}
ok: [db15] => {
    "msg": "db15 | Ubuntu | 20.04"
}

TASK [print information about mount point/capacity/used] ***********************
Sunday 04 December 2022  18:59:42 +0300 (0:00:00.108)       0:00:02.718 ******* 
ok: [host33] => {
    "msg": [
        "Mount point: /",
        "Total size: 11.71 GB",
        "Available size: 10.07 GB",
        "Used size 1.64 GB"
    ]
}
ok: [host34] => {
    "msg": [
        "Mount point: /",
        "Total size: 11.71 GB",
        "Available size: 10.21 GB",
        "Used size 1.5 GB"
    ]
}
ok: [db15] => {
    "msg": [
        "Mount point: /",
        "Total size: 9.75 GB",
        "Available size: 7.22 GB",
        "Used size 2.53 GB"
    ]
}

TASK [print information about RAM/capacity/used] *******************************
Sunday 04 December 2022  18:59:42 +0300 (0:00:00.138)       0:00:02.857 ******* 
ok: [host33] => {
    "msg": "RAM info: {'total': 2048, 'used': 394, 'free': 1654} mb"
}
ok: [host34] => {
    "msg": "RAM info: {'total': 2048, 'used': 391, 'free': 1657} mb"
}
ok: [db15] => {
    "msg": "RAM info: {'total': 2048, 'used': 790, 'free': 1258} mb"
}

PLAY RECAP *********************************************************************
db15                       : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host33                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host34                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 04 December 2022  18:59:43 +0300 (0:00:00.284)       0:00:03.142 ******* 
=============================================================================== 
Gathering Facts --------------------------------------------------------- 2.57s
print information about RAM/capacity/used ------------------------------- 0.28s
print information about mount point/capacity/used ----------------------- 0.14s
print information about OS ---------------------------------------------- 0.11s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds
