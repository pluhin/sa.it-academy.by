# 05.Ansible.start
---

## 1. Setting up Ansible

Installing Ansible

```bash
mkdir 05.Ansible.start
cd 05.Ansible.start
sudo apt update
sudo apt -yqq install python3-pip
sudo pip3 install ansible
sudo apt install sshpass
```

vim ansible.cfg

```bash
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

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
Host 192.168.201.* 192.168.202.* 192.168.203.* 192.168.208.*
        ProxyJump ec_bastion
```

Setting up vars.yaml

```bash
mkdir group_vars/all_workers
vim group_vars/all_workers/vars.yaml
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
```

hello.yaml

```yaml
- hosts: all_workers
  gather_facts: False

  tasks:
    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```

Run the playbook

```bash
ansible-playbook -i inv.yaml hello.yaml --ask-vault-pass
```

Output

```bash
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Hello Ansible] *****************************************************************************************************************************************
Wednesday 31 January 2024  08:52:00 +0000 (0:00:00.029)       0:00:00.029 *****
ok: [host7] => {
    "msg": "Hello, Ansible!"
}
ok: [host8] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 31 January 2024  08:52:00 +0000 (0:00:00.033)       0:00:00.063 *****
===============================================================================
Hello Ansible ----------------------------------------------------------------------------------------------------------------------------------------- 0.03s
```

## 2. Managing Remote Hosts

install_packages.yaml

```yaml
- hosts: all_workers
  gather_facts: False
  become: yes

  tasks:
    - name: Install Htop
      package:
        name: htop
        state: present
    - name: Install mc
      package:
        name: mc
        state: present
    - name: Install net-tools
      package:
        name: net-tools
        state: present   
```

Run the playbook

```bash
ansible-playbook -i inv.yaml install_htop.yaml -u root
```

Output

```bash
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Install Htop] ******************************************************************************************************************************************
Wednesday 31 January 2024  09:05:41 +0000 (0:00:00.027)       0:00:00.027 *****
changed: [host8]
changed: [host7]

TASK [Install mc] ********************************************************************************************************************************************
Wednesday 31 January 2024  09:05:53 +0000 (0:00:12.450)       0:00:12.478 *****
ok: [host8]
ok: [host7]

TASK [Install net-tools] *************************************************************************************************************************************
Wednesday 31 January 2024  09:05:56 +0000 (0:00:03.032)       0:00:15.510 *****
changed: [host8]
changed: [host7]

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 31 January 2024  09:06:01 +0000 (0:00:05.023)       0:00:20.533 *****
===============================================================================
Install Htop ----------------------------------------------------------------------------------------------------------------------------------------- 12.45s
Install net-tools ------------------------------------------------------------------------------------------------------------------------------------- 5.02s
Install mc -------------------------------------------------------------------------------------------------------------------------------------------- 3.03s
```

## 3. Managing Users and Groups

vim vars/main.yaml

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
    password: qwerty1234
```

vim add_user.yaml

```yaml
- hosts: all_workers
  become: yes
  vars_files:
    - vars/main.yaml
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

Run the playbook

```bash
ansible-playbook -i inv.yaml add_user.yaml --ask-vault-pass
```

Output

```bash
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Wednesday 31 January 2024  09:33:38 +0000 (0:00:00.026)       0:00:00.026 *****
ok: [host8]
ok: [host7]

TASK [Create group] ******************************************************************************************************************************************
Wednesday 31 January 2024  09:33:40 +0000 (0:00:02.428)       0:00:02.455 *****
ok: [host8] => (item={'name': 'students'})
ok: [host7] => (item={'name': 'students'})
ok: [host8] => (item={'name': 'teachers'})
ok: [host7] => (item={'name': 'teachers'})

TASK [Create users] ******************************************************************************************************************************************
Wednesday 31 January 2024  09:33:43 +0000 (0:00:02.232)       0:00:04.687 *****
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13.
Install the passlib library for continued encryption functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
changed: [host7] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host8] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host7] => (item={'name': 'teacher1', 'group': 'teachers', 'password': 'qwerty1234'})
changed: [host8] => (item={'name': 'teacher1', 'group': 'teachers', 'password': 'qwerty1234'})

TASK [Delete users] ******************************************************************************************************************************************
Wednesday 31 January 2024  09:33:45 +0000 (0:00:02.397)       0:00:07.084 *****
changed: [host8] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host7] => (item={'name': 'student1', 'group': 'students', 'password': '1234qwerty'})
changed: [host8] => (item={'name': 'teacher1', 'group': 'teachers', 'password': 'qwerty1234'})
changed: [host7] => (item={'name': 'teacher1', 'group': 'teachers', 'password': 'qwerty1234'})

TASK [Delete groups] *****************************************************************************************************************************************
Wednesday 31 January 2024  09:33:47 +0000 (0:00:02.359)       0:00:09.444 *****
ok: [host7] => (item={'name': 'students'})
ok: [host8] => (item={'name': 'students'})
ok: [host8] => (item={'name': 'teachers'})
ok: [host7] => (item={'name': 'teachers'})

PLAY RECAP ***************************************************************************************************************************************************
host7                      : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host8                      : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 31 January 2024  09:33:50 +0000 (0:00:02.357)       0:00:11.801 *****
===============================================================================
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.43s
Create users ------------------------------------------------------------------------------------------------------------------------------------------ 2.40s
Delete users ------------------------------------------------------------------------------------------------------------------------------------------ 2.36s
Delete groups ----------------------------------------------------------------------------------------------------------------------------------------- 2.36s
Create group ------------------------------------------------------------------------------------------------------------------------------------------ 2.23s
```