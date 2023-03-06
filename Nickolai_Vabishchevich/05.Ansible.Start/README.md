# 05.Ansible.Start
  
## Install  

### Install ansible  

```bash
  282  apt update
  283  apt upgrade
  284  apt install python3-pip
  285  pip3 install ansible
  286  ansible --version
```

### Setup ssh environment

```bash
  304  ssh-keygen
  305  ssh-copy-id jump_sa@178.124.206.53
  306  ssh jump_sa@178.124.206.53
```

### Setup ansible.cfg and inv.yaml files

ansible.cfg
```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

inv.yaml
```bash
all_workers:
  children:
    work_sa:
      vars:
        ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
        ansible_user: root
      hosts:
        host5:
          ansible_host: 192.168.202.5
        host6:
          ansible_host: 192.168.202.6
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

## Playbook ansible 
  
### playbook.yaml 

```bash
- hosts: "{{ group | default('all_workers') }}"
  tasks:

  - name: Print OS/version
    debug:
      msg:
        - "{{ ansible_os_family }}"
        - "{{ ansible_distribution }}"
        - "version {{ ansible_distribution_version }}"
    tags:
        - os

  - name: Print mount point/capacity/used
    debug:
      msg:
        - "Mount {{ item.device }} {{ item.mount }}"
        - "Capacity {{(item.size_total / 1024 / 1024 ) | round}}"
        - "Used {{((item.size_total - item.size_available) / 1024 / 1024) | round}}"
    with_items: "{{ ansible_facts.mounts }}"
    loop_control:
      label: "{{ item.mount }}"
    tags:
        - mount

  - name: Print RAM/capacity/free
    debug:
      msg: "info: {{ ansible_memory_mb.real }} mb"
    tags:
        -info
```

### Playbook output  

```bash 
root@vnl:/home/vnl/ansible/05.ansible# ansible-playbook -i inv.yaml my.yaml --ask-vault-pass
Vault password: 

PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Субота 04 сакавіка 2023  00:32:46 +0300 (0:00:00.069)       0:00:00.069 ******* 
ok: [host5]
ok: [host6]

TASK [Print OS/version] **************************************************************************************************************************************
Субота 04 сакавіка 2023  00:32:49 +0300 (0:00:02.896)       0:00:02.965 ******* 
ok: [host5] => {
    "msg": [
        "Debian",
        "Ubuntu",
        "version 20.04"
    ]
}
ok: [host6] => {
    "msg": [
        "Debian",
        "Ubuntu",
        "version 20.04"
    ]
}

TASK [Print mount point/capacity/used] ***********************************************************************************************************************
Субота 04 сакавіка 2023  00:32:50 +0300 (0:00:00.260)       0:00:03.226 ******* 
ok: [host5] => (item=/) => {
    "msg": [
        "Mount /dev/loop4 /",
        "Capacity 7963.0",
        "Used 1486.0"
    ]
}
ok: [host6] => (item=/) => {
    "msg": [
        "Mount /dev/loop5 /",
        "Capacity 7963.0",
        "Used 1486.0"
    ]
}

TASK [Print RAM/capacity/free] *******************************************************************************************************************************
Субота 04 сакавіка 2023  00:32:50 +0300 (0:00:00.318)       0:00:03.545 ******* 
ok: [host5] => {
    "msg": "info: {'total': 2048, 'used': 402, 'free': 1646} mb"
}
ok: [host6] => {
    "msg": "info: {'total': 2048, 'used': 402, 'free': 1646} mb"
}

PLAY RECAP ***************************************************************************************************************************************************
host5                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host6                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Субота 04 сакавіка 2023  00:32:50 +0300 (0:00:00.234)       0:00:03.779 ******* 
=============================================================================== 
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.90s
Print mount point/capacity/used ----------------------------------------------------------------------------------------------------------------------- 0.32s
Print OS/version -------------------------------------------------------------------------------------------------------------------------------------- 0.26s
Print RAM/capacity/free ------------------------------------------------------------------------------------------------------------------------------- 0.23s
Playbook run took 0 days, 0 hours, 0 minutes, 3 seconds
```
