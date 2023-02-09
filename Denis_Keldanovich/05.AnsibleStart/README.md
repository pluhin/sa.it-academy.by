## Ansible play
```
PLAY [all_workers] **************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
ok: [host10]
ok: [host23]
ok: [host24]

TASK [Check OS] *****************************************************************************************************************************************************************************************************************************
ok: [host23] => {
    "msg": "Version: 20.04"
}
ok: [host24] => {
    "msg": "Version: 20.04"
}
ok: [host10] => {
    "msg": "Version: 20.04"
}

TASK [Mounted point and capacity] ***********************************************************************************************************************************************************************************************************
ok: [host23] => (item={'mount': '/', 'device': '/dev/loop22', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10784268288, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2632878, 'block_used': 436852, 'inode_total': 786432, 'inode_available': 758468, 'inode_used': 27964, 'uuid': 'N/A'}) => {
    "msg": "Mount point: /  Capacity: 12573 MB / Used space: 1789 MB"
}
ok: [host24] => (item={'mount': '/', 'device': '/dev/loop23', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10784223232, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2632867, 'block_used': 436863, 'inode_total': 786432, 'inode_available': 758469, 'inode_used': 27963, 'uuid': 'N/A'}) => {
    "msg": "Mount point: /  Capacity: 12573 MB / Used space: 1789 MB"
}
ok: [host10] => (item={'mount': '/', 'device': '/dev/mapper/d01-vm--20010--disk--0', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 10464022528, 'size_available': 7721607168, 'block_size': 4096, 'block_total': 2554693, 'block_available': 1885158, 'block_used': 669535, 'inode_total': 655360, 'inode_available': 592803, 'inode_used': 62557, 'uuid': 'N/A'}) => {
    "msg": "Mount point: /  Capacity: 10464 MB / Used space: 2742 MB"
}

TASK [Show RAM  capacity] *******************************************************************************************************************************************************************************************************************
ok: [host23] => {
    "msg": "Free memory: 1724 MB"
}
ok: [host24] => {
    "msg": "Free memory: 1705 MB"
}
ok: [host10] => {
    "msg": "Free memory: 1736 MB"
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
host10                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host23                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host24                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds

```
## Ansible playbook
```
- hosts: all_workers
  tasks:
    - name: Check OS
      debug:
        msg: "OS: {{ ansible_distribution }}"
        msg: "Version: {{ ansible_distribution_version }}"

    - name: Mounted point and capacity
      debug:
        msg: "Mount point: {{ item.mount }}  Capacity: {{ (item.size_total/1000000)|int }} MB / Used space: {{ ((item.size_total-item.size_available)/1000000)|int }} MB"
      when: item.mount == '/'
      with_items:
        - "{{ ansible_mounts }}"

    - name: Show RAM  capacity
      debug:
        msg: "Memory: {{ ansible_memtotal_mb }} MB"
        msg: "Free memory: {{ ansible_memfree_mb }} MB"
```


