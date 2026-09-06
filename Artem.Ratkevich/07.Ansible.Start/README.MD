# Ansible Homework Assignments

## Overview
This repository contains solutions for three Ansible homework assignments covering basic Ansible setup, remote host management, and user/group management.

## Prerequisites
- Ubuntu/Debian system
- Python 3.6+
- SSH access to target machines (ssh-copy-id ubuntu@<vm-ip-address>)
- Sudo privileges on target machines (visudo)

## Assignment 1: Setting Up Ansible

### Installation Process

#### 1. Install Ansible on Ubuntu/Debian
```bash
# Update package index
sudo apt update

# Install required dependencies
sudo apt install -y software-properties-common

# Add Ansible repository
sudo add-apt-repository --yes --update ppa:ansible/ansible

# Install Ansible
sudo apt install -y ansible

# Verify installation
ansible --version

## Assignment 1: Run with explicit inventory
```bash
ansible-playbook -i hosts.yaml 1.hello_ansible.yaml

PLAY [Hello Ansible] *******************************************************************************************

TASK [Print Hello Ansible message] *****************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

TASK [Print system info] ***************************************************************************************
ok: [localhost] => {
    "msg": "Running on localhost"
}

PLAY RECAP *****************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   



```

## Assignment 3: Managing Remote Hosts

Run user management playbook
```bash
# Method 1: Default parameters
ansible-playbook -i hosts.yaml 3.manage_users.yaml

# Method 2: Custom user and group
ansible-playbook -i hosts.yaml 3.manage_users.yaml \ -e "user_name=john_doe group_name=developers"

# Method 3: Custom password
ansible-playbook -i hosts.yaml 3.manage_users.yaml \  -e "user_name=alice password=MySecurePass123!"

# Verify user creation
ansible host_vm -m command -a "id developer" -i hosts.yaml
# Expected: uid=1001(developer) gid=1001(devops) groups=1001(devops)

```