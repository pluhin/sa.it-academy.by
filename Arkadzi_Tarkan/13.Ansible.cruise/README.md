## Console output

### ansible-playbook -i inv.yaml play.yaml

```bash
PLAY [ec_all] **************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
Tuesday 04 May 2021  18:12:39 +0000 (0:00:00.059)       0:00:00.059 *********** 
ok: [centos]
ok: [ubuntu]

TASK [webserver : Update and Install] **************************************************************************************************
Tuesday 04 May 2021  18:12:48 +0000 (0:00:09.271)       0:00:09.331 *********** 
skipping: [centos]
ok: [ubuntu]

TASK [webserver : Nginx. Enable and start] *********************************************************************************************
Tuesday 04 May 2021  18:12:54 +0000 (0:00:05.781)       0:00:15.112 *********** 
skipping: [centos]
ok: [ubuntu]

TASK [webserver : Copy nginx config] ***************************************************************************************************
Tuesday 04 May 2021  18:12:58 +0000 (0:00:04.508)       0:00:19.620 *********** 
skipping: [centos]
ok: [ubuntu]

TASK [webserver : Copy index.html ubuntu] **********************************************************************************************
Tuesday 04 May 2021  18:13:05 +0000 (0:00:06.882)       0:00:26.502 *********** 
skipping: [centos]
ok: [ubuntu]

TASK [webserver : Update and Install] **************************************************************************************************
Tuesday 04 May 2021  18:13:14 +0000 (0:00:09.327)       0:00:35.829 *********** 
skipping: [ubuntu] => (item=epel-release) 
skipping: [ubuntu] => (item=nginx) 
ok: [centos] => (item=epel-release)
ok: [centos] => (item=nginx)

TASK [webserver : Nginx Enable and start] **********************************************************************************************
Tuesday 04 May 2021  18:13:23 +0000 (0:00:08.533)       0:00:44.363 *********** 
skipping: [ubuntu]
ok: [centos]

TASK [webserver : Copy nginx config] ***************************************************************************************************
Tuesday 04 May 2021  18:13:27 +0000 (0:00:04.194)       0:00:48.558 *********** 
skipping: [ubuntu]
ok: [centos]

TASK [webserver : Copy index.html Centos] **********************************************************************************************
Tuesday 04 May 2021  18:13:33 +0000 (0:00:06.286)       0:00:54.844 *********** 
skipping: [ubuntu]
ok: [centos]

TASK [webserver : Templates hosts] *****************************************************************************************************
Tuesday 04 May 2021  18:13:42 +0000 (0:00:08.849)       0:01:03.694 *********** 
ok: [centos]
ok: [ubuntu]

TASK [webserver : Check connaction] ****************************************************************************************************
Tuesday 04 May 2021  18:13:50 +0000 (0:00:07.699)       0:01:11.394 *********** 
ok: [centos]
ok: [ubuntu]

TASK [webserver : print out] ***********************************************************************************************************
Tuesday 04 May 2021  18:13:55 +0000 (0:00:04.624)       0:01:16.018 *********** 
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

TASK [webserver : Check content to the sites] ******************************************************************************************
Tuesday 04 May 2021  18:13:55 +0000 (0:00:00.285)       0:01:16.303 *********** 
ok: [centos] => (item={'name': 'sa-centos21', 'ip': '192.168.202.21'})
ok: [ubuntu] => (item={'name': 'sa-centos21', 'ip': '192.168.202.21'})
ok: [centos] => (item={'name': 'sa-ubuntu22', 'ip': '192.168.202.22'})
ok: [ubuntu] => (item={'name': 'sa-ubuntu22', 'ip': '192.168.202.22'})

TASK [webserver : print out] ***********************************************************************************************************
Tuesday 04 May 2021  18:14:04 +0000 (0:00:08.951)       0:01:25.255 *********** 
ok: [centos] => {
    "msg": "<html>\n<body>\n\n<h1>sa-centos21</h1>\n\n</body>\n</html>\n | <html>\n<body>\n\n<h1>sa-ubuntu22</h1>\n\n</body>\n</html>\n"
}
ok: [ubuntu] => {
    "msg": "<html>\n<body>\n\n<h1>sa-centos21</h1>\n\n</body>\n</html>\n | <html>\n<body>\n\n<h1>sa-ubuntu22</h1>\n\n</body>\n</html>\n"
}

TASK [test : Check if we have SUDO with NOPASSWD] **************************************************************************************
Tuesday 04 May 2021  18:14:04 +0000 (0:00:00.192)       0:01:25.448 *********** 
ok: [centos]
ok: [ubuntu]

TASK [test : Check if we have connection to public repositories] ***********************************************************************
Tuesday 04 May 2021  18:14:08 +0000 (0:00:04.347)       0:01:29.795 *********** 
ok: [ubuntu]
ok: [centos]

TASK [test : print out] ****************************************************************************************************************
Tuesday 04 May 2021  18:14:16 +0000 (0:00:07.627)       0:01:37.423 *********** 
ok: [centos] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [ubuntu] => {
    "msg": "('http://archive.ubuntu.com/', 200, 'OK (696 bytes)')"
}

TASK [test : Check if we have connection to docker hub] ********************************************************************************
Tuesday 04 May 2021  18:14:16 +0000 (0:00:00.204)       0:01:37.628 *********** 
ok: [centos]
ok: [ubuntu]

TASK [test : print out] ****************************************************************************************************************
Tuesday 04 May 2021  18:14:21 +0000 (0:00:05.118)       0:01:42.747 *********** 
ok: [centos] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [ubuntu] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}

TASK [test : Check if RAM is less 512 MB] **********************************************************************************************
Tuesday 04 May 2021  18:14:22 +0000 (0:00:00.196)       0:01:42.944 *********** 
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

TASK [test : Check if HDD is less 10 GB] ***********************************************************************************************
Tuesday 04 May 2021  18:14:22 +0000 (0:00:00.299)       0:01:43.243 *********** 
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

PLAY RECAP *****************************************************************************************************************************
centos                     : ok=17   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0   
ubuntu                     : ok=17   changed=0    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0   

Tuesday 04 May 2021  18:14:22 +0000 (0:00:00.195)       0:01:43.438 *********** 
=============================================================================== 
webserver : Copy index.html ubuntu ---------------------------------------------------------------------------------------------- 9.33s
Gathering Facts ----------------------------------------------------------------------------------------------------------------- 9.27s
webserver : Check content to the sites ------------------------------------------------------------------------------------------ 8.95s
webserver : Copy index.html Centos ---------------------------------------------------------------------------------------------- 8.85s
webserver : Update and Install -------------------------------------------------------------------------------------------------- 8.53s
webserver : Templates hosts ----------------------------------------------------------------------------------------------------- 7.70s
test : Check if we have connection to public repositories ----------------------------------------------------------------------- 7.63s
webserver : Copy nginx config --------------------------------------------------------------------------------------------------- 6.88s
webserver : Copy nginx config --------------------------------------------------------------------------------------------------- 6.29s
webserver : Update and Install -------------------------------------------------------------------------------------------------- 5.78s
test : Check if we have connection to docker hub -------------------------------------------------------------------------------- 5.12s
webserver : Check connaction ---------------------------------------------------------------------------------------------------- 4.62s
webserver : Nginx. Enable and start --------------------------------------------------------------------------------------------- 4.51s
test : Check if we have SUDO with NOPASSWD -------------------------------------------------------------------------------------- 4.35s
webserver : Nginx Enable and start ---------------------------------------------------------------------------------------------- 4.19s
test : Check if RAM is less 512 MB ---------------------------------------------------------------------------------------------- 0.30s
webserver : print out ----------------------------------------------------------------------------------------------------------- 0.29s
test : print out ---------------------------------------------------------------------------------------------------------------- 0.20s
test : print out ---------------------------------------------------------------------------------------------------------------- 0.20s
test : Check if HDD is less 10 GB ----------------------------------------------------------------------------------------------- 0.20s
Playbook run took 0 days, 0 hours, 1 minutes, 43 seconds

```

