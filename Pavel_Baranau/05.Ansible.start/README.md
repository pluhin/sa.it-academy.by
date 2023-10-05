## 1: Setting Up Ansible

1. Install ansible
``` bash
468  sudo apt install python3-pip
469  exit
470  sudo pip3 install ansible
471  ansible --version
472  pip3 install ansible
473  ansible --version
474  --root-user-action=ignore requests
475  clear
476  history
477  pip3 install ansible
478  sudo pip3 install ansible
479  pip3 install ansible
480  ansible --version
481  pip3 install wheel
482  pip3 install virtualenv
483  python3 -m venv venv
484  sudo apt install python3.10-venv
485  history
486  ls
487  md ansible
488  cd ansible
489  sudo python3 -m venv academy-env
490  ls
491  source academy-env/bin/activate
492  clear
493  sudo pip3 install ansible
494  pip3 install ansible
495  python
496  python -m pip install ansible
497  mc
498  sudo python -m pip install ansible
499  source academy-env/bin/activate
500  mc
501  sudo chown -R 1000:1000 ansible/academy-env
502* pip install ansible
503* ansible --version
504* source academy-env/bin/deactivate
505  ansible --version
506  export LC_ALL=C.UTF-8
507  ansible --version
```
2. first.yaml
``` yaml
- hosts: all
  tasks:
    - name: Print message
      debug:
        msg: Hello Ansible World
```


## 2: Managing Remote Hosts
``` yaml
workers:
  hosts:
    ans1:
      ansible_host: 192.168.202.1
    ans2:
      ansible_host: 192.168.202.2
#  vars: add to vault
#    ansible_ssh_private_key_file: /root/.ssh/baranau  
#    ansible_user: root
- hosts: workers
  become: yes
  tasks:
    - name: Install htop, mc, vim
      apt:
        name: "{{ item }}"
        state: latest
      with_items:
        - htop
        - mc
        - vim 
```


## 3: Managing Users and Groups
```yaml
- hosts: workers
  become: yes
  vars_prompt:
    - name: "new_username"
      prompt: "Enter username:"
      private: false
    - name: "new_password"
      prompt: "new_password"
      private: true
      encrypt: sha256_crypt
      confirm: true
    - name: "new_group"
      prompt: "Enter group name"
      private: false

  tasks:
    - name: Creat group
      group:
        name: "{{ new_group }}"
        state: present

    - name: Create a new user
      user:
        name: "{{ new_username }}"
        state: present
        password: "{{ new_password }}"
        groups: "{{ new_group }}"
        append: yes
```
