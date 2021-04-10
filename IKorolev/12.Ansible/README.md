# 12.Ansible
```
ansible-playbook play.yaml -i hosts.yaml -u root --sk-vault-pass
Vault password:

PLAY [ec2] ********************************************************************************

TASK [Gathering Facts] ********************************************************************
Saturday 03 April 2021  12:56:15 +0000 (0:00:00.031)       0:00:00.031 ********
ok: [w_2]
ok: [w_1]

TASK [Set authorized key taken from file] *************************************************
Saturday 03 April 2021  12:56:24 +0000 (0:00:09.438)       0:00:09.469 ********
ok: [w_1] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDUJ/gDEbGEm/oyKfpXieMEK5ZCLPx93MoadzAEbFNaOpORKOB+fpfWQ+sUAynqiMHdKyjS6EU4pP17cUQaafQe3y3zswc3SN+w6Lb7fsX+J7cpxlCuEU0cSU3NBFYvQqXH70G3/7sja51ZLdAZlKtfDfBywng1asa0mk+9TJIJE0UJkTZwlSLXjJl6xWZ4oYeZjP2rcJqJGJyBCYVd3nzj6q42DIOhA8ZR585Q6IPxiiVrzTTOAxOlUuhXCd70mfh/1ftfs4G6EUR4o9Kb6KYyvS4lVP/kNyU8u0p4dNBNjChX2O2AzTlR0R0KN1YaVB7EvrIaGAumzotiPJx user@ubuntu-bionic)
ok: [w_2] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDUJ/gDEbGEm/oyKfpXieMEK5ZCLPx93MoadzAEbFNaOpORKOB+fpfWQ+sUAynqiMHdKyjS6EU4pP17cUQaafQe3y3zswc3SN+w6Lb7fsX+J7cpxlCuEU0cSU3NBFYvQqXH70G3/7sja51ZLdAZlKtfDfBywng1asa0mk+9TJIJE0UJkTZwlSLXjJl6xWZ4oYeZjP2rcJqJGJyBCYVd3nzj6q42DIOhA8ZR585Q6IPxiiVrzTTOAxOlUuhXCd70mfh/1ftfs4G6EUR4o9Kb6KYyvS4lVP/kNyU8u0p4dNBNjChX2O2AzTlR0R0KN1YaVB7EvrIaGAumzotiPJx user@ubuntu-bionic)

TASK [Print variables] ********************************************************************
Saturday 03 April 2021  12:56:29 +0000 (0:00:04.514)       0:00:13.983 ********
ok: [w_1] => {
    "msg": "IKorolev | True | 1374"
}
ok: [w_2] => {
    "msg": "IKorolev | True | 1374"
}

TASK [Print OS] ***************************************************************************
Saturday 03 April 2021  12:56:29 +0000 (0:00:00.191)       0:00:14.174 ********
ok: [w_1] => {
    "msg": "Ubuntu | 18.04"
}
ok: [w_2] => {
    "msg": "CentOS | 7.7"
}

TASK [Print mount] ************************************************************************
Saturday 03 April 2021  12:56:29 +0000 (0:00:00.210)       0:00:14.385 ********
ok: [w_1] => {
    "msg": [
        {
            "block_available": 4602652,
            "block_size": 4096,
            "block_total": 5127828,
            "block_used": 525176,
            "device": "/dev/loop9",
            "fstype": "ext4",
            "inode_available": 1284173,
            "inode_total": 1310720,
            "inode_used": 26547,
            "mount": "/",
            "options": "rw,relatime",
            "size_available": 18852462592,
            "size_total": 21003583488,
            "uuid": "N/A"
        }
    ]
}
ok: [w_2] => {
    "msg": [
        {
            "block_available": 4689442,
            "block_size": 4096,
            "block_total": 5127828,
            "block_used": 438386,
            "device": "/dev/loop8",
            "fstype": "ext4",
            "inode_available": 1288130,
            "inode_total": 1310720,
            "inode_used": 22590,
            "mount": "/",
            "options": "rw,relatime",
            "size_available": 19207954432,
            "size_total": 21003583488,
            "uuid": "N/A"
        }
    ]
}

TASK [Print RAM] **************************************************************************
Saturday 03 April 2021  12:56:29 +0000 (0:00:00.230)       0:00:14.616 ********
ok: [w_1] => {
    "msg": "RAM capacity: 4096, RAM free: 3987"
}
ok: [w_2] => {
    "msg": "RAM capacity: 4096, RAM free: 4002"
}

PLAY RECAP ********************************************************************************
w_1                        : ok=6    changed=0    unreachable=0    failed=0    skipped=0   rescued=0    ignored=0
w_2                        : ok=6    changed=0    unreachable=0    failed=0    skipped=0   rescued=0    ignored=0

Saturday 03 April 2021  12:56:29 +0000 (0:00:00.197)       0:00:14.813 ********
===============================================================================
Gathering Facts --------------------------------------------------------------------- 9.44s
Set authorized key taken from file -------------------------------------------------- 4.51s
Print mount ------------------------------------------------------------------------- 0.23s
Print OS ---------------------------------------------------------------------------- 0.21s
Print RAM --------------------------------------------------------------------------- 0.20s
Print variables --------------------------------------------------------------------- 0.19s
Playbook run took 0 days, 0 hours, 0 minutes, 14 seconds

```
----
```
ansible-playbook play_user.yaml -i hosts.yaml -u root --ask-vault-pass -e group=ec2 -e user_to_add=IK
Vault password:

PLAY [ec2] *********************************************************************

TASK [Gathering Facts] *********************************************************
Sunday 04 April 2021  10:09:33 +0000 (0:00:00.055)       0:00:00.055 **********
ok: [w_2]
ok: [w_1]

TASK [Print variable] **********************************************************
Sunday 04 April 2021  10:09:36 +0000 (0:00:03.217)       0:00:03.272 **********
ok: [w_1] => {
    "msg": "You requested user IK"
}
ok: [w_2] => {
    "msg": "You requested user IK"
}

TASK [Install sudo if OS-family is Debian] *************************************
Sunday 04 April 2021  10:09:36 +0000 (0:00:00.097)       0:00:03.369 **********
skipping: [w_1]
ok: [w_2]

TASK [Install sudo if OS-family is CentOS] *************************************
Sunday 04 April 2021  10:09:39 +0000 (0:00:03.062)       0:00:06.432 **********
skipping: [w_1]
skipping: [w_2]

TASK [Ensure group "sudo" exists] **********************************************
Sunday 04 April 2021  10:09:40 +0000 (0:00:00.096)       0:00:06.529 **********
skipping: [w_1]
ok: [w_2]

TASK [Ensure group "wheel" exists] *********************************************
Sunday 04 April 2021  10:09:40 +0000 (0:00:00.816)       0:00:07.345 **********
skipping: [w_1]
skipping: [w_2]

TASK [Creating user IK] ********************************************************
Sunday 04 April 2021  10:09:40 +0000 (0:00:00.096)       0:00:07.442 **********
ok: [w_1]
ok: [w_2]

TASK [Adding user to sudo group if OS-family is Debian] ************************
Sunday 04 April 2021  10:09:42 +0000 (0:00:01.188)       0:00:08.631 **********
skipping: [w_1]
ok: [w_2]

TASK [Adding user to wheel group if OS-family is CentOS] ***********************
Sunday 04 April 2021  10:09:42 +0000 (0:00:00.800)       0:00:09.431 **********
skipping: [w_1]
skipping: [w_2]

TASK [Escalating privileges to sudo nopasswd] **********************************
Sunday 04 April 2021  10:09:43 +0000 (0:00:00.096)       0:00:09.527 **********
ok: [w_1]
ok: [w_2]

TASK [Check user exists] *******************************************************
Sunday 04 April 2021  10:09:43 +0000 (0:00:00.886)       0:00:10.413 **********
changed: [w_1]
changed: [w_2]

TASK [debug] *******************************************************************
Sunday 04 April 2021  10:09:45 +0000 (0:00:01.536)       0:00:11.949 **********
ok: [w_1] => {
    "msg": [
        "IK:x:1000:1000:Managed by ansible:/home/IK:/bin/bash",
        "IKorolev:x:1001:1001::/home/IKorolev:/bin/bash"
    ]
}
ok: [w_2] => {
    "msg": [
        "IK:x:1000:1000:Managed by ansible:/home/IK:/bin/bash",
        "IKorolev:x:1001:1001::/home/IKorolev:/bin/sh"
    ]
}

TASK [Check user has sudo nopasswd privigleges if OS-family is Debian] *********
Sunday 04 April 2021  10:09:45 +0000 (0:00:00.114)       0:00:12.064 **********
skipping: [w_1]
changed: [w_2]

TASK [Check user has sudo nopasswd privigleges if OS-family is CentOS] *********
Sunday 04 April 2021  10:09:52 +0000 (0:00:06.939)       0:00:19.003 **********
skipping: [w_1]
skipping: [w_2]

PLAY RECAP *********************************************************************
w_1                        : ok=6    changed=1    unreachable=0    failed=0    skipped=8    rescued=0    ignored=0
w_2                        : ok=10   changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

Sunday 04 April 2021  10:09:52 +0000 (0:00:00.105)       0:00:19.109 **********
===============================================================================
Check user has sudo nopasswd privigleges if OS-family is Debian --------- 6.94s
Gathering Facts --------------------------------------------------------- 3.22s
Install sudo if OS-family is Debian ------------------------------------- 3.06s
Check user exists ------------------------------------------------------- 1.54s
Creating user IK -------------------------------------------------------- 1.19s
Escalating privileges to sudo nopasswd ---------------------------------- 0.89s
Ensure group "sudo" exists ---------------------------------------------- 0.82s
Adding user to sudo group if OS-family is Debian ------------------------ 0.80s
debug ------------------------------------------------------------------- 0.11s
Check user has sudo nopasswd privigleges if OS-family is CentOS --------- 0.11s
Print variable ---------------------------------------------------------- 0.10s
Install sudo if OS-family is CentOS ------------------------------------- 0.10s
Adding user to wheel group if OS-family is CentOS ----------------------- 0.10s
Ensure group "wheel" exists --------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 19 seconds
user@ubuntu-bionic:/home/user/q/1231/1$
```