### molecule test

```bash
PLAY [Converge] ************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
ok: [centos]
ok: [debian]
ok: [alpine]

TASK [Include test] ********************************************************************************************************************

TASK [test : Check if we have SUDO with NOPASSWD] **************************************************************************************
ok: [debian]
ok: [centos]
ok: [alpine]

TASK [test : Check if we have connection to public repositories] ***********************************************************************
ok: [debian]
ok: [centos]
ok: [alpine]

TASK [test : print out] ****************************************************************************************************************
ok: [alpine] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [centos] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [debian] => {
    "msg": "('http://archive.ubuntu.com/', 200, 'OK (696 bytes)')"
}

TASK [test : Check if we have connection to docker hub] ********************************************************************************
ok: [debian]
ok: [centos]
ok: [alpine]

TASK [test : print out] ****************************************************************************************************************
ok: [alpine] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [centos] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [debian] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}

TASK [test : Check if RAM is less 512 MB] **********************************************************************************************
ok: [alpine] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [debian] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

TASK [test : Check if HDD is less 10 GB] ***********************************************************************************************
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [debian] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [alpine] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

PLAY RECAP *****************************************************************************************************************************
alpine                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
centos                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
debian                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************
ok: [centos]
ok: [debian]
ok: [alpine]

TASK [Include test] ********************************************************************************************************************

TASK [test : Check if we have SUDO with NOPASSWD] **************************************************************************************
ok: [centos]
ok: [debian]
ok: [alpine]

TASK [test : Check if we have connection to public repositories] ***********************************************************************
ok: [debian]
ok: [centos]
ok: [alpine]

TASK [test : print out] ****************************************************************************************************************
ok: [centos] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [alpine] => {
    "msg": "('https://dl.fedoraproject.org/pub/', 200, 'OK (1176 bytes)')"
}
ok: [debian] => {
    "msg": "('http://archive.ubuntu.com/', 200, 'OK (696 bytes)')"
}

TASK [test : Check if we have connection to docker hub] ********************************************************************************
ok: [debian]
ok: [centos]
ok: [alpine]

TASK [test : print out] ****************************************************************************************************************
ok: [alpine] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [centos] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}
ok: [debian] => {
    "msg": "('https://registry.hub.docker.com', 200, 'OK (2040 bytes)')"
}

TASK [test : Check if RAM is less 512 MB] **********************************************************************************************
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [alpine] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [debian] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

TASK [test : Check if HDD is less 10 GB] ***********************************************************************************************
ok: [debian] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [alpine] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}
ok: [centos] => {
    "changed": false,
    "failed_when_result": false,
    "msg": "All assertions passed"
}

PLAY RECAP *****************************************************************************************************************************
alpine                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
centos                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
debian                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] **************************************************************************************************************************

TASK [Example assertion] ***************************************************************************************************************
ok: [alpine] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [centos] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [debian] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *****************************************************************************************************************************
alpine                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
centos                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
debian                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

```