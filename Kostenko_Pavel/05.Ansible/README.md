### 05.Ansible


## Ansible version
```bash
admloc@ubuntu20:~/Tasks/05.Ansible$ ansible --version
ansible 2.9.6
  config file = /home/admloc/Tasks/05.Ansible/ansible.cfg
  configured module search path = ['/home/admloc/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Jun 22 2022, 20:18:18) [GCC 9.4.0]
 ```


## config.cfg
```bash
[defaults]
inventory      = ./host.yaml
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer
  ```



## Hosts.yaml
```bash
all_workers:
  children:
    work_sa:
      hosts:
        host27:
          ansible_host: 192.168.202.27
        host28:
          ansible_host: 192.168.202.28
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa

  ```


## Module ping
```bash
admloc@ubuntu20:~/Tasks/05.Ansible$ ansible -i host.yaml -m ping all_workers -u root --ask-pass
SSH password:
host27 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
host28 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
  ```

## play.yaml
```bash
- hosts: all_workers
  tasks:
    - name: OS/version
      debug:
        msg: "OS: {{ ansible_distribution }} | OS Version: {{ ansible_distribution_version }} "
    - name: Mount point/capacity/used
      debug:
        msg: "Mount point capacity: {{ (ansible_mounts[0].size_total /1000000)|round(2) }} MB, available: {{ (ansible_mounts[0].size_available/1000000)|round(2) }} MB, used: {{ ((ansible_mounts[0].size_total - ansible_mounts[0].size_available) /1000000)|round(2) }} MB"
    - name: RAM/capacity/free
      debug:
        msg: "ram total capacity: {{ ansible_facts['memtotal_mb'] }} MB, ram available: {{ ansible_facts['memfree_mb'] }} MB, ram used: {{ ansible_facts['memtotal_mb'] - ansible_facts['memfree_mb'] }} MB " 
  ```


## output after play
```bash
admloc@ubuntu20:~/Tasks/05.Ansible$ ansible-playbook -i host.yaml play.yaml -u root

PLAY [all_workers] *********************************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************************
ok: [host28]
ok: [host27]

TASK [OS/version] **********************************************************************************************************************************************************
ok: [host27] => {
    "msg": "OS: Ubuntu | OS Version: 20.04 "
}
ok: [host28] => {
    "msg": "OS: Ubuntu | OS Version: 20.04 "
}

TASK [Mount point/capacity/used] *******************************************************************************************************************************************
ok: [host28] => {
    "msg": "Mount point capacity: 12573.61 MB, available: 10801.35 MB, used: 1772.26 MB"
}
ok: [host27] => {
    "msg": "Mount point capacity: 12573.61 MB, available: 10956.64 MB, used: 1616.98 MB"
}

TASK [RAM/capacity/free] ***************************************************************************************************************************************************
ok: [host27] => {
    "msg": "ram total capacity: 2048 MB, ram available: 1661 MB, ram used: 387 MB "
}
ok: [host28] => {
    "msg": "ram total capacity: 2048 MB, ram available: 1643 MB, ram used: 405 MB "
}

PLAY RECAP *****************************************************************************************************************************************************************
host27                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host28                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
  ```