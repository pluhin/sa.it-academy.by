# **05.Ansible.start**

# **Install ansible on sandbox (min.2.13**) ##
```bash
git@testgit:~/ansible$ sudo apt install python3-pip
git@testgit:~/ansible$ sudo pip3 install ansible
git@testgit:~/ansible$ ansible --version
ansible [core 2.14.3]
  config file = /home/git/ansible/ansible.cfg
  configured module search path = ['/home/git/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/git/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.6 (main, Nov 14 2022, 16:10:14) [GCC 11.3.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```
## **Setup your ansible config file for disable host checking** ##
```bash
[defaults]
# inventory      = /etc/ansible/hosts
# remote_tmp     = /tmp/.ansible/tmp
forks          = 3
host_key_checking = false
callbacks_enabled = profile_tasks, timer

```

## **Setup your ssh environment to work with hosts in it-academy datacenter** ##
```bash
git@testgit:~/ansible$ ssh-copy-id jump_sa@178.124.206.53
it@testgit:~/ansible$ ansible -i invent.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
```

## **Playbook** ##
```bash
- hosts: all_workers
  serial: 2
  pre_tasks:
    - name: Set authorized key taken from file
      authorized_key:
        user: "{{ ansible_user }}"
        state: present
        key: "{{ item }}"
      with_items:
        - "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
      tags:
        - never
  tasks:
    - name: Operation system
      debug:
        msg: "{{ ansible_distribution }} | {{ ansible_distribution_version }}"

    - name: Mount point
      debug:
        msg:
          - "Mount point : {{ item.mount }}"
          - "Size total = {{item.size_total}}"
          - "Used = {{(item.size_total - item.size_available)}}"
      with_items: "{{ ansible_mounts }}"

    - name: RAM
      debug:
        msg:
          - "Totol = {{ansible_memory_mb.real.total }}"
          - "Free = {{ ansible_memory_mb.real.free }}"
          - "Used = {{ ansible_memory_mb.real.used }}"
```

## **Play Playbook** ##
```bash
git@testgit:~/ansible$ ansible-playbook -i invent.yaml play.yaml --ask-vault-pass
Vault password:

PLAY [all_workers] *******************************************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************************************************
Вторник 28 февраля 2023  20:12:32 +0000 (0:00:00.026)       0:00:00.026 *******
ok: [host28]
ok: [host27]

TASK [Operation system] **************************************************************************************************************************************************************************************
Вторник 28 февраля 2023  20:12:34 +0000 (0:00:01.939)       0:00:01.966 *******
ok: [host27] => {
    "msg": "Ubuntu | 20.04"
}
ok: [host28] => {
    "msg": "Ubuntu | 20.04"
}

TASK [Mount point] *******************************************************************************************************************************************************************************************
Вторник 28 февраля 2023  20:12:34 +0000 (0:00:00.052)       0:00:02.018 *******
ok: [host27] => (item={'mount': '/', 'device': '/dev/loop26', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792597504, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658349, 'block_used': 380298, 'inode_total': 524288, 'inode_available': 496348, 'inode_used': 27940, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point : /",
        "Size total = 8350298112",
        "Used = 1557700608"
    ]
}
ok: [host28] => (item={'mount': '/', 'device': '/dev/loop27', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 8350298112, 'size_available': 6792581120, 'block_size': 4096, 'block_total': 2038647, 'block_available': 1658345, 'block_used': 380302, 'inode_total': 524288, 'inode_available': 496348, 'inode_used': 27940, 'uuid': 'N/A'}) => {
    "msg": [
        "Mount point : /",
        "Size total = 8350298112",
        "Used = 1557716992"
    ]
}

TASK [RAM] ***************************************************************************************************************************************************************************************************
Вторник 28 февраля 2023  20:12:34 +0000 (0:00:00.069)       0:00:02.088 *******
ok: [host27] => {
    "msg": [
        "Totol = 2048",
        "Free = 1663",
        "Used = 385"
    ]
}
ok: [host28] => {
    "msg": [
        "Totol = 2048",
        "Free = 1664",
        "Used = 384"
    ]
}

PLAY RECAP ***************************************************************************************************************************************************************************************************
host27                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host28                     : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

```