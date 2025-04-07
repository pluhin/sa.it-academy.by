## Homework Assignment 1: Setting Up Ansible

### Ansible installation
1. Install pip - ```sudo apt install python3-pip```
2. Install ansible - ```pip3 install --user ansible```
3. Check installation - ```ansible --version``` 
```bash
ansible [core 2.14.18]
  config file = None
  configured module search path = ['/home/debian/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/debian/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.11.2 (main, Nov 30 2024, 21:22:50) [GCC 12.2.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```
### Ansible playbook
1. Create hello_ansible.yaml file.
2. Run file:
```ansible-playbook hello_ansible.yaml```
```bash
PLAY [Hello Ansible] ************************************************************************************************************************************************************************************

TASK [Print msg] ****************************************************************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Hello, ansible!"
}

PLAY RECAP **********************************************************************************************************************************************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Homework Assignment 2: Managing Remote Hosts
1. To complete the task, I used the following hosts: 192.168.202.19 and 192.168.202.20
2. Establised ssh connection to each host and copy ssh pub key. 
3. Create inventoty file - inv.yaml.
4. Create install_htop.yaml file. 
5. Run file:
```ansible-playbook -i ./inv.yaml ./install_htop.yaml```
```bash
PLAY [Install htop package on remote hosts] *************************************************************************************************************************************************************

TASK [Gathering Facts] **********************************************************************************************************************************************************************************
Sunday 06 April 2025  13:30:08 +0300 (0:00:00.022)       0:00:00.022 **********
ok: [host_19]
ok: [host_20]

TASK [Ensure htop is installed] *************************************************************************************************************************************************************************
Sunday 06 April 2025  13:30:16 +0300 (0:00:07.892)       0:00:07.915 **********
changed: [host_19]
changed: [host_20]

PLAY RECAP **********************************************************************************************************************************************************************************************
host_19                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host_20                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Sunday 06 April 2025  13:30:25 +0300 (0:00:08.714)       0:00:16.632 **********
===============================================================================
Ensure htop is installed ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 8.72s 
Gathering Facts ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 7.89s
``` 
