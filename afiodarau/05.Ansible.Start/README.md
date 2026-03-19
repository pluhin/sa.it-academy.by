# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible
 - [x] Install Ansible on your local machine or a virtual environment.
 - 
```bash
    python3 -m venv ansible-env
    source ansible-env/bin/activate
    pip install ansible
```
 - [x] Create a directory for your Ansible playbooks and configuration files.

```bash
mkdir -p ~/ansible/{playbooks,inventory}
```

 - [x] Write an Ansible playbook that prints "Hello, Ansible!" to the console.


```bash
vim ~/ansible/playbooks/hello.yml
```

 - [x] Run the playbook using the ansible-playbook command and ensure it executes successfully.

```bash
cd ~/ansible
ansible-playbook playbooks/hello.yml
```

 - [x] Document the installation process and the steps you took to run the playbook.

```bash
(ansible-env) fiodarau@EPBYMINW5591 ansible % ansible-playbook playbooks/hello.yml

PLAY [Print Hello Ansible message] *********************************************

TASK [Print message to console] ************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  
```

## Homework Assignment 2: Managing Remote Hosts

 - [x] Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.
 - [x] Ensure SSH access to the remote machine from your local machine.
 - [x] Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.


[install_htop.yml](afiodarau/05.Ansible.Start/playbooks/install_htop.yml)

 - [x] Use inventory files to manage the connection details for the remote host.

[hosts](afiodarau/05.Ansible.Start/inventory/hosts)
 
 - [ ] Execute the playbook and verify that the package is installed on the remote host.

```bash
ansible -i inventory/hosts servers -m ping
ansible-playbook -i inventory/hosts install_htop.yml
ansible -i inventory/hosts servers -a "htop --version"
```

Result:
```
[WARNING]: Platform linux on host remote1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for
more information.
remote1 | CHANGED | rc=0 >>
htop 3.0.5
```

## Homework Assignment 3: Managing Users and Groups

 - [ ] Create a playbook to manage users and groups on a remote host.

Generate pass hash:
```bash
python3 -c "import crypt; print(crypt.crypt('Password', crypt.mksalt(crypt.METHOD_SHA512)))"
```

 create [variable](afiodarau/05.Ansible.Start/group_vars/users.yml) for user 

 [playbook](afiodarau/05.Ansible.Start/playbook/manage_users.yml) created

 - [x] Define tasks to create a new user, assign the user to a specific group, and set a password.
 - [x] Parameterize the playbook to allow dynamic user and group names.
 - [x] Execute the playbook and verify that the user and group configurations are applied.

```bash
ansible-playbook -i inventory/hosts playbooks/manage_users.yml
```

```log
PLAY [Manage users and groups] *************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
[WARNING]: Platform linux on host remote1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for
more information.
ok: [remote1]

TASK [Ensure group exists] *****************************************************************************************************************************
changed: [remote1]

TASK [Ensure user exists] ******************************************************************************************************************************
changed: [remote1]

PLAY RECAP *********************************************************************************************************************************************
remote1                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

fiodarau@EPBYMINW5591 ansible % ansible -i inventory/hosts servers -a "getent group devops"
[WARNING]: Platform linux on host remote1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for
more information.
remote1 | CHANGED | rc=0 >>
devops:x:1000:
fiodarau@EPBYMINW5591 ansible % ansible -i inventory/hosts servers -a "id devuser"
[WARNING]: Platform linux on host remote1 is using the discovered Python interpreter at /usr/bin/python3.10, but future installation of another Python
interpreter could change the meaning of that path. See https://docs.ansible.com/ansible-core/2.18/reference_appendices/interpreter_discovery.html for
more information.
remote1 | CHANGED | rc=0 >>
uid=1000(devuser) gid=1000(devops) groups=1000(devops)
```
