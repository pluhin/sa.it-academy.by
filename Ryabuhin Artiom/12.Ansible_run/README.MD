# 12.Ansible_run

### omr.yaml (OS VERSION, mnt, RAM cap)

```
- hosts: ec_ws
  #gather_facts: true
  #strategy: free
  #serial: 2
#  vars:
#    var_01: 
#    var_02: 
#    var_03: 
  tasks:
    - name: OS VERSION
      debug:
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"
    - name: size total (ALL)
      debug:
        msg: "{{ ansible_facts.mounts[0].size_total }}"
    - name: mnt
      debug:
        msg: "{{ ansible_facts.mounts[0] }}"
      tags:
        - mounts      
    - name: OS VERSION
      debug:
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"
      tags:
        - os_ver
    - name: RAM cap
      debug:
        msg: "{{ ansible_facts.memory_mb.real }}"
      tags:
        - RAM     

```

### add_user.yaml

#### changes is remote hosts

```
sudo passwd user (remote)
ssh-copy-id user@192.168.202.14
sudo passwd -d user (remote)
```

```
---
- hosts: ec_ws
#  become: True
  vars:
    user_to_add: user
  tasks:
  - name: Print user name to add
    debug:
      msg: "You requested user {{ user_to_add }}"
  - name: Creating user {{ user_to_add }}
    user:
      name: "{{ user_to_add }}"
      comment: Managed by ansible
      state: present
  - name: user Authentication
    lineinfile:
      path: /etc/ssh/sshd_config
#      path: /home/user/.ssh/id_rsa      
      state: present
      line: 'Match User user PasswordAuthentication no'
      insertbefore: BOF
  - name: Add user user for upgrade command
    when: ansible_distribution == 'CentOS'
    lineinfile:
      path: /etc/sudoers
      state: present
      line: 'user ALL=(ALL) NOPASSWD: /usr/bin/yum'
      insertbefore: BOF
  - name: Add user user for upgrade command
    when: ansible_distribution == 'Ubuntu'
    lineinfile:
      path: /etc/sudoers
      state: present
      line: 'user ALL=(ALL) NOPASSWD: /usr/bin/apt'
      insertbefore: BOF
  - name: Check creating user
    shell: |
      grep "{{ user_to_add }}" /etc/passwd
      date
      env
    register: out
  - debug:
      msg: "{{ out.stdout_lines }}"
  - name: System upgrade from user user CentOS
    remote_user: user
    when: ansible_distribution == 'CentOS'
    shell: |
      sudo yum upgrade -y
  - name: System upgrade from user user Ubuntu
    remote_user: user
    when: ansible_distribution == 'Ubuntu'
    shell: |
      sudo apt upgrade -y
```

### BASH omr.yaml

```

user@u_ssh_k8s:~/ansible$ ansible-playbook omr.yaml -u root

PLAY [ec_ws] **********************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************
ok: [192.168.202.13]
ok: [192.168.202.14]

TASK [OS VERSION] *****************************************************************************************************************
ok: [192.168.202.13] => {
    "msg": "CentOS | 7.9"
}
ok: [192.168.202.14] => {
    "msg": "Ubuntu | 18.04"
}

TASK [size total (ALL)] ***********************************************************************************************************
ok: [192.168.202.13] => {
    "msg": "21003583488"
}
ok: [192.168.202.14] => {
    "msg": "21003583488"
}

TASK [mnt] ************************************************************************************************************************
ok: [192.168.202.13] => {
    "msg": {
        "block_available": 4667696,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 460132,
        "device": "/dev/loop12",
        "fstype": "ext4",
        "inode_available": 1288947,
        "inode_total": 1310720,
        "inode_used": 21773,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19118882816,
        "size_total": 21003583488,
        "uuid": "N/A"
    }
}
ok: [192.168.202.14] => {
    "msg": {
        "block_available": 4556018,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 571810,
        "device": "/dev/loop13",
        "fstype": "ext4",
        "inode_available": 1283811,
        "inode_total": 1310720,
        "inode_used": 26909,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18661449728,
        "size_total": 21003583488,
        "uuid": "N/A"
    }
}

TASK [OS VERSION] *****************************************************************************************************************
ok: [192.168.202.13] => {
    "msg": "CentOS | 7.9"
}
ok: [192.168.202.14] => {
    "msg": "Ubuntu | 18.04"
}

TASK [RAM cap] ********************************************************************************************************************
ok: [192.168.202.13] => {
    "msg": {
        "free": 3920,
        "total": 4096,
        "used": 176
    }
}
ok: [192.168.202.14] => {
    "msg": {
        "free": 3722,
        "total": 4096,
        "used": 374
    }
}

PLAY RECAP ************************************************************************************************************************
192.168.202.13             : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
192.168.202.14             : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```

