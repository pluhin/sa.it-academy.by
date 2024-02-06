## Homework Assignment 1: Setting Up Ansible

1. Install Ansible on your local machine or a virtual environment.

```bash
zypper se ansible
sudo zypper in ansible
ansible --version

ansible [core 2.16.2]
  config file = None
  configured module search path = ['/home/zhivushko_av/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.11/site-packages/ansible
  ansible collection location = /home/zhivushko_av/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.11.7 (main, Dec 15 2023, 10:49:17) [GCC] (/usr/bin/python3.11)
  jinja version = 3.1.3
  libyaml = True
```

1. Create a directory for your Ansible playbooks and configuration files.

```bash
mkdir -p ./05.Ansible.start/playbook
```

1. Write an Ansible playbook that prints "Hello, Ansible!" to the console.

```yaml
# hello.yaml

---

- name: Print "Hello, Ansible" to the console
  hosts: localhost
  gather_facts: false

  tasks:
    - name: Print message
      debug:
        msg: "Hello, Ansible"

```

1. Run the playbook using the `ansible-playbook` command and ensure it executes successfully.

```bash
⋊> /m/c/s/m/Artem_Zhivushko on 7bb1595a  ansible-playbook ./05.Ansible.start/playbook/hello.yaml


[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'

PLAY [Print "Hello, Ansible" to the console] ****************************************************************************************************************************************************************************************************************************************************************************************************************************
TASK [Print message] ****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible"
}

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

## Homework Assignment 2: Managing Remote Hosts

1. Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.
2. Ensure SSH access to the remote machine from your local machine.

```bash
ssh-copy-id -p 32510 jump_sa@178.124.206.53
ssh-copy-id root@192.168.202.5
ssh-copy-id root@192.168.202.6
```

1. Write an Ansible playbook to install a basic package (e.g., `vim` or `htop`) on the remote host.

```yaml
# install.yaml

---

- name: Install Htop on remote host
  hosts: work_sa
  tasks:
    - name: Update apt package cache
      become: true
      apt:
        update_cache: yes

    - name: Install Htop
      become: true
      apt:
        name: htop
        state: present
```

1. Use inventory files to manage the connection details for the remote host.

```yaml
all_workers:
  children:
    work_sa:
      hosts:
        host05:
          ansible_host: 192.168.202.5
        host06:
          ansible_host: 192.168.202.6

jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

1. Execute the playbook and verify that the package is installed on the remote host.

```bash
⋊> /m/c/s/m/Artem_Zhivushko on 7bb1595a  ansible-playbook -i ./05.Ansible.start/playbook/inv.yaml ./05.Ansible.start/playbook/install.yaml -u root


PLAY [Install Htop on remote host] **************************************************************************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host06]
ok: [host05]

TASK [Update apt package cache] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [host05]
changed: [host06]

TASK [Install Htop] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [host05]
changed: [host06]

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
host05                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
## Homework Assignment 3: Managing Users and Groups

1. Create a playbook to manage users and groups on a remote host.

```bash
---

- name: Tasks to create a new user, assign the user to a specific group, and set a password.
  hosts: work_sa

  tasks:
    - name: Create group
      group:
        name: "{{ group_name }}"
        state: present

    - name: Create a Linux User with non-interactive shell
      user:
        name: "{{ user_name }}"
        group: "{{ group_name }}"
        password: "{{ user_password | password_hash('sha512') }}"
        # shell: /sbin/nologin
        state: present
```

1. Define tasks to create a new user, assign the user to a specific group, and set a password.
2. Parameterize the playbook to allow dynamic user and group names.
1. Execute the playbook and verify that the user and group configurations are applied.

```bash
⋊> /m/c/s/my-study on 7bb1595a  ansible-playbook -i ./Artem_Zhivushko/05.Ansible.start/playbook/inv.yaml ./Artem_Zhivushko/05.Ansible.start/playbook/user.yaml -e "user_name=Zhivushko group_name=ZhivGroup user_password=qwerty" -u root



PLAY [Tasks to create a new user, assign the user to a specific group, and set a password.] *****************************************************************************************************************************************************************************************************************************************************************************

TASK [Gathering Facts] **************************************************************************************************************************************************************************************************************************************************************************************************************************************************
ok: [host06]
ok: [host05]

TASK [Create group] *****************************************************************************************************************************************************************************************************************************************************************************************************************************************************
changed: [host05]
changed: [host06]

TASK [Create a Linux User with non-interactive shell] *******************************************************************************************************************************************************************************************************************************************************************************************************************
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13. Install the passlib library for continued encryption functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
changed: [host06]
changed: [host05]

PLAY RECAP **************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
host05                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host06                     : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
