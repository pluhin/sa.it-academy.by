# 06.Ansible.Workshop

## Preparing

All files (playbook, inventory and jinja2 templates) in current PR.

All tasks with name as a description of performed actions.

## Playbook run output

```bash
$ ansible-playbook hw6_nginx.yaml

PLAY [Group of hosts] **********************************************************************************************

TASK [Gathering Facts] *********************************************************************************************
Saturday 03 December 2022  14:09:21 +0000 (0:00:00.012)       0:00:00.012 ***** 
ok: [host8]
ok: [host7]

TASK [Update the repository cache and update package "nginx" to latest version] ************************************
Saturday 03 December 2022  14:09:23 +0000 (0:00:02.061)       0:00:02.074 ***** 
ok: [host7]
ok: [host8]

TASK [Check nginx version] *****************************************************************************************
Saturday 03 December 2022  14:09:25 +0000 (0:00:02.230)       0:00:04.305 ***** 
changed: [host7]
changed: [host8]

TASK [Show nginx version] ******************************************************************************************
Saturday 03 December 2022  14:09:26 +0000 (0:00:00.718)       0:00:05.023 ***** 
ok: [host7] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}
ok: [host8] => {
    "msg": "nginx version: nginx/1.18.0 (Ubuntu)"
}

TASK [Check nginx status] ******************************************************************************************
Saturday 03 December 2022  14:09:26 +0000 (0:00:00.042)       0:00:05.066 ***** 
changed: [host7]
changed: [host8]

TASK [Show nginx status] *******************************************************************************************
Saturday 03 December 2022  14:09:27 +0000 (0:00:00.620)       0:00:05.687 ***** 
ok: [host7] => {
    "msg": "     Active: active (running) since Sat 2022-12-03 14:05:18 UTC; 4min 8s ago"
}
ok: [host8] => {
    "msg": "     Active: active (running) since Sat 2022-12-03 14:05:18 UTC; 4min 8s ago"
}

TASK [Create folders for each site with owner www-data] ************************************************************
Saturday 03 December 2022  14:09:27 +0000 (0:00:00.042)       0:00:05.729 ***** 
ok: [host8] => (item=first.loc)
ok: [host7] => (item=first.loc)
ok: [host8] => (item=second.loc)
ok: [host7] => (item=second.loc)

TASK [Change owner www catalog and subfolders recursive] ***********************************************************
Saturday 03 December 2022  14:09:28 +0000 (0:00:01.303)       0:00:07.032 ***** 
ok: [host7]
ok: [host8]

TASK [Create config file with templates] ***************************************************************************
Saturday 03 December 2022  14:09:29 +0000 (0:00:00.621)       0:00:07.654 ***** 
ok: [host7] => (item=first.loc)
ok: [host8] => (item=first.loc)
ok: [host7] => (item=second.loc)
ok: [host8] => (item=second.loc)

TASK [Create index.html for each sites using templates] ************************************************************
Saturday 03 December 2022  14:09:31 +0000 (0:00:02.074)       0:00:09.728 ***** 
ok: [host7] => (item=first.loc)
ok: [host8] => (item=first.loc)
ok: [host7] => (item=second.loc)
ok: [host8] => (item=second.loc)

TASK [Enable virtual host] *****************************************************************************************
Saturday 03 December 2022  14:09:33 +0000 (0:00:02.028)       0:00:11.757 ***** 
changed: [host7] => (item=first.loc)
changed: [host8] => (item=first.loc)
changed: [host7] => (item=second.loc)
changed: [host8] => (item=second.loc)

TASK [Restart Nginx service] ***************************************************************************************
Saturday 03 December 2022  14:09:34 +0000 (0:00:01.198)       0:00:12.955 ***** 
changed: [host8]
changed: [host7]

TASK [Modify local hosts file] *************************************************************************************
Saturday 03 December 2022  14:09:35 +0000 (0:00:01.011)       0:00:13.967 ***** 
changed: [host7] => (item=first.loc)
changed: [host8] => (item=first.loc)
changed: [host7] => (item=second.loc)
changed: [host8] => (item=second.loc)

TASK [Check sites page returns a status 200 and fail if the word Welcome not in content] **************************
Saturday 03 December 2022  14:09:36 +0000 (0:00:01.192)       0:00:15.159 ***** 
ok: [host8] => (item=first.loc)
ok: [host7] => (item=first.loc)
ok: [host8] => (item=second.loc)
ok: [host7] => (item=second.loc)

TASK [Show additional websites answer using uri on previous step] *************************************************
Saturday 03 December 2022  14:09:38 +0000 (0:00:01.422)       0:00:16.582 ***** 
ok: [host7] => (item=http://www.first.loc) => {
    "msg": [
        "http://www.first.loc",
        "nginx/1.18.0 (Ubuntu)",
        "200"
    ]
}
ok: [host7] => (item=http://www.second.loc) => {
    "msg": [
        "http://www.second.loc",
        "nginx/1.18.0 (Ubuntu)",
        "200"
    ]
}
ok: [host8] => (item=http://www.first.loc) => {
    "msg": [
        "http://www.first.loc",
        "nginx/1.18.0 (Ubuntu)",
        "200"
    ]
}
ok: [host8] => (item=http://www.second.loc) => {
    "msg": [
        "http://www.second.loc",
        "nginx/1.18.0 (Ubuntu)",
        "200"
    ]
}

PLAY RECAP *********************************************************************************************************
host7                      : ok=15   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
host8                      : ok=15   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Saturday 03 December 2022  14:09:38 +0000 (0:00:00.084)       0:00:16.667 ***** 
=============================================================================== 
Update the repository cache and update package "nginx" to latest version ------------------------------------ 2.23s
Create config file with templates --------------------------------------------------------------------------- 2.07s
Gathering Facts --------------------------------------------------------------------------------------------- 2.06s
Create index.html for each sites using templates ------------------------------------------------------------ 2.03s
Check sites page returns a status 200 and fail if the word Welcome not in content --------------------------- 1.42s
Create folders for each site with owner www-data ------------------------------------------------------------ 1.30s
Enable virtual host ----------------------------------------------------------------------------------------- 1.20s
Modify local hosts file ------------------------------------------------------------------------------------- 1.19s
Restart Nginx service --------------------------------------------------------------------------------------- 1.01s
Check nginx version ----------------------------------------------------------------------------------------- 0.72s
Change owner www catalog and subfolders recursive ----------------------------------------------------------- 0.62s
Check nginx status ------------------------------------------------------------------------------------------ 0.62s
Show additional websites answer using uri on previous step -------------------------------------------------- 0.09s
Show nginx version ------------------------------------------------------------------------------------------ 0.04s
Show nginx status ------------------------------------------------------------------------------------------- 0.04s
Playbook run took 0 days, 0 hours, 0 minutes, 16 seconds
```
