## 07.Ansible.Curse

### Install Nginx server

```yaml
vagrant@vagrant:~/ansible$ ansible-playbook -i inv.yaml web.yaml 

PLAY [all_workers] **************************************************************************************

TASK [Gathering Facts] **********************************************************************************
Sunday 06 February 2022  17:56:28 +0000 (0:00:00.008)       0:00:00.008 ******* 
ok: [host7]
ok: [host8]

TASK [webserver : Include deploy for Debian systems] ****************************************************
Sunday 06 February 2022  17:56:30 +0000 (0:00:02.072)       0:00:02.081 ******* 
skipping: [host7]
included: /home/vagrant/ansible/roles/webserver/tasks/nginx_deb.yaml for host8

TASK [webserver : Install nginx] ************************************************************************
Sunday 06 February 2022  17:56:30 +0000 (0:00:00.070)       0:00:02.151 ******* 
ok: [host8]

TASK [webserver : NGINX. Enable and start service] ******************************************************
Sunday 06 February 2022  17:56:33 +0000 (0:00:02.805)       0:00:04.957 ******* 
ok: [host8]

TASK [webserver : NGINX. Deploy] ************************************************************************
Sunday 06 February 2022  17:56:34 +0000 (0:00:00.901)       0:00:05.858 ******* 
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host8 => (item=site1.debian)
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host8 => (item=site2.debian)

TASK [webserver : Make sure destination dir exists] *****************************************************
Sunday 06 February 2022  17:56:34 +0000 (0:00:00.042)       0:00:05.901 ******* 
changed: [host8]

TASK [webserver : Add index.html] ***********************************************************************
Sunday 06 February 2022  17:56:34 +0000 (0:00:00.668)       0:00:06.570 ******* 
changed: [host8]

TASK [webserver : Add conf] *****************************************************************************
Sunday 06 February 2022  17:56:36 +0000 (0:00:01.336)       0:00:07.906 ******* 
changed: [host8]

TASK [webserver : Debug] ********************************************************************************
Sunday 06 February 2022  17:56:37 +0000 (0:00:01.119)       0:00:09.026 ******* 
ok: [host8] => {
    "msg": "Virtual host: site1.debian"
}

TASK [webserver : Make sure destination dir exists] *****************************************************
Sunday 06 February 2022  17:56:37 +0000 (0:00:00.028)       0:00:09.054 ******* 
changed: [host8]

TASK [webserver : Add index.html] ***********************************************************************
Sunday 06 February 2022  17:56:37 +0000 (0:00:00.596)       0:00:09.651 ******* 
changed: [host8]

TASK [webserver : Add conf] *****************************************************************************
Sunday 06 February 2022  17:56:39 +0000 (0:00:01.223)       0:00:10.875 ******* 
changed: [host8]

TASK [webserver : Debug] ********************************************************************************
Sunday 06 February 2022  17:56:40 +0000 (0:00:01.123)       0:00:11.998 ******* 
ok: [host8] => {
    "msg": "Virtual host: site2.debian"
}

TASK [webserver : Restart nginx] ************************************************************************
Sunday 06 February 2022  17:56:40 +0000 (0:00:00.046)       0:00:12.044 ******* 
changed: [host8]

TASK [webserver : Include deploy for RedHat systems] ****************************************************
Sunday 06 February 2022  17:56:41 +0000 (0:00:00.885)       0:00:12.930 ******* 
skipping: [host8]
included: /home/vagrant/ansible/roles/webserver/tasks/nginx_rh.yaml for host7

TASK [webserver : Install EPEL Repo] ********************************************************************
Sunday 06 February 2022  17:56:41 +0000 (0:00:00.048)       0:00:12.979 ******* 
ok: [host7]

TASK [webserver : NGINX. Install packages] **************************************************************
Sunday 06 February 2022  17:56:42 +0000 (0:00:00.954)       0:00:13.933 ******* 
ok: [host7]

TASK [webserver : NGINX. Enable and start] **************************************************************
Sunday 06 February 2022  17:56:43 +0000 (0:00:00.824)       0:00:14.758 ******* 
ok: [host7]

TASK [webserver : NGINX. Deploy] ************************************************************************
Sunday 06 February 2022  17:56:43 +0000 (0:00:00.693)       0:00:15.451 ******* 
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host7 => (item=site1.centos)
included: /home/vagrant/ansible/roles/webserver/tasks/deploy.yaml for host7 => (item=site2.centos)

TASK [webserver : Make sure destination dir exists] *****************************************************
Sunday 06 February 2022  17:56:43 +0000 (0:00:00.038)       0:00:15.489 ******* 
changed: [host7]

TASK [webserver : Add index.html] ***********************************************************************
Sunday 06 February 2022  17:56:44 +0000 (0:00:00.614)       0:00:16.103 ******* 
changed: [host7]

TASK [webserver : Add conf] *****************************************************************************
Sunday 06 February 2022  17:56:45 +0000 (0:00:01.105)       0:00:17.209 ******* 
changed: [host7]

TASK [webserver : Debug] ********************************************************************************
Sunday 06 February 2022  17:56:46 +0000 (0:00:01.127)       0:00:18.336 ******* 
ok: [host7] => {
    "msg": "Virtual host: site1.centos"
}

TASK [webserver : Make sure destination dir exists] *****************************************************
Sunday 06 February 2022  17:56:46 +0000 (0:00:00.022)       0:00:18.359 ******* 
changed: [host7]

TASK [webserver : Add index.html] ***********************************************************************
Sunday 06 February 2022  17:56:47 +0000 (0:00:00.590)       0:00:18.950 ******* 
changed: [host7]

TASK [webserver : Add conf] *****************************************************************************
Sunday 06 February 2022  17:56:48 +0000 (0:00:01.230)       0:00:20.180 ******* 
changed: [host7]

TASK [webserver : Debug] ********************************************************************************
Sunday 06 February 2022  17:56:49 +0000 (0:00:01.133)       0:00:21.313 ******* 
ok: [host7] => {
    "msg": "Virtual host: site2.centos"
}

TASK [webserver : Restart nginx] ************************************************************************
Sunday 06 February 2022  17:56:49 +0000 (0:00:00.026)       0:00:21.339 ******* 
changed: [host7]

TASK [webserver : Nginx. Enable firewall port] **********************************************************
Sunday 06 February 2022  17:56:50 +0000 (0:00:00.825)       0:00:22.165 ******* 
ok: [host7]

TASK [webserver : Nginx. reload service firewalld] ******************************************************
Sunday 06 February 2022  17:56:51 +0000 (0:00:00.990)       0:00:23.156 ******* 
changed: [host7]

PLAY RECAP **********************************************************************************************
host7                      : ok=18   changed=8    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
host8                      : ok=15   changed=7    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Sunday 06 February 2022  17:56:52 +0000 (0:00:01.148)       0:00:24.304 ******* 
=============================================================================== 
webserver : Install nginx ------------------------------------------------------------------------ 2.81s
Gathering Facts ---------------------------------------------------------------------------------- 2.07s
webserver : Add index.html ----------------------------------------------------------------------- 1.34s
webserver : Add index.html ----------------------------------------------------------------------- 1.23s
webserver : Add index.html ----------------------------------------------------------------------- 1.22s
webserver : Nginx. reload service firewalld ------------------------------------------------------ 1.15s
webserver : Add conf ----------------------------------------------------------------------------- 1.13s
webserver : Add conf ----------------------------------------------------------------------------- 1.13s
webserver : Add conf ----------------------------------------------------------------------------- 1.12s
webserver : Add conf ----------------------------------------------------------------------------- 1.12s
webserver : Add index.html ----------------------------------------------------------------------- 1.11s
webserver : Nginx. Enable firewall port ---------------------------------------------------------- 0.99s
webserver : Install EPEL Repo -------------------------------------------------------------------- 0.95s
webserver : NGINX. Enable and start service ------------------------------------------------------ 0.90s
webserver : Restart nginx ------------------------------------------------------------------------ 0.89s
webserver : Restart nginx ------------------------------------------------------------------------ 0.83s
webserver : NGINX. Install packages -------------------------------------------------------------- 0.82s
webserver : NGINX. Enable and start -------------------------------------------------------------- 0.69s
webserver : Make sure destination dir exists ----------------------------------------------------- 0.67s
webserver : Make sure destination dir exists ----------------------------------------------------- 0.61s
Playbook run took 0 days, 0 hours, 0 minutes, 24 seconds

```

