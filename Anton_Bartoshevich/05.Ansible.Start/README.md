# Install
## Install ansible on my sandbox
```bash
613 sudo apt install python3-pip -y
621  sudo pip3 install ansible
622  ansible --version

ansible [core 2.13.8]
  config file = /home/server/sa.it-academy.by/Anton_Bartoshevich/05.Ansible.Start/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.8.10 (default, Nov 14 2022, 12:59:47) [GCC 9.4.0]
  jinja version = 3.1.2
  libyaml = True
```
## Setup ansible config file for disable host checking
```bash
624  vim ansible.cfg
649  vim inv.yml
```
## Setup ssh environment to work with hosts in it-academy datacenter
```bash
658 sudo ssh-copy-id jump_sa@178.124.206.53
659  ssh 'jump_sa@178.124.206.53'
663  ssh root@192.168.202.1
664  ssh root@192.168.202.2
669  mkdir -p group_vars/all_workers
672  vim group_vars/all_workers/vars.yml
673  ansible-inventory -i inv.yml --graph
@all:
  |--@all_workers:
  |  |--@work_sa:
  |  |  |--host1
  |  |  |--host2
  |--@jump_sa:
  |  |--bastion
  |--@ungrouped:
702 ansible -i inv.yml -m ping all_workers -u root --ask-pass

host1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

 724 sudo ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
 725 ansible -i inv.yml -m ping all_workers -u root
```
## Create playbook to display parameters from remote host
```bash
726 vi display_param.yml
727 ansible-playbook -i inv.yml display_param.yml -u root

PLAY [all_workers] **********************************************************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************************************************
Sunday 05 March 2023  07:21:08 +0000 (0:00:00.025)       0:00:00.025 **********
ok: [host2]
ok: [host1]

TASK [Display OS/version] ***************************************************************************************************************************************************************
Sunday 05 March 2023  07:21:13 +0000 (0:00:04.294)       0:00:04.320 **********
ok: [host1] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host2] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] ********************************************************************************************************************************************************
Sunday 05 March 2023  07:21:13 +0000 (0:00:00.281)       0:00:04.602 **********
ok: [host1] => {
    "msg": [
        {
            "block_available": 1658348,
            "block_size": 4096,
            "block_total": 2038647,
            "block_used": 380299,
            "device": "/dev/loop0",
            "fstype": "ext4",
            "inode_available": 496341,
            "inode_total": 524288,
            "inode_used": 27947,
            "mount": "/",
            "options": "rw,relatime",
            "size_available": 6792593408,
            "size_total": 8350298112,
            "uuid": "N/A"
        }
    ]
}
ok: [host2] => {
    "msg": [
        {
            "block_available": 1658293,
            "block_size": 4096,
            "block_total": 2038647,
            "block_used": 380354,
            "device": "/dev/loop1",
            "fstype": "ext4",
            "inode_available": 496341,
            "inode_total": 524288,
            "inode_used": 27947,
            "mount": "/",
            "options": "rw,relatime",
            "size_available": 6792368128,
            "size_total": 8350298112,
            "uuid": "N/A"
        }
    ]
}

TASK [Display RAM/capacity/free] ********************************************************************************************************************************************************
Sunday 05 March 2023  07:21:13 +0000 (0:00:00.237)       0:00:04.841 **********
ok: [host1] => {
    "msg": {
        "nocache": {
            "free": 1974,
            "used": 74
        },
        "real": {
            "free": 1655,
            "total": 2048,
            "used": 393
        },
        "swap": {
            "cached": 0,
            "free": 2048,
            "total": 2048,
            "used": 0
        }
    }
}
ok: [host2] => {
    "msg": {
        "nocache": {
            "free": 1976,
            "used": 72
        },
        "real": {
            "free": 1658,
            "total": 2048,
            "used": 390
        },
        "swap": {
            "cached": 0,
            "free": 2048,
            "total": 2048,
            "used": 0
        }
    }
}

PLAY RECAP ******************************************************************************************************************************************************************************
host1                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 05 March 2023  07:21:14 +0000 (0:00:00.298)       0:00:05.140 **********
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 4.29s
Display RAM/capacity/free -------------------------------------------------------------------------------------------------------------------------------------------------------- 0.30s
Display OS/version --------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.28s
Mount point/capacity/used -------------------------------------------------------------------------------------------------------------------------------------------------------- 0.24s
Playbook run took 0 days, 0 hours, 0 minutes, 5 seconds
```
