# 06.Ansible_workshop
1. Create ansible.cfg
[ansible.cfg](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/ansible.cfg)
2. Create inventory file
[inventory](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/inv.yaml)
3.Create sample html files for virtualhosts 1 and 2 and template for /etc/nginx/sites-available/julia-site*.by 

[site1.html](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/site1.html)

[site2.html](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/site2.html)

[template](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/index_htm_template)

4. Create playbook
[playbook](https://github.com/julietredk/sa.it-academy.by/blob/md-sa2-23-23/Yulia_Redkova/06.Ansible_workshop/playbook_nginx2.yaml)
5. Run playbook and check results
```bash
yulia@ubuntuserver:~/Gitlab_repo/06.Ansible_workshop$ ansible-playbook -i inv.yaml playbook_nginx2.yaml --ask-pass
SSH password: 
[WARNING]: Skipping callback plugin 'profile_tasks', unable to load
[WARNING]: Skipping callback plugin 'timer', unable to load

PLAY [db_all] **********************************************************************************************************************************************************

TASK [Gathering Facts] *************************************************************************************************************************************************
ok: [host16]

TASK [ensure nginx is at the latest version] ***************************************************************************************************************************
ok: [host16]

TASK [start nginx] *****************************************************************************************************************************************************
ok: [host16]

TASK [Create a directory if it does not exist] *************************************************************************************************************************
ok: [host16] => (item=julia-site1.by)
ok: [host16] => (item=julia-site2.by)

TASK [Create html file for virtual host] *******************************************************************************************************************************
ok: [host16] => (item=julia-site1.by)
ok: [host16] => (item=julia-site2.by)

TASK [temlating files /etc/nginx/sites-available/julia-site*.by] *******************************************************************************************************
ok: [host16] => (item=julia-site1.by)
ok: [host16] => (item=julia-site2.by)

TASK [Create a symbolic link for site] *********************************************************************************************************************************
ok: [host16] => (item=julia-site1.by)
ok: [host16] => (item=julia-site2.by)

TASK [Check nginx configuration] ***************************************************************************************************************************************
changed: [host16]

TASK [debug] ***********************************************************************************************************************************************************
ok: [host16] => {
    "msg": []
}

TASK [Restart service httpd, in all cases] *****************************************************************************************************************************
changed: [host16]

TASK [Check that you can connect (GET) to a page and it returns a status 200] ******************************************************************************************
ok: [host16] => (item=julia-site1.by)
ok: [host16] => (item=julia-site2.by)

PLAY RECAP *************************************************************************************************************************************************************
host16                     : ok=11   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```
