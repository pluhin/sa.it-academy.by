# Inventory.yaml
```yaml
 my_invironment:

        hosts:

         remoute_ubuntu:

          ansible_host: 10.0.2.5
          ansible_ssh_user: stas
          ansible_python_interpreter: /usr/bin/python3

         remoute_centos:
          ansible_host: 10.0.2.4
          ansible_ssh_user: root

```
# OS_Information
```yaml
- hosts: my_invironment
  become: yes
  tasks:
    - name: os_version
      debug:
        msg: "{{ ansible_distribution }} {{ ansible_distribution_version }} {{ ansible_architecture }}"
      tags:
        - all
        - os-version
    - name: Mount point/capacity/used
      debug:
        msg: "Mount point: '{{ item.mount }}' Total_space: {{ item.size_total//1024//1024 }}Mb Used_space: {{ (item.size_total-item.size_available)//1024//1024 }}Mb"
      with_items: "{{ ansible_mounts }}"
     
    - name: RAM/capacity/free
      debug:
        msg: "Total_memory:{{ ansible_memory_mb.real.total }} Free_memory: {{ ansible_memory_mb.real.free }}"
      tags:
        - all
        - memory

```
# Add User

```yaml

- hosts: my_invironment

  become: yes

  tasks:
    - name: Create user "ansible_test"
      user:
        name:  ansible_test
        state: present

    - name: Add ssh key from ansible host to ansible user
      authorized_key:
        user: ansible_test
        state: present
        key: "{{ lookup('file','~/.ssh/id_rsa.pub') }}"

    - name: Get sudoers privileges whithout password
      lineinfile:
        path: /etc/sudoers
        state: present
        regexp: '^ansible_test'
        line: "ansible_test ALL=(ALL) NOPASSWD: ALL"

    - name: Update CentOS system
      shell: sudo -u ansible_test sudo yum -y update
      when: ansible_distribution == "CentOS"

    - name: Update Ubuntu system
      shell: sudo -u ansible_test  sudo apt-get update
      when: ansible_distribution == "Ubuntu"

```

# ansible.cfg
```bash
inventory       = /root/Ansible.run/inventory.yaml
```


# STDOUT

## ansible-playbook os_information.yaml

``` bash 
PLAY [my_invironment] ************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
ok: [remoute_centos]
ok: [remoute_ubuntu]

TASK [os_version] ****************************************************************************************************************
ok: [remoute_ubuntu] => {
    "msg": "Ubuntu 18.04 x86_64"
}
ok: [remoute_centos] => {
    "msg": "CentOS 7.7 x86_64"
}

TASK [Mount point/capacity/used] *************************************************************************************************
ok: [remoute_centos] => (item={u'block_used': 42465, u'uuid': u'ed3f5bff-e982-45a5-94f1-b20b7718ad76', u'size_total': 1063256064, u'block_total': 259584, u'mount': u'/boot', u'block_available': 217119, u'size_available': 889319424, u'fstype': u'xfs', u'inode_total': 524288, u'inode_available': 523956, u'device': u'/dev/sda1', u'inode_used': 332, u'block_size': 4096, u'options': u'rw,seclabel,relatime,attr2,inode64,noquota'}) => {
    "msg": "Mount point: '/boot' Total_space: 1014Mb Used_space: 165Mb"
}
ok: [remoute_centos] => (item={u'block_used': 340798, u'uuid': u'77498303-1e5a-4b97-bf2e-3ee37afd212f', u'size_total': 6641680384, u'block_total': 1621504, u'mount': u'/', u'block_available': 1280706, u'size_available': 5245771776, u'fstype': u'xfs', u'inode_total': 3248128, u'inode_available': 3217893, u'device': u'/dev/mapper/centos-root', u'inode_used': 30235, u'block_size': 4096, u'options': u'rw,seclabel,relatime,attr2,inode64,noquota'}) => {
    "msg": "Mount point: '/' Total_space: 6334Mb Used_space: 1331Mb"
}
ok: [remoute_ubuntu] => (item={u'block_used': 1160596, u'uuid': u'047804d4-e934-4796-9c2b-cd28a7d98ef2', u'size_total': 10498625536, u'block_total': 2563141, u'mount': u'/', u'block_available': 1402545, u'size_available': 5744824320, u'fstype': u'ext4', u'inode_total': 655360, u'inode_available': 580571, u'device': u'/dev/sda2', u'inode_used': 74789, u'block_size': 4096, u'options': u'rw,relatime,data=ordered'}) => {
    "msg": "Mount point: '/' Total_space: 10012Mb Used_space: 4533Mb"
}
ok: [remoute_ubuntu] => (item={u'block_used': 713, u'uuid': u'N/A', u'size_total': 93454336, u'block_total': 713, u'mount': u'/snap/core/8268', u'block_available': 0, u'size_available': 0, u'fstype': u'squashfs', u'inode_total': 12842, u'inode_available': 0, u'device': u'/dev/loop0', u'inode_used': 12842, u'block_size': 131072, u'options': u'ro,nodev,relatime'}) => {
    "msg": "Mount point: '/snap/core/8268' Total_space: 89Mb Used_space: 89Mb"
}
ok: [remoute_ubuntu] => (item={u'block_used': 708, u'uuid': u'N/A', u'size_total': 92798976, u'block_total': 708, u'mount': u'/snap/core/7270', u'block_available': 0, u'size_available': 0, u'fstype': u'squashfs', u'inode_total': 12823, u'inode_available': 0, u'device': u'/dev/loop1', u'inode_used': 12823, u'block_size': 131072, u'options': u'ro,nodev,relatime'}) => {
    "msg": "Mount point: '/snap/core/7270' Total_space: 88Mb Used_space: 88Mb"
}

TASK [RAM/capacity/free] *********************************************************************************************************
ok: [remoute_centos] => {
    "msg": "Total_memory:991 Free_memory: 751"
}
ok: [remoute_ubuntu] => {
    "msg": "Total_memory:985 Free_memory: 394"
}

PLAY RECAP ***********************************************************************************************************************
remoute_centos             : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
remoute_ubuntu             : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
# ansible-playbook adduser.yaml
```bash

PLAY [my_invironment] ************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************
ok: [remoute_centos]
ok: [remoute_ubuntu]

TASK [Create user "ansible_test"] ************************************************************************************************
ok: [remoute_ubuntu]
ok: [remoute_centos]

TASK [Add ssh key from ansible host to ansible user] *****************************************************************************
ok: [remoute_centos]
ok: [remoute_ubuntu]

TASK [Get sudoers privileges whithout password] **********************************************************************************
ok: [remoute_centos]
ok: [remoute_ubuntu]

TASK [Update CentOS system] ******************************************************************************************************
skipping: [remoute_ubuntu]
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

changed: [remoute_centos]

TASK [Update Ubuntu system] ******************************************************************************************************
skipping: [remoute_centos]
changed: [remoute_ubuntu]

PLAY RECAP ***********************************************************************************************************************
remoute_centos             : ok=5    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
remoute_ubuntu             : ok=5    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
```


