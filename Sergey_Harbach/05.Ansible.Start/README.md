# 05.Ansible.Start

## Preparing

### Install Python, pip, ansible, copy SSH

```bash
  474  sudo apt update
  475  sudo apt upgrade
  476  python3 --version
  477  pip3 --version
  478  sudo apt install python3-pip
  479  pip3 --version
  480  pip3 list
  481  sudo pip3 install ansible
  482  ansible --version
  483  sudo pip3 install ansible-lint
  484  sudo apt install sshpass
  492  ssh-copy-id jump_sa@178.124.206.53
  493  ssh jump_sa@178.124.206.53
```

## Ansible: config, inventory
  
```bash
  494  mkdir ansible
  495  cd ansible/
  496  vim ansible.cfg
  497  vim inv.yaml
```

### ansible.cfg

```ini
[defaults]
 inventory      = ./inv.yaml
 forks          = 3
 host_key_checking = false
 callbacks_enabled = profile_tasks, timer
 ```

### inv.yaml

```yaml
---
all_workers:
  children:
    work_sa:
      vars:
        ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
        ansible_user: root
      hosts:
        host7:
          ansible_host: 192.168.202.7
        host8:
          ansible_host: 192.168.202.8
    local:
      vars:
        ansible_connection: local
      hosts:
        localhost:
          ansible_host: 127.0.0.1
jump_sa:
  vars:
    env: "it-academy bastion"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### Check inventory, check hosts

```bash
$ ansible-inventory -i inv.yaml --graph
@all:
  |--@all_workers:
  |  |--@local:
  |  |  |--localhost
  |  |--@work_sa:
  |  |  |--host7
  |  |  |--host8
  |--@jump_sa:
  |  |--bastion
  |--@ungrouped:
