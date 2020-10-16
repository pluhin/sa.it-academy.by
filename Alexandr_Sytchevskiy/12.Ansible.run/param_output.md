
PLAY [sav] ***********************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
ok: [worker1]
ok: [worker2]

TASK [Print OS version] **********************************************************************************************************
ok: [worker1] => {
    "msg": "Version OS \"CentOS 7.8 Core\""
}
ok: [worker2] => {
    "msg": "Version OS \"Ubuntu 18.04 bionic\""
}

TASK [Print mounts] **************************************************************************************************************
ok: [worker1] => {
    "msg": "Mounts \"{'block_used': 248988, 'uuid': 'N/A', 'size_total': 6274220032, 'block_total': 1531792, 'mount': '/', 'block_available': 1282804, 'size_available': 5254365184, 'fstype': 'ext4', 'inode_total': 393216, 'options': 'rw,relatime', 'device': '/dev/mapper/d01-vm--30011--disk--0', 'inode_used': 21517, 'block_size': 4096, 'inode_available': 371699}\""
}
ok: [worker2] => {
    "msg": "Mounts \"{'mount': '/', 'device': '/dev/mapper/d01-vm--30012--disk--0', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 6274220032, 'size_available': 4798128128, 'block_size': 4096, 'block_total': 1531792, 'block_available': 1171418, 'block_used': 360374, 'inode_total': 393216, 'inode_available': 366518, 'inode_used': 26698, 'uuid': 'N/A'}\""
}

TASK [Print RAM] *****************************************************************************************************************
ok: [worker1] => {
    "msg": "RAM \"{'real': {'total': 4096, 'used': 167, 'free': 3929}, 'swap': {'cached': 0, 'total': 6144, 'free': 6144, 'used': 0}, 'nocache': {'used': 57, 'free': 4039}}\""
}
ok: [worker2] => {
    "msg": "RAM \"{'real': {'total': 4096, 'used': 192, 'free': 3904}, 'nocache': {'free': 4036, 'used': 60}, 'swap': {'total': 6144, 'free': 6144, 'used': 0, 'cached': 0}}\""
}

PLAY RECAP ***********************************************************************************************************************
worker1                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker2                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

