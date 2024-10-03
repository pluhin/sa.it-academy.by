# Homework Assignment 1: Setting Up Ansible
1. Install Ansible on your local machine or a virtual environment.

Install on my VM  
```bash
fadeev@kirill:~$ cat /etc/*release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04

apt-get update
apt install python3-pip
pip install ansible
git clone https://github.com/ansible/ansible.git
ansible --version
ansible [core 2.17.4]
```
2. Create a directory for your Ansible playbooks and configuration files.
```bash
fadeev@kirill:~$ ls -l
total 56
drwxrwxr-x  2 fadeev fadeev  4096 Oct  2 16:54 ans_files
```
3. Write an Ansible playbook that prints "Hello, Ansible!" to the console.
```bash
nano hello.yml

- name: Print Hello, Ansible!

  hosts: localhost
  tasks:
      - name: Print message

        debug:
          msg: "Hello, Ansible!"
```
4. Run the playbook using the ansible-playbook command and ensure it executes successfully.
  * Running playbook on VM  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/05.Ansible.start/img/1.jpg)

5. Document the installation process and the steps you took to run the playbook.

# Homework Assignment 2: Managing Remote Hosts
1. Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.  
  * Remote targets are Academy VMs, access via Bastion:  
  192.168.202.21  
  192.168.202.22  

2. Ensure SSH access to the remote machine from your local machine.  
 
  * Establish SSH connect with Bastion.  
```bash
fadeev@kirill:~/ans_files$ ssh-copy-id -p 32510 jump_sa@178.124.206.53
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
jump_sa@178.124.206.53's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh -p '32510' 'jump_sa@178.124.206.53'"
and check to make sure that only the key(s) you wanted were added.

fadeev@kirill:~/ans_files$ ssh -p 32510 jump_sa@178.124.206.53
Enter passphrase for key '/home/fadeev/.ssh/id_rsa':
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro
New release '22.04.5 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Tue Oct  1 17:54:11 2024 from 93.84.40.133
jump_sa@jump:~$
```
 
  * Set up proxy to VMs.  
```bash
nano ~/.ssh/config

Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.202.*
        ProxyJump ec_bastion
```
 
  * Check access to VM.  
```bash
fadeev@kirill:~/ans_files$ ssh root@192.168.202.21
Enter passphrase for key '/home/fadeev/.ssh/id_rsa':
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.202.21' (ED25519) to the list of known hosts.
root@192.168.202.21's password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

root@sa-21:~#
```
3. Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.  
  * Install htop:  
```bash
root@sa-21:~# htop
Command 'htop' not found, but can be installed with:
apt install htop

fadeev@kirill:~/ans_files$ cat htop.yaml
- hosts: host21
  become: true
  become_method: sudo
  tasks:
    - name: Install and configure htop
      ansible.builtin.include_role:
        name: htop
```

4. Use inventory files to manage the connection details for the remote host.
```bash
fadeev@kirill:~/ans_files$ cat inv.yaml
all_workers:
  children:
    work_sa:
      hosts:
       host21:
         ansible_host: 192.168.202.21
       host22:
         ansible_host: 192.168.202.22
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa

```
5. Execute the playbook and verify that the package is installed on the remote host.
```bash
ansible-playbook -i inv.yaml htop.yaml -u root --ask-pass
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/05.Ansible.start/img/2.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/05.Ansible.start/img/3.jpg)  
# Homework Assignment 3: Managing Users and Groups
1. Create a playbook to manage users and groups on a remote host.
2. Define tasks to create a new user, assign the user to a specific group, and set a password.
3. Parameterize the playbook to allow dynamic user and group names.
```bash
fadeev@kirill:~/ans_files$ cat users.yaml
- hosts: "{{ group | default('all_workers')}}"
  tasks:

   - name: "Creating group: {{ user_group }}"
     ansible.builtin.group:
       name: "{{ user_group }}"
       state: present

   - name: "Creating user: {{ user_name }}"
     ansible.builtin.user:
       name: "{{ user_name }}"
       group: "{{ user_group }}"
       password: "{{ user_pass | password_hash('sha256') }}"
       state: present
       comment: Managed by Ansible

   - name: Check user
     shell: |
       grep "{{ user_name }}" /etc/passwd
       groups "{{ user_name }}"
       grep "{{ user_name }}" /etc/shadow
       date
     register: out

   - debug:
       msg: "{{ out.stdout_lines }}"

   - name: Removing user {{ user_name }}
     ansible.builtin.user:
       name: "{{ user_name }}"
       state: absent
       remove: yes
     tags: never

```

4. Execute the playbook and verify that the user and group configurations are applied.
```bash
ansible-playbook -i inv.yaml users.yaml -e "user_name=kirill user_group=developers user_pass=dev123!" -u root --ask-pass
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/05.Ansible.start/img/4.jpg)  
 
  * Delete user
```bash
ansible-playbook -i inv.yaml users.yaml -e "user_name=kirill" -u root -t never --ask-pass 
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/05.Ansible.start/img/5.jpg)  
