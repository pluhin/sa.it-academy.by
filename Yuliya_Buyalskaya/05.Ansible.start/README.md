## Homework Assignment 1: Setting Up Ansible
```shell
sudo apt install ansible

user@vm5:~$ ansible --version
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/user/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Nov  6 2024, 18:32:19) [GCC 13.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```

Playbook [hello.yml](../05.Ansible.start/playbook/hello.yml) runs on localhost 

```shell
ansible-playbook hello.yml 
```

## Homework Assignment 2: Managing Remote Hosts

[Inventory file](../05.Ansible.start/config/inv.yml)

```shell
ansible-inventory -i inv.yml --graph    @all:
  |--@ungrouped:
  |--@jump_sa:
  |  |--bastion
  |--@other:
  |  |--host3
  |  |--host4
```

Copy public key to the bastion and try to login

```shell
ssh-copy-id -i /home/user/.ssh/ansible_key.pub -p 32510 jump_sa@178.124.206.53
ssh -p 32510 'jump_sa@178.124.206.53'
```
To the config add proxy
```shell
nano ~/.ssh/config
```

```yaml
Host 178.124.206.53
  Hostname 178.124.206.53
  IdentityFile ~/.ssh/ansible_key
  PreferredAuthentications publickey
  User jump_sa
  Port 32510
  ForwardAgent yes
  User root
Host 192.168.202.3 192.168.202.4 192.168.201.2
  ProxyJump 178.124.206.53
```

Try to connect
```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/05.Ansible.start/playbook$ ssh root@192.168.202.3
root@192.168.202.3's password:
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '24.04.1 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sun Dec 29 22:54:15 2024 from 192.168.204.82
root@sa-3:~#
```

Add config [ansible.cfg](../05.Ansible.start/config/ansible.cfg) \
Create [inventory file](../05.Ansible.start/config/inv.yml) \
Playbook to install vim on all remote VM [install_vim.yml](../05.Ansible.start/playbook/install_vim.yml) \
Add key in order not to enter password on each command

```shell
ansible -i ../config/inv.yml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/ansible_key.pub') }}\"" -u root other --ask-pass
```
Run playbook

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/05.Ansible.start/playbook$ ansible-playbook -i ../config/inv.yml install_vim.yml

PLAY [other] *******************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
ok: [host3]
ok: [host4]

TASK [Install vim] *************************************************************************************************************************************
ok: [host3]
ok: [host4]

TASK [Check installation] ******************************************************************************************************************************
changed: [host3]
changed: [host4]

TASK [Print result] ************************************************************************************************************************************
ok: [host3] => {
    "msg": "  Installed: 2:8.2.3995-1ubuntu2.21"
}
ok: [host4] => {
    "msg": "  Installed: 2:8.2.3995-1ubuntu2.21"
}

PLAY RECAP *********************************************************************************************************************************************
host3                      : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host4                      : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 3: Managing Users and Groups

Playbook for user management [manage_user_and_group.yml](../05.Ansible.start/playbook/manage_user_and_group.yml)

```shell
user@vm5:~/sa.it-academy.by/Yuliya_Buyalskaya/05.Ansible.start/playbook$ ansible-playbook -i ../config/inv.yml manage_user_and_group.yml

PLAY [other] *******************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
ok: [host3]
ok: [host4]

TASK [Create user] *************************************************************************************************************************************
changed: [host4]
changed: [host3]

TASK [Check user creation] *****************************************************************************************************************************
changed: [host4]
changed: [host3]

TASK [Print result] ************************************************************************************************************************************
ok: [host3] => {
    "msg": "user1:x:1000:27:Managed by ansible:/home/user1:/bin/sh\n   \nuser1 : sudo"
}
ok: [host4] => {
    "msg": "user1:x:1000:27:Managed by ansible:/home/user1:/bin/sh\n   \nuser1 : sudo"
}

TASK [Assign user to group] ****************************************************************************************************************************
changed: [host3]
changed: [host4]

TASK [Check user's groups] *****************************************************************************************************************************
changed: [host3]
changed: [host4]

TASK [Print result] ************************************************************************************************************************************
ok: [host3] => {
    "msg": "user1 : sudo root"
}
ok: [host4] => {
    "msg": "user1 : sudo root"
}

TASK [Remove the user] *********************************************************************************************************************************
changed: [host3]
changed: [host4]

TASK [Check user was deleted] **************************************************************************************************************************
changed: [host3]
changed: [host4]

TASK [Print result] ************************************************************************************************************************************
ok: [host3] => {
    "msg": "absent"
}
ok: [host4] => {
    "msg": "absent"
}

PLAY RECAP *********************************************************************************************************************************************
host3                      : ok=10   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host4                      : ok=10   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
