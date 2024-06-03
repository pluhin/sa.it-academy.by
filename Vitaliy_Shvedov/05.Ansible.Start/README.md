## 05.Ansible start

---

### Setting Up Ansible

---

1. Install Ansible on your local machine or a virtual environment:

```bash
sudo apt update
sudo apt upgrade
sudo apt install python3-pip
sudo pip3 install ansible
ansible --version
```

2. Create a directory for your Ansible playbooks and configuration files:

```bash
mkdir 05.Ansible.Start
cd 05.Ansible.Start
nano inv.yaml
```
```yml
all_workers:
  children:
    work_sa:
      hosts:
        host11:
          ansible_host: 192.168.my_work_ip
        host12:
          ansible_host: 192.168.my_work_ip
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: ip_bastion
      ansible_user: user_for bastion
```
```bash
ansible-inventory -i inv.yaml --graph
nano ansible.cfg
```
```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

3. Write an Ansible playbook that prints "Hello, Ansible!" to the console:

```bash
nano hello.yml
```
```yml
- hosts: all_workers
  gather_facts: False

  tasks:
    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!"
```

4. Run the playbook using the ansible-playbook command and ensure it executes successfully:

- Run the playbook:

```bash
ansible-playbook -i inv.yaml hello.yml
```

5. Document the installation process and the steps you took to run the playbook:

- Output:
```
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Hello Ansible] *****************************************************************************************************************************************
Saturday 01 June 2024  10:58:19 +0000 (0:00:00.023)       0:00:00.024 *********
ok: [host11] => {
    "msg": "Hello, Ansible!"
}
ok: [host12] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ***************************************************************************************************************************************************
host11                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host12                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 01 June 2024  10:58:19 +0000 (0:00:00.063)       0:00:00.087 *********
===============================================================================
Hello Ansible ----------------------------------------------------------------------------------------------------------------------------------------- 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds
```

### Managing Remote Hosts
---

1. Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target:
- host11
- host12
 
2. Ensure SSH access to the remote machine from your local machine:

```bash
sudo apt install sshpass
sudo ssh-keygen -t ed25519
sudo ssh-copy-id -p 32510 user_bastion@ip_bastion
nano ~/.ssh/config
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -u root all_workers --ask-pass
ansible -i inv.yaml -m ping -u root  all_workers
```

- Output:

```json
host11 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host12 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

3. Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host:

```bash
nano install_basic_package
```
```yml
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
```  

4. Use inventory files to manage the connection details for the remote host:

```bash
ansible-playbook -i inv.yaml install_basic_package.yml -u root
```

5. Execute the playbook and verify that the package is installed on the remote host:

- Output:

```
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Install Htop] ******************************************************************************************************************************************
Saturday 01 June 2024  11:13:30 +0000 (0:00:00.014)       0:00:00.014 *********
changed: [host11]
changed: [host12]

TASK [Install mc] ********************************************************************************************************************************************
Saturday 01 June 2024  11:13:36 +0000 (0:00:06.232)       0:00:06.246 *********
ok: [host11]
ok: [host12]

PLAY RECAP ***************************************************************************************************************************************************
host11                     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host12                     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 01 June 2024  11:13:39 +0000 (0:00:02.391)       0:00:08.637 *********
===============================================================================
Install Htop ------------------------------------------------------------------------------------------------------------------------------------------ 6.23s
Install mc -------------------------------------------------------------------------------------------------------------------------------------------- 2.39s
Playbook run took 0 days, 0 hours, 0 minutes, 8 seconds
```

### Managing Users and Groups
---

1. Create a playbook to manage users and groups on a remote host:

```bash
mkdir -p group_vars/task3/
nano group_vars/task3/vars.yml
```
```
mygroups:
  - name: home_task_group1
  - name: home_task_group2

users:
  - name: home_task_user1
    group: home_task_group1
    password: tyhnr

  - name: home_task_user2
    group: home_task_group2
    password: hjkty
```
2. Define tasks to create a new user, assign the user to a specific group, and set a password.
3. Parameterize the playbook to allow dynamic user and group names:

```yml
- hosts: all_workers
  become: yes
  vars_files:
    - group_vars/task3/vars.yml
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

4. Execute the playbook and verify that the user and group configurations are applied:

```bash
ansible-playbook -i inv.yaml add_user.yml -u root
```

- Output:

```
PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Saturday 01 June 2024  11:38:15 +0000 (0:00:00.017)       0:00:00.017 *********
ok: [host11]
ok: [host12]

TASK [Create group] ******************************************************************************************************************************************
Saturday 01 June 2024  11:38:18 +0000 (0:00:02.684)       0:00:02.702 *********
changed: [host11] => (item={'name': 'home_task_group1'})
changed: [host12] => (item={'name': 'home_task_group1'})
changed: [host11] => (item={'name': 'home_task_group2'})
changed: [host12] => (item={'name': 'home_task_group2'})

TASK [Create users] ******************************************************************************************************************************************
Saturday 01 June 2024  11:38:20 +0000 (0:00:01.918)       0:00:04.620 *********
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13.
Install the passlib library for continued encryption functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
changed: [host12] => (item={'name': 'home_task_user1', 'group': 'home_task_group1', 'password': 'tyhnr'})
changed: [host11] => (item={'name': 'home_task_user1', 'group': 'home_task_group1', 'password': 'tyhnr'})
changed: [host11] => (item={'name': 'home_task_user2', 'group': 'home_task_group2', 'password': 'hjkty'})
changed: [host12] => (item={'name': 'home_task_user2', 'group': 'home_task_group2', 'password': 'hjkty'})

TASK [Delete users] ******************************************************************************************************************************************
Saturday 01 June 2024  11:38:22 +0000 (0:00:02.014)       0:00:06.635 *********
changed: [host11] => (item={'name': 'home_task_user1', 'group': 'home_task_group1', 'password': 'tyhnr'})
changed: [host12] => (item={'name': 'home_task_user1', 'group': 'home_task_group1', 'password': 'tyhnr'})
changed: [host12] => (item={'name': 'home_task_user2', 'group': 'home_task_group2', 'password': 'hjkty'})
changed: [host11] => (item={'name': 'home_task_user2', 'group': 'home_task_group2', 'password': 'hjkty'})

TASK [Delete groups] *****************************************************************************************************************************************
Saturday 01 June 2024  11:38:24 +0000 (0:00:01.688)       0:00:08.323 *********
ok: [host11] => (item={'name': 'home_task_group1'})
ok: [host12] => (item={'name': 'home_task_group1'})
ok: [host11] => (item={'name': 'home_task_group2'})
ok: [host12] => (item={'name': 'home_task_group2'})

PLAY RECAP ***************************************************************************************************************************************************
host11                     : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host12                     : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Saturday 01 June 2024  11:38:26 +0000 (0:00:01.884)       0:00:10.208 *********
===============================================================================
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.68s
Create users ------------------------------------------------------------------------------------------------------------------------------------------ 2.01s
Create group ------------------------------------------------------------------------------------------------------------------------------------------ 1.92s
Delete groups ----------------------------------------------------------------------------------------------------------------------------------------- 1.88s
Delete users ------------------------------------------------------------------------------------------------------------------------------------------ 1.69s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
```