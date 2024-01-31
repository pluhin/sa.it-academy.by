## 05.Ansible

---

### 1. Setting Up Ansible

---

- Install Ansible on your local machine or a virtual environment.
    ```bash
    brew install ansible
    ```

- Create a directory for your Ansible playbooks and configuration files.

    ```bash
    mkdir 05.Ansible
    ```

    ```bash
    # ansible.cfg
  
    [defaults]
    # inventory       = /etc/ansible/hosts
    # remote_tmp      = /tmp/.ansible/tmp
    forks             = 3
    host_key_checking = false
    callbacks_enabled = profile_tasks, timer
    ```
  
    ```yaml
    # inv.yaml

    all_workers:
      children:
        work_sa:
          hosts:
            host4:
              ansible_host: 192.168.202.4
    
    jump_sa:
      vars:
        env: "it-academy"
      hosts:
        bastion:
          ansible_host: 178.124.206.53
          ansible_user: jump_sa
    ```

    ```yaml
    # group_var/all_workers/vars.yaml

    jump_sa_user: "{{ hostvars['bastion'].ansible_user }}"
    jump_sa_host: "{{ hostvars['bastion'].ansible_host }}"
    ansible_ssh_common_args: "-o ProxyCommand='ssh -W %h:%p -q {{ jump_sa_user }}@{{ jump_sa_host }} -p 32510'"
    ```
  
- Write an Ansible playbook that prints "Hello, Ansible!" to the console.

    ```yaml
    # hello_playbook.yaml
    - hosts: host4
      gather_facts: False
    
      tasks:
        - name: Hello task
          debug:
            msg: "Hello, Ansible!"
    ```

- Run the playbook using the ansible-playbook command and ensure it executes successfully.    

    ```bash
    ansible-inventory -i inv.yaml --host host4
    ```

### 2. Managing Remote Hosts

---

- Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.
    ```bash
    ssh-copy-id -p 32510 jump_sa@178.124.206.53
    ```

    ```bash
    nano ~/.ssh/config
    ```
    
    ```bash
    # ~/.ssh/config
    
    Host ec_bastion
            User jump_sa
            Port 32510
            HostName 178.124.206.53
    Host 192.168.201.* 192.168.202.* 192.168.203.* 192.168.208.*
            ProxyJump ec_bastion
    ```
  
    ```bash
    ssh-copy-id root@192.168.202.4
    ```
  
- Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.

    ```yaml
    # install_packages_playbook.yaml
  
    - hosts: host4
      gather_facts: False
      tasks:
        - name: Install htop package
          package:
            name: htop
            state: present
        - name: Install vim package
          package:
            name: vim
            state: present
    ```

- Use inventory files to manage the connection details for the remote host.

    ```bash
    ansible-playbook -i inv.yaml install_packages_playbook.yaml -u root
    ```

### 3. Managing Users and Groups

- Create vault variables and decrypt them
    ```bash
    nano group_var/all_workers/user_vault.yaml
    ```
    
    ```yaml
    user_password: "Qwerty_123"
    ```
    
    ```bash
    ansible-vault encrypt group_var/all_workers/user_vault.yaml 
    ```

- Create user playbook and execute it

    ```bash
    nano create_user_playbook.yaml
    ```
    
    ```yaml
    - name: Create user and group
      hosts: host4
      gather_facts: False
      become: yes
    
      vars_files:
        - group_var/all_workers/user_vault.yaml
    
      tasks:
        - name: Create group
          user:
            name: it-academy-users
            state: present
    
        - name: Create user
          user:
            name: Danila
            state: present
            password: "{{ user_password | password_hash('sha512') }}"
    ```
    
    ```bash
    ansible-playbook -i inv.yaml create_user_playbook.yaml -u root --ask-vault-pass
    ```

- Delete user playbook and execute it

    ```bash
    nano delete_user_playbook.yaml
    ```
    
    ```yaml
    - name: Delete user and group
      hosts: host4
      gather_facts: False
      become: yes
    
      tasks:
        - name: Delete group
          user:
            name: it-academy-users
            state: absent
    
        - name: Delete user
          user:
            name: Danila
            state: absent
    ```
    
    ```bash
    ansible-playbook -i inv.yaml create_user_playbook.yaml -u root
    ```
