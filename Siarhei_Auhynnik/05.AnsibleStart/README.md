# Homework Assignment 1: Setting Up Ansible
### 1. Install Ansible on your local machine or a virtual environment.

__Input__
``` bash
sudo apt update
sudo apt upgrade
sudo apt install python3-pip
sudo pip3 install ansible
ansible --version
```

__Output__

``` bash
ansible [core 2.17.14]
  config file = None
  configured module search path = ['/home/student/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/student/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Aug 15 2025, 14:32:43) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
``` 

### 2. Install Ansible on your local machine or a virtual environment.

__Input__
``` bash
mkdir ~/ansible-homework
cd ~/ansible-homework
nano hello.yml
```
### 3. Write an Ansible playbook that prints "Hello, Ansible!" to the console.n Ansible playbook that prints "Hello, Ansible!" to the console.

__Input__

```
---
- name: Hello Ansible Playbook
  hosts: localhost
  gather_facts: no
  tasks:
    - name: Print Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```
### 4. Run the playbook using the ansible-playbook command and ensure it executes successfully.

__Input__

```bash
ansible-playbook -i localhost, hello.yml
```
__Output__
``` bash
PLAY [Hello Ansible Playbook] ***************************************************************************************************************************************************************************************************************

TASK [Print Hello Ansible] ******************************************************************************************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```


# Homework Assignment 2: Managing Remote Hosts


### 1. Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.

use host1 & host2

### 2. Ensure SSH access to the remote machine from your local machine.

__Input __
``` bash
ano ~/.ssh/config
ssh-keygen -o
ssh-copy-id -p 32511 jump_sa@178.124.206.53
ssh-keygen -f "/home/jump_sa/.ssh/known_hosts" -R "192.168.202.1"
ssh-keygen -f "/home/jump_sa/.ssh/known_hosts" -R "192.168.202.2"
ssh root@192.168.202.1
ssh root@192.168.202.2
ansible-homework$ ansible -i inv.yaml -m ping -u root all_workers --ask-vault-pass
```
__Output__
``` bash
[WARNING]: Platform linux on host host1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
host1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}
[WARNING]: Platform linux on host host2 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
host2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.10"
    },
    "changed": false,
    "ping": "pong"
}
```

### 3. Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.

__Input__
```bash
nano install_pkg.yaml

---
- name: Install basic package on workers
  hosts: work_sa
  become: true
  tasks:
    - name: Ensure htop is installed
      package:
        name: htop
        state: present
```

### 4. Use inventory files to manage the connection details for the remote host.

__Input__
``` bash
nano inv.yaml

all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.1
        host2:
          ansible_host: 192.168.202.2
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```
### 5. Execute the playbook and verify that the package is installed on the remote host.

__Input__
``` bash
ansible-playbook -i inv.yaml install_pkg.yaml -u root --ask-vault-pass
ansible -i inv.yml work_sa -a "htop --version"
```
__Output__
``` bash
PLAY [Install basic package on workers] *****************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:01:51 +0000 (0:00:00.024)       0:00:00.024 ********
[WARNING]: Platform linux on host host1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host1]
[WARNING]: Platform linux on host host2 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host2]

TASK [Ensure htop is installed] *************************************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:01:54 +0000 (0:00:02.351)       0:00:02.376 ********
changed: [host1]
changed: [host2]

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
host1                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 19 October 2025  18:01:59 +0000 (0:00:05.354)       0:00:07.731 ********
===============================================================================
Ensure htop is installed ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 5.35s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.35s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds




[WARNING]: Platform linux on host host1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
host1 | CHANGED | rc=0 >>
htop 3.0.5
[WARNING]: Platform linux on host host2 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
host2 | CHANGED | rc=0 >>
htop 3.0.5
```

# Homework Assignment 3: Managing Users and Groups

### 1. Create a playbook to manage users and groups on a remote host.
### 2. Define tasks to create a new user, assign the user to a specific group, and set a password.

__Input__ 
``` bash
nano user _mgmt.yaml

---
- name: Manage multiple users and verify creation
  hosts: work_sa
  become: true

  vars:
    users: []  # список пользователей передаётся через --extra-vars

  tasks:
    - name: Ensure groups exist
      ansible.builtin.group:
        name: "{{ item.group }}"
        state: present
      loop: "{{ users }}"
      loop_control:
        label: "{{ item.group }}"

    - name: Ensure users exist and are in their groups
      ansible.builtin.user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        password: "{{ item.password | password_hash('sha512') }}"
        shell: /bin/bash
        state: present
      loop: "{{ users }}"
      loop_control:
        label: "{{ item.name }}"

    - name: Verify users exist via 'id'
      ansible.builtin.command: "id {{ item.name }}"
      register: user_check
      ignore_errors: true
      changed_when: false
      loop: "{{ users }}"
      loop_control:
        label: "{{ item.name }}"

    - name: Show verification results
      ansible.builtin.debug:
        msg: "{{ item.stdout }}"
      loop: "{{ user_check.results }}"

```
### 3. Parameterize the playbook to allow dynamic user and group names.
### 4. Execute the playbook and verify that the user and group configurations are applied.

