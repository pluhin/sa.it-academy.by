# 05.Ansible start

## Hosts

```bush
admin1@igor:~/05.ansible$ ansible-inventory -i inv.yaml --graph
@all:
  |--@ungrouped:
  |--@all_workers:
  |  |--@work_sa:
  |  |  |--host3
  |  |  |--host4
  |--@jump_sa:
  |  |--bastion
admin1@igor:~/05.ansible$ ansible-inventory -i inv.yaml --host bastion
{
    "ansible_host": "178.124.206.53",
    "ansible_user": "jump_sa",
    "env": "it-academy"
}
admin1@igor:~/05.ansible$ ansible-inventory -i inv.yaml --host host3
{
    "ansible_host": "192.168.202.3",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
admin1@igor:~/05.ansible$ ansible-inventory -i inv.yaml --host host4
{
    "ansible_host": "192.168.202.4",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
```

## Result playbook

```bush
admin1@igor:~/05.ansible$ ansible-playbook -i inv.yaml pb.yaml

PLAY [all_workers] ***************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
Wednesday 01 March 2023  18:27:34 +0000 (0:00:00.009)       0:00:00.009 *******
ok: [host3]
ok: [host4]

TASK [OS/Version] ****************************************************************************************************************
Wednesday 01 March 2023  18:27:36 +0000 (0:00:02.413)       0:00:02.422 *******
ok: [host3] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host4] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] *************************************************************************************************
Wednesday 01 March 2023  18:27:36 +0000 (0:00:00.070)       0:00:02.493 *******
ok: [host3] => (item={'mount': '/', 'device': '/dev/loop2', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792638464, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658359, 'block_used': 380288, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev - /dev/loop2",
        "Mount point - /",
        "Total size - 7.78 Gb",
        "Available size - 6.33 Gb",
        "Used size - 1.45 Gb"
    ]
}
ok: [host4] => (item={'mount': '/', 'device': '/dev/loop3', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792445952, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658312, 'block_used': 380335, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev - /dev/loop3",
        "Mount point - /",
        "Total size - 7.78 Gb",
        "Available size - 6.33 Gb",
        "Used size - 1.45 Gb"
    ]
}

TASK [RAM/capacity/free] *********************************************************************************************************
Wednesday 01 March 2023  18:27:36 +0000 (0:00:00.148)       0:00:02.641 *******
ok: [host3] => {
    "msg": [
        "Total memory - 2.0 Gb",
        "Free memory - 1.63 Gb",
        "Used memory - 0.37 Gb"
    ]
}
ok: [host4] => {
    "msg": [
        "Total memory - 2.0 Gb",
        "Free memory - 1.63 Gb",
        "Used memory - 0.37 Gb"
    ]
}

PLAY RECAP ***********************************************************************************************************************
host3                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host4                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 01 March 2023  18:27:36 +0000 (0:00:00.193)       0:00:02.834 *******
===============================================================================
Gathering Facts ----------------------------------------------------------------------------------------------------------- 2.41s
RAM/capacity/free --------------------------------------------------------------------------------------------------------- 0.19s
Mount point/capacity/used ------------------------------------------------------------------------------------------------- 0.15s
OS/Version ---------------------------------------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
