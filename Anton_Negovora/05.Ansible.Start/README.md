# 05.Asnsible start

## Install

### Ansible version

```bash
root@vm1:~# ansible --version
ansible [core 2.13.8]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.8.10 (default, Nov 14 2022, 12:59:47) [GCC 9.4.0]
  jinja version = 3.1.2
  libyaml = True
```

### Ansible config file for disable host checking

```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### SSH environment to work with hosts in it-academy datacenter

```bash
ssh-copy-id jump_sa@178.124.206.53
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
```

## Playbook

### task.yaml

```bash
- hosts: all_workers
  serial: 2
  pre_tasks:
  - name: Set authorized key taken from file
    authorized_key:
       user: "{{ ansible_user }}"
       state: present
       key: "{{ item }}"
    with_items:
       - "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
    tags:
       - never
  tasks:
  - name: OS/version
    debug:
      msg: "{{ ansible_distribution }} | {{ ansible_distribution_version}}"
  - name: Mount point/capacity/used
    debug:
      msg:
        - "Mount point: {{ ansible_mounts.0.mount }}"
        - "Capacity: {{ (ansible_mounts.0.size_total / 1024 / 1024) | round }} Mb"
        - "Used: {{ ((ansible_mounts.0.size_total-ansible_mounts.0.size_available) / 1024 / 1024)|round }} Mb"
  - name: RAM/capacity/free
    debug:
      msg:
        - "RAM total: {{ ansible_memtotal_mb }} Mb"
        - "RAM free: {{ ansible_memfree_mb }} Mb"
```

### Result

```bash
root@vm1:/tmp/sa.it-academy.by/Anton_Negovora/05.Ansible.Start# ansible-playbook -i inv.yaml task.yaml  --ask-vault-pass
Vault password:

PLAY [all_workers] **********************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************
Friday 17 March 2023  19:02:19 +0000 (0:00:00.056)       0:00:00.056 **********
ok: [host31]
ok: [host32]

TASK [OS/version] ***********************************************************************************************************************
Friday 17 March 2023  19:02:39 +0000 (0:00:20.622)       0:00:20.679 **********
ok: [host31] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host32] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] ********************************************************************************************************
Friday 17 March 2023  19:02:39 +0000 (0:00:00.090)       0:00:20.769 **********
ok: [host31] => {
    "msg": [
        "Mount point: /",
        "Capacity: 7963.0 Mb",
        "Used: 1486.0 Mb"
    ]
}
ok: [host32] => {
    "msg": [
        "Mount point: /",
        "Capacity: 7963.0 Mb",
        "Used: 1485.0 Mb"
    ]
}

TASK [RAM/capacity/free] ****************************************************************************************************************
Friday 17 March 2023  19:02:40 +0000 (0:00:00.150)       0:00:20.920 **********
ok: [host31] => {
    "msg": [
        "RAM total: 2048 Mb",
        "RAM free: 1665 Mb"
    ]
}
ok: [host32] => {
    "msg": [
        "RAM total: 2048 Mb",
        "RAM free: 1672 Mb"
    ]
}

PLAY RECAP ******************************************************************************************************************************
host31                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host32                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Friday 17 March 2023  19:02:40 +0000 (0:00:00.123)       0:00:21.044 **********
===============================================================================
Gathering Facts ----------------------------------------------------------------------------------------------------------------- 20.62s
Mount point/capacity/used -------------------------------------------------------------------------------------------------------- 0.15s
RAM/capacity/free ---------------------------------------------------------------------------------------------------------------- 0.12s
OS/version ----------------------------------------------------------------------------------------------------------------------- 0.09s
Playbook run took 0 days, 0 hours, 0 minutes, 21 seconds

```
