# 05.Ansible Start 
1. Create ansible.cfg
[ansible.cfg](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/05.Ansible_start/ansible.cfg)
2. Create inventory file
[inventory](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/05.Ansible_start/inv.yaml)
3. Create playbook
[playbook](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/05.Ansible_start/playbook1.yaml)
4. Run playbook
```bash
yulia@ubuntuserver:~/Gitlab_repo/05.Ansible$ ansible-playbook -i inventory.yaml playbook1.yaml --ask-pass
SSH password: 
[WARNING]: Skipping callback plugin 'profile_tasks', unable to load
[WARNING]: Skipping callback plugin 'timer', unable to load

PLAY [all_workers] ***************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************
ok: [host36]
ok: [host35]

TASK [OS/Version] ****************************************************************************************************************************************
ok: [host35] => {
    "msg": "OS/Version is: Ubuntu | 20.04"
}
ok: [host36] => {
    "msg": "OS/Version is: Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] *************************************************************************************************************************
ok: [host35] => (item={'mount': '/', 'device': '/dev/loop34', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792626176, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658356, 'block_used': 380291, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev: /dev/loop34",
        "Mount point: /",
        "Total size: 7.78 Gb",
        "Available size: 6.33 Gb",
        "Used size: 1.45 Gb"
    ]
}
ok: [host36] => (item={'mount': '/', 'device': '/dev/loop35', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792478720, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658320, 'block_used': 380327, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev: /dev/loop35",
        "Mount point: /",
        "Total size: 7.78 Gb",
        "Available size: 6.33 Gb",
        "Used size: 1.45 Gb"
    ]
}

TASK [RAM/capacity/free] *********************************************************************************************************************************
ok: [host35] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1665 Mb",
        "Used memory: 383 Mb"
    ]
}
ok: [host36] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1663 Mb",
        "Used memory: 385 Mb"
    ]
}

PLAY RECAP ***********************************************************************************************************************************************
host35                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host36                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
