###### output of display parameters from remote host
```
[root@control-plane ansible]# ansible-playbook play_hw_12.yaml -i hosts.yaml

PLAY [ec2] ******************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************
Wednesday 05 May 2021  09:05:27 -0400 (0:00:00.049)       0:00:00.049 *********
ok: [worker_01]
ok: [worker_02]

TASK [Print OS and version] *************************************************************************************************
Wednesday 05 May 2021  09:05:32 -0400 (0:00:04.103)       0:00:04.152 *********
ok: [worker_01] => {
    "msg": "CentOS | 7.9"
}
ok: [worker_02] => {
    "msg": "Ubuntu | 18.04"
}

TASK [Print mounts information] *********************************************************************************************
Wednesday 05 May 2021  09:05:32 -0400 (0:00:00.225)       0:00:04.377 *********
ok: [worker_01] => {
    "msg": [
        "Mount path: /",
        "Mount capacity: 21003583488",
        "Mount used: 1830780928"
    ]
}
ok: [worker_02] => {
    "msg": [
        "Mount path: /",
        "Mount capacity: 21003583488",
        "Mount used: 2377584640"
    ]
}

TASK [Pring memory information] *********************************************************************************************
Wednesday 05 May 2021  09:05:32 -0400 (0:00:00.323)       0:00:04.701 *********
ok: [worker_01] => {
    "msg": [
        "Memory capacity: 4096",
        "Memory free: 3745"
    ]
}
ok: [worker_02] => {
    "msg": [
        "Memory capacity: 4096",
        "Memory free: 3915"
    ]
}

PLAY RECAP ******************************************************************************************************************
worker_01                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
worker_02                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

Wednesday 05 May 2021  09:05:32 -0400 (0:00:00.186)       0:00:04.887 *********
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------ 4.10s
Print mounts information --------------------------------------------------------------------------------------------- 0.32s
Print OS and version ------------------------------------------------------------------------------------------------- 0.23s
Pring memory information --------------------------------------------------------------------------------------------- 0.19s
Playbook run took 0 days, 0 hours, 0 minutes, 4 seconds
```
###### output of Playbook for the Ansible user

```
[root@control-plane ansible]# ansible-playbook user_hw_12.yaml -i hosts.yaml

PLAY [ec2] ******************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************
Wednesday 05 May 2021  09:06:59 -0400 (0:00:00.079)       0:00:00.079 *********
ok: [worker_01]
ok: [worker_02]

TASK [Creating user pdn] ****************************************************************************************************
Wednesday 05 May 2021  09:07:03 -0400 (0:00:04.287)       0:00:04.367 *********
ok: [worker_01]
ok: [worker_02]

TASK [Creating ssh folder] **************************************************************************************************
Wednesday 05 May 2021  09:07:05 -0400 (0:00:01.406)       0:00:05.774 *********
ok: [worker_01]
ok: [worker_02]

TASK [Authorize key] ********************************************************************************************************
Wednesday 05 May 2021  09:07:06 -0400 (0:00:01.274)       0:00:07.049 *********
ok: [worker_01] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ9q6slEx7DSPQMhtKi1FKE5EOjSXi3vG7SZbfX/bEtjDuqqs+Jzvqwb/oeGuW+gnt0mqoR2oCLCVJBPUv0iMiTmL6TyeJLCpxfbFIhkZLMD9IklF5LNsQpmTzsy95X0SXP/Ya/xWWRL0JfnvZUoOHGQ/kdaWcPdrddIieYaWRrgCgODhV534SzayKSOt4oAGaewLVwQ1iBleRW/BKWsmhcV6s46rXRHqJTsaMTUnjEP5z6hmuH2/6fihDluwpK4bXNt7HZ9BGyf5/G0rIXpb1D1/BKLmSY8roH+zCecWoHt2Z8dR3arWU9im9/PCEZ3u3nxS0JtZrIYlwIRmYNy07 pdn@control-plane.minikube.internal)
ok: [worker_02] => (item=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ9q6slEx7DSPQMhtKi1FKE5EOjSXi3vG7SZbfX/bEtjDuqqs+Jzvqwb/oeGuW+gnt0mqoR2oCLCVJBPUv0iMiTmL6TyeJLCpxfbFIhkZLMD9IklF5LNsQpmTzsy95X0SXP/Ya/xWWRL0JfnvZUoOHGQ/kdaWcPdrddIieYaWRrgCgODhV534SzayKSOt4oAGaewLVwQ1iBleRW/BKWsmhcV6s46rXRHqJTsaMTUnjEP5z6hmuH2/6fihDluwpK4bXNt7HZ9BGyf5/G0rIXpb1D1/BKLmSY8roH+zCecWoHt2Z8dR3arWU9im9/PCEZ3u3nxS0JtZrIYlwIRmYNy07 pdn@control-plane.minikube.internal)

TASK [SSH authentication] ***************************************************************************************************
Wednesday 05 May 2021  09:07:07 -0400 (0:00:01.302)       0:00:08.351 *********
ok: [worker_01]
ok: [worker_02]

TASK [Add user to sudo nopasswd] ********************************************************************************************
Wednesday 05 May 2021  09:07:09 -0400 (0:00:01.119)       0:00:09.471 *********
ok: [worker_01]
ok: [worker_02]

TASK [Check user pdn] *******************************************************************************************************
Wednesday 05 May 2021  09:07:09 -0400 (0:00:00.815)       0:00:10.287 *********
changed: [worker_01]
changed: [worker_02]

TASK [debug] ****************************************************************************************************************
Wednesday 05 May 2021  09:07:11 -0400 (0:00:01.180)       0:00:11.467 *********
ok: [worker_01] => {
    "msg": [
        "pdn:x:1001:1001:Managed by ansible:/home/pdn:/bin/bash"
    ]
}
ok: [worker_02] => {
    "msg": [
        "pdn:x:1001:1001:Managed by ansible:/home/pdn:/bin/sh"
    ]
}

TASK [Upgrade CentOS] *******************************************************************************************************
Wednesday 05 May 2021  09:07:11 -0400 (0:00:00.215)       0:00:11.682 *********
skipping: [worker_02]
ok: [worker_01]

TASK [Upgrade Ubuntu] *******************************************************************************************************
Wednesday 05 May 2021  09:07:13 -0400 (0:00:02.258)       0:00:13.941 *********
skipping: [worker_01]
ok: [worker_02]

PLAY RECAP ******************************************************************************************************************
worker_01                  : ok=9    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
worker_02                  : ok=9    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

Wednesday 05 May 2021  09:07:15 -0400 (0:00:02.328)       0:00:16.270 *********
===============================================================================
Gathering Facts ------------------------------------------------------------------------------------------------------ 4.29s
Upgrade Ubuntu ------------------------------------------------------------------------------------------------------- 2.33s
Upgrade CentOS ------------------------------------------------------------------------------------------------------- 2.26s
Creating user pdn ---------------------------------------------------------------------------------------------------- 1.41s
Authorize key -------------------------------------------------------------------------------------------------------- 1.30s
Creating ssh folder -------------------------------------------------------------------------------------------------- 1.27s
Check user pdn ------------------------------------------------------------------------------------------------------- 1.18s
SSH authentication --------------------------------------------------------------------------------------------------- 1.12s
Add user to sudo nopasswd -------------------------------------------------------------------------------------------- 0.82s
debug ---------------------------------------------------------------------------------------------------------------- 0.22s
Playbook run took 0 days, 0 hours, 0 minutes, 16 seconds
```