$ ansible-inventory -i inv.yaml --host=host7
{
    "ansible_host": "192.168.202.7",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
$ ansible-inventory -i inv.yaml --host=host8
{
    "ansible_host": "192.168.202.8",
    "ansible_ssh_common_args": "-o ProxyCommand=\"ssh -W %h:%p -q jump_sa@178.124.206.53\"",
    "ansible_user": "root"
}
$ ansible-inventory --host=localhost
{
    "ansible_connection": "local",
    "ansible_host": "127.0.0.1"
}
$ ansible-inventory --host=bastion
{
    "ansible_host": "178.124.206.53",
    "ansible_user": "jump_sa",
    "env": "it-academy bastion"
}
$ ansible -i inv.yaml -m ping work_sa --ask-pass
SSH password: 
host7 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host8 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

### Push SSH key to hosts

```bash
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" work_sa -u root --ask-pass
```

## Ansible Playbook

```yaml
- name: Group of hosts
  hosts: "{{ group | default('all_workers') }}"
  tasks:
 
  - name: Show OS and Version (from gather_facts)
    ansible.builtin.debug:
      msg:
        - "{{ ansible_os_family }} -- {{ ansible_distribution }} -- v. {{ ansible_distribution_version }}"
 
  - name: Show All mounts (from gether_facts)
    ansible.builtin.debug:
      msg:
        - "-MOUNTS-INFO--------"
        - "Dev {{ item.device }} mounted as {{ item.mount }} and has size available {{(item.size_available / 1024 / 1024) | round}} Mb"
        - "Capaсity {{(item.size_total / 1024 / 1024 ) | round}} Mb"
        - "Used {{((item.size_total - item.size_available) / 1024 / 1024) | round}} Mb"
        - "--------------------"
    with_items: "{{ ansible_facts.mounts }}"
    loop_control:
      label: "{{ item.mount }}"

  - name: Show memory (from gether_facts)
    vars:
      m_total: "{{ ansible_memory_mb.real.total }}"
      m_used: "{{ ansible_memory_mb.real.used }}"
      ms_total: "{{ ansible_memory_mb.swap.total }}"
      ms_used: "{{ ansible_memory_mb.swap.used }}"
    ansible.builtin.debug:
      msg:
        - "-MEMORY-INFO--------"
        - "Total RAM is {{ m_total }} Mb"
        - "Used RAM is {{m_used}} Mb"
        - "Total RAM (with swap) is {{ m_total | int + ms_total | int }} Mb"
        - "Used RAM ( with swap) is {{ m_used | int + ms_used | int }} Mb"
        - "--------------------"
```

## Play Output

```bash
$ ansible-playbook homework.yaml 

PLAY [Group of hosts] *************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************
Saturday 26 November 2022  14:21:55 +0000 (0:00:00.021)       0:00:00.021 ***** 
ok: [localhost]
ok: [host8]
ok: [host7]

TASK [Show OS and Version (from gather_facts)] ************************************************************************************
Saturday 26 November 2022  14:21:57 +0000 (0:00:01.908)       0:00:01.930 ***** 
ok: [host7] => {
    "msg": [
        "Debian -- Ubuntu -- v. 20.04"
    ]
}
ok: [host8] => {
    "msg": [
        "Debian -- Ubuntu -- v. 20.04"
    ]
}
ok: [localhost] => {
    "msg": [
        "Debian -- Ubuntu -- v. 20.04"
    ]
}

TASK [Show All mounts (from gether_facts)] ****************************************************************************************
Saturday 26 November 2022  14:21:57 +0000 (0:00:00.058)       0:00:01.988 ***** 
ok: [host7] => (item=/) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop7 mounted as / and has size available 10441.0 Mb",
        "Capasity 11991.0 Mb",
        "Used 1550.0 Mb",
        "--------------------"
    ]
}
ok: [host8] => (item=/) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop8 mounted as / and has size available 10301.0 Mb",
        "Capasity 11991.0 Mb",
        "Used 1690.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/mapper/ubuntu--vg-ubuntu--lv mounted as / and has size available 19280.0 Mb",
        "Capasity 28110.0 Mb",
        "Used 8831.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/lxd/23991) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop1 mounted as /snap/lxd/23991 and has size available 0.0 Mb",
        "Capasity 92.0 Mb",
        "Used 92.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/snapd/16292) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop2 mounted as /snap/snapd/16292 and has size available 0.0 Mb",
        "Capasity 47.0 Mb",
        "Used 47.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/core20/1611) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop0 mounted as /snap/core20/1611 and has size available 0.0 Mb",
        "Capasity 62.0 Mb",
        "Used 62.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/core20/1695) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop3 mounted as /snap/core20/1695 and has size available 0.0 Mb",
        "Capasity 63.0 Mb",
        "Used 63.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/boot) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/sda2 mounted as /boot and has size available 1623.0 Mb",
        "Capasity 1946.0 Mb",
        "Used 323.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/lxd/22753) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop4 mounted as /snap/lxd/22753 and has size available 0.0 Mb",
        "Capasity 68.0 Mb",
        "Used 68.0 Mb",
        "--------------------"
    ]
}
ok: [localhost] => (item=/snap/snapd/17576) => {
    "msg": [
        "-MOUNTS-INFO--------",
        "Dev /dev/loop5 mounted as /snap/snapd/17576 and has size available 0.0 Mb",
        "Capasity 50.0 Mb",
        "Used 50.0 Mb",
        "--------------------"
    ]
}

TASK [Show memory (from gether_facts)] ********************************************************************************************
Saturday 26 November 2022  14:21:57 +0000 (0:00:00.182)       0:00:02.170 ***** 
ok: [host7] => {
    "msg": [
        "-MEMORY-INFO--------",
        "Total RAM is 2048 Mb",
        "Used RAM is 503 Mb",
        "Total RAM (with swap) is 4096 Mb",
        "Used RAM ( with swap) is 503 Mb",
        "--------------------"
    ]
}
ok: [host8] => {
    "msg": [
        "-MEMORY-INFO--------",
        "Total RAM is 2048 Mb",
        "Used RAM is 391 Mb",
        "Total RAM (with swap) is 4096 Mb",
        "Used RAM ( with swap) is 391 Mb",
        "--------------------"
    ]
}
ok: [localhost] => {
    "msg": [
        "-MEMORY-INFO--------",
        "Total RAM is 3931 Mb",
        "Used RAM is 1361 Mb",
        "Total RAM (with swap) is 6909 Mb",
        "Used RAM ( with swap) is 1361 Mb",
        "--------------------"
    ]
}

PLAY RECAP ************************************************************************************************************************
host7                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host8                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Saturday 26 November 2022  14:21:57 +0000 (0:00:00.074)       0:00:02.245 ***** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------ 1.91s
Show All mounts (from gether_facts) ---------------------------------------------------------------------------------------- 0.18s
Show memory (from gether_facts) -------------------------------------------------------------------------------------------- 0.07s
Show OS and Version (from gather_facts) ------------------------------------------------------------------------------------ 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
