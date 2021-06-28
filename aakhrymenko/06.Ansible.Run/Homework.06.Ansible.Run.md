# 06.Homework.Ansible.Run

## Environments

```bash

➜  ansible 
➜  ansible 
➜  ansible 
➜  ansible pwd
/home/andrei/ansible

➜  ansible cat /etc/os-release 
NAME="Ubuntu"
VERSION="20.04.2 LTS (Focal Fossa)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 20.04.2 LTS"
VERSION_ID="20.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=focal
UBUNTU_CODENAME=focal

➜  ansible 
➜  ansible ls -l
total 28
-rw-r--r-- 1 andrei andrei  245 чэр 27 11:53 ansible.cfg
drwxr-xr-x 2 andrei andrei 4096 чэр 26 21:06 group_vars
drwxr-xr-x 3 andrei andrei 4096 чэр 26 21:06 host_vars
-rw-r--r-- 1 andrei andrei 1817 чэр 26 21:06 inv.yaml
-rw-rw-r-- 1 andrei andrei  767 чэр 27 21:14 parameters1.yaml
-rw-rw-r-- 1 andrei andrei  451 чэр 27 17:57 playbook1.yaml
-rw-rw-r-- 1 andrei andrei 1820 чэр 28 12:46 user1.yaml
```

## Task-1 Ansible Playbook for parameters

```bash

➜  ansible ansible-playbook -i inv.yaml parameters1.yaml                                    

PLAY [work_hosts] ************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************
Monday 28 June 2021  14:33:44 +0300 (0:00:00.045)       0:00:00.045 *********** 
ok: [work_host1]
ok: [work_host2]

TASK [Print OS type and version] *********************************************************************************************************************
Monday 28 June 2021  14:34:13 +0300 (0:00:28.739)       0:00:28.784 *********** 
ok: [work_host1] => {
    "msg": "OS type - CentOS, OS version - 7.9"
}
ok: [work_host2] => {
    "msg": "OS type - Ubuntu, OS version - 18.04"
}

TASK [Print mount point, capacity and used space] ****************************************************************************************************
Monday 28 June 2021  14:34:13 +0300 (0:00:00.200)       0:00:28.985 *********** 
ok: [work_host1] => {
    "msg": "Mount point - `/`, Space total - 19.6GB, Space used - 1.9GB"
}
ok: [work_host2] => {
    "msg": "Mount point - `/`, Space total - 19.6GB, Space used - 2.4GB"
}

TASK [Print memory capacity and free] ****************************************************************************************************************
Monday 28 June 2021  14:34:13 +0300 (0:00:00.194)       0:00:29.179 *********** 
ok: [work_host1] => {
    "msg": "Memory total - 4.0GB, Memory free - 3.2GB"
}
ok: [work_host2] => {
    "msg": "Memory total - 4.0GB, Memory free - 3.0GB"
}

PLAY RECAP *******************************************************************************************************************************************
work_host1                 : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
work_host2                 : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Monday 28 June 2021  14:34:13 +0300 (0:00:00.196)       0:00:29.376 *********** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------ 28.74s
Print OS type and version --------------------------------------------------------------------------------------------------------------------- 0.20s
Print memory capacity and free ---------------------------------------------------------------------------------------------------------------- 0.20s
Print mount point, capacity and used space ---------------------------------------------------------------------------------------------------- 0.19s
Playbook run took 0 days, 0 hours, 0 minutes, 29 seconds

```

## Task-2 Ansible Playbook to create user

