# 05. Ansible.start

## Setup your ssh environment to work with hosts in it-academy datacenter


```bash 
artem@serverart:~/05.Ansible$ ansible -i hosts.yaml -m ping all_workers -u root
host5 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host6 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```
## Ansible playbook

```bash
artem@serverart:~/05.Ansible$ ansible-playbook -i hosts.yaml playb.yaml -u root

PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Saturday 26 November 2022  04:04:04 -0500 (0:00:00.012)       0:00:00.012 *****
ok: [host6]
ok: [host5]

TASK [Show OS and version] *****************************************************
Saturday 26 November 2022  04:04:07 -0500 (0:00:02.991)       0:00:03.003 *****
ok: [host5] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}
ok: [host6] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}

TASK [Show mount point and capacity] *******************************************
Saturday 26 November 2022  04:04:07 -0500 (0:00:00.078)       0:00:03.081 *****
ok: [host5] => (item={'mount': '/', 'device': '/dev/loop5', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10809729024, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2639094, 'block_used': 430636, 'inode_total': 786432, 'inode_available': 758482, 'inode_used': 27950, 'uuid': 'N/A'}) => {
    "msg": "Mount point: / | Capacity: 12573 MB | Used space: 1763 MB"
}
ok: [host6] => (item={'mount': '/', 'device': '/dev/loop6', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10809610240, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2639065, 'block_used': 430665, 'inode_total': 786432, 'inode_available': 758483, 'inode_used': 27949, 'uuid': 'N/A'}) => {
    "msg": "Mount point: / | Capacity: 12573 MB | Used space: 1764 MB"
}

TASK [Show RAM  capacity] ******************************************************
Saturday 26 November 2022  04:04:07 -0500 (0:00:00.089)       0:00:03.170 *****
ok: [host5] => {
    "msg": "Total memory: 2048 MB | Free memory: 1664 MB"
}
ok: [host6] => {
    "msg": "Total memory: 2048 MB | Free memory: 1669 MB"
}

PLAY RECAP *********************************************************************
host5                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host6                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 26 November 2022  04:04:07 -0500 (0:00:00.069)       0:00:03.240 *****
===============================================================================
Gathering Facts --------------------------------------------------------- 2.99s
Show mount point and capacity ------------------------------------------- 0.09s
Show OS and version ----------------------------------------------------- 0.08s
Show RAM  capacity ------------------------------------------------------ 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds
```