### Testing

```yaml
vagrant@vagrant:~/ansible$ ansible-playbook -i inv.yaml test.yaml 

PLAY [all_workers] **************************************************************************************

TASK [Gathering Facts] **********************************************************************************
Sunday 06 February 2022  19:51:14 +0000 (0:00:00.008)       0:00:00.008 ******* 
ok: [host7]
ok: [host8]

TASK [test : Check SUDO with NOPASSWD] ******************************************************************
Sunday 06 February 2022  19:51:16 +0000 (0:00:01.551)       0:00:01.559 ******* 
ok: [host8]
ok: [host7]

TASK [test : Check repos] *******************************************************************************
Sunday 06 February 2022  19:51:16 +0000 (0:00:00.643)       0:00:02.202 ******* 
ok: [host7] => (item=https://deb.debian.org/debian/)
ok: [host8] => (item=https://deb.debian.org/debian/)
ok: [host7] => (item=https://cloud.centos.org/centos/)
ok: [host8] => (item=https://cloud.centos.org/centos/)
ok: [host8] => (item=https://pypi.org/)
ok: [host7] => (item=https://pypi.org/)

TASK [test : Checking free spase] ***********************************************************************
Sunday 06 February 2022  19:51:20 +0000 (0:00:04.173)       0:00:06.375 ******* 
ok: [host7] => (item={'block_used': 473807, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4654021, 'size_available': 19062870016, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop6', 'inode_used': 23812, 'block_size': 4096, 'inode_available': 1286908}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4654021,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 473807,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1286908,
        "inode_total": 1310720,
        "inode_used": 23812,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19062870016,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18800775168, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4590033, 'block_used': 537795, 'inode_total': 1310720, 'inode_available': 1283635, 'inode_used': 27085, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4590033,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 537795,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1283635,
        "inode_total": 1310720,
        "inode_used": 27085,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18800775168,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Checking free memory] **********************************************************************
Sunday 06 February 2022  19:51:20 +0000 (0:00:00.075)       0:00:06.451 ******* 
ok: [host7] => (item={'block_used': 473807, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4654021, 'size_available': 19062870016, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop6', 'inode_used': 23812, 'block_size': 4096, 'inode_available': 1286908}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4654021,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 473807,
        "device": "/dev/loop6",
        "fstype": "ext4",
        "inode_available": 1286908,
        "inode_total": 1310720,
        "inode_used": 23812,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19062870016,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [host8] => (item={'mount': '/', 'device': '/dev/loop7', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18800775168, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4590033, 'block_used': 537795, 'inode_total': 1310720, 'inode_available': 1283635, 'inode_used': 27085, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4590033,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 537795,
        "device": "/dev/loop7",
        "fstype": "ext4",
        "inode_available": 1283635,
        "inode_total": 1310720,
        "inode_used": 27085,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18800775168,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

PLAY RECAP **********************************************************************************************
host7                      : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host8                      : ok=5    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Sunday 06 February 2022  19:51:21 +0000 (0:00:00.085)       0:00:06.537 ******* 
=============================================================================== 
test : Check repos ------------------------------------------------------------------------------- 4.17s
Gathering Facts ---------------------------------------------------------------------------------- 1.55s
test : Check SUDO with NOPASSWD ------------------------------------------------------------------ 0.64s
test : Checking free memory ---------------------------------------------------------------------- 0.09s
test : Checking free spase ----------------------------------------------------------------------- 0.08s
Playbook run took 0 days, 0 hours, 0 minutes, 6 seconds
```