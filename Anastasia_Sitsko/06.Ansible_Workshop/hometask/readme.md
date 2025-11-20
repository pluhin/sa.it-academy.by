`
ansible-playbook -i inv.yaml playbook.yaml -u root --ask-pass
`

```
SSH password: 

PLAY [Install and configure nginx] ************************************************************************************

TASK [Gathering Facts] ************************************************************************************************
Thursday 20 November 2025  16:43:36 +0300 (0:00:00.007)       0:00:00.007 ***** 
ok: [myhosts]

TASK [Ensure nginx is installed] **************************************************************************************
Thursday 20 November 2025  16:43:52 +0300 (0:00:15.489)       0:00:15.496 ***** 
ok: [myhosts]

TASK [Create root directories for each site] **************************************************************************
Thursday 20 November 2025  16:44:04 +0300 (0:00:12.506)       0:00:28.002 ***** 
ok: [myhosts] => (item={'name': 'HOST1', 'domain': 'host1.com', 'root': '/var/www/host1', 'port': 90})
ok: [myhosts] => (item={'name': 'HOST2', 'domain': 'host2.com', 'root': '/var/www/host2', 'port': 8080})

TASK [Create index.html with unique content per host] *****************************************************************
Thursday 20 November 2025  16:44:26 +0300 (0:00:21.464)       0:00:49.467 ***** 
ok: [myhosts] => (item={'name': 'HOST1', 'domain': 'host1.com', 'root': '/var/www/host1', 'port': 90})
ok: [myhosts] => (item={'name': 'HOST2', 'domain': 'host2.com', 'root': '/var/www/host2', 'port': 8080})

TASK [Remove default nginx site if exists] ****************************************************************************
Thursday 20 November 2025  16:44:59 +0300 (0:00:33.132)       0:01:22.599 ***** 
ok: [myhosts]

TASK [Deploy nginx config for each virtual host] **********************************************************************
Thursday 20 November 2025  16:45:10 +0300 (0:00:10.980)       0:01:33.580 ***** 
changed: [myhosts] => (item={'name': 'HOST1', 'domain': 'host1.com', 'root': '/var/www/host1', 'port': 90})
ok: [myhosts] => (item={'name': 'HOST2', 'domain': 'host2.com', 'root': '/var/www/host2', 'port': 8080})

TASK [Enable virtual hosts by creating symlinks] **********************************************************************
Thursday 20 November 2025  16:45:46 +0300 (0:00:36.400)       0:02:09.981 ***** 
ok: [myhosts] => (item={'name': 'HOST1', 'domain': 'host1.com', 'root': '/var/www/host1', 'port': 90})
ok: [myhosts] => (item={'name': 'HOST2', 'domain': 'host2.com', 'root': '/var/www/host2', 'port': 8080})

TASK [Show last 20 lines of nginx journal] ****************************************************************************
Thursday 20 November 2025  16:46:09 +0300 (0:00:22.538)       0:02:32.519 ***** 
changed: [myhosts]

TASK [Print nginx journal] ********************************************************************************************
Thursday 20 November 2025  16:46:19 +0300 (0:00:10.518)       0:02:43.038 ***** 
ok: [myhosts] => {
    "nginx_journal.stdout_lines": [
        "Nov 20 13:31:27 ws-6 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "░░ Subject: A start job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 118900.",
        "Nov 20 13:31:27 ws-6 nginx[40247]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:31:27 ws-6 nginx[40247]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:31:28 ws-6 nginx[40247]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:31:28 ws-6 nginx[40247]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:31:29 ws-6 nginx[40247]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:31:29 ws-6 nginx[40247]: nginx: [emerg] still could not bind()",
        "Nov 20 13:31:29 ws-6 systemd[1]: nginx.service: Control process exited, code=exited, status=1/FAILURE",
        "░░ Subject: Unit process exited",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ An ExecStart= process belonging to unit nginx.service has exited.",
        "░░ ",
        "░░ The process' exit code is 'exited' and its exit status is 1.",
        "Nov 20 13:31:29 ws-6 systemd[1]: nginx.service: Failed with result 'exit-code'.",
        "░░ Subject: Unit failed",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ The unit nginx.service has entered the 'failed' state with result 'exit-code'.",
        "Nov 20 13:31:29 ws-6 systemd[1]: Failed to start A high performance web server and a reverse proxy server.",
        "░░ Subject: A start job for unit nginx.service has failed",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has finished with a failure.",
        "░░ ",
        "░░ The job identifier is 118900 and the job result is failed.",
        "Nov 20 13:40:53 ws-6 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "░░ Subject: A start job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 129350.",
        "Nov 20 13:40:53 ws-6 nginx[42872]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:40:53 ws-6 nginx[42872]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:40:54 ws-6 nginx[42872]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:40:54 ws-6 nginx[42872]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:40:55 ws-6 nginx[42872]: nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Unknown error)",
        "Nov 20 13:40:55 ws-6 nginx[42872]: nginx: [emerg] still could not bind()",
        "Nov 20 13:40:55 ws-6 systemd[1]: nginx.service: Control process exited, code=exited, status=1/FAILURE",
        "░░ Subject: Unit process exited",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ An ExecStart= process belonging to unit nginx.service has exited.",
        "░░ ",
        "░░ The process' exit code is 'exited' and its exit status is 1.",
        "Nov 20 13:40:55 ws-6 systemd[1]: nginx.service: Failed with result 'exit-code'.",
        "░░ Subject: Unit failed",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ The unit nginx.service has entered the 'failed' state with result 'exit-code'.",
        "Nov 20 13:40:55 ws-6 systemd[1]: Failed to start A high performance web server and a reverse proxy server.",
        "░░ Subject: A start job for unit nginx.service has failed",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has finished with a failure.",
        "░░ ",
        "░░ The job identifier is 129350 and the job result is failed."
    ]
}

TASK [Ensure nginx is started and enabled] ****************************************************************************
Thursday 20 November 2025  16:46:19 +0300 (0:00:00.057)       0:02:43.096 ***** 
changed: [myhosts]

TASK [Verify websites are accessible] *********************************************************************************
Thursday 20 November 2025  16:46:30 +0300 (0:00:11.087)       0:02:54.183 ***** 
ok: [myhosts] => (item={'name': 'HOST1', 'domain': 'host1.com', 'root': '/var/www/host1', 'port': 90})
ok: [myhosts] => (item={'name': 'HOST2', 'domain': 'host2.com', 'root': '/var/www/host2', 'port': 8080})

PLAY RECAP ************************************************************************************************************
myhosts                    : ok=11   changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

Thursday 20 November 2025  16:46:52 +0300 (0:00:21.546)       0:03:15.730 ***** 
=============================================================================== 
Deploy nginx config for each virtual host --------------------------------------------------------------------- 36.40s
Create index.html with unique content per host ---------------------------------------------------------------- 33.13s
Enable virtual hosts by creating symlinks --------------------------------------------------------------------- 22.54s
Verify websites are accessible -------------------------------------------------------------------------------- 21.55s
Create root directories for each site ------------------------------------------------------------------------- 21.46s
Gathering Facts ----------------------------------------------------------------------------------------------- 15.49s
Ensure nginx is installed ------------------------------------------------------------------------------------- 12.51s
Ensure nginx is started and enabled --------------------------------------------------------------------------- 11.09s
Remove default nginx site if exists --------------------------------------------------------------------------- 10.98s
Show last 20 lines of nginx journal --------------------------------------------------------------------------- 10.52s
Print nginx journal -------------------------------------------------------------------------------------------- 0.06s
Playbook run took 0 days, 0 hours, 3 minutes, 15 seconds
```