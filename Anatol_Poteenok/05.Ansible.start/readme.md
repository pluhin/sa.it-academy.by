*Assignment 1: Install Ansible && Run test Playbook

``` bash
   7  pipx install --include-deps ansible
    8  ansible --version
    9  pipx ensurepath
   10  ansible
   11  sudi pipx install --include-deps ansible
   12  sudo pipx install --include-deps ansible
   13  ansible
   14  python3 -m pip -V
   15  python -m ensurep
   16  python3 -m pip -V
   17  python3 -m ensurepip --default-pip
   18  python3 -m ensurepip --default-pip
   19  python3 -m ensurepip --default-pip
   20  sudo python3 -m ensurepip --default-pip
   21  sudo apt update
   22  sudo apt install python3-pip
   23  sudo pacman -S python-pip
   24  history
   25  python3 -m pip -V
   26  curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   27  python3 get-pip.py --user
   28  sudo python3 get-pip.py --user
   29  pwd
   30  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
   31  source ~/.bashrc
   32  cls
   33  sudo apt install pipx
   34  python3 -m pip install --user ansible
   35  cls
   36  clear
   37  python3 -m pip install --user ansible
   38  python3 -m pipx ensurepath
   39  python3 -m pipx ensurepath --force
   40  source ~/.bashrc
   41  pipx install ansible
   42  ansible
   43  ansible --version
   44  sudo apt install mc
   45  mc
   46  mkdir -p ~/ansible-playbooks/{inventories,playbooks,roles,group_vars,host_vars}
   47  ls
   48  pwd
   49  cd ansible-playbooks/
   50  vim hello.yml
   51  cat hello.yml
   52  ls
   53  move hello.yml  playbooks
   54  mv hello.yml  playbooks
   55  cd playbooks/
   56  ls
   57  ls -lh
   58  cd ..
   59  ansible-playbook playbooks/hello.yml
   60  ls -lh
   61  cd inventories/
   62  ls
   63  cat > hosts << 'EOF'
[local]
localhost a


   64  ls
   65  vi hosts
   66  cat hosts
   67  vi hosts
   68  cd ..
   69  ansible-playbook playbooks/hello.yml
   70  vim playbooks/hello.yml
   71  ansible-playbook playbooks/hello.yml
   72  ls
   73  vim inventories/hosts
   74  ansible-playbook playbooks/hello.yml
   75  cd ~
   76  tree ansible-playbooks 2>/dev/null || find ansible-playbooks -type f
   77  cd ansible-playbooks/
   78  vim ansible.cfg
   79  ansible-playbook playbooks/hello.yml
   80  history
```
Result

```

PLAY [Hi from Ansible] *****************************************************************************

TASK [Вывести сообщение "Hello, Ansible!"] ****************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP ************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

# assigment 2
install vim
``` bash
ansible-playbook -i inv.yaml vim_install.yaml -u root
```

``` bash
PLAY [Install vim on Ubuntu] ******************************************************************************

TASK [Gathering Facts] ************************************************************************************
Thursday 12 February 2026  08:18:48 +0000 (0:00:00.010)       0:00:00.010 *****
[WARNING]: Host 'host1' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [host1]

TASK [Install vim] ****************************************************************************************
Thursday 12 February 2026  08:18:50 +0000 (0:00:02.042)       0:00:02.053 *****
changed: [host1]

TASK [Verify vim installation] ****************************************************************************
Thursday 12 February 2026  08:19:14 +0000 (0:00:24.033)       0:00:26.086 *****
ok: [host1]

TASK [Show vim version] ***********************************************************************************
Thursday 12 February 2026  08:19:15 +0000 (0:00:00.728)       0:00:26.814 *****
ok: [host1] => {
    "msg": "✅ Vim installed: VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Apr 02 2025 12:39:01)"
}

PLAY RECAP ************************************************************************************************
host1                      : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


TASKS RECAP ***********************************************************************************************
Thursday 12 February 2026  08:19:15 +0000 (0:00:00.015)       0:00:26.830 *****
===============================================================================
Install vim --------------------------------------------------------------------------------------- 24.03s
Gathering Facts ------------------------------------------------------------------------------------ 2.04s
Verify vim installation ---------------------------------------------------------------------------- 0.73s
Show vim version ----------------------------------------------------------------------------------- 0.02s

