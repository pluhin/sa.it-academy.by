# Setting Up Ansible

```
mkdir 05.Ansible
cd 05.Ansible
sudo apt update
sudo apt install python3-pip
sudo pip3 install ansible
nano ~/.ssh/config
nano inv.yaml
nano hello.yaml
ansible-playbook -i inv.yaml hello.yaml
```

```
- name: Print Hello.
  hosts: localhost
  gather_facts: false
  
  tasks:
    - name: Hello
      debug:
        msg: "Hello, Ansible!"
```
# Managing Remote Hosts

```
nano ~/.ssh/config
nano inv.yaml
ssh root@192.168.202.21
ssh root@192.168.201.21   -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
mkdir -p group_vars/all_workers
nano group_vars/all_workers/vars.yaml
ansible-inventory -i inv.yaml --graph
ansible-inventory -i inv.yaml --host bastion
ansible-inventory -i inv.yaml --host host21
ansible-inventory -i inv.yaml --host host22
ansible -i inv.yaml -m ping all_workers -u root --ask-pass
nano ansible.cfg
ansible -i inv.yaml -m ping all_workers -u root --ask-pass
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
ansible -i inv.yaml -m ping all_workers -u root
ansible-vault create group_vars/all_workers/vault.yaml
ansible-vault edit group_vars/all_workers/vault.yaml
cat group_vars/all_workers/vault.yaml
ansible -i inv.yaml -m ping all_workers -u root --ask-pass
nano hello.yaml
ansible -i inv.yaml -m ping all_workers --ask-vault-pass
ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
ansible-playbook -i inv.yaml hello.yaml
```

```
cat hello.yaml
- name: Install htop
  hosts: all_workers
  become: yes
  tasks:
    - name: Install htop
      package:
        name: htop
        state: present
```

# Managing Users and Groups

```
nano ~/.ssh/config
nano user.yaml
ansible -i inv.yaml -m ping all_workers --ask-vault-pass
ansible-playbook -i inv.yaml user.yaml --ask-vault-pass
```

```
cat user.yaml
 name: Add users, password and groups
  hosts: all_workers
  become: yes
  vars_files:
    - group_vars/all_workers/userdata.yaml
  tasks:
    - name: Create groups
      group:
        name: "{{ item.name }}"
        state: present
      loop: "{{ mygroups }}"

    - name: Create users
      user:
        name: "{{ item.name }}"
        group: "{{ item.group }}"
        password: "{{ item.password | password_hash('sha512') }}"
        state: present
      loop: "{{ users }}"
```

```
cat group_vars/all_workers/userdata.yaml 
mygroups:
  - name: testg1
  - name: testg2

users:
  - name: jon
    group: testg1
    password: jon5

  - name: bob
    group: testg2
    password: bob5
