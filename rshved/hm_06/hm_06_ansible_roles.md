# Lesson 6: Ansible.Roles
### Output:
```bash
romanshved:~/work/git/ansible ansible-playbook nginx.yml

PLAY [all] *****************************************************************************************

TASK [Gathering Facts] *****************************************************************************
ok: [cent]
ok: [ubuntu]

TASK [deploy_nginx : Setup nginx cent_os] **********************************************************
skipping: [ubuntu]
included: /Users/romanshved/work/git/ansible/roles/deploy_nginx/tasks/cent.yml for cent

TASK [deploy_nginx : add epel repo] ****************************************************************
ok: [cent]

TASK [deploy_nginx : update packages on cent_os] ***************************************************
ok: [cent]

TASK [deploy_nginx : install packages on cent_os] **************************************************
ok: [cent]

TASK [deploy_nginx : start and enable nginx] *******************************************************
ok: [cent]

TASK [deploy_nginx : insert index file on cent_os] *************************************************
ok: [cent]

TASK [deploy_nginx : Setup nginx ubuntu] ***********************************************************
skipping: [cent]
included: /Users/romanshved/work/git/ansible/roles/deploy_nginx/tasks/ubuntu.yml for ubuntu

TASK [deploy_nginx : apt-get update] ***************************************************************
ok: [ubuntu]

TASK [deploy_nginx : install packages on ubuntu] ***************************************************
ok: [ubuntu]

TASK [deploy_nginx : start and enable nginx] *******************************************************
ok: [ubuntu]

TASK [deploy_nginx : insert index page on ubuntu] **************************************************
ok: [ubuntu]

TASK [deploy_nginx : Check deployment on Cent OS] **************************************************
skipping: [ubuntu]
ok: [cent]

TASK [deploy_nginx : Check deployment on Ubuntu] ***************************************************
skipping: [cent]
ok: [ubuntu]

PLAY RECAP *****************************************************************************************
cent                       : ok=8    changed=0    unreachable=0    failed=0   
ubuntu                     : ok=7    changed=0    unreachable=0    failed=0  
```
