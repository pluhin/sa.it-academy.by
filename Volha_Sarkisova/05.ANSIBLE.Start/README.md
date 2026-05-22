**УСТАНОВКА ANSIBLE
    1  sudo apt update && sudo apt upgrade -y
    2  sudo apt install ansible -y
    3  ansible --version

**HELLO
kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/05.ANSIBLE.Start$ ansible-playbook -i inv.yaml playbooks/hello.yaml
PLAY [First playbook - print hello message] ****************************************************************************
TASK [Print Hello, Ansible!] *******************************************************************************************
ok: [localhost] => {
    "msg": "Hello, Ansible!"
}
PLAY RECAP *************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


**УСТАНОВКА HTOP
kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/05.ANSIBLE.Start$ ansible-playbook -i inv.yaml playbooks/htop.yaml --ask-vault-pass
Vault password:
PLAY [Install htop on PostgreSQL hosts] ********************************************************************************
TASK [Gathering Facts] *************************************************************************************************
ok: [host13]
TASK [Validate htop configuration] *************************************************************************************
ok: [host13] => {
    "msg": [
        "Target host: 192.168.202.13",
        "Package to install: ['htop']"
    ]
}
TASK [Update apt cache] ************************************************************************************************
changed: [host13]
TASK [Install htop package] ********************************************************************************************
changed: [host13]
TASK [Get htop version] ************************************************************************************************
ok: [host13]
TASK [Set htop version fact] *******************************************************************************************
ok: [host13]
TASK [Display htop version] ********************************************************************************************
ok: [host13] => {
    "msg": "htop installed version: htop 3.0.5"
}
TASK [Check htop binary location] **************************************************************************************
ok: [host13]
TASK [Show htop path] **************************************************************************************************
ok: [host13] => {
    "msg": "htop binary: /usr/bin/htop"
}
PLAY RECAP *************************************************************************************************************
host13                     : ok=9    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

**ПРОВЕРКА ВЕРСИИ HTOP
kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/05.ANSIBLE.Start$ ssh root@192.168.202.13
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '24.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.
Last login: Fri May 22 11:37:55 2026 from 192.168.204.82
root@sa-13:~# htop --version
htop 3.0.5

**НОВЫЙ ПОЛЬЗОВАТЕЛЬ И ГРУППА
kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/05.ANSIBLE.Start$ ansible-playbook -i inv.yaml playbooks/user_group.yaml --ask-vault-pass
Vault password:
PLAY [Quick user management] *******************************************************************************************
TASK [Gathering Facts] *************************************************************************************************
ok: [host13]
TASK [Create group] ****************************************************************************************************
changed: [host13]
TASK [Create user with group] ******************************************************************************************
changed: [host13]
TASK [Add user to sudo group] ******************************************************************************************
changed: [host13]
TASK [Verify user] *****************************************************************************************************
ok: [host13]
TASK [Show user info] **************************************************************************************************
ok: [host13] => {
    "msg": "uid=1000(newuser) gid=1000(newgroup) groups=1000(newgroup),27(sudo)"
}
PLAY RECAP *************************************************************************************************************
host13                     : ok=6    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

kryvol@99-SarkisovaO:/mnt/c/Users/99-SarkisovaOV/05.ANSIBLE.Start$ ssh newuser@192.168.202.13
newuser@192.168.202.13's password:
Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '24.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.
The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
newuser@sa-13:~$id
uid=1000(newuser) gid=1000(newgroup) groups=1000(newgroup),27(sudo)