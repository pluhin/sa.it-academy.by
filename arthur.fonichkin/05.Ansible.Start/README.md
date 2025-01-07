# Ansible.Start

## First task

### History:
```bash
  113  mkdir ansible
  114  cd ansible/
  143  vim task1_local_pring.yaml
  144  cat task1_local_pring.yaml
  145  ansible-playbook task1_local_pring.yaml
  148  history
```

### Yml playbook:
```yaml
- name: Task1 local print
  hosts: localhost
  gather_facts: False
  vars:
    msg_text: "Hello, Ansible!"
  tasks:
    - name: Print
      debug:
        msg: "{{ msg_text }}"
```

## Second task

### History:
```bash
  146  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  147  ssh -p '32510' 'jump_sa@178.124.206.53'
  148  vim inv.yaml
  149  vim task2.yaml
  150  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  151  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  152  ansible -i inv.yaml -m ping -u root all_workers
  153  vim inv.yaml
  154  ansible -i inv.yaml -m ping -u root all_workers
  155 ansible-playbook -i inv.yaml task2.yaml
  156 history 
```

### Yaml inventory:
```yaml
all_workers:
  vars:
    ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"'
  children:
    work_sa:
      hosts:
        host15:
          ansible_host: 192.168.202.15
        host16:
          ansible_host: 192.168.202.16
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

### Yaml playbook:
```yaml
- name: Install a basic package on Ubuntu
  hosts: all_workers
  become: true
  tasks:
    - name: Update the package manager cache
      ansible.builtin.apt:
        update_cache: yes

    - name: Install vim
      ansible.builtin.apt:
        name: vim
        state: present

    - name: Verify vim installation
      ansible.builtin.command:
        cmd: vim --version
      register: vim_version_output

    - name: Display vim version
      ansible.builtin.debug:
        var: vim_version_output.stdout
```

## Third task

### Yaml playbook:
```yaml
- name: Manage two users and groups on a remote host
  hosts: all_workers
  become: true
  vars:
    users:
      - name: userA1
        group: groupA1
        password: "{{ '54321' | password_hash('sha512') }}"
      - name: userB1
        group: groupB1
        password: "{{ '12345' | password_hash('sha512') }}"
  tasks:
    - name: Ensure groups exist
      ansible.builtin.group:
        name: "{{ item.group }}"
        state: present
      loop: "{{ users }}"

    - name: Ensure users exist and are assigned to groups
      ansible.builtin.user:
        name: "{{ item.name }}"
        groups: "{{ item.group }}"
        append: true
        state: present
        password: "{{ item.password }}"
      loop: "{{ users }}"

    - name: Verify user creation
      ansible.builtin.command:
        cmd: id "{{ item.name }}"
      loop: "{{ users }}"
      register: user_check_output
      ignore_errors: true

    - name: Display verification results
      ansible.builtin.debug:
        msg: "{{ item.stdout }}"
      loop: "{{ user_check_output.results }}"
```
