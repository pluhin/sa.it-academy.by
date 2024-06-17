
# Home task 05. Ansible start

Ubuntu-server24-new-clone-work-2
-----------------------------------------------------------------------------
## Homework Assignment 1: Setting Up Ansible
### 1. installation Ansible
```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt install mc
ansible
sudo apt install python3-pip

>>> tmp
sudo pip3 install ansible
sudo update
sudo apt update
sudo mc
sudo apt-get install ssh
sudo apt-get install openssh-server
sudo apt install openssh-server
sudo systemctl enable ssh
systemctl status ssh
<<< tmp

sudo apt update
sudo apt install python3-pip 
sudo pip3 install ansible

// Since it does not install on Ubuntu 24.04 and gives an error, installed according to the instructions:
http://www.it-automation.com/2021/06/24/6-ways-to-install-ansible-on-ubuntu2004.html
// Installation according to instructions:
sudo apt install python3-pip
sudo apt install python3-virtualenv
virtualenv ansible41
source ~/ansible41/bin/activate
pip3 install ansible
ansible --version
// Installed in the catalog /home/vmuser/ansible41/
// Deleted directory
// Reinstallation into directory /home/vmuser/ansible/
sudo apt install python3-pip
sudo apt install python3-virtualenv
virtualenv ansible
source ~/ansible/bin/activate
pip3 install ansible
ansible --version
```

```yaml
- hosts: localhost
  gather_facts: False

  tasks:
    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```


```bash
mkdir 05.Ansible
cd 05.Ansible

ansible-playbook -i inv.yaml hello.yaml

PLAY [localhost] ***********************************************************************************************

TASK [Hello Ansible] *******************************************************************************************
Суббота 15 июня 2024  14:35:33 +0000 (0:00:00.006)       0:00:00.006 **********
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *****************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 15 июня 2024  14:35:33 +0000 (0:00:00.013)       0:00:00.019 **********
===============================================================================
Hello Ansible ------------------------------------------------------------------------------------------- 0.01s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
vmuser@vm2:~/05.Ansible$ ansible-playbook -i inv.yaml hello_inv.yaml
```
-----------------------------------------------------------------------------
## Homework Assignment 2: Managing Remote Hosts
-----------------------------------------------------------------------------
```bash
ansible-playbook -i inv.yaml Install_application.yaml
```
```bash
// bastion
ssh-copy-id -p 32510 jump_sa@178.124.206.53
ssh -p 32510 jump_sa@178.124.206.53
logout
// connect to host
ssh root@192.168.202.5
ssh root@192.168.202.5 -vvvv
logout

mkdir 05.Ansible
cd 05.Ansible
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_ed25519.pub')}}\" user=root" -u root all_workers --ask-pass

ssh root@192.168.202.5
logout
ssh root@192.168.202.6
logout
```

```bash
installapp.yaml

- hosts: all_workers
  gather_facts: False
  become: true

  tasks:
    - name: Install application htop
      apt:
        name: htop
        state: present
    - name: Install application vim
      apt:
        name: vim
        state: present
    - name: Install application mc
      apt:
        name: mc
        state: present
```

```bash
vmuser@vm2:~/05.Ansible$ ansible-playbook -i inv.yaml installapp.yaml -u root
```

Result:
```bash
PLAY [all_workers] ******************************************************************************************

TASK [Install application htop] *****************************************************************************
Пятница 14 июня 2024  20:45:06 +0000 (0:00:00.008)       0:00:00.008 **********
ok: [host05]
ok: [host06]

TASK [Install application vim] ******************************************************************************
Пятница 14 июня 2024  20:45:08 +0000 (0:00:02.039)       0:00:02.048 **********
ok: [host05]
ok: [host06]

TASK [Install application mc] *******************************************************************************
Пятница 14 июня 2024  20:45:09 +0000 (0:00:01.301)       0:00:03.349 **********
ok: [host05]
ok: [host06]

PLAY RECAP **************************************************************************************************
host05                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Пятница 14 июня 2024  20:45:11 +0000 (0:00:01.330)       0:00:04.679 **********
===============================================================================
Install application htop ----------------------------------------------------------------------------- 2.04s
Install application mc ------------------------------------------------------------------------------- 1.33s
Install application vim ------------------------------------------------------------------------------ 1.30s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```
Checking the result. The application is installed.
```bash
 ssh root@192.168.202.5
 htop
```
-----------------------------------------------------------------------------
## Homework Assignment 3: Managing Users and Groups

