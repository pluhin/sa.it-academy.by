# Task 1

```bash
  ansible-playbook -i inv.yaml hello.yaml

PLAY [all_workers] ************************************************************************

TASK [Gathering Facts] ********************************************************************
Wednesday 05 November 2025  10:52:30 +0300 (0:00:00.030)       0:00:00.030 **** 
ok: [host_21]
ok: [host_22]

TASK [Hello] ******************************************************************************
Wednesday 05 November 2025  10:52:33 +0300 (0:00:02.517)       0:00:02.547 **** 
ok: [host_21] => {
    "msg": "Hello Ansible!"
}
ok: [host_22] => {
    "msg": "Hello Ansible!"
}

PLAY RECAP ********************************************************************************
host_21                    : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_22                    : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 05 November 2025  10:52:33 +0300 (0:00:00.153)       0:00:02.701 **** 
=============================================================================== 
Gathering Facts -------------------------------------------------------------------- 2.52s
Hello ------------------------------------------------------------------------------ 0.15s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds

```


# Task 2

```bash
ansible-playbook -i inv.yaml install_package.yaml -e package_name=vim

PLAY [all_workers] *************************************************************************

TASK [Gathering Facts] *********************************************************************
Wednesday 05 November 2025  11:17:23 +0300 (0:00:00.029)       0:00:00.030 **** 
ok: [host_21]
ok: [host_22]

TASK [Install package vim] *****************************************************************
Wednesday 05 November 2025  11:17:25 +0300 (0:00:02.454)       0:00:02.484 **** 
ok: [host_21]
ok: [host_22]

TASK [Check package installed] *************************************************************
Wednesday 05 November 2025  11:17:27 +0300 (0:00:01.671)       0:00:04.156 **** 
changed: [host_22]
changed: [host_21]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:17:28 +0300 (0:00:00.810)       0:00:04.966 **** 
ok: [host_21] => {
    "msg": [
        "/usr/bin/vim"
    ]
}
ok: [host_22] => {
    "msg": [
        "/usr/bin/vim"
    ]
}

PLAY RECAP *********************************************************************************
host_21                    : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_22                    : ok=4    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 05 November 2025  11:17:28 +0300 (0:00:00.200)       0:00:05.167 **** 
=============================================================================== 
Gathering Facts --------------------------------------------------------------------- 2.45s
Install package vim ----------------------------------------------------------------- 1.67s
Check package installed ------------------------------------------------------------- 0.81s
debug ------------------------------------------------------------------------------- 0.20s
Playbook run took 0 days, 0 hours, 0 minutes, 5 seconds

```


# Task 3

