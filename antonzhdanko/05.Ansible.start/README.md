# 05.Ansible.start

## Homework Assignment 1 - Setting Up Ansible

Ansible was installed on macOS using Homebrew package manager.

Installation steps:

```bash
brew install ansible
ansible --version
```

Project structure was created for Ansible configuration files, inventory and playbooks.

Created files and directories:

```text
05.Ansible.start/
├── ansible.cfg
├── inv.yaml
├── inventory/
├── playbooks/
│   ├── hello.yml
│   ├── packages.yml
│   └── users.yml
└── README.md
```

ansible.cfg:

```ini
[defaults]
forks = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

Inventory file example:

```yaml
all_workers:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32511"'
  hosts:
    worker1:
      ansible_host: 192.168.208.3

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

Created first playbook:

```yaml
---
- hosts: local
  gather_facts: false

  tasks:
    - name: Print Hello message
      debug:
        msg: "Hello, Ansible!"
```

Playbook execution:

```bash
ansible-playbook -i inv.yaml playbooks/hello.yml
```

Result:

```text
msg: "Hello, Ansible!"
```

---

## Homework Assignment 2 - Managing Remote Hosts

Remote virtual machine from IT-ACADEMY DC was used as managed host.

SSH access was configured through bastion host using ProxyJump.

SSH configuration:

```sshconfig
Host ec_bastion
    User jump_sa
    Port 32511
    HostName 178.124.206.53

Host 192.168.208.*
    ProxyJump ec_bastion
```

SSH key was copied to bastion host:

```bash
ssh-copy-id -p 32511 jump_sa@178.124.206.53
```

Connectivity test:

```bash
ssh root@192.168.208.3
```

Inventory validation:

```bash
ansible-inventory -i inv.yaml --graph
```

Connectivity test using ansible ping module:

```bash
ansible -i inv.yaml -m ping all_workers -u root --ask-pass
```

Result:

```text
worker1 | SUCCESS => {
    "ping": "pong"
}
```

Created playbook for package installation:

```yaml
---
- hosts: all_workers
  become: true

  tasks:
    - name: Install htop
      apt:
        name: htop
        state: present
        update_cache: true
```

Playbook execution:

```bash
ansible-playbook -i inv.yaml playbooks/packages.yml -u root --ask-pass
```

htop package was successfully installed on remote host.

---

## Homework Assignment 3 - Managing Users and Groups

Created playbook for user and group management.

Playbook functionality:

- create Linux group
- create Linux user
- assign user to group
- configure user password
- verify created user

Playbook example:

```yaml
---
- hosts: all_workers
  become: true

  vars:
    user_name: "{{ user_to_add | default('devopsuser') }}"
    group_name: "{{ group_to_add | default('devops') }}"

  tasks:
    - name: Create group
      group:
        name: "{{ group_name }}"
        state: present

    - name: Create user
      user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        shell: /bin/bash
        password: "{{ 'QwertY_13' | password_hash('sha512') }}"
        state: present

    - name: Verify user
      shell: id {{ user_name }}
      register: user_info

    - name: Print user info
      debug:
        msg: "{{ user_info.stdout }}"
```

Playbook execution:

```bash
ansible-playbook -i inv.yaml playbooks/users.yml -u root --ask-pass
```

Verification result:

```text
uid=1001(devopsuser) gid=1001(devops) groups=1001(devops)
```

User and group were successfully created on remote host.
