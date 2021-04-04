 ### variables user and pass (SHA256)
```yaml
   vars:    
     - user_password: '$6$G60EE/gYsN2$BcEjizSkfW.p4HxsNYHmPP77mZf45/MCHpMTa/fUmcC47KXVCJ.mItzbpsT8wOaVQHQEwjEXrCfzctUqBe2pC0'
       user: second
   gather_facts: yes
```
### add new user pass and shell
```yaml
- name: Add a new user  
  user:
       name="{{ user }}"
       password={{ user_password }}
       shell="/bin/bash"     
```
### user example

```yaml
- name: Add the user 'johnd' with a specific uid and a primary group of 'admin'
  ansible.builtin.user:
    name: johnd
    comment: John Doe
    uid: 1040
    group: admin

- name: Add the user 'james' with a bash shell, appending the group 'admins' and 'developers' to the user's groups
  ansible.builtin.user:
    name: james
    shell: /bin/bash
    groups: admins,developers
    append: yes

- name: Remove the user 'johnd'
  ansible.builtin.user:
    name: johnd
    state: absent
    remove: yes
```
### create file second and write a string
```yaml
- name: Add test user to the sudoers
  copy:
       dest: "/etc/sudoers.d/{{ user }}"
       content: "{{ user }} ALL=(ALL) NOPASSWD: ALL"
```       
## copy example
```yaml
tasks:
- name: Copy file to a remote machine
  copy:
  src: ~/devops.txt
  dest: /tmp
  force: yes
  
  copy the file with different permissions
  - copy:
  src: /srd/myfiles/abc.conf
  dest: /etc/abc.conf
  owner: abc
  group: abc
  mode: "u=rw,g=r,o=r"
```
### add 2 line end the file and add notify to handler
```yaml
- name: Disable Password Authentication
  lineinfile:
        dest=/etc/ssh/sshd_config
        line="Match user {{ user }}"
        state=present
        backup=yes

      
- name: Disable Password Authentication
  lineinfile:
        dest=/etc/ssh/sshd_config
        line="PasswordAuthentication no"
        state=present
        backup=yes
  notify:
    - restart ssh
```
### lineinfile example
```yaml
- name: add a new string at the beginning of the file
    lineinfile: dest=/test/test.conf
                regexp='^This'
                insertbefore=BOF
                line='This is no longer a comment'
   
   
- name: add a string to the new file
    lineinfile: dest=/test/test.conf
                regexp='^'
                line='Hello, World!'
                state=present   

  - name: create a new file with lineinfile
    lineinfile: dest=/test/test.conf 
                regexp='^' line=''
                state=present
                create=True          
          

```
### add command in shell apt for Debian. yum for Centos
```yaml
- name: Test upgrade Ubuntu system by {{ user }}
  remote_user: "{{ user }}"
  shell: sudo apt upgrade -y
  when: ansible_facts['os_family'] == "Debian"
  register: out

- name: Test upgrade Centos system by {{ user }}
  remote_user: "{{ user }}"
  shell: sudo yum upgrade -y
  when: ansible_facts['distribution'] == "CentOS"
  register: out
```
### shell example
```yaml
- name: Check Date with Shell command
  shell: date
        
      
- name: Execute a command using the shell module
  become: true
  become_user: root
  shell: apt-get install clamav -y
    
    
```
### Resstart sshd 
```yaml
handlers:
   - name: restart ssh
     service:
       name=sshd
       state=restarted
```
## Handlers example
```yaml
tasks:
  - name: Set host variables based on distribution
    include_vars: "{{ ansible_facts.distribution }}.yml"

handlers:
  - name: Restart web service
    ansible.builtin.service:
      name: "{{ web_service_name | default('httpd') }}"
      state: restarted
      
```      
