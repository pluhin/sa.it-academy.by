# **05.Ansible.start**
## **Install**
### **Install ansible on your sandbox, please use minimum ansible core 2.13**
```bash
root@ubuntu:~# ansible --version
ansible [core 2.14.3]
  config file = None
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```
### **Setup your ansible config file for disable host checking**
```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
### **Setup your ssh environment to work with hosts in it-academy datacenter**
```bash
root@ubuntu:~/.ansible# ssh-copy-id jump_sa@178.124.206.53
root@ubuntu:~/.ansible# ansible -i invent.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
```
## **Ansible playbook**
Create playbook to display parameters from remote host

-OS/version

-Mount point/capacity/used

-RAM/capacity/free
### **Playbook**
```bash
- hosts: all_workers 
  #strategy: free
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
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"

    - name: Mount point/capacity/used
      debug:
        msg:
          - "Mount point : {{ item.mount }}"
          - "Size total = {{item.size_total / 1048576}} MB  "
          - "Used = {{(item.size_total - item.size_available) / 1048576 }} MB"
      with_items: "{{ ansible_mounts }}"

    - name: RAM/capacity/free
      debug:
        msg:
          - "Total RAM = {{ ansible_memtotal_mb}} MB"
          - "Free RAM = {{ ansible_memfree_mb}} MB "
          - "Used RAM = {{( ansible_memtotal_mb - ansible_memfree_mb)}} MB"
```
## **Result**
```bash
root@ubuntu:~/.ansible# ansible-playbook -i inv.yaml dz.yaml  --ask-vault-pass
Vault password:

PLAY [all_workers] ***************************************************************************

TASK [Gathering Facts] ***********************************************************************
Wednesday 01 March 2023  11:39:43 +0000 (0:00:00.034)       0:00:00.034 *******
ok: [host23]
ok: [host24]

TASK [OS/version] ****************************************************************************
Wednesday 01 March 2023  11:39:45 +0000 (0:00:01.967)       0:00:02.001 *******
ok: [host23] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host24] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point/capacity/used] *************************************************************
Wednesday 01 March 2023  11:39:45 +0000 (0:00:00.067)       0:00:02.068 *******
ok: [host23] => (item={'mount': '/', 'device': '/dev/loop22', 'fstype': 'ext4', 'options': 'rw                                                                   ,relatime', 'size_total': 8350298112, 'size_available': 6792556544, 'block_size': 4096, 'block                                                                   _total': 2038647, 'block_available': 1658339, 'block_used': 380308, 'inode_total': 524288, 'in                                                                   ode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point : /",
        "Size total = 7963.46484375 MB  ",
        "Used = 1485.578125 MB"
    ]
}
ok: [host24] => (item={'mount': '/', 'device': '/dev/loop23', 'fstype': 'ext4', 'options': 'rw                                                                   ,relatime', 'size_total': 8350298112, 'size_available': 6792531968, 'block_size': 4096, 'block                                                                   _total': 2038647, 'block_available': 1658333, 'block_used': 380314, 'inode_total': 524288, 'in                                                                   ode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point : /",
        "Size total = 7963.46484375 MB  ",
        "Used = 1485.6015625 MB"
    ]
}

TASK [RAM/capacity/free] *********************************************************************
Wednesday 01 March 2023  11:39:45 +0000 (0:00:00.086)       0:00:02.155 *******
ok: [host23] => {
    "msg": [
        "Total RAM = 2048 MB",
        "Free RAM = 1659 MB ",
        "Used RAM = 389 MB"
    ]
}
ok: [host24] => {
    "msg": [
        "Total RAM = 2048 MB",
        "Free RAM = 1660 MB ",
        "Used RAM = 388 MB"
    ]
}

PLAY RECAP ***********************************************************************************
host23                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    re                                                                   scued=0    ignored=0
host24                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    re                                                                   scued=0    ignored=0

Wednesday 01 March 2023  11:39:45 +0000 (0:00:00.135)       0:00:02.291 *******
===============================================================================
Gathering Facts ----------------------------------------------------------------------- 1.97s
RAM/capacity/free --------------------------------------------------------------------- 0.14s
Mount point/capacity/used ------------------------------------------------------------- 0.09s
OS/version ---------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
