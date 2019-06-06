## 05.Ansible.Run

1. Create playbook to print out remote host parameters 

* ansible-playbook -i inv.yaml parameters.yaml -t print::os/version,print::mount,print::ram --ask-vault-pass 
```yaml
- hosts: ec_htp
  tasks:
  - name: Print facts
    debug:
      msg: "{{ ansible_facts }}"
    tags:
    - print::facts
  - name: Print os/version
    debug:
      msg: "OS/ver: {{ ansible_facts.distribution }}/{{ansible_facts.distribution_version}}"
    tags:
    - print::os/version
  - name: Print mount
    debug:
      msg: "{{ ansible_facts.mounts[1] }}"
    tags:
    - print::mount
  - name: Print RAM
    debug:
      msg: "Total: {{ ansible_facts.memtotal_mb }}Mb, Free: {{ansible_facts.memfree_mb}}Mb"
    tags:
    - print::ram
```
2. Playbook for the ansible user

* ansible-playbook -i inv.yaml user_create.yaml --ask-vault-pass -b

```yaml
- hosts: sa_ub
  tasks:
  - name: creating user
    user:
      name: "{{ item.name }}"
      comment: "Managed by Ansible"
      state: present
    with_items:
      - { name: 'testuser' }
    tags:
    - user::create

  - name:  authorized key
    authorized_key:
      user: testuser
      key: "{{ lookup('file','/root/.ssh/id_rsa.pub') }}"

  - name: add sudoers privileges
    lineinfile:
      dest: "/etc/sudoers"
      backup: yes
      state: present
      regexp: '^testuser ALL=(ALL)'
      line: 'testuser ALL=(ALL) NOPASSWD: ALL'
      
  - name: remote user
    user:
      name: "{{ item.name }}"
      state: absent
    with_items:
      - { name: 'testuser' }
    tags:
    - user::clear
```
