### 07.Ansible.Cruise

## Role webserver

# 1. Deploying and testing 

```yaml
ansible-playbook websrv.yaml -i inventory.yaml 



PLAY [all_workers] *************************************************************************************************************************


TASK [Gathering Facts] *********************************************************************************************************************

ok: [host53]
ok: [host54]

TASK [websrv : Include deploy for Debian systems] ******************************************************************************************
skipping: [host53]
included: /home/ansible/roles/websrv/tasks/ubuntu.yaml for host54

TASK [websrv : Nginx. Install packages] ****************************************************************************************************
ok: [host54]

TASK [websrv : Nginx. Enable and start service] ********************************************************************************************
ok: [host54]

TASK [websrv : Nginx. Deploy ubuntu] *******************************************************************************************************
included: /home/ansible/roles/websrv/tasks/deploy.yaml for host54
included: /home/ansible/roles/websrv/tasks/deploy.yaml for host54

TASK [websrv : Make sure destination dir exists] *******************************************************************************************
ok: [host54]

TASK [websrv : Add index.html] *************************************************************************************************************
ok: [host54]

TASK [websrv : Add conf] *******************************************************************************************************************
ok: [host54]

TASK [websrv : Debug] **********************************************************************************************************************
ok: [host54] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [websrv : Make sure destination dir exists] *******************************************************************************************
ok: [host54]

TASK [websrv : Add index.html] *************************************************************************************************************
ok: [host54]

TASK [websrv : Add conf] *******************************************************************************************************************
ok: [host54]

TASK [websrv : Debug] **********************************************************************************************************************
ok: [host54] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [websrv : Restart nginx ubuntu] *******************************************************************************************************
changed: [host54]

TASK [websrv : Nginx. Test ubuntu] *********************************************************************************************************
included: /home/ansible/roles/websrv/tasks/test.yaml for host54
included: /home/ansible/roles/websrv/tasks/test.yaml for host54

TASK [websrv : Check content to the sites] *************************************************************************************************
ok: [host54]

TASK [websrv : Debug test] *****************************************************************************************************************
ok: [host54] => {
    "msg": "Virtual host: local-debian1.site"
}

TASK [websrv : Check content to the sites] *************************************************************************************************
ok: [host54]

TASK [websrv : Debug test] *****************************************************************************************************************
ok: [host54] => {
    "msg": "Virtual host: local-debian2.site"
}

TASK [websrv : Include deploy for RedHat systems] ******************************************************************************************
skipping: [host54]
included: /home/ansible/roles/websrv/tasks/centos.yaml for host53

TASK [websrv : Install EPEL Repo] **********************************************************************************************************
ok: [host53]

TASK [websrv : Nginx. Install packages] ****************************************************************************************************
ok: [host53]

TASK [websrv : Nginx. Enable and start service] ********************************************************************************************
ok: [host53]

TASK [websrv : Nginx. Deploy centos] *******************************************************************************************************
included: /home/ansible/roles/websrv/tasks/deploy.yaml for host53
included: /home/ansible/roles/websrv/tasks/deploy.yaml for host53

TASK [websrv : Make sure destination dir exists] *******************************************************************************************
ok: [host53]

TASK [websrv : Add index.html] *************************************************************************************************************
ok: [host53]

TASK [websrv : Add conf] *******************************************************************************************************************
ok: [host53]

TASK [websrv : Debug] **********************************************************************************************************************
ok: [host53] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [websrv : Make sure destination dir exists] *******************************************************************************************
ok: [host53]

TASK [websrv : Add index.html] *************************************************************************************************************
ok: [host53]

TASK [websrv : Add conf] *******************************************************************************************************************
ok: [host53]

TASK [websrv : Debug] **********************************************************************************************************************
ok: [host53] => {
    "msg": "Virtual host: local-centos2.site"
}

TASK [websrv : Restart nginx centos] *******************************************************************************************************
changed: [host53]

TASK [websrv : Nginx. Enable firewall port] ************************************************************************************************
ok: [host53]

TASK [websrv : Nginx. reload service firewalld] ********************************************************************************************
changed: [host53]

TASK [websrv : Nginx. Test centos] *********************************************************************************************************
included: /home/ansible/roles/websrv/tasks/test.yaml for host53
included: /home/ansible/roles/websrv/tasks/test.yaml for host53

TASK [websrv : Check content to the sites] *************************************************************************************************
ok: [host53]

TASK [websrv : Debug test] *****************************************************************************************************************
ok: [host53] => {
    "msg": "Virtual host: local-centos1.site"
}

TASK [websrv : Check content to the sites] *************************************************************************************************
ok: [host53]

TASK [websrv : Debug test] *****************************************************************************************************************
ok: [host53] => {
    "msg": "Virtual host: local-centos2.site"
}

PLAY RECAP *********************************************************************************************************************************
host53                     : ok=24   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host54                     : ok=21   changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

```


## Role Testing

```yaml
ansible-playbook test.yaml -i inventory.yaml 

PLAY [all_workers] *************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************
ok: [host53]
ok: [host54]

TASK [test : Check SUDO with NOPASSWD] *****************************************************************************************************
ok: [host53]
ok: [host54]

TASK [test : Check repos] ******************************************************************************************************************
ok: [host53] => (item=https://deb.debian.org/debian)
ok: [host54] => (item=https://deb.debian.org/debian)
ok: [host54] => (item=https://cloud.centos.org/centos)
ok: [host53] => (item=https://cloud.centos.org/centos)
ok: [host54] => (item=https://pypi.org/simple)
ok: [host53] => (item=https://pypi.org/simple)

TASK [test : Check Docker Hub] *************************************************************************************************************
ok: [host54]
ok: [host53]

TASK [test : Check Mount point] ************************************************************************************************************
ok: [host53] => (item={'block_used': 479927, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4647901, 'size_available': 19037802496, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop52', 'inode_used': 23501, 'block_size': 4096, 'inode_available': 1287219}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4647901,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 479927,
        "device": "/dev/loop52",
        "fstype": "ext4",
        "inode_available": 1287219,
        "inode_total": 1310720,
        "inode_used": 23501,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19037802496,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available 90.64 % of disk space."
}
ok: [host54] => (item={'mount': '/', 'device': '/dev/loop53', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18824495104, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4595824, 'block_used': 532004, 'inode_total': 1310720, 'inode_available': 1283889, 'inode_used': 26831, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4595824,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 532004,
        "device": "/dev/loop53",
        "fstype": "ext4",
        "inode_available": 1283889,
        "inode_total": 1310720,
        "inode_used": 26831,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18824495104,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "OK. Available 89.63 % of disk space."
}

TASK [test : Check RAM] ********************************************************************************************************************
ok: [host53] => {
    "changed": false,
    "msg": "OK. Available 83.00999999999999% of RAM."
}
ok: [host54] => {
    "changed": false,
    "msg": "OK. Available 73.97% of RAM."
}

PLAY RECAP *********************************************************************************************************************************
host53                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host54                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

```