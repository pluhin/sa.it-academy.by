# Output from playbook hw_1.yaml (with shell module on step of ugrade hosts with new user, there are no problems)

```bash
[denis@denis-PC ansible]$ vim hw_1.yaml 
[denis@denis-PC ansible]$ ansible-playbook -i inv.yaml hw_1.yaml -e group=work_hosts -e my_user=den

PLAY [work_hosts] ****************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
Tuesday 20 July 2021  12:14:45 +0300 (0:00:00.155)       0:00:00.155 ********** 
ok: [work_01]
ok: [work_02]

TASK [Host OS Information] *******************************************************************************************************************
Tuesday 20 July 2021  12:15:00 +0300 (0:00:14.617)       0:00:14.772 ********** 
ok: [work_01] => {
    "msg": "OS Distribution  CentOS  Version  7.9"
}
ok: [work_02] => {
    "msg": "OS Distribution  Ubuntu  Version  18.04"
}

TASK [Host HW Information] *******************************************************************************************************************
Tuesday 20 July 2021  12:15:00 +0300 (0:00:00.459)       0:00:15.231 ********** 
ok: [work_01] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 2853732352 RAM Capacity 4096 | Used RAM Capacity 830"
}
ok: [work_02] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 4575625216 RAM Capacity 4096 | Used RAM Capacity 887"
}

TASK [Create user "den"] *********************************************************************************************************************
Tuesday 20 July 2021  12:15:00 +0300 (0:00:00.491)       0:00:15.724 ********** 
ok: [work_01]
ok: [work_02]

TASK [SSH connection configuration of "den"] *************************************************************************************************
Tuesday 20 July 2021  12:15:04 +0300 (0:00:03.532)       0:00:19.256 ********** 
ok: [work_02] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)
ok: [work_01] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)

TASK [Sudo no pass] **************************************************************************************************************************
Tuesday 20 July 2021  12:15:08 +0300 (0:00:03.538)       0:00:22.795 ********** 
ok: [work_01]
ok: [work_02]

TASK [Checking CentOS user and upgrade] ******************************************************************************************************
Tuesday 20 July 2021  12:15:10 +0300 (0:00:02.650)       0:00:25.446 ********** 
skipping: [work_02]


^C [ERROR]: User interrupted execution
[denis@denis-PC ansible]$ vim hw_1.yaml 
[denis@denis-PC ansible]$ ansible-playbook -i inv.yaml hw_1.yaml -e group=work_hosts -e my_user=den

PLAY [work_hosts] ****************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
Tuesday 20 July 2021  14:15:12 +0300 (0:00:00.155)       0:00:00.155 ********** 
ok: [work_02]
ok: [work_01]

TASK [Host OS Information] *******************************************************************************************************************
Tuesday 20 July 2021  14:15:23 +0300 (0:00:11.452)       0:00:11.608 ********** 
ok: [work_01] => {
    "msg": "OS Distribution  CentOS  Version  7.9"
}
ok: [work_02] => {
    "msg": "OS Distribution  Ubuntu  Version  18.04"
}

TASK [Host HW Information] *******************************************************************************************************************
Tuesday 20 July 2021  14:15:24 +0300 (0:00:00.544)       0:00:12.153 ********** 
ok: [work_01] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 2829926400 RAM Capacity 4096 | Used RAM Capacity 258"
}
ok: [work_02] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 4575690752 RAM Capacity 4096 | Used RAM Capacity 863"
}

TASK [Create user "den"] *********************************************************************************************************************
Tuesday 20 July 2021  14:15:24 +0300 (0:00:00.499)       0:00:12.653 ********** 
ok: [work_02]
ok: [work_01]

TASK [SSH connection configuration of "den"] *************************************************************************************************
Tuesday 20 July 2021  14:15:30 +0300 (0:00:05.572)       0:00:18.225 ********** 
ok: [work_02] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)
ok: [work_01] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)

TASK [Sudo no pass] **************************************************************************************************************************
Tuesday 20 July 2021  14:15:34 +0300 (0:00:04.549)       0:00:22.775 ********** 
ok: [work_01]
ok: [work_02]

TASK [Checking CentOS user and upgrade] ******************************************************************************************************
Tuesday 20 July 2021  14:15:38 +0300 (0:00:03.443)       0:00:26.219 ********** 
skipping: [work_02]
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
changed: [work_01]

TASK [Cheking Ubuntu user and upgrade] *******************************************************************************************************
Tuesday 20 July 2021  14:15:51 +0300 (0:00:12.757)       0:00:38.976 ********** 
skipping: [work_01]
changed: [work_02]

TASK [Chek] **********************************************************************************************************************************
Tuesday 20 July 2021  14:16:15 +0300 (0:00:24.384)       0:01:03.360 ********** 
skipping: [work_01]
changed: [work_02]

TASK [debug] *********************************************************************************************************************************
Tuesday 20 July 2021  14:16:17 +0300 (0:00:02.463)       0:01:05.824 ********** 
ok: [work_01] => {
    "msg": {
        "changed": false,
        "skip_reason": "Conditional result was False",
        "skipped": true
    }
}
ok: [work_02] => {
    "msg": {
        "changed": true,
        "cmd": [
            "whoami"
        ],
        "delta": "0:00:00.041386",
        "end": "2021-07-20 11:16:17.487877",
        "failed": false,
        "rc": 0,
        "start": "2021-07-20 11:16:17.446491",
        "stderr": "",
        "stderr_lines": [],
        "stdout": "den",
        "stdout_lines": [
            "den"
        ]
    }
}

TASK [Removing user "den"] *******************************************************************************************************************
Tuesday 20 July 2021  14:16:18 +0300 (0:00:00.518)       0:01:06.342 ********** 
changed: [work_01]
changed: [work_02]

PLAY RECAP ***********************************************************************************************************************************
work_01                    : ok=9    changed=2    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
work_02                    : ok=10   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Tuesday 20 July 2021  14:16:21 +0300 (0:00:03.199)       0:01:09.542 ********** 
=============================================================================== 
Cheking Ubuntu user and upgrade ------------------------------------------------------------------------------------------------------ 24.38s
Checking CentOS user and upgrade ----------------------------------------------------------------------------------------------------- 12.76s
Gathering Facts ---------------------------------------------------------------------------------------------------------------------- 11.45s
Create user "den" --------------------------------------------------------------------------------------------------------------------- 5.57s
SSH connection configuration of "den" ------------------------------------------------------------------------------------------------- 4.55s
Sudo no pass -------------------------------------------------------------------------------------------------------------------------- 3.44s
Removing user "den" ------------------------------------------------------------------------------------------------------------------- 3.20s
Chek ---------------------------------------------------------------------------------------------------------------------------------- 2.46s
Host OS Information ------------------------------------------------------------------------------------------------------------------- 0.54s
debug --------------------------------------------------------------------------------------------------------------------------------- 0.52s
Host HW Information ------------------------------------------------------------------------------------------------------------------- 0.50s
Playbook run took 0 days, 0 hours, 1 minutes, 9 seconds
```


