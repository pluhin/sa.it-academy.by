# 1. Homework Assignment 1: Setting Up Ansible
## 1. Install Ansible on your local machine or a virtual environment.

Команды, которые были использованы для утстановки Ansible
```
   27  apt update
   28  pip
   29  apt install python3-pip
   30  sudo pip3 install ansible

```
## 2. Create a directory for your Ansible playbooks and configuration files.

```
mkdir 05.Ansible
cd 05.Ansible
nano inv.yaml

```
inv.yaml

```
all_workers:
  children:
    work_sa:
      hosts:
        host1:
          ansible_host: 192.168.202.1
        host2:
          ansible_host: 192.168.202.2
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa

```
ansible.cfg
ansible-inventory -i inv.yaml --graph
```
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer

```

## 3. Write an Ansible playbook that prints "Hello, Ansible!" to the console. 

Playbook hello.yaml

```
- hosts: all_workers
  gather_facts: False

  tasks:
    - name: Hello Ansible
      debug:
        msg: "Hello, Ansible!

```


## 4. Run the playbook using the ansible-playbook command and ensure it executes successfully.

```
ansible-playbook -i inv.yaml hello.yml

```
## 5. Document the installation process and the steps you took to run the playbook.

Результат выполнения playbook hello.yml

```

PLAY [all_workers] *****************************************************************************************************
TASK [Hello Ansible] ***************************************************************************************************Wednesday 05 June 2024  15:35:59 +0000 (0:00:00.028)       0:00:00.028 ********
ok: [host1] => {
    "msg": "Hello, Ansible!"
}
ok: [host2] => {
    "msg": "Hello, Ansible!"
}

PLAY RECAP *************************************************************************************************************host1                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 05 June 2024  15:35:59 +0000 (0:00:00.112)       0:00:00.141 ********
===============================================================================
Hello Ansible --------------------------------------------------------------------------------------------------- 0.11s
Playbook run took 0 days, 0 hours, 0 minutes, 0 seconds

```

# 2. Homework Assignment 2: Managing Remote Hosts
## 1. Set up a virtual machine (or use an existing one in IT-ACADEMY DC) to act as your remote target.

Мои удалённые сервера

```

host1: 192.168.201.1
host2: 192.168.201.2

```

## 2. Ensure SSH access to the remote machine from your local machine.

Сам ssh ключ был сгенерирован при настройки ssh для гита. Здесь описаны команы, которые добавляли ключ на бастион и на удалённый сервер

Настройка прокси

```
ssh-copy-id -p 32510 jump_sa@178.124.206.53
apt install sshpass
nano ~/.ssh/config

```
Содержимое файла .ssh/config

```

Host ec_bastion
        User jump_sa
        Port 32510
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.* 192.168.208.*
        ProxyJump ec_bastion

```
Подключаемся к нащему серверу

```
ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -u root all_workers --ask-pass

```
Результат работы

```

rootubuntudev:/05.Ansible ansible -i inv.yaml -m authorized_key -a "key=\"lookup(file,/.ssh/id_rsa.pub)\" user=root" -u root all_workers --ask-pass
SSH password:
host2  CHANGED = 
    "ansible_facts": 
        "discovered_interpreter_python": "/usr/bin/python3"
    ,
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7MxXA4GD6mbYH/Ej1ZKxia7aKAEXIx19RTWEfkUO6BBoMLSfzw/LuvSFsZslHnHWFoLUz3NQV0dK4GTNvsMDxbUY5qaHoj53iT6ZUIq45B+iG/IJJzgoe/eO+P+MFDwXX7gNFrmEhh5QFyfBZtjw1nd+05A9Kyk6dQpJqQhO/D8MIiCT+/OwDLOptoN5+rSjCZyFMj/h16Q3dWtMNbOk1X7Xfe2Z1p3nL+Xmx+7PadGsEzinG98bUOHbclN/kkA1WzcoJvuSg38o/ybb6leKoOapjRHmIoj2Qsj/6CVwl0mHNfzMKDf6R8xDyM/ox4l06DkzGwPXF1Ar1i1d2o1BIBvfQ0AUJc2TsUHO/koLCfofUmF6UZ2Zkp7rUHeIkoGnxMNLxGgF7XSs0WqWR5CuYrq9phWFRf/xUNTtjzI36EH8btYRIZe1ZC65/ir8oxMyNzdDSFk+FQQo5HSGlYMLTZQ3v/WUld1m3dfC3eVWB/3i3QBuV1GS73Ipqla8+LQM= rootubuntudev",
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true

host1  CHANGED = 
    "ansible_facts": 
        "discovered_interpreter_python": "/usr/bin/python3"
    ,
    "changed": true,
    "comment": null,
    "exclusive": false,
    "follow": false,
    "key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7MxXA4GD6mbYH/Ej1ZKxia7aKAEXIx19RTWEfkUO6BBoMLSfzw/LuvSFsZslHnHWFoLUz3NQV0dK4GTNvsMDxbUY5qaHoj53iT6ZUIq45B+iG/IJJzgoe/eO+P+MFDwXX7gNFrmEhh5QFyfBZtjw1nd+05A9Kyk6dQpJqQhO/D8MIiCT+/OwDLOptoN5+rSjCZyFMj/h16Q3dWtMNbOk1X7Xfe2Z1p3nL+Xmx+7PadGsEzinG98bUOHbclN/kkA1WzcoJvuSg38o/ybb6leKoOapjRHmIoj2Qsj/6CVwl0mHNfzMKDf6R8xDyM/ox4l06DkzGwPXF1Ar1i1d2o1BIBvfQ0AUJc2TsUHO/koLCfofUmF6UZ2Zkp7rUHeIkoGnxMNLxGgF7XSs0WqWR5CuYrq9phWFRf/xUNTtjzI36EH8btYRIZe1ZC65/ir8oxMyNzdDSFk+FQQo5HSGlYMLTZQ3v/WUld1m3dfC3eVWB/3i3QBuV1GS73Ipqla8+LQM= rootubuntudev",
    "key_options": null,
    "keyfile": "/root/.ssh/authorized_keys",
    "manage_dir": true,
    "path": null,
    "state": "present",
    "user": "root",
    "validate_certs": true

```
Проверка подключения

