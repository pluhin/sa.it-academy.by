# Homework for 04.Git.Action
---
## Install Ansible
```bash
svv@ubuntu:~/devops$ sudo apt install python3-pip
svv@ubuntu:~/devops$ mkdir 05.Ansible
svv@ubuntu:~/devops$ cd 05.Ansible/
svv@ubuntu:~/devops$ cd 05.Ansible$ sudo pip3 install ansible
svv@ubuntu:~/devops/05.Ansible$ vim ansible.cfg
svv@ubuntu:~/devops/05.Ansible$ ansible --version
ansible [core 2.13.8]
  config file = /home/svv/devops/05.Ansible/ansible.cfg
  configured module search path = ['/home/svv/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.8/dist-packages/ansible
  ansible collection location = /home/svv/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.8.10 (default, Nov 14 2022, 12:59:47) [GCC 9.4.0]
  jinja version = 3.1.2
  libyaml = True
svv@ubuntu:~/devops/05.Ansible$ vim inv.yaml
```
## Setup SSH+bastion v1
```bash
svv@ubuntu:~/devops/05.Ansible$ ssh-copy-id jump_sa@178.124.206.53
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/svv/.ssh/id_rsa.pub"
The authenticity of host '178.124.206.53 (178.124.206.53)' can't be established.
ECDSA key fingerprint is SHA256:gV6LIvkaIW6pdop1iIECFwx5wZqAIHixQbUL+kZNQvc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
jump_sa@178.124.206.53's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'jump_sa@178.124.206.53'"
and check to make sure that only the key(s) you wanted were added.

svv@ubuntu:~/devops/05.Ansible$ ssh 'jump_sa@178.124.206.53'
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 19:12:45 2023 from 87.252.225.206
jump_sa@jump:~$
jump_sa@jump:~$ exit
svv@ubuntu:~/devops/05.Ansible$ vim ~/.ssh/config
svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.39
The authenticity of host '192.168.202.39 (<no hostip for                     proxy command>)' can't be established.
ECDSA key fingerprint is SHA256:OhCacz2xH1lsNdKbv7qO7/tdT                    gHkc9G0jFfjW9UeRpE.
Are you sure you want to continue connecting (yes/no/[fin                    gerprint])? yes
Warning: Permanently added '192.168.202.39' (ECDSA) to th                    e list of known hosts.
root@192.168.202.39's password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_                    64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 20:17:39 2023 from 192.168.204.82
root@sa-39:~#
root@sa-39:~# exit
logout
Connection to 192.168.202.39 closed.
svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.40
The authenticity of host '192.168.202.40 (<no hostip for proxy command>)' can't be established.
ECDSA key fingerprint is SHA256:+AfJy7wsZZg9jNOE9wownWjNL0x/CkP2UfSzFSIO52M.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.202.40' (ECDSA) to the list of known hosts.
root@192.168.202.40's password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 20:17:44 2023 from 192.168.204.82
root@sa-40:~# exit
logout
Connection to 192.168.202.40 closed.
svv@ubuntu:~/devops/05.Ansible$ svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.40
The authenticity of host '192.168.202.40 (<no hostip for proxy command>)' can't be established.
ECDSA key fingerprint is SHA256:+AfJy7wsZZg9jNOE9wownWjNL0x/CkP2UfSzFSIO52M.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.202.40' (ECDSA) to the list of known hosts.
root@192.168.202.40's password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 20:17:44 2023 from 192.168.204.82
root@sa-40:~# exit
logout
Connection to 192.168.202.40 closed.
svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.39  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"


```
## Setup SSH+bastion v2
```bash
svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.39  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
root@192.168.202.39's password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 20:29:49 2023 from 192.168.204.82
root@sa-39:~# exit
logout
Connection to 192.168.202.39 closed.
svv@ubuntu:~/devops/05.Ansible$ ssh root@192.168.202.40  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
root@192.168.202.40's password:

Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release '22.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Mar  1 20:20:31 2023 from 192.168.204.82
root@sa-40:~# exit
logout
Connection to 192.168.202.40 closed.

```
## setup ansible
```bash
svv@ubuntu:~/devops/05.Ansible$ mkdir -p group_vars/all_workers
svv@ubuntu:~/devops/05.Ansible$ cd group_vars/all_workers/
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ vim inv.yaml
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ vim vars.yaml
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ ansible-inventory -i inv.yaml --graph
@all:
  |--@all_workers:
  |  |--@work_sa:
  |  |  |--host39
  |  |  |--host40
  |--@jump_sa:
  |  |--bastion
  |--@ungrouped:
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ ansible-inventory -i inv.yaml --host host39
{
    "ansible_host": "192.168.202.39"
}
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ ansible-inventory -i inv.yaml --host host40
{
    "ansible_host": "192.168.202.40"
}
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ ansible-inventory -i inv.yaml --host bastion
{
    "ansible_host": "178.124.206.53",
    "ansible_user": "jump_sa",
    "env": "it-academy"
}
svv@ubuntu:~/devops/05.Ansible/group_vars/all_workers$ sudo apt install sshpass
svv@ubuntu:~/devops/05.Ansible$ ansible -i inv.yaml -m ping all_workers -u root --ask-pass
SSH password:
host40 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host39 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
svv@ubuntu:~/devops/05.Ansible$ ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
SSH password:
host39 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa ",
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true
}
host40 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa ",
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true
}
svv@ubuntu:~/devops/05.Ansible$ ansible -i inv.yaml -m ping all_workers -u root
host39 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host40 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}

```
## Playbook
```bash
svv@ubuntu:~/devops/05.Ansible$ ansible-playbook -i inv.yaml play.yaml --ask-vault-pass
Vault password:

PLAY [all_workers] *******************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************
Wednesday 01 March 2023  14:45:29 -0800 (0:00:00.019)       0:00:00.019 *******
ok: [host40]
ok: [host39]

TASK [os/version] ********************************************************************************************************************************************
Wednesday 01 March 2023  14:45:32 -0800 (0:00:02.219)       0:00:02.239 *******
ok: [host39] => {
    "msg": [
        "OS: Ubuntu",
        "Version: 20.04"
    ]
}
ok: [host40] => {
    "msg": [
        "OS: Ubuntu",
        "Version: 20.04"
    ]
}

TASK [Mount point/capacity/used] *****************************************************************************************************************************
Wednesday 01 March 2023  14:45:32 -0800 (0:00:00.067)       0:00:02.307 *******
ok: [host39] => (item={'mount': '/', 'device': '/dev/loop38', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792531968, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658333, 'block_used': 380314, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 7963.46 Mb",
        "Used : 1485.6 Mb"
    ]
}
ok: [host40] => (item={'mount': '/', 'device': '/dev/loop39', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792531968, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658333, 'block_used': 380314, 'inode_total': 524288, 'inode_available': 496343, 'inode_used': 27945, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 7963.46 Mb",
        "Used : 1485.6 Mb"
    ]
}

TASK [RAM] ***************************************************************************************************************************************************
Wednesday 01 March 2023  14:45:32 -0800 (0:00:00.090)       0:00:02.397 *******
ok: [host39] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1666 Mb"
    ]
}
ok: [host40] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1666 Mb"
    ]
}

PLAY RECAP ***************************************************************************************************************************************************
host39                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host40                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 01 March 2023  14:45:32 -0800 (0:00:00.066)       0:00:02.464 *******
===============================================================================
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------- 2.22s
Mount point/capacity/used ----------------------------------------------------------------------------------------------------------------------------- 0.09s
os/version -------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
RAM --------------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds

```