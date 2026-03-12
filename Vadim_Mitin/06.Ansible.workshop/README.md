# HW 6
`ansible-playbook -i inv.yaml playbook.yaml`

```bash
PLAY [Install and configure nginx] **************************************************************************************

TASK [Gathering Facts] **************************************************************************************************
[WARNING]: Host 'host5' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [host5]
[WARNING]: Host 'host6' is using the discovered Python interpreter at '/usr/bin/python3.10', but future installation of another Python interpreter could cause a different interpreter to be discovered. See https://docs.ansible.com/ansible-core/2.20/reference_appendices/interpreter_discovery.html for more information.
ok: [host6]

TASK [Select site config for this host] *********************************************************************************
ok: [host5]
ok: [host6]

TASK [Ensure nginx is installed] ****************************************************************************************
ok: [host5]
ok: [host6]

TASK [Create root directory for site] ***********************************************************************************
ok: [host5]
ok: [host6]

TASK [Deploy index.html with unique content per host] *******************************************************************
[WARNING]: Deprecation warnings can be disabled by setting `deprecation_warnings=False` in ansible.cfg.
[DEPRECATION WARNING]: INJECT_FACTS_AS_VARS default to `True` is deprecated, top-level facts will not be auto injected after the change. This feature will be removed from ansible-core version 2.24.
Origin: /Users/vadimmitin/Projects/sa.it-academy.by/Vadim_Mitin/06.Ansible.workshop/homework/templates/index.html.j2

Use `ansible_facts["fact_name"]` (no `ansible_` prefix) instead.

changed: [host5]
changed: [host6]

TASK [Remove default nginx site] ****************************************************************************************
ok: [host5]
ok: [host6]

TASK [Deploy nginx virtual host config] *********************************************************************************
changed: [host5]
changed: [host6]

TASK [Enable virtual host] **********************************************************************************************
ok: [host5]
ok: [host6]

TASK [Show last 20 lines of nginx journal] ******************************************************************************
changed: [host6]
changed: [host5]

TASK [Print nginx journal] **********************************************************************************************
ok: [host5] => {
    "nginx_journal.stdout_lines": [
        "Mar 11 00:07:09 sa-5 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "░░ Subject: A start job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 27383.",
        "Mar 11 00:07:09 sa-5 systemd[1]: Started A high performance web server and a reverse proxy server.",
        "░░ Subject: A start job for unit nginx.service has finished successfully",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has finished successfully.",
        "░░ ",
        "░░ The job identifier is 27383.",
        "Mar 11 00:07:38 sa-5 systemd[1]: Reloading A high performance web server and a reverse proxy server...",
        "░░ Subject: A reload job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 27437.",
        "Mar 11 00:07:38 sa-5 systemd[1]: Reloaded A high performance web server and a reverse proxy server.",
        "░░ Subject: A reload job for unit nginx.service has finished",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has finished.",
        "░░ ",
        "░░ The job identifier is 27437 and the job result is done.",
        "Mar 11 00:09:12 sa-5 systemd[1]: Reloading A high performance web server and a reverse proxy server...",
        "░░ Subject: A reload job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 27438.",
        "Mar 11 00:09:12 sa-5 systemd[1]: Reloaded A high performance web server and a reverse proxy server.",
        "░░ Subject: A reload job for unit nginx.service has finished",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has finished.",
        "░░ ",
        "░░ The job identifier is 27438 and the job result is done.",
        "Mar 11 00:15:15 sa-5 systemd[1]: Reloading A high performance web server and a reverse proxy server...",
        "░░ Subject: A reload job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 27552.",
        "Mar 11 00:15:15 sa-5 systemd[1]: Reloaded A high performance web server and a reverse proxy server.",
        "░░ Subject: A reload job for unit nginx.service has finished",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has finished.",
        "░░ ",
        "░░ The job identifier is 27552 and the job result is done."
    ]
}
ok: [host6] => {
    "nginx_journal.stdout_lines": [
        "Mar 11 00:14:47 sa-6 systemd[1]: Starting A high performance web server and a reverse proxy server...",
        "░░ Subject: A start job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 25782.",
        "Mar 11 00:14:47 sa-6 systemd[1]: Started A high performance web server and a reverse proxy server.",
        "░░ Subject: A start job for unit nginx.service has finished successfully",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A start job for unit nginx.service has finished successfully.",
        "░░ ",
        "░░ The job identifier is 25782.",
        "Mar 11 00:15:15 sa-6 systemd[1]: Reloading A high performance web server and a reverse proxy server...",
        "░░ Subject: A reload job for unit nginx.service has begun execution",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has begun execution.",
        "░░ ",
        "░░ The job identifier is 25836.",
        "Mar 11 00:15:15 sa-6 systemd[1]: Reloaded A high performance web server and a reverse proxy server.",
        "░░ Subject: A reload job for unit nginx.service has finished",
        "░░ Defined-By: systemd",
        "░░ Support: http://www.ubuntu.com/support",
        "░░ ",
        "░░ A reload job for unit nginx.service has finished.",
        "░░ ",
        "░░ The job identifier is 25836 and the job result is done."
    ]
}

TASK [Ensure nginx is started and enabled] ******************************************************************************
changed: [host6]
changed: [host5]

TASK [Verify website is accessible] *************************************************************************************
ok: [host5]
ok: [host6]

PLAY RECAP **************************************************************************************************************
host5                      : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host6                      : ok=12   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```