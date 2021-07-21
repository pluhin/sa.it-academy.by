TASK [Gathering Facts] ***********************************************************************************************************************
Tuesday 20 July 2021  11:36:15 +0300 (0:00:00.119)       0:00:00.119 ********** 
ok: [work_02]
ok: [work_01]

TASK [webserver : nginx. install packages] ***************************************************************************************************
Tuesday 20 July 2021  11:36:24 +0300 (0:00:08.440)       0:00:08.560 ********** 
skipping: [work_01]
ok: [work_02]

TASK [webserver : nginx. enable and starting] ************************************************************************************************
Tuesday 20 July 2021  11:36:29 +0300 (0:00:05.105)       0:00:13.666 ********** 
skipping: [work_01]
ok: [work_02]

TASK [webserver : nginx. install packeges] ***************************************************************************************************
Tuesday 20 July 2021  11:36:33 +0300 (0:00:03.783)       0:00:17.449 ********** 
skipping: [work_02]
ok: [work_01]

TASK [webserver : nginx. enable and start service] *******************************************************************************************
Tuesday 20 July 2021  11:36:36 +0300 (0:00:03.154)       0:00:20.604 ********** 
skipping: [work_02]
ok: [work_01]

TASK [webserver : nginx. Enable firewall port] ***********************************************************************************************
Tuesday 20 July 2021  11:36:38 +0300 (0:00:02.713)       0:00:23.318 ********** 
skipping: [work_02]
ok: [work_01]

TASK [webserver : reload service firewalld] **************************************************************************************************
Tuesday 20 July 2021  11:36:41 +0300 (0:00:02.941)       0:00:26.259 ********** 
skipping: [work_02]
changed: [work_01]

TASK [webserver : Ubuntu www structure] ******************************************************************************************************
Tuesday 20 July 2021  11:36:45 +0300 (0:00:03.972)       0:00:30.232 ********** 
skipping: [work_01] => (item=1) 
skipping: [work_01] => (item=2) 
ok: [work_02] => (item=1)
ok: [work_02] => (item=2)

TASK [webserver : Centos www structure] ******************************************************************************************************
Tuesday 20 July 2021  11:36:50 +0300 (0:00:04.497)       0:00:34.729 ********** 
skipping: [work_02] => (item=1) 
skipping: [work_02] => (item=2) 
ok: [work_01] => (item=1)
ok: [work_01] => (item=2)

TASK [webserver : mkdir sites-available] *****************************************************************************************************
Tuesday 20 July 2021  11:36:54 +0300 (0:00:04.024)       0:00:38.754 ********** 
ok: [work_02]
ok: [work_01]

TASK [webserver : mkdir sites-enabled] *******************************************************************************************************
Tuesday 20 July 2021  11:36:56 +0300 (0:00:02.201)       0:00:40.955 ********** 
ok: [work_01]
ok: [work_02]

TASK [webserver : Copy Ubuntu sites] *********************************************************************************************************
Tuesday 20 July 2021  11:36:58 +0300 (0:00:02.290)       0:00:43.246 ********** 
skipping: [work_01] => (item=1) 
skipping: [work_01] => (item=2) 
ok: [work_02] => (item=1)
ok: [work_02] => (item=2)

TASK [webserver : Available Ubuntu sites] ****************************************************************************************************
Tuesday 20 July 2021  11:37:06 +0300 (0:00:07.397)       0:00:50.643 ********** 
skipping: [work_01] => (item=1) 
skipping: [work_01] => (item=2) 
ok: [work_02] => (item=1)
ok: [work_02] => (item=2)

TASK [webserver : Enable Ubuntu sites] *******************************************************************************************************
Tuesday 20 July 2021  11:37:12 +0300 (0:00:06.413)       0:00:57.056 ********** 
skipping: [work_01] => (item=1) 
skipping: [work_01] => (item=2) 
ok: [work_02] => (item=1)
ok: [work_02] => (item=2)

TASK [webserver : Copy Centos sites] *********************************************************************************************************
Tuesday 20 July 2021  11:37:16 +0300 (0:00:03.591)       0:01:00.648 ********** 
skipping: [work_02] => (item=1) 
skipping: [work_02] => (item=2) 
ok: [work_01] => (item=1)
ok: [work_01] => (item=2)

TASK [webserver : Modify nginx config] *******************************************************************************************************
Tuesday 20 July 2021  11:37:22 +0300 (0:00:06.323)       0:01:06.971 ********** 
skipping: [work_02]
ok: [work_01]

TASK [webserver : Available Centos sites] ****************************************************************************************************
Tuesday 20 July 2021  11:37:25 +0300 (0:00:03.142)       0:01:10.114 ********** 
skipping: [work_02] => (item=1) 
skipping: [work_02] => (item=2) 
ok: [work_01] => (item=1)
ok: [work_01] => (item=2)

TASK [webserver : Enable Centos sites] *******************************************************************************************************
Tuesday 20 July 2021  11:37:32 +0300 (0:00:06.639)       0:01:16.754 ********** 
skipping: [work_02] => (item=1) 
skipping: [work_02] => (item=2) 
ok: [work_01] => (item=1)
ok: [work_01] => (item=2)

TASK [webserver : Hosts modify] **************************************************************************************************************
Tuesday 20 July 2021  11:37:36 +0300 (0:00:04.175)       0:01:20.929 ********** 
ok: [work_01]
ok: [work_02]

TASK [webserver : Check hosts] ***************************************************************************************************************
Tuesday 20 July 2021  11:37:41 +0300 (0:00:04.537)       0:01:25.467 ********** 
ok: [work_02]
ok: [work_01]

