# 13.Ansible
```
 ansible-playbook -i hosts.yaml play.yaml

PLAY [all] ***************************************************************************************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************************************************************
Wednesday 07 April 2021  18:44:40 +0000 (0:00:00.036)       0:00:00.036 *******
ok: [centos]
ok: [ubuntu]

TASK [web : Update and Install] ******************************************************************************************************************************************
Wednesday 07 April 2021  18:44:44 +0000 (0:00:04.029)       0:00:04.065 *******
skipping: [centos]
ok: [ubuntu]

TASK [web : Nginx. Enable ans start] *************************************************************************************************************************************
Wednesday 07 April 2021  18:44:47 +0000 (0:00:02.831)       0:00:06.896 *******
skipping: [centos]
ok: [ubuntu]

TASK [web : Copy nginx config] *******************************************************************************************************************************************
Wednesday 07 April 2021  18:44:49 +0000 (0:00:01.423)       0:00:08.320 *******
skipping: [centos]
ok: [ubuntu]

TASK [web : Copy index.html Debian] **************************************************************************************************************************************
Wednesday 07 April 2021  18:44:50 +0000 (0:00:01.795)       0:00:10.115 *******
skipping: [centos]
ok: [ubuntu]

TASK [web : Update and Install] ******************************************************************************************************************************************
Wednesday 07 April 2021  18:44:53 +0000 (0:00:02.242)       0:00:12.357 *******
skipping: [ubuntu] => (item=epel-release)
skipping: [ubuntu] => (item=nginx)
ok: [centos] => (item=epel-release)
ok: [centos] => (item=nginx)

TASK [web : Nginx Enable and start] **************************************************************************************************************************************
Wednesday 07 April 2021  18:44:55 +0000 (0:00:02.699)       0:00:15.057 *******
skipping: [ubuntu]
ok: [centos]

TASK [web : Copy nginx config] *******************************************************************************************************************************************
Wednesday 07 April 2021  18:44:56 +0000 (0:00:00.781)       0:00:15.839 *******
skipping: [ubuntu]
ok: [centos]

TASK [web : Copy index.html Centos] **************************************************************************************************************************************
Wednesday 07 April 2021  18:44:57 +0000 (0:00:01.209)       0:00:17.048 *******
skipping: [ubuntu]
ok: [centos]

TASK [web : Templates hosts] *********************************************************************************************************************************************
Wednesday 07 April 2021  18:44:59 +0000 (0:00:01.764)       0:00:18.813 *******
ok: [centos]
ok: [ubuntu]

TASK [web : Check connaction] ********************************************************************************************************************************************
Wednesday 07 April 2021  18:45:01 +0000 (0:00:01.459)       0:00:20.273 *******
ok: [centos]
ok: [ubuntu]

TASK [web : print out] ***************************************************************************************************************************************************
Wednesday 07 April 2021  18:45:02 +0000 (0:00:00.995)       0:00:21.269 *******
ok: [centos] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}
ok: [ubuntu] => {
    "msg": {
        "changed": false,
        "elapsed": 0,
        "failed": false,
        "match_groupdict": {},
        "match_groups": [],
        "path": null,
        "port": 80,
        "search_regex": null,
        "state": "started"
    }
}

TASK [web : Check content to the sites] **********************************************************************************************************************************
Wednesday 07 April 2021  18:45:02 +0000 (0:00:00.128)       0:00:21.398 *******
ok: [centos] => (item={'name': 'centos9.sa', 'ip': '192.168.202.9'})
ok: [ubuntu] => (item={'name': 'centos9.sa', 'ip': '192.168.202.9'})
ok: [centos] => (item={'name': 'ubuntu10.sa', 'ip': '192.168.202.10'})
ok: [ubuntu] => (item={'name': 'ubuntu10.sa', 'ip': '192.168.202.10'})

TASK [web : print out] ***************************************************************************************************************************************************
Wednesday 07 April 2021  18:45:04 +0000 (0:00:01.936)       0:00:23.334 *******
ok: [centos] => {
    "msg": "<html>\n<body>\n\n<h1>Hello world, Centos</h1>\n\n</body>\n</html>\n | <!DOCTYPE html>\n<html>\n<head>\n<title>Welcome to nginx!</title>\n<style>\n    body {\n        width: 35em;\n        margin: 0 auto;\n        font-family: Tahoma, Verdana, Arial, sans-serif;\n    }\n</style>\n</head>\n<body>\n<h1>Welcome to nginx!</h1>\n<p>If you see this page, the nginx web server is successfully installed and\nworking. Further configuration is required.</p>\n\n<p>For online documentation and support please refer to\n<a href=\"http://nginx.org/\">nginx.org</a>.<br/>\nCommercial support is available at\n<a href=\"http://nginx.com/\">nginx.com</a>.</p>\n\n<p><em>Thank you for using nginx.</em></p>\n</body>\n</html>\n"
}
ok: [ubuntu] => {
    "msg": "<html>\n<body>\n\n<h1>Hello world, Centos</h1>\n\n</body>\n</html>\n | <!DOCTYPE html>\n<html>\n<head>\n<title>Welcome to nginx!</title>\n<style>\n    body {\n        width: 35em;\n        margin: 0 auto;\n        font-family: Tahoma, Verdana, Arial, sans-serif;\n    }\n</style>\n</head>\n<body>\n<h1>Welcome to nginx!</h1>\n<p>If you see this page, the nginx web server is successfully installed and\nworking. Further configuration is required.</p>\n\n<p>For online documentation and support please refer to\n<a href=\"http://nginx.org/\">nginx.org</a>.<br/>\nCommercial support is available at\n<a href=\"http://nginx.com/\">nginx.com</a>.</p>\n\n<p><em>Thank you for using nginx.</em></p>\n</body>\n</html>\n"
}

TASK [test : Check RAM] **************************************************************************************************************************************************
Wednesday 07 April 2021  18:45:04 +0000 (0:00:00.127)       0:00:23.462 *******
ok: [centos] => (item={'real': {'total': 4096, 'used': 207, 'free': 3889}, 'swap': {'cached': 0, 'total': 6144, 'free': 6142, 'used': 2}, 'nocache': {'used': 135, 'free': 3961}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 3961,
            "used": 135
        },
        "real": {
            "free": 3889,
            "total": 4096,
            "used": 207
        },
        "swap": {
            "cached": 0,
            "free": 6142,
            "total": 6144,
            "used": 2
        }
    },
    "msg": "All assertions passed"
}
ok: [ubuntu] => (item={'real': {'total': 4096, 'used': 465, 'free': 3631}, 'nocache': {'free': 3939, 'used': 157}, 'swap': {'total': 6144, 'free': 6143, 'used': 1, 'cached': 0}}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "nocache": {
            "free": 3939,
            "used": 157
        },
        "real": {
            "free": 3631,
            "total": 4096,
            "used": 465
        },
        "swap": {
            "cached": 0,
            "free": 6143,
            "total": 6144,
            "used": 1
        }
    },
    "msg": "All assertions passed"
}

TASK [test : Check free space] *******************************************************************************************************************************************
Wednesday 07 April 2021  18:45:04 +0000 (0:00:00.136)       0:00:23.598 *******
ok: [centos] => (item={'block_used': 483226, 'uuid': 'N/A', 'size_total': 21003583488, 'block_total': 5127828, 'mount': '/', 'block_available': 4644602, 'size_available': 19024289792, 'fstype': 'ext4', 'inode_total': 1310720, 'options': 'rw,relatime', 'device': '/dev/loop8', 'inode_used': 23392, 'block_size': 4096, 'inode_available': 1287328}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4644602,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 483226,
        "device": "/dev/loop8",
        "fstype": "ext4",
        "inode_available": 1287328,
        "inode_total": 1310720,
        "inode_used": 23392,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 19024289792,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}
ok: [ubuntu] => (item={'mount': '/', 'device': '/dev/loop9', 'fstype': 'ext4', 'options': 'rw,relatime', 'size_total': 21003583488, 'size_available': 18605363200, 'block_size': 4096, 'block_total': 5127828, 'block_available': 4542325, 'block_used': 585503, 'inode_total': 1310720, 'inode_available': 1283100, 'inode_used': 27620, 'uuid': 'N/A'}) => {
    "ansible_loop_var": "item",
    "changed": false,
    "item": {
        "block_available": 4542325,
        "block_size": 4096,
        "block_total": 5127828,
        "block_used": 585503,
        "device": "/dev/loop9",
        "fstype": "ext4",
        "inode_available": 1283100,
        "inode_total": 1310720,
        "inode_used": 27620,
        "mount": "/",
        "options": "rw,relatime",
        "size_available": 18605363200,
        "size_total": 21003583488,
        "uuid": "N/A"
    },
    "msg": "All assertions passed"
}

TASK [test : Connectivity checks to doker_hub] ***************************************************************************************************************************
Wednesday 07 April 2021  18:45:04 +0000 (0:00:00.143)       0:00:23.742 *******
ok: [centos] => (item=https://registry.hub.docker.com)
ok: [ubuntu] => (item=https://registry.hub.docker.com)

TASK [test : Print output] ***********************************************************************************************************************************************
Wednesday 07 April 2021  18:45:06 +0000 (0:00:01.497)       0:00:25.240 *******
ok: [centos] => (item=W/"7f8-7NgY3rR1BoeLhW2F4V8VG/fg8+4") => {
    "msg": "Url W/\"7f8-7NgY3rR1BoeLhW2F4V8VG/fg8+4\""
}
ok: [ubuntu] => (item=W/"7f8-7NgY3rR1BoeLhW2F4V8VG/fg8+4") => {
    "msg": "Url W/\"7f8-7NgY3rR1BoeLhW2F4V8VG/fg8+4\""
}

TASK [test : Check pub repo] *********************************************************************************************************************************************
Wednesday 07 April 2021  18:45:06 +0000 (0:00:00.135)       0:00:25.375 *******
ok: [ubuntu] => (item={'url': 'archive.ubuntu.com', 'port': 80})
ok: [centos] => (item={'url': 'archive.ubuntu.com', 'port': 80})
ok: [centos] => (item={'url': 'ftp.wrz.de', 'port': 80})
ok: [ubuntu] => (item={'url': 'ftp.wrz.de', 'port': 80})
ok: [ubuntu] => (item={'url': 'bootstrap.pypa.io', 'port': 443})
ok: [centos] => (item={'url': 'bootstrap.pypa.io', 'port': 443})

TASK [test : Check SUDO with NOPASSWD] ***********************************************************************************************************************************
Wednesday 07 April 2021  18:45:08 +0000 (0:00:02.504)       0:00:27.879 *******
ok: [centos]
ok: [ubuntu]

PLAY RECAP ***************************************************************************************************************************************************************
centos                     : ok=16   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0
ubuntu                     : ok=16   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

Wednesday 07 April 2021  18:45:09 +0000 (0:00:01.058)       0:00:28.938 *******
===============================================================================
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------------------------- 4.03s
web : Update and Install ------------------------------------------------------------------------------------------------------------------------------------------ 2.83s
web : Update and Install ------------------------------------------------------------------------------------------------------------------------------------------ 2.70s
test : Check pub repo --------------------------------------------------------------------------------------------------------------------------------------------- 2.50s
web : Copy index.html Debian -------------------------------------------------------------------------------------------------------------------------------------- 2.24s
web : Check content to the sites ---------------------------------------------------------------------------------------------------------------------------------- 1.94s
web : Copy nginx config ------------------------------------------------------------------------------------------------------------------------------------------- 1.80s
web : Copy index.html Centos -------------------------------------------------------------------------------------------------------------------------------------- 1.76s
test : Connectivity checks to doker_hub --------------------------------------------------------------------------------------------------------------------------- 1.50s
web : Templates hosts --------------------------------------------------------------------------------------------------------------------------------------------- 1.46s
web : Nginx. Enable ans start ------------------------------------------------------------------------------------------------------------------------------------- 1.42s
web : Copy nginx config ------------------------------------------------------------------------------------------------------------------------------------------- 1.21s
test : Check SUDO with NOPASSWD ----------------------------------------------------------------------------------------------------------------------------------- 1.06s
web : Check connaction -------------------------------------------------------------------------------------------------------------------------------------------- 1.00s
web : Nginx Enable and start -------------------------------------------------------------------------------------------------------------------------------------- 0.78s
test : Check free space ------------------------------------------------------------------------------------------------------------------------------------------- 0.14s
test : Check RAM -------------------------------------------------------------------------------------------------------------------------------------------------- 0.14s
test : Print output ----------------------------------------------------------------------------------------------------------------------------------------------- 0.14s
web : print out --------------------------------------------------------------------------------------------------------------------------------------------------- 0.13s
web : print out --------------------------------------------------------------------------------------------------------------------------------------------------- 0.13s
Playbook run took 0 days, 0 hours, 0 minutes, 28 seconds

```