```bash
ansible-playbook -i inv.yaml create_users_and_groups.yaml -e new_user=grisha -e user_group=student

PLAY [all_workers] *************************************************************************

TASK [Gathering Facts] *********************************************************************
Wednesday 05 November 2025  11:48:00 +0300 (0:00:00.012)       0:00:00.012 **** 
ok: [host_21]
ok: [host_22]

TASK [Add new user grisha] *****************************************************************
Wednesday 05 November 2025  11:48:03 +0300 (0:00:02.476)       0:00:02.488 **** 
changed: [host_21]
changed: [host_22]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:04 +0300 (0:00:01.246)       0:00:03.735 **** 
ok: [host_21] => {
    "msg": {
        "changed": true,
        "comment": "",
        "create_home": true,
        "failed": false,
        "group": 1000,
        "home": "/home/grisha",
        "name": "grisha",
        "password": "NOT_LOGGING_PASSWORD",
        "shell": "/bin/bash",
        "state": "present",
        "system": false,
        "uid": 1000
    }
}
ok: [host_22] => {
    "msg": {
        "changed": true,
        "comment": "",
        "create_home": true,
        "failed": false,
        "group": 1000,
        "home": "/home/grisha",
        "name": "grisha",
        "password": "NOT_LOGGING_PASSWORD",
        "shell": "/bin/bash",
        "state": "present",
        "system": false,
        "uid": 1000
    }
}

TASK [Check user] **************************************************************************
Wednesday 05 November 2025  11:48:04 +0300 (0:00:00.065)       0:00:03.800 **** 
changed: [host_21]
changed: [host_22]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:05 +0300 (0:00:00.790)       0:00:04.591 **** 
ok: [host_21] => {
    "msg": [
        "grisha:x:1000:1000::/home/grisha:/bin/bash",
        "grisha:x:1000:"
    ]
}
ok: [host_22] => {
    "msg": [
        "grisha:x:1000:1000::/home/grisha:/bin/bash",
        "grisha:x:1000:"
    ]
}

TASK [Create a group student] **************************************************************
Wednesday 05 November 2025  11:48:05 +0300 (0:00:00.068)       0:00:04.660 **** 
changed: [host_22]
changed: [host_21]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:06 +0300 (0:00:00.820)       0:00:05.480 **** 
ok: [host_21] => {
    "msg": {
        "changed": true,
        "failed": false,
        "gid": 1001,
        "name": "student",
        "state": "present",
        "system": false
    }
}
ok: [host_22] => {
    "msg": {
        "changed": true,
        "failed": false,
        "gid": 1001,
        "name": "student",
        "state": "present",
        "system": false
    }
}

TASK [Check group exists] ******************************************************************
Wednesday 05 November 2025  11:48:06 +0300 (0:00:00.105)       0:00:05.585 **** 
changed: [host_21]
changed: [host_22]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:07 +0300 (0:00:00.686)       0:00:06.272 **** 
ok: [host_21] => {
    "msg": [
        "student:x:1001:"
    ]
}
ok: [host_22] => {
    "msg": [
        "student:x:1001:"
    ]
}

TASK [Add a user grisha to a group student] ************************************************
Wednesday 05 November 2025  11:48:07 +0300 (0:00:00.075)       0:00:06.347 **** 
changed: [host_21]
changed: [host_22]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:07 +0300 (0:00:00.728)       0:00:07.076 **** 
ok: [host_21] => {
    "msg": {
        "append": true,
        "changed": true,
        "comment": "",
        "failed": false,
        "group": 1000,
        "groups": "student, sudo",
        "home": "/home/grisha",
        "move_home": false,
        "name": "grisha",
        "shell": "/bin/bash",
        "state": "present",
        "uid": 1000
    }
}
ok: [host_22] => {
    "msg": {
        "append": true,
        "changed": true,
        "comment": "",
        "failed": false,
        "group": 1000,
        "groups": "student, sudo",
        "home": "/home/grisha",
        "move_home": false,
        "name": "grisha",
        "shell": "/bin/bash",
        "state": "present",
        "uid": 1000
    }
}

TASK [Check user in group] *****************************************************************
Wednesday 05 November 2025  11:48:08 +0300 (0:00:00.071)       0:00:07.148 **** 
changed: [host_21]
changed: [host_22]

TASK [debug] *******************************************************************************
Wednesday 05 November 2025  11:48:08 +0300 (0:00:00.685)       0:00:07.833 **** 
ok: [host_21] => {
    "msg": [
        "uid=1000(grisha) gid=1000(grisha) groups=1000(grisha),27(sudo),1001(student)"
    ]
}
ok: [host_22] => {
    "msg": [
        "uid=1000(grisha) gid=1000(grisha) groups=1000(grisha),27(sudo),1001(student)"
    ]
}

PLAY RECAP *********************************************************************************
host_21                    : ok=13   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host_22                    : ok=13   changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 05 November 2025  11:48:08 +0300 (0:00:00.157)       0:00:07.990 **** 
=============================================================================== 
Gathering Facts --------------------------------------------------------------------- 2.48s
Add new user grisha ----------------------------------------------------------------- 1.25s
Create a group student -------------------------------------------------------------- 0.82s
Check user -------------------------------------------------------------------------- 0.79s
Add a user grisha to a group student ------------------------------------------------ 0.73s
Check group exists ------------------------------------------------------------------ 0.69s
Check user in group ----------------------------------------------------------------- 0.69s
debug ------------------------------------------------------------------------------- 0.16s
debug ------------------------------------------------------------------------------- 0.11s
debug ------------------------------------------------------------------------------- 0.08s
debug ------------------------------------------------------------------------------- 0.07s
debug ------------------------------------------------------------------------------- 0.07s
debug ------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 7 seconds

```
