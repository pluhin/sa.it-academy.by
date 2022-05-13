# Ansible ad-hoc

## "Check content of /etc/hosts file" task

### Output for "ansible -i inventory.yml -m shell -a "cat /etc/hosts" all_workers"
```bash
debsrv | CHANGED | rc=0 >>
127.0.0.1	localhost
127.0.1.1	debsrv.local.by	debsrv

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ubsrv | CHANGED | rc=0 >>
127.0.0.1 localhost
127.0.1.1 ubsrv

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

## "Install nginx service" task

### Output for "ansible -i inventory.yml -m apt -a "name=nginx state=latest" --become -K all_workers"
```bash
ubsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652260589,
    "cache_updated": false,
    "changed": true,
    "stderr": "debconf: delaying package configuration, since apt-utils is not installed\n",
    "stderr_lines": [
        "debconf: delaying package configuration, since apt-utils is not installed"
    ],
    "stdout": "Reading package lists...
    ...
}
debsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "cache_update_time": 1652259933,
    "cache_updated": false,
    "changed": true,
    "stderr": "",
    "stderr_lines": [],
    "stdout": "Reading package lists...
    ...
```

## "Upload nginx config for virtual host" task

### Output for "ansible -i inventory.yml -m copy -a "src=/home/ivan/ansible/index.nginx-debian.html dest=/var/www/html/" --become -K all_workers"
```bash
ubsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "3cec08de8194c38fae9347b8f22688ee0ba7fb63",
    "dest": "/var/www/html/index.nginx-debian.html",
    "gid": 0,
    "group": "root",
    "md5sum": "7af14d7b87ebc81ecfa91f9da7b7133b",
    "mode": "0644",
    "owner": "root",
    "size": 380,
    "src": "/home/ivan/.ansible/tmp/ansible-tmp-1652354125.3766263-7524-248608471997354/source",
    "state": "file",
    "uid": 0
}
debsrv | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "checksum": "3cec08de8194c38fae9347b8f22688ee0ba7fb63",
    "dest": "/var/www/html/index.nginx-debian.html",
    "gid": 0,
    "group": "root",
    "md5sum": "7af14d7b87ebc81ecfa91f9da7b7133b",
    "mode": "0644",
    "owner": "root",
    "size": 380,
    "src": "/home/ivan/.ansible/tmp/ansible-tmp-1652354125.6075032-7526-188679914305245/source",
    "state": "file",
    "uid": 0
}

```

## "Restart nginx service" task

### Output for "ansible -i inventory.yml -m shell -a "systemctl restart nginx" --become -K all_workers"
```bash
ubsrv | CHANGED | rc=0 >>

debsrv | CHANGED | rc=0 >>
```

## "Test it" task

### Output for "ansible -i inventory.yml -m shell -a "ps -ef | grep nginx" all_workers"
```bash
ubsrv | CHANGED | rc=0 >>
root        2200       1  0 11:17 ?        00:00:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data    2201    2200  0 11:17 ?        00:00:00 nginx: worker process
ivan        2621    2619  0 12:29 pts/0    00:00:00 /bin/sh -c ps -ef | grep nginx
ivan        2623    2621  0 12:29 pts/0    00:00:00 grep nginx
debsrv | CHANGED | rc=0 >>
root        5083       1  0 14:17 ?        00:00:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
www-data    5084    5083  0 14:17 ?        00:00:00 nginx: worker process
ivan        5387    5385  0 15:29 pts/1    00:00:00 /bin/sh -c ps -ef | grep nginx
ivan        5389    5387  0 15:29 pts/1    00:00:00 grep nginx

```

# Ansible playbook

## Playbook file
```yml
- hosts: all_workers 
  tasks:
    - name: Print OS versions 
      debug:
        msg: 
          - "OS     : {{ ansible_distribution }}"
          - "Version: {{ ansible_distribution_version }}"
    - name: Print mount point/capacity/used 
      debug:
        msg: 
          - "Mount   : {{ item.mount }}"
          - "Capacity: {{ (item.size_total/1048576)|int }} MB"
          - "Used    : {{ ((item.size_total - item.size_available)/1048576)|int }} MB"
      loop: "{{ ansible_mounts }}"
    - name: Print RAM capacity/free 
      debug:
        msg: 
          - "RAM total: {{ ansible_memtotal_mb }} MB"
          - "RAM free : {{ ansible_memfree_mb }} MB"