**The task is done in three ways**

### way 1:

groupvars.yaml
```yaml
mygroups:
  - name: grp_devops
  - name: grp_programmer
  - name: grp_tester

users:
  - name: Kuznecov
    group: grp_devops
    password: 123d

  - name: Petrov
    group: grp_programmer
    password: 123p

  - name: Sidorov
    group: grp_tester
    password: 123t
```

createuser.yaml
```yaml
- hosts: all_workers
  gather_facts: False
  become: true
  vars_files:
    - groupvars.yaml
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
      group:
        name: "{{ item.name }}"
        state: absent
      loop: "{{ mygroups }}"
```

Result:
```bash
ansible-playbook -i inv.yaml Create_user_v1/createuser.yaml -u root



PLAY [all_workers] *********************************************************************************************

TASK [Create group] ********************************************************************************************
Суббота 15 июня 2024  14:15:17 +0000 (0:00:00.009)       0:00:00.009 **********
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

TASK [Create users] ********************************************************************************************
Суббота 15 июня 2024  14:15:19 +0000 (0:00:02.468)       0:00:02.478 **********
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops', 'password': '123d'})
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops', 'password': '123d'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer', 'password': '123p'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer', 'password': '123p'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester', 'password': '123t'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester', 'password': '123t'})

TASK [Delete users] ********************************************************************************************
Суббота 15 июня 2024  14:15:22 +0000 (0:00:02.610)       0:00:05.089 **********
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops', 'password': '123d'})
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops', 'password': '123d'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer', 'password': '123p'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer', 'password': '123p'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester', 'password': '123t'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester', 'password': '123t'})

TASK [Delete groups] *******************************************************************************************
Суббота 15 июня 2024  14:15:24 +0000 (0:00:01.930)       0:00:07.019 **********
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

PLAY RECAP *****************************************************************************************************
host05                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 15 июня 2024  14:15:26 +0000 (0:00:01.757)       0:00:08.776 **********
===============================================================================
Create users -------------------------------------------------------------------------------------------- 2.61s
Create group -------------------------------------------------------------------------------------------- 2.47s
Delete users -------------------------------------------------------------------------------------------- 1.93s
Delete groups ------------------------------------------------------------------------------------------- 1.76s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```
-----------------------------------------------------------------------------

### way 2:

groupvars.yaml
```yaml
mygroups:
  - name: grp_devops
  - name: grp_programmer
  - name: grp_tester

users:
  - name: Kuznecov
    group: grp_devops

  - name: Petrov
    group: grp_programmer

  - name: Sidorov
    group: grp_tester
```

createuser.yaml
```yaml
- hosts: all_workers
  gather_facts: False
  become: true
  vars_files:
    - groupvars.yaml
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
        password: "{{ password_users | password_hash('sha512') }}"
        state: present
      loop: "{{ users }}"

    - name: Delete users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        state: absent
      loop: "{{ users }}"

    - name: Delete groups
      group:
        name: "{{ item.name }}"
        state: absent
      loop: "{{ mygroups }}"
```

