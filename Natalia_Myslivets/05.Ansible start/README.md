# HA1

### Install Ansible,Create a directory whith conf 

```bash
apt update
pip3 install ansible
apt install python3-pip
pip3 install ansible
mkdir labs
cd labs/
ansible --version
vim my_inventory.yml
vim ansible.cfg
ansible --version
```
### Ansible playbook that prints "Hello, Ansible!"

```yaml
- name: Hello Playbook
  hosts: localhost

  tasks:
  - name: Print Hello
    ansible.builtin.shell: echo "Hello, Ansible!"
    register: output
  - name: Debug registered var
    ansible.builtin.debug: 
      var: output.stdout_lines  
```

### Run the playbook using the ansible-playbook command and ensure it executes successfully

```
vim hello_pb.yml
ansible-playbook --syntax-check hello_pb.yml
ansible-playbook hello_pb.yml
```

# HA2

### Ansible playbook that install htop

```yaml
- name: Install htop
  hosts: lab2

  tasks:
  - name: Install
    ansible.builtin.apt:
      name: htop
      update_cache: yes
      state: latest
```

### inventory:

```
lab2:
  hosts:
    192.168.202.14
```

### Execute the playbook and verify that the package is installed

```
ansible-playbook --syntax-check install_htop.yml
ansible-playbook install_htop.yml
ansible-playbook install_htop.yml -v
ansible -m command -a "htop -v" lab2
```

# HA3

### Create a playbook to manage users and groups (dynamic) on a remote host

```yaml
- name: User_criation
  hosts: lab2

  tasks:
  - name: Create group
    ansible.builtin.group:
      name: {{ group_name }}
      state: present
  - name: Create user
    ansible.builtin.user:
      name: "{{ user_name }}"
      append: true
      groups: "{{ group_name }}"
      create_home: true
      password: "{{ 'QwertY13' | password_hash('sha512') }}"
      shell: /bin/bash
      state: present
```

### Commands to verify that the user and group configurations are applied

```
ansible-playbook --syntax-check d_user_add.yml
ansible-playbook d_user_add.yml -e "group_name=test user_name=test"
ansible -m command -a "id test" lab2
```