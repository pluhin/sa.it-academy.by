# 13. Ansible cruise

```sh
root_@FREE-VM:~/www/13/13.Ansible.cruise$ sudo  ansible-playbook -i hosts.yaml play_web.yaml 

PLAY [all_hosts] *************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************************
[WARNING]: Platform linux on host worker2 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker2]
[WARNING]: Platform linux on host worker1 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker1]

TASK [web : Nginx. Install packages] *****************************************************************************************************************************************************************************************
skipping: [worker2]
skipping: [worker1]

TASK [web : Nginx. Enable and start servce] **********************************************************************************************************************************************************************************
skipping: [worker2]
skipping: [worker1]

TASK [web : Nginx. Install packages] *****************************************************************************************************************************************************************************************
skipping: [worker2]
skipping: [worker1]

TASK [web : Nginx. Enable and start servce] **********************************************************************************************************************************************************************************
skipping: [worker2]
skipping: [worker1]

TASK [web : Remove Index file] ***********************************************************************************************************************************************************************************************
changed: [worker2]
changed: [worker1]

TASK [web : Copy first page] *************************************************************************************************************************************************************************************************
changed: [worker2]
changed: [worker1]

TASK [web : Check connection to Localhost] ***********************************************************************************************************************************************************************************
ok: [worker2]
ok: [worker1]

TASK [web : print out] *******************************************************************************************************************************************************************************************************
ok: [worker2] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}
ok: [worker1] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

RUNNING HANDLER [web : restart nginx] ****************************************************************************************************************************************************************************************
changed: [worker2]
changed: [worker1]

PLAY RECAP *******************************************************************************************************************************************************************************************************************
worker1                    : ok=6    changed=3    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0   
worker2                    : ok=6    changed=3    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0   

root_@FREE-VM:~/www/13/13.Ansible.cruise$ sudo  ansible-playbook -i hosts.yaml play_test.yaml 

PLAY [all_hosts] *************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************************
[WARNING]: Platform linux on host worker2 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker2]
[WARNING]: Platform linux on host worker1 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker1]

PLAY RECAP *******************************************************************************************************************************************************************************************************************
worker1                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker2                    : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

root_@FREE-VM:~/www/13/13.Ansible.cruise$ sudo  ansible-playbook -i hosts.yaml play_test.yaml 

PLAY [all_hosts] *************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************************************
[WARNING]: Platform linux on host worker2 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker2]
[WARNING]: Platform linux on host worker1 is using the discovered Python interpreter at /usr/bin/python, but future installation of another Python interpreter could change this. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information.
ok: [worker1]

TASK [test : Check RAM] ******************************************************************************************************************************************************************************************************
ok: [worker1] => (item={'real': {'used': 10221, 'total': 16041, 'free': 5820}, 'swap': {'used': 0, 'total': 0, 'free': 0, 'cached': 0}, 'nocache': {'used': 2993, 'free': 13048}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 13048,
            "used": 2993
        },
        "real": {
            "free": 5820,
            "total": 16041,
            "used": 10221
        },
        "swap": {
            "cached": 0,
            "free": 0,
            "total": 0,
            "used": 0
        }
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'real': {'used': 11629, 'total': 16041, 'free': 4412}, 'swap': {'used': 0, 'total': 0, 'free': 0, 'cached': 0}, 'nocache': {'used': 2912, 'free': 13129}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 13129,
            "used": 2912
        },
        "real": {
            "free": 4412,
            "total": 16041,
            "used": 11629
        },
        "swap": {
            "cached": 0,
            "free": 0,
            "total": 0,
            "used": 0
        }
    },
    "msg": "All assertions passed"
}

TASK [test : Check free space] ***********************************************************************************************************************************************************************************************
ok: [worker1] => (item={'size_available': 13671566802944, 'fstype': 'nfs', 'inode_available': 26702278702, 'block_total': 104378560, 'inode_total': 26702374446, 'size_total': 13681106616320, 'block_size': 131072, 'uuid': 'N/A', 'mount': '/mnt/test', 'block_available': 104305777, 'block_used': 72783, 'device': '192.168.37.105:/mnt/IT-Academy/nfs-data', 'inode_used': 95744, 'options': 'rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 104305777,
        "block_size": 131072,
        "block_total": 104378560,
        "block_used": 72783,
        "device": "192.168.37.105:/mnt/IT-Academy/nfs-data",
        "fstype": "nfs",
        "inode_available": 26702278702,
        "inode_total": 26702374446,
        "inode_used": 95744,
        "mount": "/mnt/test",
        "options": "rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105",
        "size_available": 13671566802944,
        "size_total": 13681106616320,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [worker1] => (item={'size_available': 12296142848, 'fstype': 'ext4', 'inode_available': 1184583, 'block_total': 5402740, 'inode_total': 1360128, 'size_total': 22129623040, 'block_size': 4096, 'uuid': 'fc3ee326-2932-4444-ab88-507dbd2014e2', 'mount': '/', 'block_available': 3001988, 'block_used': 2400752, 'device': '/dev/sda1', 'inode_used': 175545, 'options': 'rw,relatime,errors=remount-ro'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 3001988,
        "block_size": 4096,
        "block_total": 5402740,
        "block_used": 2400752,
        "device": "/dev/sda1",
        "fstype": "ext4",
        "inode_available": 1184583,
        "inode_total": 1360128,
        "inode_used": 175545,
        "mount": "/",
        "options": "rw,relatime,errors=remount-ro",
        "size_available": 12296142848,
        "size_total": 22129623040,
        "uuid": "fc3ee326-2932-4444-ab88-507dbd2014e2"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'size_available': 13671566802944, 'fstype': 'nfs', 'inode_available': 26702278702, 'block_total': 104378560, 'inode_total': 26702374446, 'size_total': 13681106616320, 'block_size': 131072, 'uuid': 'N/A', 'mount': '/mnt/test', 'block_available': 104305777, 'block_used': 72783, 'device': '192.168.37.105:/mnt/IT-Academy/nfs-data', 'inode_used': 95744, 'options': 'rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 104305777,
        "block_size": 131072,
        "block_total": 104378560,
        "block_used": 72783,
        "device": "192.168.37.105:/mnt/IT-Academy/nfs-data",
        "fstype": "nfs",
        "inode_available": 26702278702,
        "inode_total": 26702374446,
        "inode_used": 95744,
        "mount": "/mnt/test",
        "options": "rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105",
        "size_available": 13671566802944,
        "size_total": 13681106616320,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'size_available': 13671566802944, 'fstype': 'nfs', 'inode_available': 26702278702, 'block_total': 104378560, 'inode_total': 26702374446, 'size_total': 13681106616320, 'block_size': 131072, 'uuid': 'N/A', 'mount': '/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volumes/kubernetes.io~nfs/jenkins-config', 'block_available': 104305777, 'block_used': 72783, 'device': '192.168.37.105:/mnt/IT-Academy/nfs-data/sa2-16-21/Biaspatsau/jenkins_home', 'inode_used': 95744, 'options': 'rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 104305777,
        "block_size": 131072,
        "block_total": 104378560,
        "block_used": 72783,
        "device": "192.168.37.105:/mnt/IT-Academy/nfs-data/sa2-16-21/Biaspatsau/jenkins_home",
        "fstype": "nfs",
        "inode_available": 26702278702,
        "inode_total": 26702374446,
        "inode_used": 95744,
        "mount": "/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volumes/kubernetes.io~nfs/jenkins-config",
        "options": "rw,relatime,vers=3,rsize=131072,wsize=131072,namlen=255,hard,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=192.168.37.105,mountvers=3,mountport=961,mountproto=udp,local_lock=none,addr=192.168.37.105",
        "size_available": 13671566802944,
        "size_total": 13681106616320,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'size_available': 11203584000, 'fstype': 'ext4', 'inode_available': 1150337, 'block_total': 5402740, 'inode_total': 1360128, 'size_total': 22129623040, 'block_size': 4096, 'uuid': 'fc3ee326-2932-4444-ab88-507dbd2014e2', 'mount': '/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volume-subpaths/jenkins-auth-config/jenkins/1', 'block_available': 2735250, 'block_used': 2667490, 'device': '/dev/sda1', 'inode_used': 209791, 'options': 'rw,relatime,errors=remount-ro,bind'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 2735250,
        "block_size": 4096,
        "block_total": 5402740,
        "block_used": 2667490,
        "device": "/dev/sda1",
        "fstype": "ext4",
        "inode_available": 1150337,
        "inode_total": 1360128,
        "inode_used": 209791,
        "mount": "/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volume-subpaths/jenkins-auth-config/jenkins/1",
        "options": "rw,relatime,errors=remount-ro,bind",
        "size_available": 11203584000,
        "size_total": 22129623040,
        "uuid": "fc3ee326-2932-4444-ab88-507dbd2014e2"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'size_available': 11203584000, 'fstype': 'ext4', 'inode_available': 1150337, 'block_total': 5402740, 'inode_total': 1360128, 'size_total': 22129623040, 'block_size': 4096, 'uuid': 'fc3ee326-2932-4444-ab88-507dbd2014e2', 'mount': '/', 'block_available': 2735250, 'block_used': 2667490, 'device': '/dev/sda1', 'inode_used': 209791, 'options': 'rw,relatime,errors=remount-ro'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 2735250,
        "block_size": 4096,
        "block_total": 5402740,
        "block_used": 2667490,
        "device": "/dev/sda1",
        "fstype": "ext4",
        "inode_available": 1150337,
        "inode_total": 1360128,
        "inode_used": 209791,
        "mount": "/",
        "options": "rw,relatime,errors=remount-ro",
        "size_available": 11203584000,
        "size_total": 22129623040,
        "uuid": "fc3ee326-2932-4444-ab88-507dbd2014e2"
    },
    "msg": "All assertions passed"
}
ok: [worker2] => (item={'size_available': 11203584000, 'fstype': 'ext4', 'inode_available': 1150337, 'block_total': 5402740, 'inode_total': 1360128, 'size_total': 22129623040, 'block_size': 4096, 'uuid': 'fc3ee326-2932-4444-ab88-507dbd2014e2', 'mount': '/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volume-subpaths/jenkins-config-yaml/jenkins/2', 'block_available': 2735250, 'block_used': 2667490, 'device': '/dev/sda1', 'inode_used': 209791, 'options': 'rw,relatime,errors=remount-ro,bind'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 2735250,
        "block_size": 4096,
        "block_total": 5402740,
        "block_used": 2667490,
        "device": "/dev/sda1",
        "fstype": "ext4",
        "inode_available": 1150337,
        "inode_total": 1360128,
        "inode_used": 209791,
        "mount": "/var/lib/kubelet/pods/537193eb-a486-41ac-b3ed-6240504c8054/volume-subpaths/jenkins-config-yaml/jenkins/2",
        "options": "rw,relatime,errors=remount-ro,bind",
        "size_available": 11203584000,
        "size_total": 22129623040,
        "uuid": "fc3ee326-2932-4444-ab88-507dbd2014e2"
    },
    "msg": "All assertions passed"
}

TASK [test : check connection to doker_hub] **********************************************************************************************************************************************************************************
ok: [worker2] => (item=https://registry.hub.docker.com)
ok: [worker1] => (item=https://registry.hub.docker.com)

TASK [test : Print status] ***************************************************************************************************************************************************************************************************
ok: [worker1] => (item=200) => {
    "msg": "200"
}
ok: [worker2] => (item=200) => {
    "msg": "200"
}

TASK [test : Check pub repo] *************************************************************************************************************************************************************************************************
ok: [worker2] => (item={'port': 80, 'url': 'archive.ubuntu.com'})
ok: [worker1] => (item={'port': 80, 'url': 'archive.ubuntu.com'})
ok: [worker2] => (item={'port': 80, 'url': 'mirror.datacenter.by'})
ok: [worker1] => (item={'port': 80, 'url': 'mirror.datacenter.by'})
ok: [worker2] => (item={'port': 443, 'url': 'pypi.org'})
ok: [worker1] => (item={'port': 443, 'url': 'pypi.org'})

TASK [test : Check SUDO with NOPASSWD] ***************************************************************************************************************************************************************************************
ok: [worker2]
ok: [worker1]

PLAY RECAP *******************************************************************************************************************************************************************************************************************
worker1                    : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker2                    : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```