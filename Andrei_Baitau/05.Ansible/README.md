# 05.Ansible

## Install

### Install Ansible

```bash
ansible [core 2.14.0]
  config file = /home/andreibaitau/05.Ansible/ansible.cfg
  configured module search path = ['/home/andreibaitau/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/andreibaitau/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```

### Ansible config

```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer, tree
```

### Setup 

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.1
        host2:
          ansible_host: 192.168.202.2
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### Check hosts

```bash
host2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

## Playbook

### env_info.yaml code

```yaml
"env_info.yaml" 20L, 730B                                                                                                                                    20,13         All
- hosts: all_workers
  tasks:
    - name: OS and Version
      debug:
        msg: "OS: {{ ansible_distribution }} | Version: {{ ansible_distribution_version }}"

    - name: Mount points and Capacity
      debug:
        msg:
          - "Mount point: {{ item.mount }}"
          - "Capacity: {{ (item.size_total / 1024 / 1024) | round(2)}} Mb"
          - "Available: {{ (item.size_available / 1024 / 1024) | round(2)}} Mb"
          - "Used space: {{ ((item.size_total-item.size_available) / 1024 / 1024)|round(2) }} Mb"
      with_items: "{{ ansible_mounts }}"

    - name: RAM capacity
      debug:
        msg:
          - "Total memory: {{ ansible_memtotal_mb }} Mb"
          - "Free memory: {{ ansible_memfree_mb }} Mb"
```

### env_info.yaml result

```bash
host2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
andreibaitau@ubuntu1:[~/05.Ansible]: vim env_info.yaml
andreibaitau@ubuntu1:[~/05.Ansible]: ansible-vault create group_vars/all_workers/vault.yaml
New Vault password:
Confirm New Vault password:
andreibaitau@ubuntu1:[~/05.Ansible]: ansible-playbook -i inv.yaml env_info.yaml --ask-vault-pass
Vault password:

PLAY [all_workers] ************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************
Friday 02 December 2022  10:57:36 +0000 (0:00:00.067)       0:00:00.067 *******
ok: [host1]
ok: [host2]

TASK [OS and Version] *********************************************************************************************************************************************************
Friday 02 December 2022  10:57:38 +0000 (0:00:02.562)       0:00:02.630 *******
ok: [host1] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}
ok: [host2] => {
    "msg": "OS: Ubuntu | Version: 20.04"
}

TASK [Mount points and Capacity] **********************************************************************************************************************************************
Friday 02 December 2022  10:57:38 +0000 (0:00:00.116)       0:00:02.746 *******
ok: [host1] => (item={'mount': '/', 'device': '/dev/loop1', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10809651200, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2639075, 'block_used': 430655, 'inode_total': 786432, 'inode_available': 758468, 'inode_used': 27964, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11991.13 Mb",
        "Available: 10308.89 Mb",
        "Used space: 1682.25 Mb"
    ]
}
ok: [host2] => (item={'mount': '/', 'device': '/dev/loop2', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10965831680, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2677205, 'block_used': 392525, 'inode_total': 786432, 'inode_available': 764725, 'inode_used': 21707, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11991.13 Mb",
        "Available: 10457.83 Mb",
        "Used space: 1533.3 Mb"
    ]
}

TASK [RAM capacity] ***********************************************************************************************************************************************************
Friday 02 December 2022  10:57:39 +0000 (0:00:00.270)       0:00:03.017 *******
ok: [host1] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1648 Mb"
    ]
}
ok: [host2] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1648 Mb"
    ]
}

PLAY RECAP ********************************************************************************************************************************************************************
host1                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Friday 02 December 2022  10:57:39 +0000 (0:00:00.275)       0:00:03.293 *******
===============================================================================
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------- 2.56s
RAM capacity ----------------------------------------------------------------------------------------------------------------------------------------------------------- 0.28s
Mount points and Capacity ---------------------------------------------------------------------------------------------------------------------------------------------- 0.27s
OS and Version --------------------------------------------------------------------------------------------------------------------------------------------------------- 0.12s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds
```