##### 05.Ansible run



ansible-playbook  user.yaml 

PLAY [test] ********************************************************************************

TASK [Gathering Facts] *********************************************************************
ok: [centos]
ok: [ubuntu]

TASK [create ansibleuser] ******************************************************************
ok: [ubuntu]
ok: [centos]

TASK [adding ansible user to sudoers] ******************************************************
ok: [ubuntu]
ok: [centos]

TASK [Set authorized key] ******************************************************************
ok: [ubuntu]
ok: [centos]

TASK [Disable Root Login] ******************************************************************
ok: [ubuntu]
ok: [centos]

TASK [Remove user] *************************************************************************
changed: [ubuntu]
changed: [centos]

PLAY RECAP *********************************************************************************
centos                     : ok=6    changed=1    unreachable=0    failed=0   
ubuntu                     : ok=6    changed=1    unreachable=0    failed=0   

ansible-playbook  os.yaml

PLAY [test] ********************************************************************************

TASK [Gathering Facts] *********************************************************************
ok: [centos]
ok: [ubuntu]

TASK [Print OS] ****************************************************************************
ok: [ubuntu] => {
    "msg": "Ubuntu"
}
ok: [centos] => {
    "msg": "CentOS"
}

TASK [Print ansible mounts] ****************************************************************
ok: [ubuntu] => {
    "msg": [
        {
            "block_available": 2226991, 
            "block_size": 4096, 
            "block_total": 2524608, 
            "block_used": 297617, 
            "device": "/dev/sda1", 
            "fstype": "ext4", 
            "inode_available": 1211134, 
            "inode_total": 1280000, 
            "inode_used": 68866, 
            "mount": "/", 
            "options": "rw,relatime,data=ordered", 
            "size_available": 9121755136, 
            "size_total": 10340794368, 
            "uuid": "be710a8d-0108-40d8-98a9-5df49fd52647"
        }
    ]
}
ok: [centos] => {
    "msg": [
        {
            "block_available": 10399828, 
            "block_size": 4096, 
            "block_total": 10738562, 
            "block_used": 338734, 
            "device": "/dev/mapper/centos-root", 
            "fstype": "xfs", 
            "inode_available": 21453745, 
            "inode_total": 21487616, 
            "inode_used": 33871, 
            "mount": "/", 
            "options": "rw,seclabel,relatime,attr2,inode64,noquota", 
            "size_available": 42597695488, 
            "size_total": 43985149952, 
            "uuid": "214cf212-d7f8-41fe-89a4-6b5e1f1d469c"
        }, 
        {
            "block_available": 218640, 
            "block_size": 4096, 
            "block_total": 259584, 
            "block_used": 40944, 
            "device": "/dev/sda1", 
            "fstype": "xfs", 
            "inode_available": 523955, 
            "inode_total": 524288, 
            "inode_used": 333, 
            "mount": "/boot", 
            "options": "rw,seclabel,relatime,attr2,inode64,noquota", 
            "size_available": 895549440, 
            "size_total": 1063256064, 
            "uuid": "ec9d8bfa-8da0-43ce-b469-f0178aa904b5"
        }, 
        {
            "block_available": 5233844, 
            "block_size": 4096, 
            "block_total": 5242367, 
            "block_used": 8523, 
            "device": "/dev/mapper/centos-home", 
            "fstype": "xfs", 
            "inode_available": 10489810, 
            "inode_total": 10489856, 
            "inode_used": 46, 
            "mount": "/home", 
            "options": "rw,seclabel,relatime,attr2,inode64,noquota", 
            "size_available": 21437825024, 
            "size_total": 21472735232, 
            "uuid": "0fb2cf77-ad36-4728-a3f5-b53dc134e3fd"
        }
    ]
}

TASK [Print Memory] ************************************************************************
ok: [ubuntu] => {
    "msg": {
        "nocache": {
            "free": 838, 
            "used": 147
        }, 
        "real": {
            "free": 430, 
            "total": 985, 
            "used": 555
        }, 
        "swap": {
            "cached": 0, 
            "free": 0, 
            "total": 0, 
            "used": 0
        }
    }
}
ok: [centos] => {
    "msg": {
        "nocache": {
            "free": 782, 
            "used": 209
        }, 
        "real": {
            "free": 310, 
            "total": 991, 
            "used": 681
        }, 
        "swap": {
            "cached": 0, 
            "free": 2047, 
            "total": 2047, 
            "used": 0
        }
    }
}

PLAY RECAP *********************************************************************************
centos                     : ok=4    changed=0    unreachable=0    failed=0   
ubuntu                     : ok=4    changed=0    unreachable=0    failed=0   