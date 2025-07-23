# 1: Setting Up Ansible

## 1 Install ansible
```bash
sudo apt update
sudo apt install python3 python3-pip
sudo pip3 install ansible
ansible --version
```

## 2 Configs

### ansible.cfg
```
[defaults]
# inventory = /etc/ansible/hosts
# remote_tmp = /tmp/.ansible/tmp
forks = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
```

### inventory.yaml
```
all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.1
          ansible_user: root
        host2:
          ansible_host: 192.168.202.2
          ansible_user: root
jump_sa:
  vars:
    env: 'it-academy'
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```


## 3 playbook
```yaml
- hosts: all_workers
  gather_facts: false
  tasks:    
    - name: Print message
      command: echo "Hello world"
      register: output
    - debug: var=output.stdout_lines
    
    - name: Print message 2
      debug:
        msg: "Hello world"
```

## 4 Command
```bash
ansible-playbook -i inventory.yaml hello_world.yaml
```

# 2: Managing Remote Hosts

## 3 playbook
```
- hosts: all_workers
  gather_facts: false
  become: true
  tasks:
    - name: Update apt cache
      ansible.builtin.apt:
        update_cache: yes

    - name: Install package {{ package_name }}
      ansible.builtin.apt:
        name: "{{ package_name }}"
        state: latest

    - name: Check package installed
      shell: |
        which "{{ package_name }}"
      register: out
    - debug:
       msg: "{{ out.stdout_lines }}"
```

## 4: Command
```bash
ansible-playbook -i inventory.yaml install_package.yaml -e package_name=vim
```


# 3: Managing Users and Groups

## 3: playbook
```
- hosts: all_workers
  gather_facts: false
  become: yes
  tasks:
    - name: Add new user {{ new_user }}
      user:
        name: "{{ new_user }}"
        state: present
        shell: "/bin/bash"
        password: "{{ 'password' | password_hash('sha512') }}"
      register: out
    - debug:
       msg: "{{ out }}"
       
    - name: Check user
      shell: |
        grep "{{ new_user }}" /etc/passwd
        grep "^{{ new_user }}*" /etc/group
      register: out
    - debug:
       msg: "{{ out.stdout_lines }}"
 
    - name: Create a group {{ user_group }}
      group:
        name: "{{ user_group }}"
        state: present
      register: out
    - debug:
       msg: "{{ out }}"
       
    - name: Check group exists
      shell: |
        grep "^{{ user_group }}*" /etc/group
      register: out
    - debug:
       msg: "{{ out.stdout_lines }}"   
       
    - name: Add a user {{ new_user }} to a group {{ user_group }}
      user:
        name: "{{ new_user }}"
        groups: "{{ user_group }}, sudo"
        append: yes
      register: out
    - debug:
       msg: "{{ out }}"
       
    - name: Check user in group
      shell: |
        id "{{ new_user }}"
      register: out
    - debug:
       msg: "{{ out.stdout_lines }}"    
```

## 4 Command
```bash
ansible-playbook -i inventory.yaml create_user.yaml -e new_user=andrey -e user_group=devops
```