```bash

➜  ansible 
➜  ansible 
➜  ansible ansible-playbook -i inv.yaml user1.yaml -e group=work_hosts -e user_to_add=jajabinks 

PLAY [work_hosts] ************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************
Monday 28 June 2021  14:35:55 +0300 (0:00:00.081)       0:00:00.081 *********** 
ok: [work_host2]
ok: [work_host1]

TASK [Print variable] ********************************************************************************************************************************
Monday 28 June 2021  14:36:15 +0300 (0:00:19.550)       0:00:19.632 *********** 
ok: [work_host1] => {
    "msg": "You gonna to create user - `jajabinks`"
}
ok: [work_host2] => {
    "msg": "You gonna to create user - `jajabinks`"
}

TASK [Creating user jajabinks] ***********************************************************************************************************************
Monday 28 June 2021  14:36:15 +0300 (0:00:00.125)       0:00:19.758 *********** 
changed: [work_host1]
changed: [work_host2]

TASK [Set authorized SSH key taken from file] ********************************************************************************************************
Monday 28 June 2021  14:36:25 +0300 (0:00:10.003)       0:00:29.761 *********** 
changed: [work_host2] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCw7VHUbfWK8zvIYg6sYe0enWLnoHHbk5L8tC4CAIGT3fVPBgwNvI3pK6EISUIjwVM69hthbrkDN1YVrqRpWCkq4amC0zFuF54A3+HWaWoef3VnCFv2kM/iSgLgtPwPWaLRSQr2xF3HVREgTNjGnxmx69oszo1thHTzAmIC14JapR/KZHJtxhsuff+K90kaXS0UTXdyha0DBfiaZZDy5bz1tfjQ+UMOONqVxVAxiZx2RWNnH+JLJOtv1eEO0qzJgNFNnxAAxqdRSFGXCavKp6Tu3D5URd3ZLEZfAY+Ah/bgGuD/9W5+UssbE7HaHjDdIdgeP6Itz6ixH3jKu9CipvZBrgWcfTz08OTf9vm1kBjQ0a0gKSz77WB0GPOfCj1Nj8G0XJi7SuZtlhX2JeOZNVN6Mf2YGzqPPGxPuHMafBQyiiINGr7QFAaKdn73XN9Mvyn9udp118q/8bZOXtpXPipv5m5oxz29AHm3UuDMkrGxEJB5efw09sDLxxgOtAmRNZk= andrei@VM-Ubuntu)
changed: [work_host1] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCw7VHUbfWK8zvIYg6sYe0enWLnoHHbk5L8tC4CAIGT3fVPBgwNvI3pK6EISUIjwVM69hthbrkDN1YVrqRpWCkq4amC0zFuF54A3+HWaWoef3VnCFv2kM/iSgLgtPwPWaLRSQr2xF3HVREgTNjGnxmx69oszo1thHTzAmIC14JapR/KZHJtxhsuff+K90kaXS0UTXdyha0DBfiaZZDy5bz1tfjQ+UMOONqVxVAxiZx2RWNnH+JLJOtv1eEO0qzJgNFNnxAAxqdRSFGXCavKp6Tu3D5URd3ZLEZfAY+Ah/bgGuD/9W5+UssbE7HaHjDdIdgeP6Itz6ixH3jKu9CipvZBrgWcfTz08OTf9vm1kBjQ0a0gKSz77WB0GPOfCj1Nj8G0XJi7SuZtlhX2JeOZNVN6Mf2YGzqPPGxPuHMafBQyiiINGr7QFAaKdn73XN9Mvyn9udp118q/8bZOXtpXPipv5m5oxz29AHm3UuDMkrGxEJB5efw09sDLxxgOtAmRNZk= andrei@VM-Ubuntu)

TASK [Assign sudo permissions for jajabinks in CentOS] ***********************************************************************************************
Monday 28 June 2021  14:36:38 +0300 (0:00:12.788)       0:00:42.549 *********** 
skipping: [work_host2]
changed: [work_host1]

TASK [Assign sudo permissions for jajabinks in Ubuntu] ***********************************************************************************************
Monday 28 June 2021  14:36:46 +0300 (0:00:07.799)       0:00:50.348 *********** 
skipping: [work_host1]
changed: [work_host2]

TASK [Check] *****************************************************************************************************************************************
Monday 28 June 2021  14:36:55 +0300 (0:00:09.102)       0:00:59.451 *********** 
changed: [work_host1]
changed: [work_host2]

TASK [debug] *****************************************************************************************************************************************
Monday 28 June 2021  14:37:05 +0300 (0:00:10.531)       0:01:09.983 *********** 
ok: [work_host1] => {
    "msg": [
        "jajabinks:x:1004:1004:Managed by Ansible:/home/jajabinks:/bin/bash",
        "Пан Чэр 28 11:37:03 UTC 2021",
        "jajabinks  ALL=(ALL) NOPASSWD: /usr/bin/yum"
    ]
}
ok: [work_host2] => {
    "msg": [
        "jajabinks:x:1001:1001:Managed by Ansible:/home/jajabinks:/bin/sh",
        "Mon Jun 28 11:37:04 UTC 2021",
        "jajabinks  ALL=(ALL) NOPASSWD: /usr/bin/apt"
    ]
}

TASK [Test upgrade Ubuntu] ***************************************************************************************************************************
Monday 28 June 2021  14:37:05 +0300 (0:00:00.148)       0:01:10.131 *********** 
skipping: [work_host1]
changed: [work_host2]

TASK [debug] *****************************************************************************************************************************************
Monday 28 June 2021  14:37:13 +0300 (0:00:07.370)       0:01:17.502 *********** 
ok: [work_host1] => {
    "msg": {
        "changed": false,
        "skip_reason": "Conditional result was False",
        "skipped": true
    }
}
ok: [work_host2] => {
    "msg": {
        "changed": true,
        "cmd": "apt upgrade -y\n",
        "delta": "0:00:00.619354",
        "end": "2021-06-28 11:37:11.850184",
        "failed": false,
        "rc": 0,
        "start": "2021-06-28 11:37:11.230830",
        "stderr": "\nWARNING: apt does not have a stable CLI interface. Use with caution in scripts.",
        "stderr_lines": [
            "",
            "WARNING: apt does not have a stable CLI interface. Use with caution in scripts."
        ],
        "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.",
        "stdout_lines": [
            "Reading package lists...",
            "Building dependency tree...",
            "Reading state information...",
            "Calculating upgrade...",
            "0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded."
        ]
    }
}

TASK [Test upgrade CentOS] ***************************************************************************************************************************
Monday 28 June 2021  14:37:13 +0300 (0:00:00.133)       0:01:17.636 *********** 
skipping: [work_host2]
[WARNING]: Consider using the yum module rather than running 'yum'.  If you need to use command because yum is insufficient you can add 'warn: false'
to this command task or set 'command_warnings=False' in ansible.cfg to get rid of this message.
changed: [work_host1]

TASK [debug] *****************************************************************************************************************************************
Monday 28 June 2021  14:37:18 +0300 (0:00:04.855)       0:01:22.491 *********** 
ok: [work_host1] => {
    "msg": {
        "changed": true,
        "cmd": "yum upgrade -y\n",
        "delta": "0:00:00.705977",
        "end": "2021-06-28 11:37:17.685006",
        "failed": false,
        "rc": 0,
        "start": "2021-06-28 11:37:16.979029",
        "stderr": "",
        "stderr_lines": [],
        "stdout": "Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: mirror.datacenter.by\n * epel: mirror.datacenter.by\n * extras: mirror.datacenter.by\n * updates: mirror.datacenter.by\nNo packages marked for update",
        "stdout_lines": [
            "Loaded plugins: fastestmirror",
            "Loading mirror speeds from cached hostfile",
            " * base: mirror.datacenter.by",
            " * epel: mirror.datacenter.by",
            " * extras: mirror.datacenter.by",
            " * updates: mirror.datacenter.by",
            "No packages marked for update"
        ],
        "warnings": [
            "Consider using the yum module rather than running 'yum'.  If you need to use command because yum is insufficient you can add 'warn: false' to this command task or set 'command_warnings=False' in ansible.cfg to get rid of this message."
        ]
    }
}
ok: [work_host2] => {
    "msg": {
        "changed": false,
        "skip_reason": "Conditional result was False",
        "skipped": true
    }
}

PLAY RECAP *******************************************************************************************************************************************
work_host1                 : ok=10   changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
work_host2                 : ok=10   changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   

Monday 28 June 2021  14:37:18 +0300 (0:00:00.083)       0:01:22.574 *********** 
=============================================================================== 
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------ 19.55s
Set authorized SSH key taken from file ------------------------------------------------------------------------------------------------------- 12.79s
Check ---------------------------------------------------------------------------------------------------------------------------------------- 10.53s
Creating user jajabinks ---------------------------------------------------------------------------------------------------------------------- 10.00s
Assign sudo permissions for jajabinks in Ubuntu ----------------------------------------------------------------------------------------------- 9.10s
Assign sudo permissions for jajabinks in CentOS ----------------------------------------------------------------------------------------------- 7.80s
Test upgrade Ubuntu --------------------------------------------------------------------------------------------------------------------------- 7.37s
Test upgrade CentOS --------------------------------------------------------------------------------------------------------------------------- 4.86s
debug ----------------------------------------------------------------------------------------------------------------------------------------- 0.15s
debug ----------------------------------------------------------------------------------------------------------------------------------------- 0.13s
Print variable -------------------------------------------------------------------------------------------------------------------------------- 0.13s
debug ----------------------------------------------------------------------------------------------------------------------------------------- 0.08s
Playbook run took 0 days, 0 hours, 1 minutes, 22 seconds
➜  ansible 

```