### BASH add_user.yaml

```
user@u_ssh_k8s:~/ansible$ ansible-playbook add_user.yaml -u root

PLAY [ec_ws] **********************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************
ok: [192.168.202.13]
ok: [192.168.202.14]

TASK [Print user name to add] *****************************************************************************************************
ok: [192.168.202.13] => {
    "msg": "You requested user user"
}
ok: [192.168.202.14] => {
    "msg": "You requested user user"
}

TASK [Creating user user] *********************************************************************************************************
ok: [192.168.202.13]
ok: [192.168.202.14]

TASK [user Authentication] ********************************************************************************************************
ok: [192.168.202.13]
ok: [192.168.202.14]

TASK [Add user user for upgrade command] ******************************************************************************************
skipping: [192.168.202.14]
ok: [192.168.202.13]

TASK [Add user user for upgrade command] ******************************************************************************************
skipping: [192.168.202.13]
ok: [192.168.202.14]

TASK [Check creating user] ********************************************************************************************************
changed: [192.168.202.13]
changed: [192.168.202.14]

TASK [debug] **********************************************************************************************************************
ok: [192.168.202.13] => {
    "msg": [
        "myuser:x:1000:1000:Managed by ansible:/home/myuser:/bin/bash",
        "user:x:1001:1001:Managed by ansible:/home/user:/bin/bash",
        "Sun Jan  3 14:21:49 UTC 2021",
        "XDG_SESSION_ID=7723",
        "TERM=xterm",
        "SHELL=/bin/bash",
        "SSH_CLIENT=192.168.204.82 55458 22",
        "SSH_TTY=/dev/pts/3",
        "USER=root",
        "LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:",
        "MAIL=/var/mail/root",
        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin",
        "PWD=/root",
        "LANG=en_US.UTF-8",
        "SHLVL=3",
        "HOME=/root",
        "LOGNAME=root",
        "SSH_CONNECTION=192.168.204.82 55458 192.168.202.13 22",
        "LESSOPEN=||/usr/bin/lesspipe.sh %s",
        "XDG_RUNTIME_DIR=/run/user/0",
        "_=/usr/bin/env"
    ]
}
ok: [192.168.202.14] => {
    "msg": [
        "myuser:x:1000:1000:Managed by ansible:/home/myuser:/bin/sh",
        "user:x:1001:1001:Managed by ansible:/home/user:/bin/sh",
        "Sun Jan  3 14:21:49 UTC 2021",
        "MAIL=/var/mail/root",
        "USER=root",
        "SSH_CLIENT=192.168.204.82 34918 22",
        "SHLVL=1",
        "HOME=/root",
        "SSH_TTY=/dev/pts/3",
        "LOGNAME=root",
        "_=/bin/sh",
        "XDG_SESSION_ID=7722",
        "TERM=xterm",
        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin",
        "XDG_RUNTIME_DIR=/run/user/0",
        "LANG=C",
        "SHELL=/bin/bash",
        "PWD=/root",
        "SSH_CONNECTION=192.168.204.82 34918 192.168.202.14 22"
    ]
}

TASK [System upgrade from user user CentOS] ***************************************************************************************
skipping: [192.168.202.14]
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
changed: [192.168.202.13]

TASK [System upgrade from user user Ubuntu] ***************************************************************************************
skipping: [192.168.202.13]
changed: [192.168.202.14]

PLAY RECAP ************************************************************************************************************************
192.168.202.13             : ok=8    changed=2    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
192.168.202.14             : ok=8    changed=2    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

```
