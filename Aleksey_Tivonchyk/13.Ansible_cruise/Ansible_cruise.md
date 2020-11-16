# Ansible cruis

## Playbook output
```bash
PLAY RECAP ********************************************************************************************************************************************************************************************************************************
centos                     : ok=10   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0   
ubuntu                     : ok=10   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0 
```
## Test output
```bash
--> Test matrix
---                                                                                                                                                                                                                                          
default:                                                                                                                                                                                                                                     
  - dependency                                                                                                                                                                                                                               
  - lint                                                                                                                                                                                                                                     
  - cleanup                                                                                                                                                                                                                                  
  - destroy                                                                                                                                                                                                                                  
  - syntax                                                                                                                                                                                                                                   
  - create                                                                                                                                                                                                                                   
  - prepare                                                                                                                                                                                                                                  
  - converge                                                                                                                                                                                                                                 
  - idempotence                                                                                                                                                                                                                              
  - side_effect                                                                                                                                                                                                                              
  - verify                                                                                                                                                                                                                                   
  - cleanup                                                                                                                                                                                                                                  
  - destroy                                                                                                                                                                                                                                  
--> Scenario: 'default'
--> Action: 'dependency'
Skipping, missing the requirements file.
Skipping, missing the requirements file.
--> Scenario: 'default'
--> Action: 'lint'
--> Lint is disabled.
--> Scenario: 'default'
--> Action: 'cleanup'
Skipping, cleanup playbook not configured.
--> Scenario: 'default'
--> Action: 'destroy'
--> Sanity checks: 'docker'

PLAY [Destroy] *******************************************************************************************************************************************************************************************************************************

TASK [Destroy molecule instance(s)] **********************************************************************************************************************************************************************************************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)
changed: [localhost] => (item=instance3)

TASK [Wait for instance(s) deletion to complete] *********************************************************************************************************************************************************************************************
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Delete docker network(s)] **************************************************************************************************************************************************************************************************************

PLAY RECAP ***********************************************************************************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

--> Scenario: 'default'
--> Action: 'syntax'

playbook: /root/13.Ansible_cruise/roles/test/molecule/default/converge.yml
--> Scenario: 'default'
--> Action: 'create'

PLAY [Create] ********************************************************************************************************************************************************************************************************************************

TASK [Log into a Docker registry] ************************************************************************************************************************************************************************************************************
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)

TASK [Check presence of custom Dockerfiles] **************************************************************************************************************************************************************************************************
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Create Dockerfiles from image names] ***************************************************************************************************************************************************************************************************
skipping: [localhost] => (item=None)
changed: [localhost] => (item=None)
changed: [localhost] => (item=None)

TASK [Discover local Docker images] **********************************************************************************************************************************************************************************************************
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Build an Ansible compatible image (new)] ***********************************************************************************************************************************************************************************************
skipping: [localhost] => (item=molecule_local/centos:7)
ok: [localhost] => (item=molecule_local/ubuntu:latest)
ok: [localhost] => (item=molecule_local/alpine:latest)

TASK [Create docker network(s)] **************************************************************************************************************************************************************************************************************

TASK [Determine the CMD directives] **********************************************************************************************************************************************************************************************************
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Create molecule instance(s)] ***********************************************************************************************************************************************************************************************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)
changed: [localhost] => (item=instance3)

TASK [Wait for instance(s) creation to complete] *********************************************************************************************************************************************************************************************
changed: [localhost] => (item=None)
changed: [localhost] => (item=None)
changed: [localhost] => (item=None)
changed: [localhost]

PLAY RECAP ***********************************************************************************************************************************************************************************************************************************
localhost                  : ok=7    changed=3    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

--> Scenario: 'default'
--> Action: 'prepare'
Skipping, prepare playbook not configured.
--> Scenario: 'default'
--> Action: 'converge'

PLAY [Converge] ******************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************************************************************************************************************
ok: [instance3]
ok: [instance2]
ok: [instance1]

TASK [Include test] **************************************************************************************************************************************************************************************************************************

TASK [test : Check RAM] **********************************************************************************************************************************************************************************************************************
ok: [instance1] => (item={'real': {'total': 1993, 'used': 1899, 'free': 94}, 'swap': {'cached': 0, 'total': 2047, 'free': 2046, 'used': 1}, 'nocache': {'used': 957, 'free': 1036}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 1036,
            "used": 957
        },
        "real": {
            "free": 94,
            "total": 1993,
            "used": 1899
        },
        "swap": {
            "cached": 0,
            "free": 2046,
            "total": 2047,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}
ok: [instance2] => (item={'real': {'total': 1993, 'used': 1899, 'free': 94}, 'nocache': {'free': 1036, 'used': 957}, 'swap': {'total': 2047, 'free': 2046, 'used': 1, 'cached': 0}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 1036,
            "used": 957
        },
        "real": {
            "free": 94,
            "total": 1993,
            "used": 1899
        },
        "swap": {
            "cached": 0,
            "free": 2046,
            "total": 2047,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}
ok: [instance3] => (item={'real': {'total': 1993, 'used': 1902, 'free': 91}, 'nocache': {'free': 1035, 'used': 958}, 'swap': {'total': 2047, 'free': 2046, 'used': 1, 'cached': 0}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 1035,
            "used": 958
        },
        "real": {
            "free": 91,
            "total": 1993,
            "used": 1902
        },
        "swap": {
            "cached": 0,
            "free": 2046,
            "total": 2047,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}

TASK [test : Check free space] ***************************************************************************************************************************************************************************************************************
ok: [instance1] => (item={'block_used': 2376415, 'uuid': 'N/A', 'size_total': 10498625536, 'block_total': 2563141, 'mount': '/etc/resolv.conf', 'block_available': 186726, 'size_available': 764829696, 'fstype': 'ext4', 'inode_total': 655360, 'options': 'rw,relatime,data=ordered,bind', 'device': '/dev/vda2', 'inode_used': 247645, 'block_size': 4096, 'inode_available': 407715}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186726,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376415,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407715,
        "inode_total": 655360,
        "inode_used": 247645,
        "mount": "/etc/resolv.conf",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 764829696,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance2] => (item={'mount': '/etc/resolv.conf', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered,bind', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/resolv.conf",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance3] => (item={'mount': '/etc/resolv.conf', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/resolv.conf",
        "options": "rw,relatime,data=ordered",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance1] => (item={'block_used': 2376415, 'uuid': 'N/A', 'size_total': 10498625536, 'block_total': 2563141, 'mount': '/etc/hostname', 'block_available': 186726, 'size_available': 764829696, 'fstype': 'ext4', 'inode_total': 655360, 'options': 'rw,relatime,data=ordered,bind', 'device': '/dev/vda2', 'inode_used': 247645, 'block_size': 4096, 'inode_available': 407715}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186726,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376415,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407715,
        "inode_total": 655360,
        "inode_used": 247645,
        "mount": "/etc/hostname",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 764829696,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance2] => (item={'mount': '/etc/hostname', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered,bind', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/hostname",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance3] => (item={'mount': '/etc/hostname', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/hostname",
        "options": "rw,relatime,data=ordered",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance1] => (item={'block_used': 2376415, 'uuid': 'N/A', 'size_total': 10498625536, 'block_total': 2563141, 'mount': '/etc/hosts', 'block_available': 186726, 'size_available': 764829696, 'fstype': 'ext4', 'inode_total': 655360, 'options': 'rw,relatime,data=ordered,bind', 'device': '/dev/vda2', 'inode_used': 247645, 'block_size': 4096, 'inode_available': 407715}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186726,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376415,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407715,
        "inode_total": 655360,
        "inode_used": 247645,
        "mount": "/etc/hosts",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 764829696,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance2] => (item={'mount': '/etc/hosts', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered,bind', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/hosts",
        "options": "rw,relatime,data=ordered,bind",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [instance3] => (item={'mount': '/etc/hosts', 'device': '/dev/vda2', 'fstype': 'ext4', 'options': 'rw,relatime,data=ordered', 'size_total': 10498625536, 'size_available': 763887616, 'block_size': 4096, 'block_total': 2563141, 'block_available': 186496, 'block_used': 2376645, 'inode_total': 655360, 'inode_available': 407707, 'inode_used': 247653, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 186496,
        "block_size": 4096,
        "block_total": 2563141,
        "block_used": 2376645,
        "device": "/dev/vda2",
        "fstype": "ext4",
        "inode_available": 407707,
        "inode_total": 655360,
        "inode_used": 247653,
        "mount": "/etc/hosts",
        "options": "rw,relatime,data=ordered",
        "size_available": 763887616,
        "size_total": 10498625536,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : check connection to doker_hub] **************************************************************************************************************************************************************************************************
ok: [instance2] => (item=https://registry.hub.docker.com)
ok: [instance3] => (item=https://registry.hub.docker.com)
ok: [instance1] => (item=https://registry.hub.docker.com)

TASK [test : Print status] *******************************************************************************************************************************************************************************************************************
ok: [instance1] => (item=W/"7f8-fsVJ7CC+91OivGz8p9vONO/62n0") => {
    "msg": "Url W/\"7f8-fsVJ7CC+91OivGz8p9vONO/62n0\""
}
ok: [instance2] => (item=W/"7f8-fsVJ7CC+91OivGz8p9vONO/62n0") => {
    "msg": "Url W/\"7f8-fsVJ7CC+91OivGz8p9vONO/62n0\""
}
ok: [instance3] => (item=W/"7f8-fsVJ7CC+91OivGz8p9vONO/62n0") => {
    "msg": "Url W/\"7f8-fsVJ7CC+91OivGz8p9vONO/62n0\""
}

TASK [test : Check pub repo] *****************************************************************************************************************************************************************************************************************
ok: [instance3] => (item={'url': 'archive.ubuntu.com', 'port': 80})
ok: [instance1] => (item={'url': 'archive.ubuntu.com', 'port': 80})
ok: [instance2] => (item={'url': 'archive.ubuntu.com', 'port': 80})
ok: [instance3] => (item={'url': 'ftp.wrz.de', 'port': 80})
ok: [instance1] => (item={'url': 'ftp.wrz.de', 'port': 80})
ok: [instance2] => (item={'url': 'ftp.wrz.de', 'port': 80})
ok: [instance1] => (item={'url': 'bootstrap.pypa.io', 'port': 443})
ok: [instance2] => (item={'url': 'bootstrap.pypa.io', 'port': 443})
ok: [instance3] => (item={'url': 'bootstrap.pypa.io', 'port': 443})

TASK [test : Check SUDO with NOPASSWD] *******************************************************************************************************************************************************************************************************
fatal: [instance1]: FAILED! => {"changed": false, "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout": "", "msg": "MODULE FAILURE\nSee stdout/stderr for the exact error", "rc": 127}
ok: [instance3]
ok: [instance2]

PLAY RECAP ***********************************************************************************************************************************************************************************************************************************
instance1                  : ok=6    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
instance2                  : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
instance3                  : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```