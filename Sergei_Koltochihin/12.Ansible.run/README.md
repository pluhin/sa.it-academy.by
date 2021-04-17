### play.yaml execution output
```sh
sergei@sergei-VirtualBox:~/vebinar12$ ansible-playbook play.yaml -i hosts.yaml

PLAY [all_hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Wednesday 07 April 2021  15:32:45 +0300 (0:00:00.024)       0:00:00.025 ******* 
ok: [worker1]
ok: [worker2]

TASK [Print OS and version] ****************************************************************************************************************************
Wednesday 07 April 2021  15:32:48 +0300 (0:00:02.391)       0:00:02.416 ******* 
ok: [worker1] => {
    "msg": "CentOS | 7.9"
}
ok: [worker2] => {
    "msg": "Ubuntu | 18.04"
}

TASK [Print mounts information] ************************************************************************************************************************
Wednesday 07 April 2021  15:32:48 +0300 (0:00:00.100)       0:00:02.516 ******* 
ok: [worker1] => {
    "msg": [
        "Mount path: /",
        "Mount capacity: 21003583488",
        "Mount used: 1824260096"
    ]
}
ok: [worker2] => {
    "msg": [
        "Mount path: /",
        "Mount capacity: 21003583488",
        "Mount used: 2372513792"
    ]
}

TASK [Pring memory information] ************************************************************************************************************************
Wednesday 07 April 2021  15:32:48 +0300 (0:00:00.127)       0:00:02.644 ******* 
ok: [worker1] => {
    "msg": [
        "Memory capacity: 4096",
        "Memory free: 3915"
    ]
}
ok: [worker2] => {
    "msg": [
        "Memory capacity: 4096",
        "Memory free: 3887"
    ]
}

PLAY RECAP *********************************************************************************************************************************************
worker1                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
worker2                    : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Wednesday 07 April 2021  15:32:48 +0300 (0:00:00.095)       0:00:02.739 ******* 
=============================================================================== 
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 2.39s
Print mounts information ------------------------------------------------------------------------------------------------------------------------ 0.13s
Print OS and version ---------------------------------------------------------------------------------------------------------------------------- 0.10s
Pring memory information ------------------------------------------------------------------------------------------------------------------------ 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 2 seconds
```
### user.yaml execution output
```sh
sergei@sergei-VirtualBox:~/vebinar12$ ansible-playbook user.yaml -i hosts.yaml -u root

PLAY [all_hosts] ***************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************
Wednesday 07 April 2021  15:28:48 +0300 (0:00:00.025)       0:00:00.025 ******* 
ok: [worker1]
ok: [worker2]

TASK [Creating user sergei] ****************************************************************************************************************************
Wednesday 07 April 2021  15:28:50 +0300 (0:00:02.011)       0:00:02.036 ******* 
ok: [worker1]
ok: [worker2]

TASK [Creating ssh folder] *****************************************************************************************************************************
Wednesday 07 April 2021  15:28:51 +0300 (0:00:00.885)       0:00:02.921 ******* 
ok: [worker1]
ok: [worker2]

TASK [Authorize key] ***********************************************************************************************************************************
Wednesday 07 April 2021  15:28:52 +0300 (0:00:00.855)       0:00:03.777 ******* 
ok: [worker1] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVHb9i6j5EnlmU4HunhOSnAOqlqt8200LGfmDOcQfKjVOHAzoUfpBiQIy0tlPdVnpa6IflhBlVosYpV78RxXBidjPQ3FQtJ+3V87cuOvDnGWM8q2d9A2rtTXgfLwGGlsxHZfMPKnKnzHAeZ17G8BaxHanGu7pmmESLbh4Iw6NW6bl0Gjs9/x4oLPed7ImoG9jNkVL0YPK70tHI4y5oc5uYQdOs4Hw+Hnt+zak7BfuULEiFdeoOeHxCfL+wEiMjDoCVNPivOwEQUW8RXj3c1mHySdVqJmpOqV+C1Ge62wl8dU63xdLm865VEuRW9a77CDJlDLsTN1Xpotec9oIxhdzyiNPr+NYfESSJ+Gp3xwelPBPiwhIAXlaTTHZ40LTq8QR1PuEoNzHr25wszuI9dkXJqpub8oLuHOH7J2Lq8VzMLNxOFDb4ZVSWj9lksS7C91OsGbcZ9WdtOvY5XaCaglPLX6He7zXhVVlD7YhxueK5Nm78q8+pGGWYiH5oKMcxYWU= sergei@sergei-VirtualBox)
ok: [worker2] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVHb9i6j5EnlmU4HunhOSnAOqlqt8200LGfmDOcQfKjVOHAzoUfpBiQIy0tlPdVnpa6IflhBlVosYpV78RxXBidjPQ3FQtJ+3V87cuOvDnGWM8q2d9A2rtTXgfLwGGlsxHZfMPKnKnzHAeZ17G8BaxHanGu7pmmESLbh4Iw6NW6bl0Gjs9/x4oLPed7ImoG9jNkVL0YPK70tHI4y5oc5uYQdOs4Hw+Hnt+zak7BfuULEiFdeoOeHxCfL+wEiMjDoCVNPivOwEQUW8RXj3c1mHySdVqJmpOqV+C1Ge62wl8dU63xdLm865VEuRW9a77CDJlDLsTN1Xpotec9oIxhdzyiNPr+NYfESSJ+Gp3xwelPBPiwhIAXlaTTHZ40LTq8QR1PuEoNzHr25wszuI9dkXJqpub8oLuHOH7J2Lq8VzMLNxOFDb4ZVSWj9lksS7C91OsGbcZ9WdtOvY5XaCaglPLX6He7zXhVVlD7YhxueK5Nm78q8+pGGWYiH5oKMcxYWU= sergei@sergei-VirtualBox)

TASK [SSH authentication] ******************************************************************************************************************************
Wednesday 07 April 2021  15:28:53 +0300 (0:00:00.964)       0:00:04.741 ******* 
ok: [worker1]
ok: [worker2]

TASK [Add user to sudo nopasswd] ***********************************************************************************************************************
Wednesday 07 April 2021  15:28:54 +0300 (0:00:01.148)       0:00:05.890 ******* 
ok: [worker1]
ok: [worker2]

TASK [Check user sergei] *******************************************************************************************************************************
Wednesday 07 April 2021  15:28:55 +0300 (0:00:00.727)       0:00:06.617 ******* 
changed: [worker1]
changed: [worker2]

TASK [debug] *******************************************************************************************************************************************
Wednesday 07 April 2021  15:28:56 +0300 (0:00:00.867)       0:00:07.484 ******* 
ok: [worker1] => {
    "msg": [
        "sergei:x:1001:1001:Managed by ansible:/home/sergei:/bin/bash"
    ]
}
ok: [worker2] => {
    "msg": [
        "sergei:x:1001:1001:Managed by ansible:/home/sergei:/bin/sh"
    ]
}

TASK [Upgrade CentOS] **********************************************************************************************************************************
Wednesday 07 April 2021  15:28:56 +0300 (0:00:00.068)       0:00:07.553 ******* 
skipping: [worker2]
ok: [worker1]

TASK [Upgrade Ubuntu] **********************************************************************************************************************************
Wednesday 07 April 2021  15:29:12 +0300 (0:00:16.357)       0:00:23.911 ******* 
skipping: [worker1]
ok: [worker2]

PLAY RECAP *********************************************************************************************************************************************
worker1                    : ok=9    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
worker2                    : ok=9    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Wednesday 07 April 2021  15:29:14 +0300 (0:00:01.804)       0:00:25.715 ******* 
=============================================================================== 
Upgrade CentOS --------------------------------------------------------------------------------------------------------------------------------- 16.36s
Gathering Facts --------------------------------------------------------------------------------------------------------------------------------- 2.01s
Upgrade Ubuntu ---------------------------------------------------------------------------------------------------------------------------------- 1.80s
SSH authentication ------------------------------------------------------------------------------------------------------------------------------ 1.15s
Authorize key ----------------------------------------------------------------------------------------------------------------------------------- 0.96s
Creating user sergei ---------------------------------------------------------------------------------------------------------------------------- 0.89s
Check user sergei ------------------------------------------------------------------------------------------------------------------------------- 0.87s
Creating ssh folder ----------------------------------------------------------------------------------------------------------------------------- 0.86s
Add user to sudo nopasswd ----------------------------------------------------------------------------------------------------------------------- 0.73s
debug ------------------------------------------------------------------------------------------------------------------------------------------- 0.07s
Playbook run took 0 days, 0 hours, 0 minutes, 25 seconds
```
