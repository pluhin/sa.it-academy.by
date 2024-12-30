# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible
1. sudo apt install ansible -y
2. ansible --version
4. mkdir ansible-scripts
    cd ansible-scripts
5. touch hello.yml
    nano hello.yml
    - hosts: localhost
      tasks:
          - name: Print message
           debug:
             msg: "Привет, Ansible!"
6.   ansible-playbook hello.yml
   
PLAY [localhost] *************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************
ok: [localhost]

TASK [Print message] *********************************************************************************************************
ok: [localhost] => {
    "msg": "Привет, Ansible!"
}

PLAY RECAP *******************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

## Homework Assignment 2: Managing Remote Hosts
My virtual machine(192.168.56.102) is in use

1. File [inventory.ini] with the following contents:

```bash
 [remote]
192.169.56.102 ansible_ssh_andrew=andrew
```
2. File [install_package.yml] with the following content to install htop:

```bash
 ---
- hosts: remote
become: true
tasks:
- name: Install htop
apt:
name: htop
state: present
update_cache: yes
```
3. --Run script:
```bash
 ansible-playbook -i inventory.ini install_package.yml --ask-become-pass
```

ssh andrew@192.168.56.102

htop --version
```bash
htop 3.3.0
```

## Homework Assignment 3: Managing Users and Groups
touch [user_management.sh]

```bash
 #!/bin/bash

# Parameters
USERNAME=$1
GROUPNAME=$2
PASSWORD=$3

# Check for the presence of required parameters
if [ -z "$USERNAME" ] || [ -z "$GROUPNAME" ] || [ -z "$PASSWORD" ]; then
echo "Usage: $0 <username> <groupname> <password>"
exit 1
fi

# Create a new group if it doesn't exist
if ! getent group $GROUPNAME > /dev/null; then
sudo groupadd $GROUPNAME
fi

# Create a new user and add to a group
sudo useradd -m -G $GROUPNAME -s /bin/bash $USERNAME

# Setting a password
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Checking the created user and its group
if id "$USERNAME" &>/dev/null; then
echo "User $USERNAME created and added to group $GROUPNAME."
else
echo "Error creating user $USERNAME."
exit 1
fi

```
chmod +x user_management.sh

./user_management.sh Test_ansible local_group [passwrod]

id Test_ansible:
```bash
uid=1002(Test_ansible) gid=1004(Test_ansible) groups=1004(Test_ansible),1003(local_group)
```
groups Test_ansible:
```bash
Test_ansible : Test_ansible local_group
```



