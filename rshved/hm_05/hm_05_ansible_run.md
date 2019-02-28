# Lesson 5: Ansible.Run
### Playbook for print out remote host parameters:
```yml
---
- hosts: all
  ignore_errors: yes
  tasks:

  vars:
    param:
      - os_family: "{{ ansible_os_family }}"
      - distrib: "{{ ansible_distribution }}"
      - distrib_version: "{{ ansible_distribution_version }}"
      - lvm_partitions: "{{ ansible_lvm.lvs }}"
      - mount_point: "{{ ansible_mounts }}"
      - memory: "{{ ansible_memory_mb }}"

  tasks:

  - name: Print parameters
    debug:
      msg: "{{ param }}"
```
### Output:
```bash
pelsh@HP-ENVY-m6:~/ansible$ ansible-playbook parameters.yml --limit=cent_os
 [WARNING]: While constructing a mapping from
/home/pelsh/ansible/parameters.yml, line 2, column 3, found a duplicate dict
key (tasks). Using last defined value only.


PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [cent_os_1]

TASK [Print parameters] ********************************************************
ok: [cent_os_1] => {
    "msg": [
        {
            "os_family": "RedHat"
        }, 
        {
            "distrib": "CentOS"
        }, 
        {
            "distrib_version": "7.6.1810"
        }, 
        {
            "lvm_partitions": {
                "root": {
                    "size_g": "28.99", 
                    "vg": "centos"
                }, 
                "swap": {
                    "size_g": "2.00", 
                    "vg": "centos"
                }
            }
        }, 
        {
            "mount_point": [
                {
                    "block_available": 7187815, 
                    "block_size": 4096, 
                    "block_total": 7596417, 
                    "block_used": 408602, 
                    "device": "/dev/mapper/centos-root", 
                    "fstype": "xfs", 
                    "inode_available": 15159774, 
                    "inode_total": 15200256, 
                    "inode_used": 40482, 
                    "mount": "/", 
                    "options": "rw,seclabel,relatime,attr2,inode64,noquota", 
                    "size_available": 29441290240, 
                    "size_total": 31114924032, 
                    "uuid": "d6300753-a4b8-453c-b989-3ba78734855c"
                }, 
                {
                    "block_available": 215389, 
                    "block_size": 4096, 
                    "block_total": 259584, 
                    "block_used": 44195, 
                    "device": "/dev/sda1", 
                    "fstype": "xfs", 
                    "inode_available": 523951, 
                    "inode_total": 524288, 
                    "inode_used": 337, 
                    "mount": "/boot", 
                    "options": "rw,seclabel,relatime,attr2,inode64,noquota", 
                    "size_available": 882233344, 
                    "size_total": 1063256064, 
                    "uuid": "25c92c64-022e-49de-9569-635ceee44ef0"
                }
            ]
        }, 
        {
            "memory": {
                "nocache": {
                    "free": 766, 
                    "used": 224
                }, 
                "real": {
                    "free": 230, 
                    "total": 990, 
                    "used": 760
                }, 
                "swap": {
                    "cached": 0, 
                    "free": 2047, 
                    "total": 2047, 
                    "used": 0
                }
            }
        }
    ]
}

PLAY RECAP *********************************************************************
cent_os_1                  : ok=2    changed=0    unreachable=0    failed=0  
```
### Playbook for create hutemai user:
```yml
---
- hosts: all
  gather_facts: no
  remote_user: root
  become: yes
  tasks:

  - name: Create user 'hutemai'
    user:
      name: "{{ item.name }}"
      shell: "{{ item.shell }}"
      state: present
    with_items:
      - { name: 'hutemai', shell: '/bin/bash'}

  - name: Set 'hutemai' authorized key
    authorized_key:
      user: hutemai
      key: "{{ lookup('file','/home/pelsh/.ssh/id_rsa.pub') }}"

  - name: Add sudoers privileges for user 'hutemai'
    lineinfile:
      dest: "/etc/sudoers"
      backup: yes
      state: present
      regexp: '^hutemai ALL=(ALL)'
      line: 'hutemai ALL=(ALL) NOPASSWD: ALL'
```
### Output:
```bash
pelsh@HP-ENVY-m6:~/ansible$ ansible-playbook add_hutemai_to_host.yml --limit=cent_os

PLAY [all] *********************************************************************

TASK [Create user 'hutemai'] ***************************************************
ok: [cent_os_1] => (item={u'shell': u'/bin/bash', u'name': u'hutemai'})

TASK [Set 'hutemai' authorized key] ********************************************
changed: [cent_os_1]

TASK [Add sudoers privileges for user 'hutemai'] *******************************
changed: [cent_os_1]

PLAY RECAP *********************************************************************
cent_os_1                  : ok=3    changed=2    unreachable=0    failed=0  
```
### Playbook for checking user's privileges
```yml
---
- hosts: all
  remote_user: hutemai
  tasks:

  - name: update via hutemai user
    shell: yum update
    when: ansible_os_family == "RedHat"
```
### Output:
```bash
pelsh@HP-ENVY-m6:~/ansible$ ansible-playbook test.yml --limit=cent_os

PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [cent_os_1]

TASK [update via hutemai user] *************************************************
 [WARNING]: Consider using the yum module rather than running 'yum'.  If you
need to use command because yum is insufficient you can add 'warn: false' to
this command task or set 'command_warnings=False' in ansible.cfg to get rid of
this message.

changed: [cent_os_1]

PLAY RECAP *********************************************************************
cent_os_1                  : ok=2    changed=1    unreachable=0    failed=0  
```