```
ansible -i inv.yaml -m ping all_workers -u root --ask-pass

```
Результат проверки

```

rootubuntudev:/05.Ansible ansible -i inv.yaml -m ping all_workers -u root
host1  SUCCESS = 
    "ansible_facts": 
        "discovered_interpreter_python": "/usr/bin/python3"
    ,
    "changed": false,
    "ping": "pong"

host2  SUCCESS = 
    "ansible_facts": 
        "discovered_interpreter_python": "/usr/bin/python3"
    ,
    "changed": false,
    "ping": "pong"

```
## 3. Write an Ansible playbook to install a basic package (e.g., vim or htop) on the remote host.


Содержимое файла install_htop.yaml

```
- hosts: all_workers
  gather_facts: False
  become: yes

  tasks:
    - name: Install Htop
      package:
        name: htop
        state: present
```
## 4. Use inventory files to manage the connection details for the remote host.
```
ansible-playbook -i inv.yaml install_htop.yaml -u root

```
## 5. Execute the playbook and verify that the package is installed on the remote host.

Результат выполнения

```
root@ubuntudev:~/05.Ansible# ansible-playbook -i inv.yaml install_htop.yaml -u root

PLAY [all_workers] ************************************************************************************************************************************************************************************************

TASK [Install Htop] ***********************************************************************************************************************************************************************************************
Wednesday 05 June 2024  16:30:31 +0000 (0:00:00.022)       0:00:00.022 ********
changed: [host1]
changed: [host2]

PLAY RECAP ********************************************************************************************************************************************************************************************************
host1                      : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 05 June 2024  16:30:41 +0000 (0:00:10.021)       0:00:10.043 ********
===============================================================================
Install Htop ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 10.02s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
```

# 3. Homework Assignment 3: Managing Users and Groups
## 1. Create a playbook to manage users and groups on a remote host.

Создал playbook с именем add_user.yaml. Перед этим создал пользователя user с группой mygroup, но не захэшировал пароль. Поэтому пришлось их удалить. Тоже через ansible сделал.
```

- hosts: all_workers
  become: yes
  tasks:
    - name: Create group
      group:
        name: mygroup1
        state: present

    - name: Create user
      user:
        name: user2
        group: mygroup
        password: "{{ '1234' | password_hash('sha512') }}"
        state: present

    - name: Delete users
      user:
        name: user1
        group: mygroup
        state: absent


    - name: Delete groups
      user:
        name: mygroup
        state: absent

```
## 2. Define tasks to create a new user, assign the user to a specific group, and set a password.

Запустили add_user.yaml 

```
ansible-playbook -i inv.yaml add_user.yaml -u root
```
Результат выполнения