---

# Output from playbook hw.yaml (with yum and apt modules on step of ugrade hosts with new user, there is a problem with apt module: fatal: [work_02]: FAILED! => {"changed": false, "msg": "Failed to lock apt for exclusive operation: Failed to lock directory /var/lib/apt/lists/: E:Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)"}) 

```bash
[denis@denis-PC ansible]$ ansible-playbook -i inv.yaml hw.yaml -e group=work_hosts -e my_user=den

PLAY [work_hosts] ****************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
Tuesday 20 July 2021  14:25:32 +0300 (0:00:00.158)       0:00:00.158 ********** 
ok: [work_01]
ok: [work_02]

TASK [Host OS Information] *******************************************************************************************************************
Tuesday 20 July 2021  14:25:44 +0300 (0:00:12.508)       0:00:12.667 ********** 
ok: [work_01] => {
    "msg": "OS Distribution  CentOS  Version  7.9"
}
ok: [work_02] => {
    "msg": "OS Distribution  Ubuntu  Version  18.04"
}

TASK [Host HW Information] *******************************************************************************************************************
Tuesday 20 July 2021  14:25:45 +0300 (0:00:00.487)       0:00:13.154 ********** 
ok: [work_01] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 2830360576 RAM Capacity 4096 | Used RAM Capacity 302"
}
ok: [work_02] => {
    "msg": "Mount Point /  Drive Capacity 21003583488 Used Drive Capacity 4575903744 RAM Capacity 4096 | Used RAM Capacity 878"
}

TASK [Create user "den"] *********************************************************************************************************************
Tuesday 20 July 2021  14:25:45 +0300 (0:00:00.507)       0:00:13.662 ********** 
changed: [work_02]
changed: [work_01]

TASK [SSH connection configuration of "den"] *************************************************************************************************
Tuesday 20 July 2021  14:25:51 +0300 (0:00:05.578)       0:00:19.240 ********** 
ok: [work_01] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)
ok: [work_02] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1qP7R68GzdOmdMhTsNs9XvKlbm2yQHVaMJbtyKKmdg0lA5XWxAFD4bglyXIu02hEGDrJbgKaA4d6iBif6ELrrzxaEJcDK7w5Rx/82E9giKUzs5KpSchE1KOxzXNN8KctvlHcatzzpL8wvCC6Lo/WAIV6WlCwEkBPdDX3ciEUc5l0qtQrAcA2Vb/xVX3M4rErI6YhZseVHC9uwRf0DOC1bPX1XRQV9wXKnPns3ePZMeRm/s10uIlZr+70hUCHpE6LQ0qnJtjlcPsp1XFQmpdgJYswSdaxVJvFQzVy7JI1OxK/k2elHVYUUiBiLwROK5CvGBdhZnT4UzclX4/5rUikr denis@denis-PC)

TASK [Sudo no pass] **************************************************************************************************************************
Tuesday 20 July 2021  14:25:58 +0300 (0:00:07.274)       0:00:26.515 ********** 
ok: [work_01]
ok: [work_02]

TASK [Checking CentOS user and upgrade] ******************************************************************************************************
Tuesday 20 July 2021  14:26:03 +0300 (0:00:04.298)       0:00:30.814 ********** 
skipping: [work_02]
ok: [work_01]

TASK [Cheking Ubuntu user and upgrade] *******************************************************************************************************
Tuesday 20 July 2021  14:26:15 +0300 (0:00:12.450)       0:00:43.264 ********** 
skipping: [work_01]
fatal: [work_02]: FAILED! => {"changed": false, "msg": "Failed to lock apt for exclusive operation: Failed to lock directory /var/lib/apt/lists/: E:Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)"}

TASK [Chek] **********************************************************************************************************************************
Tuesday 20 July 2021  14:26:23 +0300 (0:00:07.546)       0:00:50.811 ********** 
skipping: [work_01]

TASK [debug] *********************************************************************************************************************************
Tuesday 20 July 2021  14:26:23 +0300 (0:00:00.267)       0:00:51.079 ********** 
ok: [work_01] => {
    "msg": {
        "changed": false,
        "skip_reason": "Conditional result was False",
        "skipped": true
    }
}

TASK [Removing user "den"] *******************************************************************************************************************
Tuesday 20 July 2021  14:26:23 +0300 (0:00:00.292)       0:00:51.371 ********** 
changed: [work_01]

PLAY RECAP ***********************************************************************************************************************************
work_01                    : ok=9    changed=2    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
work_02                    : ok=6    changed=1    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   

Tuesday 20 July 2021  14:26:27 +0300 (0:00:04.312)       0:00:55.684 ********** 
=============================================================================== 
Gathering Facts ---------------------------------------------------------------------------------------------------------------------- 12.51s
Checking CentOS user and upgrade ----------------------------------------------------------------------------------------------------- 12.45s
Cheking Ubuntu user and upgrade ------------------------------------------------------------------------------------------------------- 7.55s
SSH connection configuration of "den" ------------------------------------------------------------------------------------------------- 7.27s
Create user "den" --------------------------------------------------------------------------------------------------------------------- 5.58s
Removing user "den" ------------------------------------------------------------------------------------------------------------------- 4.31s
Sudo no pass -------------------------------------------------------------------------------------------------------------------------- 4.30s
Host HW Information ------------------------------------------------------------------------------------------------------------------- 0.51s
Host OS Information ------------------------------------------------------------------------------------------------------------------- 0.49s
debug --------------------------------------------------------------------------------------------------------------------------------- 0.29s
Chek ---------------------------------------------------------------------------------------------------------------------------------- 0.27s
Playbook run took 0 days, 0 hours, 0 minutes, 55 seconds
```
