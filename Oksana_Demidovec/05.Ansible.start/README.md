# 05. Ansible.start

## Install

### Install ansible on your sandbox, please use minimum ansible core 2.13

``` bash
sudo apt install python3-pip
pip3 install ansible
ansible --version

```

``` bash
ansible [core 2.14.3]
  config file = /home/oksana/DevOps/Oksana_Demidovec/05.Ansible.start/ansible.cfg
  configured module search path = ['/home/oksana/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/oksana/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```
### Setup your ansible config file for disable host checking

```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### Setup your ssh environment to work with hosts in it-academy datacenter
```bash
ssh-keygen
ssh-copy-id jump_sa@178.124.206.53
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
ssh root@192.168.202.9 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
```
### Inventory file
```yaml
all_workers:
  children:
    work_sa:
      vars:
        ansible_user: root
        ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
      hosts:
        host9:
          ansible_host: 192.168.202.9
        host10:
          ansible_host: 192.168.202.10

```

## Ansible playbook

```yaml
- hosts: all_workers 
  serial: 1
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
    - name: Display OS/version
      debug:
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"
      tags:
        - OS/version
    - name: Display mount point/capacity/used
      debug:   
        msg: "Mount point/capacity/used: {{ item.mount }} | {{ item.block_total }} | {{ item.block_used }}"
      with_items: "{{ ansible_mounts }}"
      tags:
        - mount point/capacity/used
    - name: Display RAM/capacity/free
      debug:
        msg: "{{ ansible_memtotal_mb }} | {{ ansible_memfree_mb }}"
      tags:
        - RAM/capacity/free

```
## Result

```bash
ansible-playbook -i inv.yaml playbook.yaml

PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Tuesday 28 March 2023  21:19:56 +0300 (0:00:00.061)       0:00:00.061 ********* 
ok: [host9]

TASK [Display OS/version] ******************************************************
Tuesday 28 March 2023  21:19:59 +0300 (0:00:03.206)       0:00:03.267 ********* 
ok: [host9] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Display mount point/capacity/used] ***************************************
Tuesday 28 March 2023  21:19:59 +0300 (0:00:00.070)       0:00:03.338 ********* 
ok: [host9] => (item={'mount': '/', 'device': '/dev/loop8', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6784069632, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1656267, 'block_used': 382380, 'inode_total': 524288, 'inode_available': 496330, 'inode_used': 27958, 'uuid': 'N/A'}) => {
    "msg": "Mount point/capacity/used: / | 2038647 | 382380"
}

TASK [Display RAM/capacity/free] ***********************************************
Tuesday 28 March 2023  21:19:59 +0300 (0:00:00.121)       0:00:03.459 ********* 
ok: [host9] => {
    "msg": "2048 | 1625"
}

PLAY [all_workers] *************************************************************

TASK [Gathering Facts] *********************************************************
Tuesday 28 March 2023  21:19:59 +0300 (0:00:00.201)       0:00:03.660 ********* 
ok: [host10]

TASK [Display OS/version] ******************************************************
Tuesday 28 March 2023  21:20:02 +0300 (0:00:02.814)       0:00:06.475 ********* 
ok: [host10] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Display mount point/capacity/used] ***************************************
Tuesday 28 March 2023  21:20:02 +0300 (0:00:00.106)       0:00:06.581 ********* 
ok: [host10] => (item={'mount': '/', 'device': '/dev/loop10', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6784106496, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1656276, 'block_used': 382371, 'inode_total': 524288, 'inode_available': 496331, 'inode_used': 27957, 'uuid': 'N/A'}) => {
    "msg": "Mount point/capacity/used: / | 2038647 | 382371"
}

TASK [Display RAM/capacity/free] ***********************************************
Tuesday 28 March 2023  21:20:02 +0300 (0:00:00.078)       0:00:06.659 ********* 
ok: [host10] => {
    "msg": "2048 | 1628"
}

PLAY RECAP *********************************************************************
host10                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host9                      : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 28 March 2023  21:20:02 +0300 (0:00:00.113)       0:00:06.773 ********* 
=============================================================================== 
Gathering Facts --------------------------------------------------------- 3.21s
Gathering Facts --------------------------------------------------------- 2.81s
Display RAM/capacity/free ----------------------------------------------- 0.32s
Display mount point/capacity/used --------------------------------------- 0.20s
Display OS/version ------------------------------------------------------ 0.18s
Playbook run took 0 days, 0 hours, 0 minutes, 6 seconds


```