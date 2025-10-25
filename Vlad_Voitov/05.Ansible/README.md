# Homework Assignment 1: Setting Up Ansible

## Write an Ansible playbook that prints "Hello, Ansible!" to the console.
## Run the playbook using the ansible-playbook command and ensure it executes successfully.
```bash
  cat hello.yaml
  ---
  - name: First Playbook
    hosts: localhost
    gather_facts: false
    connection: local

    tasks:
      - name: Print Hello Ansible
        ansible.builtin.debug:
          msg: Hello Ansible!
  ansible-playbook hello.yaml
  [WARNING]: No inventory was parsed, only implicit localhost is available
  [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

  PLAY [First Playbook] *******************************************************************************************************

  TASK [Print Hello Ansible] **************************************************************************************************
  ok: [localhost] => {
      msg: Hello Ansible!
  }

  PLAY RECAP ******************************************************************************************************************
  localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```



------------------------------
# Homework Assignment 2: Managing Remote Hosts

Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.
192.168.202.3-4
## Ensure SSH access to the remote machine from your local machine
```bash
  nano ~/.ssh/config
  cat ~/.ssh/config
  Host jump
    HostName 178.124.206.53
    User jump_sa
    Port 32511

  Host host3
    HostName 192.168.202.3
    User root
    ProxyJump jump

  Host host4
    HostName 192.168.202.4
    User root
    ProxyJump jump
  ssh-copy-id host3
  ssh-copy-id host4
  ssh host3
  Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

  * Documentation:  https://help.ubuntu.com
  * Management:     https://landscape.canonical.com
  * Support:        https://ubuntu.com/advantage
  New release '24.04.3 LTS' available.
  Run 'do-release-upgrade' to upgrade to it.

  Last login: Mon Oct 20 15:56:09 2025 from 192.168.204.82
```
## Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.
```bash
  cat install_pkg.yaml
  - name: Install base tools on remote hosts
    hosts: all_workers
    gather_facts: true
    become: true

    vars:
      tools:
        - vim
        - htop

    tasks:
      - name: Ensure tools are installed (all distros)
        package:
          name: "{{ tools }}"
          state: present
```
## Use inventory files to manage the connection details for the remote host.
```bash
  cat inv.yaml
  all:
    vars:
      ansible_ssh_common_args: '-o ProxyJump=jump_sa@178.124.206.53:32511'
    children:
      all_workers:
        hosts:
          host3:
            ansible_host: 192.168.202.3
            ansible_user: root
          host4:
            ansible_host: 192.168.202.4
            ansible_user: root
```
## Execute the playbook and verify that the package is installed on the remote host
```bash
  ansible-playbook -i inv.yaml install_pkg.yaml

  PLAY [Install base tools on remote hosts] ***********************************************************************************

  TASK [Gathering Facts] ******************************************************************************************************
  [WARNING]: Host 'host4' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.19/reference_appendices/interpreter_discovery.html for more information.
  ok: [host4]
  [WARNING]: Host 'host3' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.19/reference_appendices/interpreter_discovery.html for more information.
  ok: [host3]

  TASK [Ensure tools are installed (all distros)] *****************************************************************************
  ok: [host4]
  ok: [host3]

  PLAY RECAP ******************************************************************************************************************
  host3                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  host4                      : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

# Homework Assignment 3: Managing Users and Groups
## Create a playbook to manage users and groups on a remote host.
## Define tasks to create a new user, assign the user to a specific group, and set a password.
## Parameterize the playbook to allow dynamic user and group names.
```bash
  cat manage_users.yaml
  - name: Simple users & groups with plaintext password
    hosts: all_workers
    become: true
    gather_facts: false

    vars:
      username:   "student"
      groupname:  "developers"
      user_shell: "/bin/bash"
      plain_pass: "MyTestPass123!"

    tasks:
      - name: Ensure group exists
        ansible.builtin.group:
          name: "{{ groupname }}"
          state: present

      - name: Ensure user exists (no password yet)
        ansible.builtin.user:
          name: "{{ username }}"
          group: "{{ groupname }}"
          create_home: true
          shell: "{{ user_shell }}"

      - name: Set user password via chpasswd
        ansible.builtin.command: chpasswd
        args:
          stdin: "{{ username }}:{{ plain_pass }}"
        no_log: true

      - name: Check user exists
        ansible.builtin.command: id {{ username }}
        register: id_out
        changed_when: false

      - name: Print id output
        ansible.builtin.debug:
          var: id_out.stdout
```
## Execute the playbook and verify that the user and group configurations are applied.

```bash
  ansible-playbook -i inv.yaml manage_users.yaml

  PLAY [Simple users & groups with plaintext password] ************************************************************************

  TASK [Ensure group exists] **************************************************************************************************
  [WARNING]: Host 'host4' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.19/reference_appendices/interpreter_discovery.html for more information.
  ok: [host4]
  [WARNING]: Host 'host3' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.19/reference_appendices/interpreter_discovery.html for more information.
  ok: [host3]

  TASK [Ensure user exists (no password yet)] *********************************************************************************
  ok: [host3]
  ok: [host4]

  TASK [Set user password via chpasswd] ***************************************************************************************
  changed: [host4]
  changed: [host3]

  TASK [Check user exists] ****************************************************************************************************
  ok: [host4]
  ok: [host3]

  TASK [Print id output] ******************************************************************************************************
  ok: [host3] => {
      "id_out.stdout": "uid=1000(student) gid=1000(developers) groups=1000(developers)"
  }
  ok: [host4] => {
      "id_out.stdout": "uid=1000(student) gid=1000(developers) groups=1000(developers)"
  }

  PLAY RECAP ******************************************************************************************************************
  host3                      : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  host4                      : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```