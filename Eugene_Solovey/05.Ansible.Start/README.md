# 05.Ansible.Start

## Authentication, cli

```bash
$ ls -l group_vars/all_workers/ 

-rw-rw-r-- 1 e_solovey e_solovey  85 Dec  4 22:32 vars.yaml
-rw------- 1 e_solovey e_solovey 419 Dec  5 21:30 vault.yaml

$ cat  group_vars/all_workers/vars.yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'

$ cat  group_vars/all_workers/vault.yaml
$ANSIBLE_VAULT;1.1;AES256
65623532353333393033653038336135356431323563656261623335323336653038643634633562
6464383637383432373332316263306435666336316661650a643237383364383964336130346430
62333033663561353430306632343461663131656134386636343437353934313832386261643864
3031613334313738630a626138363136633931326530326130396339643663313639316534353634
33646162316537626631343466623037326137386363303631356466313036316339

```

## Ansible: config, inventory

### ansible.cfg

```bash
[defaults]
inventory      = /home/e_solovey/test-repository/05.Ansible
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### inventory.yaml

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host35:
          ansible_host: 192.168.202.35
        host36:
          ansible_host: 192.168.202.36
jump_sa:
  vars:
    env: "bastion it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### Check inventory, check hosts

```bash
$ ansible-inventory -i inventory.yaml --graph
@all:
  |--@all_workers:
  |  |--@work_sa:
  |  |  |--host35
  |  |  |--host36
  |--@jump_sa:
  |  |--bastion
  |--@ungrouped:
{
    "ansible_host": "192.168.202.35",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
{
    "ansible_host": "192.168.202.35",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
{
    "ansible_host": "178.124.206.53",
    "ansible_user": "jump_sa",
    "env": "bastion it-academy"
}
```

### Ansible: parameters_hosts.yaml 

```yaml
- hosts: all_workers
  tasks:
    - name: Print OS & Version
      debug:
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"
    - name: Mount points & capacity
      debug:
        msg:
          - "Dev {{ item.device }}"
          - "Mount point: {{ item.mount }}"
          - "Capacity: {{(item.size_total / 1024 / 1024) | round}} Mb"
          - "Available: {{(item.size_available / 1024 / 1024) | round}} Mb"
          - "Used: {{((item.size_total-item.size_available) / 1024 / 1024)|round}} Mb"
      with_items: "{{ ansible_mounts }}"
    - name: RAM capacity
      debug:
        msg:
          - "Total memory: {{ ansible_memory_mb.real.total }} Mb"
          - "Used memiry: {{ ansible_memory_mb.real.used }} Mb"
          - "Free memory: {{ ansible_memfree_mb }} Mb"
```

## Play: output

```bash
PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Tuesday 06 December 2022  00:35:53 +0300 (0:00:00.034)       0:00:00.034 ****** 
ok: [host36]
ok: [host35]

TASK [Print OS & Version] ******************************************************
Tuesday 06 December 2022  00:35:55 +0300 (0:00:01.979)       0:00:02.013 ****** 
ok: [host35] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host36] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount points & capacity] *************************************************
Tuesday 06 December 2022  00:35:55 +0300 (0:00:00.055)       0:00:02.069 ****** 
ok: [host35] => (item={'mount': '/', 'device': '/dev/loop35', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10801319936, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2637041, 'block_used': 432689, 'inode_total': 786432, 'inode_available': 758477, 'inode_used': 27955, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev /dev/loop35",
        "Mount point: /",
        "Capacity: 11991.0 Mb",
        "Available: 10301.0 Mb",
        "Used: 1690.0 Mb"
    ]
}
ok: [host36] => (item={'mount': '/', 'device': '/dev/loop36', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10801111040, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2636990, 'block_used': 432740, 'inode_total': 786432, 'inode_available': 758477, 'inode_used': 27955, 'uuid': 'N/A'}) => {
    "msg": [
        "Dev /dev/loop36",
        "Mount point: /",
        "Capacity: 11991.0 Mb",
        "Available: 10301.0 Mb",
        "Used: 1690.0 Mb"
    ]
}

TASK [RAM capacity] ************************************************************
Tuesday 06 December 2022  00:35:55 +0300 (0:00:00.083)       0:00:02.153 ****** 
ok: [host35] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Used memiry: 403 Mb",
        "Free memory: 1645 Mb"
    ]
}
ok: [host36] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Used memiry: 404 Mb",
        "Free memory: 1644 Mb"
    ]
}

PLAY RECAP *********************************************************************
host35                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host36                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 06 December 2022  00:35:55 +0300 (0:00:00.071)       0:00:02.224 ****** 
=============================================================================== 
Gathering Facts --------------------------------------------------------- 1.98s
Mount points & capacity ------------------------------------------------- 0.08s
RAM capacity ------------------------------------------------------------ 0.07s
Print OS & Version ------------------------------------------------------ 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