__Input__
``` bash
ansible-playbook -i inv.yaml user_mgmt.yaml \
  --extra-vars '{
    "users": [
      {"name": "siarhei", "group": "devops", "password": "Qwerty123!"},
      {"name": "alex", "group": "admins", "password": "Admin123!"},
      {"name": "maria", "group": "qa", "password": "Test123!"}
    ]
  }' \
  -u root --ask-vault-pass
```
__Output__
``` bash
PLAY [Manage multiple users and verify creation] ********************************************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:42:52 +0000 (0:00:00.023)       0:00:00.023 ********
[WARNING]: Platform linux on host host1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host1]
[WARNING]: Platform linux on host host2 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python interpreter could change the meaning of that path. See
https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [host2]

TASK [Ensure groups exist] ******************************************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:42:55 +0000 (0:00:02.220)       0:00:02.244 ********
ok: [host1] => (item=devops)
ok: [host2] => (item=devops)
ok: [host1] => (item=admins)
ok: [host2] => (item=admins)
ok: [host1] => (item=qa)
ok: [host2] => (item=qa)

TASK [Ensure users exist and are in their groups] *******************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:42:56 +0000 (0:00:01.910)       0:00:04.155 ********
changed: [host1] => (item=siarhei)
changed: [host2] => (item=siarhei)
changed: [host1] => (item=alex)
changed: [host2] => (item=alex)

TASK [Verify users exist via 'id'] **********************************************************************************************************************************************************************************************************

Sunday 19 October 2025  18:42:59 +0000 (0:00:02.956)       0:00:07.111 ********
ok: [host1] => (item=siarhei)
ok: [host2] => (item=siarhei)
ok: [host1] => (item=alex)
ok: [host2] => (item=alex)

ok: [host1] => (item=maria)
ok: [host2] => (item=maria)

TASK [Show verification results] ************************************************************************************************************************************************************************************************************
Sunday 19 October 2025  18:43:01 +0000 (0:00:01.971)       0:00:09.082 ********
ok: [host1] => (item={'changed': False, 'stdout': 'uid=1000(siarhei) gid=1000(devops) groups=1000(devops)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'siarhei'], 'start': '2025-10-19 18:43:01.201140', 'end': '2025-10-19 18:43:01.205829', 'delta': '0:00:00.004689', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id siarhei', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1000(siarhei) gid=1000(devops) groups=1000(devops)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'siarhei', 'group': 'devops', 'password': 'Qwerty123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1000(siarhei) gid=1000(devops) groups=1000(devops)"
}
ok: [host1] => (item={'changed': False, 'stdout': 'uid=1001(alex) gid=1001(admins) groups=1001(admins)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'alex'], 'start': '2025-10-19 18:43:01.809035', 'end': '2025-10-19 18:43:01.814051', 'delta': '0:00:00.005016', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id alex', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1001(alex) gid=1001(admins) groups=1001(admins)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'alex', 'group': 'admins', 'password': 'Admin123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1001(alex) gid=1001(admins) groups=1001(admins)"
}
ok: [host1] => (item={'changed': False, 'stdout': 'uid=1002(maria) gid=1002(qa) groups=1002(qa)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'maria'], 'start': '2025-10-19 18:43:02.424041', 'end': '2025-10-19 18:43:02.430283', 'delta': '0:00:00.006242', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id maria', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1002(maria) gid=1002(qa) groups=1002(qa)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'maria', 'group': 'qa', 'password': 'Test123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1002(maria) gid=1002(qa) groups=1002(qa)"
}
ok: [host2] => (item={'changed': False, 'stdout': 'uid=1000(siarhei) gid=1000(devops) groups=1000(devops)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'siarhei'], 'start': '2025-10-19 18:43:01.262908', 'end': '2025-10-19 18:43:01.268338', 'delta': '0:00:00.005430', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id siarhei', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1000(siarhei) gid=1000(devops) groups=1000(devops)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'siarhei', 'group': 'devops', 'password': 'Qwerty123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1000(siarhei) gid=1000(devops) groups=1000(devops)"
}
ok: [host2] => (item={'changed': False, 'stdout': 'uid=1001(alex) gid=1001(admins) groups=1001(admins)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'alex'], 'start': '2025-10-19 18:43:01.882789', 'end': '2025-10-19 18:43:01.888017', 'delta': '0:00:00.005228', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id alex', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1001(alex) gid=1001(admins) groups=1001(admins)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'alex', 'group': 'admins', 'password': 'Admin123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1001(alex) gid=1001(admins) groups=1001(admins)"
}
ok: [host2] => (item={'changed': False, 'stdout': 'uid=1002(maria) gid=1002(qa) groups=1002(qa)', 'stderr': '', 'rc': 0, 'cmd': ['id', 'maria'], 'start': '2025-10-19 18:43:02.499097', 'end': '2025-10-19 18:43:02.504385', 'delta': '0:00:00.005288', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'id maria', '_uses_shell': False, 'expand_argument_vars': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['uid=1002(maria) gid=1002(qa) groups=1002(qa)'], 'stderr_lines': [], 'failed': False, 'item': {'name': 'maria', 'group': 'qa', 'password': 'Test123!'}, 'ansible_loop_var': 'item'}) => {
    "msg": "uid=1002(maria) gid=1002(qa) groups=1002(qa)"
}

PLAY RECAP **********************************************************************************************************************************************************************************************************************************
host1                      : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 19 October 2025  18:43:01 +0000 (0:00:00.066)       0:00:09.149 ********
===============================================================================
Ensure users exist and are in their groups ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.96s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.22s
Verify users exist via 'id' ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.97s
Ensure groups exist ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.91s
Show verification results ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 9 seconds

```

