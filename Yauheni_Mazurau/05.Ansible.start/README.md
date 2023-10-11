# Homework 05.Ansible start

## Homework Assignment 1: Setting Up Ansible

* Installation and configuration *

mkdir 05.Ansible
cd 05.Ansible
sudo apt update
sudo apt install python3-pip
sudo pip3 install ansible
#Checking the version. Must be at least 2.10       
ansible --version

nano inv.yaml

```yaml

all_workers:
  children:
    work_sa:
      hosts:
        host19:
          ansible_host: 192.168.202.19
        host20:
          ansible_host: 192.168.202.20
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa

```

#Copy the ssh key to the remote server
ssh-copy-id -p 32510 jump_sa@178.124.206.53
exit
#Ñonnecting to the bastion server
ssh jump_sa@178.124.206.53 -p 32510 
#Setting up connection to Bastion server via config file 
nano ~/.ssh/config    
#Checking connect host19 host20
ssh root@192.168.202.19
exit
ssh root@192.168.202.20
exit

nano ~/.ssh/config 
mkdir -p group_vars/all_workers
#The file name is set to any, the folder must have the name of the group ( all_workers)
nano group_vars/all_workers/vars.yaml   
#Add argument

```yaml

ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'

```

#Create ansible.cfg Where, forks - number of simultaneous connections; 
nano ansible.cfg

```
[defaults]
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

#Install the sshpass utility to be able to connect by password
sudo apt install sshpass

#Test run ansible
ansible -i inv.yaml -m ping all_workers -u root --ask-pass

* Ansible. Vault *

ansible-vault create group_vars/all_workers/vault.yaml
#Vault pass 1804
ansible-vault edit group_vars/all_workers/vault.yaml
#Check
cat group_vars/all_workers/vault.yaml
#Check
ansible -i inv.yaml -m ping all_workers --ask-vault-pass


* Write an Ansible playbook that prints "Hello, Ansible!" to the console *

nano hello_loc.yml

```yaml

- name: Prints "Hello, Ansible!" to the console
  hosts: localhost
  gather_facts: False

  tasks:
    - name: Print "Hello, Ansible!"
      debug:
        msg: "Hello, Ansible!"
        
```

#Start and check
ansible-playbook hello_loc.yml


### Homework Assignment 2: Managing Remote Hosts

** Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host **

nano htop_install.yml

```yaml

- name: Htop install remote machine
  hosts: all_workers
  gather_facts: False
  become: yes
  tasks:
    - name: htop install
      ansible.builtin.package:
        name: htop
        state: present
        
```

ansible-playbook -i inv.yaml htop_install.yml -u root --ask-vault-pass
#Check
ssh root@192.168.202.20
htop
exit
ssh root@192.168.202.19
htop
exit


#### Homework Assignment 3: Managing Users and Groups

mkdir vars
nano list_user.yml

```yaml

addgroup:
  - name: team1
  - name: team2

addusers:
  - name: user1
    group: team1
    password: qwerty1
  - name: user2
    group: team2
    password: qwerty2
```

nano add_user.yml

```yaml

- name: Add, manage users and groups on a remote host from the list
  hosts: all_workers
  become: true

  vars_files:
    - ~/05.Ansible/vars/list_user.yml
    #Retrieves variables from the list

  tasks:
    - name: Create groups
      group:
        name: "{{ item.name }}"
        state: present
      loop: "{{ addgroup }}"

    - name: Create users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        password: "{{ item.password | password_hash('sha512') }}"
        #Password Hashing
        state: present
      loop: "{{ addusers }}"
```

ansible-playbook -i inv.yaml add_users.yml -u root --ask-vault-pass
#Check
ssh root@192.168.202.20
cat /etc/group | grep team
exit
ssh root@192.168.202.20
cat /etc/group | grep team
exit