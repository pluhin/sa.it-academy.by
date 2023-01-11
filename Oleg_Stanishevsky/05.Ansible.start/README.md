# 05.Ansible start


## Ansible version:

```sh
sysadmin@srv:~/Mydevops$ ansible --version
ansible [core 2.13.7]
  config file = None
  configured module search path = ['/home/sysadmin/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  ansible collection location = /home/sysadmin/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.8.10 (default, Nov 14 2022, 12:59:47) [GCC 9.4.0]
  jinja version = 3.1.2
  libyaml = True

```

## Available hosts

```sh
    
sysadmin@srv:~/Mydevops$ 
sysadmin@srv:~/Mydevops/05.Ansible$ ansible -i inv.yaml -m ping all_workers -u root --ask-vault-pass
Vault password: 
host38 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host37 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
       
    
```
## Playbook

```yaml

sysadmin@srv:~/Mydevops/05.Ansible$ ansible-playbook -i inv.yaml hwpb.yaml --ask-vault-pass
Vault password: 

PLAY [all_workers] ***********************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************
Wednesday 11 January 2023  05:04:11 +0300 (0:00:00.087)       0:00:00.087 ***** 
ok: [host38]
ok: [host37]

TASK [OS and Version] ********************************************************************************************************************
Wednesday 11 January 2023  05:04:15 +0300 (0:00:04.074)       0:00:04.162 ***** 
ok: [host37] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}
ok: [host38] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}

TASK [Mount points and Capacity] *********************************************************************************************************
Wednesday 11 January 2023  05:04:15 +0300 (0:00:00.141)       0:00:04.304 ***** 
ok: [host37] => (item={'mount': '/', 'device': '/dev/loop37', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10792865792, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2634977, 'block_used': 434753, 'inode_total': 786432, 'inode_available': 758463, 'inode_used': 27969, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11.7 Gb",
        "Available: 10.1 Gb",
        "Used space: 1.7 Gb"
    ]
}
ok: [host38] => (item={'mount': '/', 'device': '/dev/loop38', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10942500864, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2671509, 'block_used': 398221, 'inode_total': 786432, 'inode_available': 764584, 'inode_used': 21848, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11.7 Gb",
        "Available: 10.2 Gb",
        "Used space: 1.5 Gb"
    ]
}

TASK [RAM capacity] **********************************************************************************************************************
Wednesday 11 January 2023  05:04:15 +0300 (0:00:00.231)       0:00:04.536 ***** 
ok: [host37] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1602 Mb"
    ]
}
ok: [host38] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1608 Mb"
    ]
}

PLAY RECAP *******************************************************************************************************************************
host37                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host38                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 11 January 2023  05:04:15 +0300 (0:00:00.199)       0:00:04.736 ***** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------- 4.07s
Mount points and Capacity --------------------------------------------------------------------------------------------------------- 0.23s
RAM capacity ---------------------------------------------------------------------------------------------------------------------- 0.20s
OS and Version -------------------------------------------------------------------------------------------------------------------- 0.14s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds

```

