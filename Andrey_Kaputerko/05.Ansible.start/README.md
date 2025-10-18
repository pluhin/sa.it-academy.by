#### Exercise 01
## Steps
1. Create playbook01.yaml and write a code below:
``` yaml
- hosts: localhost
  vars:
    a: "Hello, Ansible!"
  tasks:
    - name: Print hello
      debug: 
        msg: "{{a}}"
```
2. Then use command ```ansible-playbook playbook01.yaml``` in terminal

#### Exercise 02
## Uses:
 IT-Academy DC as remote target
## Steps:
1. Created new ssh key, created new ansible inventory with code below
```yaml
itacademy_hosts:
 children:  
   hosts:
    host7:
     ansible_host: 192.168.202.7
    host8:
     ansible_host: 192.168.202.8
jump_sa:
 hosts:
  bastion:
   ansible_host: 178.124.206.53
   ansible_user: jump_sa
```
2. And var file with user name at group_vars/itacademy_hosts/user.yaml
```yaml
ansible_user: root
```
3. Added package install ansible script that's install htop
```yaml
- hosts: itacademy_hosts
  tasks:
    - name: Install htop
      ansible.builtin.package:
        name: htop
        state: present
```
4. used command 'ansible-playbook -i inv.yaml playbook02.yaml' that installed htop to IT-Academy DC's 

#### Exercise 03
## Uses:
IT-Academy DC as remote target
Ansible inventory file from Exercise 02
## Steps:
1. Created new playbook with code below
```yaml
- hosts: itacademy_hosts
  vars:
    group_to_add: "group_name"
    user_to_add: "user_name"
    password: "password"
  tasks:
    - name: Print variables
      debug:
        msg: "You requested user = {{ user_to_add }} with password = {{ password }}, and group = {{ group_to_add }}"
    - name: Creating group - {{ group_to_add }}
      group:
        name: "{{ group_to_add }}"
        state: present
    - name: Creating user - {{ user_to_add }}
      user:
        name: "{{ user_to_add }}"
        group: "{{ group_to_add }}"
        state: present
    - name: Changes {{ user_to_add }} password to {{ password }}
      user:
        name: "{{ user_to_add }}"
        password: "{{ password | password_hash('sha512') }}"
        state: present
    - name: Remove user {{ user_to_add }}
      user: 
        name: "{{ user_to_add }}"
        state: absent
    - name: Remove group {{ group_to_add }}
      group:
        name: "{{ group_to_add }}"
        state: absent
```
2. Checked for functionality by adding check step into code
```yaml
- name: Check
  shell: |
    grep "{{ user_to_add }}" /etc/shadow
    date
  register: out
- debug:
    msg: "{{ out.stdout_lines }}"  
```
#### P.S. Я видел что вы просили короткую версию, но мне было слишком скучно и я все расписал с кодом)