#
# 05. Ansible start
#
---
## Homework Assignment 1: Setting Up Ansible

``` bash
   66  sudo apt update
   67  sudo apt -yqq install python3-pip
   68  sudo pip3 install ansible
   69  sudo apt install sshpass
   70  ansible --version
   71  nano ansible.cfg
   72  ssh-copy-id -p 32510 jump_sa@178.124.206.53
   78  ssh -p '32510' 'jump_sa@178.124.206.53'
   79  nano inv.yaml
   80  ll
   87  ansible-inventory
   88  ansible-inventory -i inv.yaml --graph\n
   89  ansible-inventory -i inv.yaml --host host11\n
   90  ansible-inventory -i inv.yaml --host host12\n
   91  ansible-inventory -i inv.yaml --host bastion\n
   92  ssh root@192.168.202.11
   95  ssh root@192.168.202.11 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
   97  nano ~/.ssh/config
   98  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
   99  nano inv.yaml
  100  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  101  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers
  102  ssh root@192.168.202.11
  103  ssh root@192.168.202.12
  104  nano hello_ansible.yaml
  107  ansible-playbook -i inv.yaml hello_ansible.yaml
  108  nano 05.Ansinle.start.md
  ```

### ansible.cfg
``` bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```
### inv.yaml
``` bash
all_workers:
  vars:
  ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"'
  children:
    work_sa:
      hosts:
        host11:
          ansible_host: 192.168.202.11
          ansible_user: root
        host12:
          ansible_host: 192.168.202.12
          ansible_user: root
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### ~/.ssh/config

``` bash
Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.* 192.168.208.*
        ProxyJump ec_bastion
```

### hello_ansible.yaml

``` bash
- hosts: all_workers
  gather_facts: False
  #strategy: free
  #serial: 1
  tasks:
    - name: Say hello
      debug:
        msg: "Hello, Ansible!"
```

### Output

``` bash
PLAY [all_workers] *************************************************************

TASK [Say hello] ***************************************************************
Tuesday 06 February 2024  19:29:51 +0300 (0:00:00.009)       0:00:00.009 ****** 
ok: [host11] => {
    "msg": "Hello, Ansible!"
}
ok: [host12] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
host11                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host12                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 06 February 2024  19:29:51 +0300 (0:00:00.024)       0:00:00.033 ****** 
=============================================================================== 
Say hello --------------------------------------------------------------- 0.02s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

## Homework Assignment 2: Managing Remote Hosts

### install_prog.yaml 

``` bash
- hosts: all_workers
  gather_facts: False
  become: yes


  tasks:
    - name: Install Htop package
      apt:
        name: htop
        state: present
```

### Output

``` bash
PLAY [all_workers] *****************************************************************************************************************************************************************************************************

TASK [Install Htop package] ********************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:34:12 +0300 (0:00:00.010)       0:00:00.010 ****** 
ok: [host11]
ok: [host12]

PLAY RECAP *************************************************************************************************************************************************************************************************************
host11                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host12                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 06 February 2024  20:34:14 +0300 (0:00:02.080)       0:00:02.090 ****** 
=============================================================================== 
Install Htop package -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.08s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```

## Homework Assignment 3: Managing Users and Groups

### vars/groops.yaml

``` bash
mygroups:
  - name: managers
  - name: engineers

users:
  - name: manager1
    group: managers
    password: asdf5678

  - name: engineer1
    group: engineers
    password: fdsa8765
```

### user_add.yaml

``` bash
- hosts: all_workers
  become: yes
  vars_files:
    - vars/groops.yaml
  tasks:
    - name: Create group
      group:
        name: "{{ item.name }}"
        state: present
      loop: "{{ mygroups }}"

    - name: Create users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        password: "{{ item.password | password_hash('sha512') }}"
        state: present
      loop: "{{ users }}"

    - name: Delete users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        state: absent
      loop: "{{ users }}"

    - name: Delete groups
      user:
        name: "{{ item.name }}"
        state: absent
      loop: "{{ mygroups }}"
```

### Output

``` bash
PLAY [all_workers] *****************************************************************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:43:00 +0300 (0:00:00.008)       0:00:00.008 ****** 
ok: [host11]
ok: [host12]

TASK [Create group] ****************************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:43:03 +0300 (0:00:02.284)       0:00:02.293 ****** 
ok: [host12] => (item={'name': 'managers'})
ok: [host11] => (item={'name': 'managers'})
ok: [host12] => (item={'name': 'engineers'})
ok: [host11] => (item={'name': 'engineers'})

TASK [Create users] ****************************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:43:04 +0300 (0:00:01.753)       0:00:04.047 ****** 
changed: [host11] => (item={'name': 'manager1', 'group': 'managers', 'password': 'asdf5678'})
changed: [host12] => (item={'name': 'manager1', 'group': 'managers', 'password': 'asdf5678'})
changed: [host11] => (item={'name': 'engineer1', 'group': 'engineers', 'password': 'fdsa8765'})
changed: [host12] => (item={'name': 'engineer1', 'group': 'engineers', 'password': 'fdsa8765'})

TASK [Delete users] ****************************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:43:07 +0300 (0:00:02.064)       0:00:06.111 ****** 
changed: [host12] => (item={'name': 'manager1', 'group': 'managers', 'password': 'asdf5678'})
changed: [host11] => (item={'name': 'manager1', 'group': 'managers', 'password': 'asdf5678'})
changed: [host11] => (item={'name': 'engineer1', 'group': 'engineers', 'password': 'fdsa8765'})
changed: [host12] => (item={'name': 'engineer1', 'group': 'engineers', 'password': 'fdsa8765'})

TASK [Delete groups] ***************************************************************************************************************************************************************************************************
Tuesday 06 February 2024  20:43:08 +0300 (0:00:01.578)       0:00:07.689 ****** 
ok: [host11] => (item={'name': 'managers'})
ok: [host12] => (item={'name': 'managers'})
ok: [host11] => (item={'name': 'engineers'})
ok: [host12] => (item={'name': 'engineers'})

PLAY RECAP *************************************************************************************************************************************************************************************************************
host11                     : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host12                     : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Tuesday 06 February 2024  20:43:10 +0300 (0:00:01.764)       0:00:09.453 ****** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.28s
Create users ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.06s
Delete groups --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.76s
Create group ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.75s
Delete users ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.58s
Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds
```