```

root@ubuntudev:~/05.Ansible# ansible-playbook -i inv.yaml add_user.yaml -u root

PLAY [all_workers] *****************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************
Wednesday 05 June 2024  20:54:04 +0000 (0:00:00.012)       0:00:00.012 ********
ok: [host2]
ok: [host1]

TASK [Create group] ****************************************************************************************************
Wednesday 05 June 2024  20:54:06 +0000 (0:00:02.545)       0:00:02.557 ********
changed: [host2]
changed: [host1]

TASK [Create user] *****************************************************************************************************
Wednesday 05 June 2024  20:54:08 +0000 (0:00:01.049)       0:00:03.607 ********
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated
and will be removed from Python 3.13. Install the passlib library for continued encryption functionality. This feature
will be removed in version 2.17. Deprecation warnings can be disabled by setting deprecation_warnings=False in
ansible.cfg.
changed: [host2]
changed: [host1]

TASK [Delete users] ****************************************************************************************************
Wednesday 05 June 2024  20:54:09 +0000 (0:00:01.131)       0:00:04.739 ********
changed: [host2]
changed: [host1]

TASK [Delete groups] ***************************************************************************************************
Wednesday 05 June 2024  20:54:10 +0000 (0:00:01.031)       0:00:05.770 ********
ok: [host2]
ok: [host1]

PLAY RECAP *************************************************************************************************************
host1                      : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=5    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 05 June 2024  20:54:11 +0000 (0:00:00.952)       0:00:06.723 ********
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------- 2.55s
Create user ----------------------------------------------------------------------------------------------------- 1.13s
Create group ---------------------------------------------------------------------------------------------------- 1.05s
Delete users ---------------------------------------------------------------------------------------------------- 1.03s
Delete groups --------------------------------------------------------------------------------------------------- 0.95s
Playbook run took 0 days, 0 hours, 0 minutes, 6 seconds
```

Попробывал подключиться с новым пользователем
```
rootubuntudev:/05.Ansible ssh user2192.168.202.1
user2192.168.202.1s password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release 22.04.3 LTS available.
Run do-release-upgrade to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.rootubuntudev:/05.Ansible ssh user2192.168.202.1
user2192.168.202.1s password:
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release 22.04.3 LTS available.
Run do-release-upgrade to upgrade to it.


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
```
Можно подключиться через root и вызвать команду cat /etc/passwd. В списке появиться наш пользователь

## 3. Parameterize the playbook to allow dynamic user and group names:

Динамические параметры. Файл vars.yaml
```

user:
  username: user3
  password: user123

group: group3
```
Playbook который принимает параметры из файла vars.yaml

```
- hosts: all_workers
  become: yes
  vars_files:
     - vars.yaml
  tasks:
    - name: Create group
      group:
        name: "{{ group }}"
        state: present

    - name: Create users
      user:
        name: "{{ user.username }}"
        group: "{{ group }}"
        password: "{{user.password | password_hash('sha512') }}"
        state: present

```
Выполняем команду 
```
ansible-playbook -i inv.yaml add_user_vars.yaml -u root

```

## 4. Execute the playbook and verify that the user and group configurations are applied.

Результат работы playbook
```

root@ubuntudev:~/05.Ansible# ansible-playbook -i inv.yaml add_user_vars.yaml -u root

PLAY [all_workers] ************************************************************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************************************************************
Wednesday 05 June 2024  21:42:37 +0000 (0:00:00.015)       0:00:00.015 ********
ok: [host1]
ok: [host2]

TASK [Create group] ***********************************************************************************************************************************************************************************************
Wednesday 05 June 2024  21:42:39 +0000 (0:00:02.101)       0:00:02.117 ********
changed: [host2]
changed: [host1]

TASK [Create users] ***********************************************************************************************************************************************************************************************
Wednesday 05 June 2024  21:42:40 +0000 (0:00:01.002)       0:00:03.119 ********
[DEPRECATION WARNING]: Encryption using the Python crypt module is deprecated. The Python crypt module is deprecated and will be removed from Python 3.13. Install the passlib library for continued encryption
functionality. This feature will be removed in version 2.17. Deprecation warnings can be disabled by setting deprecation_warnings=False in ansible.cfg.
changed: [host1]
changed: [host2]

PLAY RECAP ********************************************************************************************************************************************************************************************************
host1                      : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host2                      : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 05 June 2024  21:42:41 +0000 (0:00:01.600)       0:00:04.719 ********
===============================================================================
Gathering Facts -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.10s
Create users ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.60s
Create group ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.00s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```
Попробуем подключиться через root к удаленному серверу и посмотрим наших пользователй

Результат 
```
rootubuntudev:/home/kirill/courses/devops/sa.it-academy.by/Kirill_Kazimirov/05.AnsibleStart ssh root192.168.202.1
Welcome to Ubuntu 20.04 LTS (GNU/Linux 5.15.39-1-pve x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

New release 22.04.3 LTS available.
Run do-release-upgrade to upgrade to it.

You have new mail.
Last login: Wed Jun  5 21:42:41 2024 from 192.168.204.82
rootsa-1: cat /etc/passwd
......
user2:x:1001:1000::/home/user2:/bin/sh
user3:x:1002:1003::/home/user3:/bin/sh
rootsa-1: cat /etc/group
mygroup:x:1000:
mygroup1:x:1001:
user3:x:1002:
group3:x:1003:
```