TASK [webserver : print out] *****************************************************************************************************************
Tuesday 20 July 2021  11:37:43 +0300 (0:00:02.619)       0:01:28.087 ********** 
ok: [work_01] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.5   local-cent1.site",
        "192.168.202.6   local-deb1.site",
        "192.168.202.5   local-cent2.site",
        "192.168.202.6   local-deb2.site"
    ]
}
ok: [work_02] => {
    "msg": [
        "### Ansible managed",
        "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4",
        "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6",
        "",
        "192.168.202.5   local-cent1.site",
        "192.168.202.6   local-deb1.site",
        "192.168.202.5   local-cent2.site",
        "192.168.202.6   local-deb2.site"
    ]
}

TASK [webserver : Check www] *****************************************************************************************************************
Tuesday 20 July 2021  11:48:11 +0300 (0:00:00.616)       0:01:55.656 ********** 
ok: [work_02]
ok: [work_01]

TASK [webserver : print out] *****************************************************************************************************************
Tuesday 20 July 2021  11:48:14 +0300 (0:00:03.111)       0:01:58.768 ********** 
ok: [work_01] => {
    "msg": [
        "total 16",
        "drwxr-xr-x  4 root root 4096 Ліп 18 11:06 .",
        "drwxr-xr-x 19 root root 4096 Ліп 18 10:45 ..",
        "drwxr-xr-x  3 root root 4096 Ліп 18 11:06 local-cent1.site",
        "drwxr-xr-x  3 root root 4096 Ліп 18 11:06 local-cent2.site"
    ]
}
ok: [work_02] => {
    "msg": [
        "total 20",
        "drwxr-xr-x  5 root root 4096 Jul 18 11:05 .",
        "drwxr-xr-x 13 root root 4096 Jul 18 11:01 ..",
        "drwxr-xr-x  2 root root 4096 Jul 18 11:01 html",
        "drwxr-xr-x  3 root root 4096 Jul 18 11:05 local-deb1.site",
        "drwxr-xr-x  3 root root 4096 Jul 18 11:05 local-deb2.site"
    ]
}

TASK [webserver : Check content to the sites] ************************************************************************************************
Tuesday 20 July 2021  11:48:15 +0300 (0:00:00.552)       0:01:59.320 ********** 
[WARNING]: conditional statements should not include jinja2 templating delimiters such as {{ }} or {% %}. Found: '{{ item.name }}' not in
this.content
[WARNING]: conditional statements should not include jinja2 templating delimiters such as {{ }} or {% %}. Found: '{{ item.name }}' not in
this.content
ok: [work_02] => (item={'name': 'local-cent1.site', 'ip': '192.168.202.5'})
ok: [work_01] => (item={'name': 'local-cent1.site', 'ip': '192.168.202.5'})
ok: [work_02] => (item={'name': 'local-deb1.site', 'ip': '192.168.202.6'})
ok: [work_01] => (item={'name': 'local-deb1.site', 'ip': '192.168.202.6'})
ok: [work_02] => (item={'name': 'local-cent2.site', 'ip': '192.168.202.5'})
ok: [work_01] => (item={'name': 'local-cent2.site', 'ip': '192.168.202.5'})
ok: [work_02] => (item={'name': 'local-deb2.site', 'ip': '192.168.202.6'})
ok: [work_01] => (item={'name': 'local-deb2.site', 'ip': '192.168.202.6'})

PLAY RECAP ***********************************************************************************************************************************
work_01                    : ok=18   changed=1    unreachable=0    failed=0    skipped=6    rescued=0    ignored=0   
work_02                    : ok=15   changed=0    unreachable=0    failed=0    skipped=9    rescued=0    ignored=0   

Tuesday 20 July 2021  11:48:28 +0300 (0:00:13.772)       0:02:13.093 ********** 
=============================================================================== 
Gathering Facts ---------------------------------------------------------------------------------------------------------------------- 14.53s
webserver : Check content to the sites ----------------------------------------------------------------------------------------------- 13.77s
webserver : Available Ubuntu sites --------------------------------------------------------------------------------------------------- 10.11s
webserver : Copy Centos sites --------------------------------------------------------------------------------------------------------- 8.93s
webserver : Centos www structure ------------------------------------------------------------------------------------------------------ 8.78s
webserver : Copy Ubuntu sites --------------------------------------------------------------------------------------------------------- 8.70s
webserver : Available Centos sites ---------------------------------------------------------------------------------------------------- 6.98s
webserver : Ubuntu www structure ------------------------------------------------------------------------------------------------------ 5.56s
webserver : Enable Ubuntu sites ------------------------------------------------------------------------------------------------------- 5.09s
webserver : nginx. install packages --------------------------------------------------------------------------------------------------- 4.65s
webserver : Hosts modify -------------------------------------------------------------------------------------------------------------- 4.58s
webserver : mkdir sites-enabled ------------------------------------------------------------------------------------------------------- 4.51s
webserver : Modify nginx config ------------------------------------------------------------------------------------------------------- 4.27s
webserver : Enable Centos sites ------------------------------------------------------------------------------------------------------- 4.24s
webserver : reload service firewalld -------------------------------------------------------------------------------------------------- 4.14s
webserver : mkdir sites-available ----------------------------------------------------------------------------------------------------- 3.93s
webserver : nginx. enable and starting ------------------------------------------------------------------------------------------------ 3.84s
webserver : nginx. install packeges --------------------------------------------------------------------------------------------------- 3.18s
webserver : Check hosts --------------------------------------------------------------------------------------------------------------- 3.12s
webserver : Check www ----------------------------------------------------------------------------------------------------------------- 3.11s
Playbook run took 0 days, 0 hours, 2 minutes, 13 seconds

