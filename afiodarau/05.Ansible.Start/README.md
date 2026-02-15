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

 - [ ] Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.
 - [ ] Ensure SSH access to the remote machine from your local machine.
 - [ ] Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.
 - [ ] Use inventory files to manage the connection details for the remote host.
 - [ ] Execute the playbook and verify that the package is installed on the remote host.

## Homework Assignment 3: Managing Users and Groups

 - [ ] Create a playbook to manage users and groups on a remote host.
 - [ ] Define tasks to create a new user, assign the user to a specific group, and set a password.
 - [ ] Parameterize the playbook to allow dynamic user and group names.
 - [ ] Execute the playbook and verify that the user and group configurations are applied.