Result:
```bash
ansible-playbook -i inv.yaml Create_user_v2/createuser.yaml -e "password_users=123qwer" -u root


PLAY [all_workers] *********************************************************************************************

TASK [Create group] ********************************************************************************************
Суббота 15 июня 2024  14:16:05 +0000 (0:00:00.009)       0:00:00.009 **********
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

TASK [Create users] ********************************************************************************************
Суббота 15 июня 2024  14:16:07 +0000 (0:00:02.006)       0:00:02.015 **********
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester'})

TASK [Delete users] ********************************************************************************************
Суббота 15 июня 2024  14:16:10 +0000 (0:00:02.611)       0:00:04.626 **********
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester'})

TASK [Delete groups] *******************************************************************************************
Суббота 15 июня 2024  14:16:12 +0000 (0:00:01.950)       0:00:06.577 **********
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

PLAY RECAP *****************************************************************************************************
host05                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 15 июня 2024  14:16:14 +0000 (0:00:01.770)       0:00:08.348 **********
===============================================================================
Create users -------------------------------------------------------------------------------------------- 2.61s
Create group -------------------------------------------------------------------------------------------- 2.01s
Delete users -------------------------------------------------------------------------------------------- 1.95s
Delete groups ------------------------------------------------------------------------------------------- 1.77s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```
-----------------------------------------------------------------------------

### way 3:

groupvars.yaml
```yaml
mygroups:
  - name: grp_devops
  - name: grp_programmer
  - name: grp_tester

users:
  - name: Kuznecov
    group: grp_devops

  - name: Petrov
    group: grp_programmer

  - name: Sidorov
    group: grp_tester
```

createuser.yaml
```yaml
- hosts: all_workers
  gather_facts: False
  become: true
  vars_files:
    - groupvars.yaml
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
        password: "{{ (devops_password | default('password1')) | password_hash('sha512') if item.group == 'grp_devops' else (programmer_password | default('password2')) | password_hash('sha512') if item.group == 'grp_programmer' else (tester_password | default('password3')) | password_hash('sha512') }}"
        state: present
      loop: "{{ users }}"

    - name: Delete users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        state: absent
      loop: "{{ users }}"

    - name: Delete groups
      group:
        name: "{{ item.name }}"
        state: absent
      loop: "{{ mygroups }}"
```

Result:
```bash
ansible-playbook -i inv.yaml Create_user_v3/createuser.yaml -e "devops_password=123d programmer_password=123p tester_password=123t" -u root



PLAY [all_workers] *********************************************************************************************

TASK [Create group] ********************************************************************************************
Суббота 15 июня 2024  14:16:43 +0000 (0:00:00.009)       0:00:00.009 **********
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

TASK [Create users] ********************************************************************************************
Суббота 15 июня 2024  14:16:45 +0000 (0:00:02.007)       0:00:02.017 **********
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester'})

TASK [Delete users] ********************************************************************************************
Суббота 15 июня 2024  14:16:48 +0000 (0:00:02.623)       0:00:04.641 **********
changed: [host05] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host06] => (item={'name': 'Kuznecov', 'group': 'grp_devops'})
changed: [host05] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host06] => (item={'name': 'Petrov', 'group': 'grp_programmer'})
changed: [host05] => (item={'name': 'Sidorov', 'group': 'grp_tester'})
changed: [host06] => (item={'name': 'Sidorov', 'group': 'grp_tester'})

TASK [Delete groups] *******************************************************************************************
Суббота 15 июня 2024  14:16:50 +0000 (0:00:01.891)       0:00:06.532 **********
changed: [host05] => (item={'name': 'grp_devops'})
changed: [host06] => (item={'name': 'grp_devops'})
changed: [host05] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_programmer'})
changed: [host06] => (item={'name': 'grp_tester'})
changed: [host05] => (item={'name': 'grp_tester'})

PLAY RECAP *****************************************************************************************************
host05                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=4    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Суббота 15 июня 2024  14:16:52 +0000 (0:00:01.857)       0:00:08.390 **********
===============================================================================
Create users -------------------------------------------------------------------------------------------- 2.62s
Create group -------------------------------------------------------------------------------------------- 2.01s
Delete users -------------------------------------------------------------------------------------------- 1.89s
Delete groups ------------------------------------------------------------------------------------------- 1.86s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```
