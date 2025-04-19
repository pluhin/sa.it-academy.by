1.Installing Ansible
```bash
sudo apt install -y ansible
ansible --version (2.16.31)
```
2.Creating a directory for playbooks
```bash
mkdir ~/ansible_playbooks
cd ~/ansible_playbooks
```
3.Creating a playbook
```bash
touch hello.yml
nano hello.yml
```
```bash
---
- name: First playbook
  hosts: localhost
  tasks: Display a message
    - name: 
      debug:
        msg: "Hello, Ansible!"
```
4.Start playbook
```bash
ansible-playbook hello.yml
```
Result:
```bash
PLAY [First playbook] *******************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************
ok: [localhost]

TASK [Display massage] ******************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ******************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
### Homework Assignment 2: Managing Remote Hosts
1.Create SSH config
```bash
mkdir -p ~/.ssh && chmod 700 ~/.ssh
nano ~/.ssh/config
```
In the config file we insert data for Bastion and External Host (from Ansible workshop target node).
Checking the connection:
```bash
ssh -o "StrictHostKeyChecking=no" workshop-node
```
Result:
```bash
andrew@GitTest:~$ ssh -o "StrictHostKeyChecking=no" workshop-node
The authenticity of host '[178.124.206.53]:32510 ([178.124.206.53]:32510)' can't be established.
ED25519 key fingerprint is SHA256:yvhK5MkTQ5tBTarkaIYhf2As+5eN8vuRDIAO2f419uo.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[178.124.206.53]:32510' (ED25519) to the list of known hosts.
no such identity: /home/andrew/.ssh/id_ed25519: No such file or directory
jump_sa@178.124.206.53's password: 
Warning: Permanently added '192.168.201.4' (ED25519) to the list of known hosts.
root@192.168.201.4's password: 
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@ws-4:~# 
```

2.Customizing Inventory for Ansible
```bash
apt install ansible
touch inventory.ini
nano inventory.ini
```

```bash
[workshop]
workshop-node ansible_host=192.168.201.4

[all:vars]
ansible_user=root
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o ProxyCommand="sshpass -p [PASSWORD] ssh -W %h:%p -p 32510 jump_sa@178.>
ansible_ssh_pass=[PASSWORD]
ansible_become_pass=[PASSWORD]
```
3.Playbook fot htop

```bash
touch install_htop.yml
nano install_htop.yml
```
```bash
---
- name: Installing htop
  hosts: workshop
  become: yes
  tasks:
    - name: Updating the package cache
      apt:
        update_cache: yes

    - name: Installing htop
      apt:
        name: htop
        state: present
```
Additionally installing sshpass
```bash
sudo apt install -y sshpass
```
Checking:
```bash
ansible-playbook -i inventory.ini install_htop.yml -k
```
Result:
```bash
PLAY [Installing htop] ******************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************
ok: [workshop-node]

TASK [Updating the package cache] *******************************************************************************************************************
ok: [workshop-node]

TASK [Installing htop] ******************************************************************************************************************************
changed: [workshop-node]

PLAY RECAP ******************************************************************************************************************************************
workshop-node              : ok=3    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

### Homework Assignment 3: Managing Users and Groups

1.Create a user_management.yml

```bash
touch user_management.yml
nano user_management.yml
```
Add parameters to the yml file

```bash
---
- name: Create a user
  hosts: workshop
  become: yes
  vars:
    target_user: "devops_student"
    target_group: "academy"
    user_password: "{{ '[PASSWORD]' | password_hash('sha512') }}"
  
  tasks:
    - name: Create a group
      group:
        name: "{{ target_group }}"
        state: present

    - name: Create a user
      user:
        name: "{{ target_user }}"
        group: "{{ target_group }}"
        password: "{{ user_password }}"
        shell: /bin/bash
        append: yes
```

2.Lounch with parametres
```bash
ansible-playbook -i inventory.ini user_management.yml --extra-vars "target_user=ivan_ivanov target_group=devops_team"
```
Result:

```bash
PLAY [Create a user] ********************************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************************
ok: [workshop-node]

TASK [Create a group] *******************************************************************************************************************************
changed: [workshop-node]

TASK [Create a user] ********************************************************************************************************************************
changed: [workshop-node]

PLAY RECAP ******************************************************************************************************************************************
workshop-node              : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
