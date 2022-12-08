# Ansible verion
```
aliaksandr@aloaksandr:~/05.Ansible$ ansible --version
ansible [core 2.14.1]
config file = None
configured module search path = ['/home/aliaksandr/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
ansible collection location = /home/aliaksandr/.ansible/collections:/usr/share/ansible/collections
executable location = /usr/local/bin/ansible
python version = 3.10.6 (main, Nov  2 2022, 18:53:38) [GCC 11.3.0] (/usr/bin/python3)
jinja version = 3.0.3
libyaml = True
aliaksandr@aloaksandr:~/05.Ansible$ vim ansible.cfg
aliaksandr@aloaksandr:~/05.Ansible$ vim inv.yaml
aliaksandr@aloaksandr:~/05.Ansible$ ssh-copy-id jump_sa@178.124.206.53
usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/aliaksandr/.ssh/id_rsa.pub"
The authenticity of host '178.124.206.53 (178.124.206.53)' can't be established.
ED25519 key fingerprint is SHA256:yvhK5MkTQ5tBTarkaIYhf2As+5eN8vuRDIAO2f419uo.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
```
#### Playbook 

```YAML
- hosts: all_workers 
  #gather_facts: False
  #strategy: free
  #serial: 1
  tasks:
    - name: os/version
      debug:
        msg:
          - "OS: {{ ansible_distribution }}"
          - "Version: {{ ansible_distribution_version }}"
    - name: Mount point/capacity/used
      debug:
        msg:
          - "Mount point: {{ item.mount }}"
          - "Capacity: {{ (item.size_total / 1024 / 1024) | round(2)}} Mb"
          - "Used : {{ ((item.size_total-item.size_available) / 1024 / 1024)|round(2) }} Mb"
      with_items: "{{ ansible_mounts }}"
    - name: RAM
      debug:
        msg:
          - "Total memory: {{ ansible_memtotal_mb }} Mb"
          - "Free memory: {{ ansible_memfree_mb }} Mb"
```
##### Output playbook
```
aliaksandr@aloaksandr:~/05.Ansible$ ansible-playbook -i inv.yaml one.yaml --ask-vault-pass
Vault password:

PLAY [all_workers] ***********************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************
Thursday 08 December 2022  18:27:04 +0000 (0:00:00.034)       0:00:00.034 *****
ok: [host14]
ok: [host13]

TASK [os/version] ************************************************************************************************************
Thursday 08 December 2022  18:27:10 +0000 (0:00:06.146)       0:00:06.180 *****
ok: [host13] => {
    "msg": [
        "OS: Ubuntu",
        "Version: 20.04"
    ]
}
ok: [host14] => {
    "msg": [
        "OS: Ubuntu",
        "Version: 20.04"
    ]
}

TASK [Mount point/capacity/used] *********************************************************************************************
Thursday 08 December 2022  18:27:10 +0000 (0:00:00.062)       0:00:06.242 *****
ok: [host13] => (item={'mount': '/', 'device': '/dev/loop13', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10810068992, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2639177, 'block_used': 430553, 'inode_total': 786432, 'inode_available': 758483, 'inode_used': 27949, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11991.13 Mb",
        "Used : 1681.85 Mb"
    ]
}
ok: [host14] => (item={'mount': '/', 'device': '/dev/loop14', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 12573614080, 'size_available': 10965250048, 'block_size': 4096, 'block_total': 3069730, 'block_available': 2677063, 'block_used': 392667, 'inode_total': 786432, 'inode_available': 764597, 'inode_used': 21835, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point: /",
        "Capacity: 11991.13 Mb",
        "Used : 1533.86 Mb"
    ]
}

TASK [RAM] *******************************************************************************************************************
Thursday 08 December 2022  18:27:10 +0000 (0:00:00.127)       0:00:06.370 *****
ok: [host13] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1671 Mb"
    ]
}
ok: [host14] => {
    "msg": [
        "Total memory: 2048 Mb",
        "Free memory: 1680 Mb"
    ]
}

PLAY RECAP *******************************************************************************************************************
host13                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host14                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Thursday 08 December 2022  18:27:10 +0000 (0:00:00.165)       0:00:06.536 *****
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------- 6.15s
RAM ------------------------------------------------------------------------------------------------------------------- 0.17s
Mount point/capacity/used --------------------------------------------------------------------------------------------- 0.13s
os/version ------------------------------------------------------------------------------------------------------------ 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 6 seconds
```