```

## Playbook output
```bash
PLAY [all_workers] *****************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
Пятніца 13 мая 2022  12:37:27 +0300 (0:00:00.016)       0:00:00.016 *********** 
ok: [debsrv]
ok: [ubsrv]

TASK [Print OS versions] ***********************************************************************************************
Пятніца 13 мая 2022  12:37:29 +0300 (0:00:02.424)       0:00:02.441 *********** 
ok: [ubsrv] => {
    "msg": [
        "OS     : Ubuntu",
        "Version: 22.04"
    ]
}
ok: [debsrv] => {
    "msg": [
        "OS     : Debian",
        "Version: 11"
    ]
}

TASK [Print mount point/capacity/used] *********************************************************************************
Пятніца 13 мая 2022  12:37:29 +0300 (0:00:00.058)       0:00:02.500 *********** 
ok: [ubsrv] => (item={'mount': '/', 'device': '/dev/mapper/ubuntu--vg-ubuntu--lv', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 10464022528, 'size_available': 5567954944, 'block_size': 4096, 'block_total': 2554693, 'block_available': 1359364, 'block_used': 1195329, 'inode_total': 655360, 'inode_available': 591350, 'inode_used': 64010, 'uuid': 'cab79a79-91f9-41ac-8957-d37ffe847c4f'}) => {
    "msg": [
        "Mount   : /",
        "Capacity: 9979 MB",
        "Used    : 4669 MB"
    ]
}
ok: [ubsrv] => (item={'mount': '/boot', 'device': '/dev/sda2', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 1890725888, 'size_available': 1645604864, 'block_size': 4096, 'block_total': 461603, 'block_available': 401759, 'block_used': 59844, 'inode_total': 119760, 'inode_available': 119444, 'inode_used': 316, 'uuid': '7aa1cec9-177c-45dc-845d-59a3593e2f0a'}) => {
    "msg": [
        "Mount   : /boot",
        "Capacity: 1803 MB",
        "Used    : 233 MB"
    ]
}
ok: [debsrv] => (item={'mount': '/', 'device': '/dev/mapper/debsrv--vg-root', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro', 'size_total': 14798553088, 'size_available': 9402429440, 'block_size': 4096, 'block_total': 3612928, 'block_available': 2295515, 'block_used': 1317413, 'inode_total': 925696, 'inode_available': 768097, 'inode_used': 157599, 'uuid': '24cd45ae-507f-4129-b134-4a834d91e206'}) => {
    "msg": [
        "Mount   : /",
        "Capacity: 14113 MB",
        "Used    : 5146 MB"
    ]
}
ok: [debsrv] => (item={'mount': '/boot', 'device': '/dev/sda1', 'fstype': 'ext2', 'options': 'rw,relatime', 'size_total': 492152832, 'size_available': 351170560, 'block_size': 1024, 'block_total': 480618, 'block_available': 342940, 'block_used': 137678, 'inode_total': 124928, 'inode_available': 124577, 'inode_used': 351, 'uuid': '2a5f6bb8-3360-4e93-8129-30b75638a532'}) => {
    "msg": [
        "Mount   : /boot",
        "Capacity: 469 MB",
        "Used    : 134 MB"
    ]
}

TASK [Print RAM capacity/free] *****************************************************************************************
Пятніца 13 мая 2022  12:37:29 +0300 (0:00:00.152)       0:00:02.653 *********** 
ok: [ubsrv] => {
    "msg": [
        "RAM total: 971 MB",
        "RAM free : 388 MB"
    ]
}
ok: [debsrv] => {
    "msg": [
        "RAM total: 976 MB",
        "RAM free : 292 MB"
    ]
}

PLAY RECAP *************************************************************************************************************
debsrv                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubsrv                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Пятніца 13 мая 2022  12:37:29 +0300 (0:00:00.070)       0:00:02.723 *********** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------- 2.42s
Print mount point/capacity/used --------------------------------------------------------------------------------- 0.15s
Print RAM capacity/free ----------------------------------------------------------------------------------------- 0.07s
Print OS versions ----------------------------------------------------------------------------------------------- 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
