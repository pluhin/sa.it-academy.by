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
## Assignment 2: Managing Remote Hosts
```bash
ansible-playbook -i hosts.yaml 2.install_packages.yaml   -e "package_name=openvpn"

PLAY [Install Package on Remote Host] **************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [host_vm]

TASK [Update apt cache (Debian/Ubuntu)] ************************************************************************

12         update_cache: yes
13         cache_valid_time: 3600
14       when: ansible_os_family == "Debian"
               ^ column 13

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

ok: [host_vm]

TASK [Install package] *****************************************************************************************
changed: [host_vm]

TASK [Verify package installation] *****************************************************************************
ok: [host_vm]

TASK [Display package location] ********************************************************************************
ok: [host_vm] => {
    "msg": "openvpn is installed at /usr/sbin/openvpn"
}

PLAY RECAP *****************************************************************************************************
host_vm                    : ok=5    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
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

# Result example
PLAY [Manage Users and Groups] *********************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [host_vm]

TASK [Ensure group exists] *************************************************************************************
ok: [host_vm]

TASK [Create user with specific group] *************************************************************************
changed: [host_vm]

TASK [Set user password expiration] ****************************************************************************
changed: [host_vm]

TASK [Verify user creation] ************************************************************************************
ok: [host_vm]

TASK [Display user information] ********************************************************************************
ok: [host_vm] => {
    "msg": "User created: uid=1002(alice) gid=1004(alice) groups=1004(alice),1001(devops)"
}

TASK [Create additional group for user] ************************************************************************
changed: [host_vm]

TASK [Add user to additional group] ****************************************************************************
changed: [host_vm]

PLAY RECAP *****************************************************************************************************
host_vm                    : ok=8    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```