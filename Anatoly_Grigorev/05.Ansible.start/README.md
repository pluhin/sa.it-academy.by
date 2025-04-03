# 05. Ansible start

## Homework Assignment 1: Setting Up Ansible
```shell
sudo apt install ansible
mkdir ansible-work
cd ansible-work/
nano hello.yaml
ansible-playbook hello.yaml
```

##### Playbook Output
```shell
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does
not match 'all'

PLAY [Print message] *****************************************************************************************

TASK [Gathering Facts] ***************************************************************************************
ok: [localhost]

TASK [Print hello] *******************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ***************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 2: Managing Remote Hosts
```shell
nano inv.yaml
ssh-copy-id -p32510 jump_sa@178.124.206.53
ssh-copy-id -p22 root@192.168.202.6
nano /etc/ssh/ssh_config
ansible-playbook -i inv.yaml install.yaml --ask-vault-pass
```
##### Playbook Output
```shell
PLAY [Install] ***********************************************************************************************

TASK [Gathering Facts] ***************************************************************************************
ok: [host_01]

TASK [Install htop] ******************************************************************************************
changed: [host_01]

TASK [Chek if htop installed] ********************************************************************************
changed: [host_01]

TASK [Print htop version] ************************************************************************************
ok: [host_01] => {
    "msg": "htop 3.0.5"
}

PLAY RECAP ***************************************************************************************************
host_01                    : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 3: Managing Users and Groups
```shell
ansible-playbook -i inv.yaml users.yaml -e "new_username=test_user new_groupname=test_group new_password=test_password" --ask-vault-pass
```

##### Playbook Output
```shell
PLAY [Managing Users and Groups] *****************************************************************************

TASK [Gathering Facts] ***************************************************************************************
ok: [host_01]

TASK [Create group] ******************************************************************************************
changed: [host_01]

TASK [Create user] *******************************************************************************************
changed: [host_01]

TASK [Print user information] ********************************************************************************
ok: [host_01] => {
    "msg": "User test_user created and add to group test_group."
}

PLAY RECAP ***************************************************************************************************
host_01                    : ok=4    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```