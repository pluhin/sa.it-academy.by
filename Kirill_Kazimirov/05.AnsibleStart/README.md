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


