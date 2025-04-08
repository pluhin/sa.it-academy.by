## Homework Assignment 1: Setting Up Ansible

```bash
sudo apt-get install ansible
mkdir ansible_scripts
cd ansible_scripts
nano hello.yaml
ansible-playbook hello.yaml
```

Output
```bash
PLAY [Hello] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [Hello message] ***********************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 2: Managing Remote Hosts

```bash
ssh-copy-id -p 32510 jump_sa@178.124.206.53
ssh root@192.168.202.23 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
ansible-playbook -i inv.yaml installation.yaml --ask-pass
```

Output
```bash
PLAY [Installation] ***********************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************
ok: [host_24]
ok: [host_23]

TASK [htop. Installation] *****************************************************************************************************************************************************
changed: [host_23]
changed: [host_24]

PLAY RECAP ********************************************************************************************************************************************************************
host_23                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_24                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

## Homework Assignment 3: Managing Users and Groups

```bash
ansible-playbook -i inv.yaml manage_users_and_groups.yaml --extra-vars "username=Robert group=teams" --ask-pass
```

Output
```bash
PLAY [Manage users and groups] ************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************
ok: [host_23]
ok: [host_24]

TASK [Create a group] *********************************************************************************************************************************************************
ok: [host_24]
ok: [host_23]

TASK [Create a user] **********************************************************************************************************************************************************
changed: [host_23]
changed: [host_24]

PLAY RECAP ********************************************************************************************************************************************************************
host_23                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_24                    : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```