# 06.Ansible_workshop
1. Create ansible.cfg
[ansible.cfg](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/ansible.cfg)
2. Create inventory file
[inventory](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/inv.yaml)
3.Create sample html files for virtualhosts 1 and 2
[site1.html](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/site1.html)
[site2.html](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/site2.html)
4. Create playbook
[playbook](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/playbook_nginx.yaml)
5. Run playbook and check results
```
PLAY [db_all] ******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [host16]

TASK [ensure nginx is at the latest version] ***********************************
ok: [host16]

TASK [start nginx] *************************************************************
ok: [host16]

TASK [Create a directory if it does not exist] *********************************
ok: [host16]

TASK [Create a directory if it does not exist] *********************************
ok: [host16]

TASK [Create html file for virtual host1] **************************************
ok: [host16]

TASK [Create html file for virtual host2] **************************************
ok: [host16]

TASK [Copy a "/etc/nginx/sites-available/default" file on the remote machine for site1] ***
changed: [host16]

TASK [Copy a "/etc/nginx/sites-available/default" file on the remote machine for site2] ***
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site1.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site2.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site1.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site2.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site1.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site2.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site1.by] ***********************
changed: [host16]

TASK [editing /etc/nginx/sites-available/julia-site2.by] ***********************
changed: [host16]

TASK [Create a symbolic link for site1] ****************************************
ok: [host16]

TASK [Create a symbolic link for site2] ****************************************
ok: [host16]

TASK [Check nginx configuration] ***********************************************
changed: [host16]

TASK [debug] *******************************************************************
ok: [host16] => {
    "msg": []
}

TASK [Restart service httpd, in all cases] *************************************
changed: [host16]

TASK [Check that you can connect (GET) to a page and it returns a status 200] ***
ok: [host16]

TASK [Check that you can connect (GET) to a page and it returns a status 200] ***
ok: [host16]

PLAY RECAP *********************************************************************
host16                     : ok=24   changed=12   unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
