# 05.Ansible

## Hosts

```bush
root@05lesson:/home/devops# ansible-inventory -i inv.yaml --graph
@all:
  |--@ungrouped:
  |--@all_workers:
  |  |--@work_sa:
  |  |  |--hostXX
  |  |  |--hostYY
  |--@jump_sa:
  |  |--bastion

root@05lesson:/home/devops# ansible-inventory -i inv.yaml --host bastion
{
    "ansible_host": "178.124.206.53",
    "ansible_user": "jump_sa",
    "env": "it-academy"
}
root@05lesson:/home/devops# ansible-inventory -i inv.yaml --host hostXX
{
    "ansible_host": "192.168.202.21",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
root@05lesson:/home/devops# ansible-inventory -i inv.yaml --host hostYY
{
    "ansible_host": "192.168.202.22",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}

```

## Result playbook

```bush
root@05lesson:/home/devops# ansible-playbook -i inv.yaml checker.yaml

PLAY [all_workers] **************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************
Friday 24 March 2023  13:11:51 +0000 (0:00:00.007)       0:00:00.007 **********
ok: [hostYY]
ok: [hostXX]

TASK [OS/Version] ***************************************************************************************************************************************************************************************
Friday 24 March 2023  13:11:55 +0000 (0:00:03.925)       0:00:03.933 **********
ok: [hostXX] => {
    "msg": "Ubuntu | 20.04"
}
ok: [hostYY] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] ************************************************************************************************************************************************************************
Friday 24 March 2023  13:11:55 +0000 (0:00:00.053)       0:00:03.986 **********
ok: [hostYY] => (item={'mount': '/', 'device': '/dev/loop21', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6784200704, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1656299, 'block_used': 382348, 'inode_total': 524288, 'inode_available': 496337, 'inode_used': 27951, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev - /dev/loop21",
        "Mount point - /",
        "Total size - 7.78 Gb",
        "Available size - 6.32 Gb",
        "Used size - 1.46 Gb"
    ]
}
ok: [hostXX] => (item={'mount': '/', 'device': '/dev/loop20', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6784212992, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1656302, 'block_used': 382345, 'inode_total': 524288, 'inode_available': 496337, 'inode_used': 27951, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev - /dev/loop20",
        "Mount point - /",
        "Total size - 7.78 Gb",
        "Available size - 6.32 Gb",
        "Used size - 1.46 Gb"
    ]
}

TASK [RAM/capacity/free] ********************************************************************************************************************************************************************************
Friday 24 March 2023  13:11:55 +0000 (0:00:00.093)       0:00:04.079 **********
ok: [hostXX] => {
    "msg": [
        "Total memory - 2.0 Gb",
        "Free memory - 1.62 Gb",
        "Used memory - 0.38 Gb"
    ]
}
ok: [hostYY] => {
    "msg": [
        "Total memory - 2.0 Gb",
        "Free memory - 1.62 Gb",
        "Used memory - 0.38 Gb"
    ]
}

PLAY RECAP **********************************************************************************************************************************************************************************************
hostXX                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
hostYY                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Friday 24 March 2023  13:11:55 +0000 (0:00:00.124)       0:00:04.204 **********
===============================================================================
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 3.93s
RAM/capacity/free -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.12s
Mount point/capacity/used ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.09s
OS/Version --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.05s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```