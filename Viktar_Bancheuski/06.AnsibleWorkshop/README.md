```bash
ansible-playbook -i inventory.yaml playbook.yaml --ask-vault-pass
Vault password:

PLAY [Configure Nginx with two virtual hosts] ******************************************************

TASK [Gathering Facts] *****************************************************************************
Tuesday 15 April 2025  21:55:59 +0000 (0:00:00.038)       0:00:00.038 *********
ok: [host2]
ok: [host1]

TASK [Install Nginx] *******************************************************************************
Tuesday 15 April 2025  21:56:01 +0000 (0:00:02.226)       0:00:02.265 *********
ok: [host2]
ok: [host1]

TASK [Create directories for virtual hosts] ********************************************************
Tuesday 15 April 2025  21:56:04 +0000 (0:00:02.585)       0:00:04.850 *********
ok: [host2] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host1] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host2] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})
ok: [host1] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})

TASK [Create index.html for virtual hosts using templates] *****************************************
Tuesday 15 April 2025  21:56:05 +0000 (0:00:01.190)       0:00:06.041 *********
ok: [host2] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host1] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host2] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})
ok: [host1] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})

TASK [Configure virtual hosts using templates] *****************************************************
Tuesday 15 April 2025  21:56:07 +0000 (0:00:01.911)       0:00:07.952 *********
ok: [host1] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host2] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host2] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})
ok: [host1] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})

TASK [Enable virtual hosts] ************************************************************************
Tuesday 15 April 2025  21:56:09 +0000 (0:00:01.896)       0:00:09.849 *********
ok: [host1] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host2] => (item={'key': 'site1', 'value': {'name': 'site1.it-academy', 'port': 80, 'root': '/va
r/www/site1', 'template': 'index1.html.j2', 'conf_template': 'virtualhost1.conf.j2', 'site_title': '
IT Academy Site 1'}})
ok: [host1] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})
ok: [host2] => (item={'key': 'site2', 'value': {'name': 'site2.it-academy', 'port': 80, 'root': '/va
r/www/site2', 'template': 'index2.html.j2', 'conf_template': 'virtualhost2.conf.j2', 'site_title': '
IT Academy Site 2'}})

TASK [Remove default Nginx site] *******************************************************************
Tuesday 15 April 2025  21:56:10 +0000 (0:00:01.131)       0:00:10.980 *********
ok: [host2]
ok: [host1]

PLAY RECAP *****************************************************************************************
host1                      : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=
0    ignored=0
host2                      : ok=7    changed=0    unreachable=0    failed=0    skipped=0    rescued=
0    ignored=0

Tuesday 15 April 2025  21:56:11 +0000 (0:00:00.675)       0:00:11.656 *********
===============================================================================
Install Nginx ------------------------------------------------------------------------------- 2.59s
Gathering Facts ----------------------------------------------------------------------------- 2.23s
Create index.html for virtual hosts using templates ----------------------------------------- 1.91s
Configure virtual hosts using templates ----------------------------------------------------- 1.90s
Create directories for virtual hosts -------------------------------------------------------- 1.19s
Enable virtual hosts ------------------------------------------------------------------------ 1.13s
Remove default Nginx site ------------------------------------------------------------------- 0.68s
Playbook run took 0 days, 0 hours, 0 minutes, 11 seconds
```
