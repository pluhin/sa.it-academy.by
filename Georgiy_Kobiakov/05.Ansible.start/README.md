# 05.Ansible.start
---

## 1. Setting up Ansible

Installing Ansible

```bash
sudo apt update
sudo apt install python3-pip
sudo pip3 install ansible
```

Setting up working directory

```bash
mkdir 05.Ansible.start
cd 05.Ansible.start
mcedit hello.y
```

hello.yaml

```yaml
- name: Hello Ansible playbook
  hosts: localhost
  gather_facts: false
  tasks:

    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```

Run the playbook

```bash
ansible-playbook hello.yaml
```

Output

```bash
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that
the implicit localhost does not match 'all'

PLAY [Hello Ansible playbook] **************************************************

TASK [Hello Ansible] ***********************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## 2. Managing Remote Hosts

Setting up direct connection to VM's

```bash
ssh-copy-id -p 32510 jump_sa@178.124.206.53
```

inv.yaml

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host7:
          ansible_host: 192.168.202.7
        host8:
          ansible_host: 192.168.202.8

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

~/.ssh/config

```bash
Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
        ProxyJump ec_bastion
```

mkdir group_vars/all_workers
mcedit group_vars/all_workers/vars.yaml

```bash
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
```

instll_htop.yaml

```yaml
- name: Install htop
  hosts: all_workers
  become: yes
  tasks:
    - name: Install htop
      package:
        name: htop
        state: present
```

Run the playbook

```bash
ansible-playbook -i inv.yaml install_htop.yaml -u root
```

Output

```bash
PLAY [Install htop] ******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
ok: [host8]
ok: [host7]

TASK [Install htop] ******************************************************************************************************************************************
changed: [host7]
changed: [host8]

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## 3. Managing Users and Groups

mcedit ansible.cfg

```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

mcedit vars/main.yaml

```yaml
mygroups:
  - name: students
  - name: teachers

users:
  - name: student1
    group: students
    password: 1234qwerty

  - name: teacher1
    group: teachers
```

mcedit add_user.yaml

```yaml
- name: Add users, groups and passwords
  hosts: all_workers
  become: yes
  vars_files:
    - vars/main.yaml
  tasks:
    - name: Create groups
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
```

Run the playbook

```bash
ansible-playbook -i inv.yaml add_user.yaml -u root
```

Output

```bash
PLAY [Add users, groups and passwords] ***********************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Tuesday 24 October 2023  14:27:59 +0000 (0:00:00.011)       0:00:00.011 *******
ok: [host8]
ok: [host7]

TASK [Create groups] *****************************************************************************************************************************************
Tuesday 24 October 2023  14:28:02 +0000 (0:00:02.639)       0:00:02.651 *******
ok: [host8] => (item={'name': 'students'})
ok: [host7] => (item={'name': 'students'})
ok: [host8] => (item={'name': 'teachers'})
ok: [host7] => (item={'name': 'teachers'})

TASK [Create users] ******************************************************************************************************************************************
Tuesday 24 October 2023  14:28:05 +0000 (0:00:02.947)       0:00:05.599 *******
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13.
Install the passlib library for continued encryption functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13.
Install the passlib library for continued encryption functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
changed: [host7] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host8] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host7] => (item={'name': 'teacher1', 'group': 'teachers', 'password': '5678qwerty'})
changed: [host8] => (item={'name': 'teacher1', 'group': 'teachers', 'password': '5678qwerty'})

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Tuesday 24 October 2023  14:28:08 +0000 (0:00:02.990)       0:00:08.589 *******
===============================================================================
Create users ------------------------------------------------------------------------------------------------------------------------------------------ 2.99s
Create groups ----------------------------------------------------------------------------------------------------------------------------------------- 2.95s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.64s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```