PLAYBOOK RECAP ********************************************************************************************
Playbook run took 0 days, 0 hours, 0 minutes, 26 seconds

```


#  assigment 3

``` bash 
ansible-playbook -i inv.yaml cred.yaml -u root

```

 cred.yaml

``` yaml

- name: Manage users and groups on remote host
  hosts: host1
  become: yes
  vars_prompt:
    - name: new_username                                                                                         prompt: "Enter username to create"                                                                         private: no                                                                                                default: "testuser"                                                                                                                                                                                                 - name: new_groupname                                                                                        prompt: "Enter group name"                                                                                 private: no                                                                                                default: "testgroup"                                                                                                                                                                                                - name: plain_password                                                                                       prompt: "Enter password for the user"                                                                      private: yes                                                                                               confirm: yes                                                                                               default: "TestPassword123"                                                                                                                                                                                        tasks:                                                                                                       - name: Create a new group                                                                                   group:                                                                                                       name: "{{ new_groupname }}"                                                                                state: present                                                                                                                                                                                                    - name: Generate password hash on remote host                                                                command: "python3 -c 'import crypt; print(crypt.crypt(\"{{ plain_password }}\", crypt.mksalt(crypt.METHOD_SHA512)))'"
      register: password_hash
      changed_when: false
      no_log: true

    - name: Create a new user
      user:
        name: "{{ new_username }}"
        group: "{{ new_groupname }}"
        password: "{{ password_hash.stdout }}"
        state: present
        shell: /bin/bash
        create_home: yes

    - name: Verify user creation
      command: "id {{ new_username }}"
      register: verification
      changed_when: false

    - name: Display verification result
      debug:
        var: verification.stdout
```

result:


``` bash
ansible-playbook -i inv.yaml cred1.yaml -u root
Enter username to create [testuser]: testuser1
Enter group name [testgroup]: testgroup1
Enter password for the user [TestPassword123]:
confirm Enter password for the user [TestPassword123]:

PLAY [Manage users and groups on remote host] *************************************************************

TASK [Gathering Facts] ************************************************************************************
Thursday 12 February 2026  06:41:45 +0000 (0:00:33.271)       0:00:33.271 *****
[WARNING]: Host 'host1' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [host1]

TASK [Create a new group] *********************************************************************************
Thursday 12 February 2026  06:41:47 +0000 (0:00:02.184)       0:00:35.455 *****
changed: [host1]

TASK [Generate password hash on remote host] **************************************************************
Thursday 12 February 2026  06:41:48 +0000 (0:00:00.783)       0:00:36.238 *****
ok: [host1]

TASK [Create a new user] **********************************************************************************
Thursday 12 February 2026  06:41:49 +0000 (0:00:00.769)       0:00:37.007 *****
changed: [host1]

TASK [Verify user creation] *******************************************************************************
Thursday 12 February 2026  06:41:49 +0000 (0:00:00.850)       0:00:37.858 *****
ok: [host1]

TASK [Display verification result] ************************************************************************
Thursday 12 February 2026  06:41:50 +0000 (0:00:00.639)       0:00:38.498 *****
ok: [host1] => {
    "verification.stdout": "uid=1001(testuser1) gid=1001(testgroup1) groups=1001(testgroup1)"
}

PLAY RECAP ************************************************************************************************
host1                      : ok=6    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


TASKS RECAP ***********************************************************************************************
Thursday 12 February 2026  06:41:50 +0000 (0:00:00.019)       0:00:38.517 *****
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------ 2.18s
Create a new user ---------------------------------------------------------------------------------- 0.85s
Create a new group --------------------------------------------------------------------------------- 0.78s
Generate password hash on remote host -------------------------------------------------------------- 0.77s
Verify user creation ------------------------------------------------------------------------------- 0.64s
Display verification result ------------------------------------------------------------------------ 0.02s

PLAYBOOK RECAP ********************************************************************************************
Playbook run took 0 days, 0 hours, 0 minutes, 38 seconds
```