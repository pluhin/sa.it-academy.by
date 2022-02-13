Playbook:

### 7.Ansible.Cruise

##  Nginx installing

```bash
root@STG-UB:/home/las/git_repos/07.Ansible.Cruise/Ansible# ansible-playbook -i inv.yaml nginx.yaml

PLAY [vbuh_hosts] **************************************************************************************************************************************************************

TASK [Gathering Facts] *********************************************************************************************************************************************************
ok: [host03]
ok: [host04]

TASK [nginx : Deploy for Debian systems] ***************************************************************************************************************************************
skipping: [host03]
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/ubuntu.yaml for host04

TASK [nginx : Nginx. Install packages] *****************************************************************************************************************************************
ok: [host04]

TASK [nginx : Nginx. Enable and start service] *********************************************************************************************************************************
ok: [host04]

TASK [nginx : Nginx. Deploy ubuntu] ********************************************************************************************************************************************
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/deploy.yaml for host04 => (item=local-debian1.site)
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/deploy.yaml for host04 => (item=local-debian2.site)

TASK [nginx : Make sure destination dir exists] ********************************************************************************************************************************
ok: [host04]

TASK [nginx : Add index.html] **************************************************************************************************************************************************
ok: [host04]

TASK [nginx : Add conf] ********************************************************************************************************************************************************
ok: [host04]

TASK [nginx : Deploy for RedHat systems] ***************************************************************************************************************************************
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/centos.yaml for host03

TASK [nginx : Install EPEL Repo] ***********************************************************************************************************************************************
ok: [host03]

TASK [nginx : Nginx. Install packages] *****************************************************************************************************************************************
ok: [host03]

TASK [nginx : Nginx. Enable and start service] *********************************************************************************************************************************
ok: [host03]

TASK [nginx : Nginx. Deploy centos] ********************************************************************************************************************************************
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/deploy.yaml for host03 => (item=local-centos1.site)
included: /home/las/git_repos/07.Ansible.Cruise/Ansible/roles/nginx/tasks/deploy.yaml for host03 => (item=local-centos2.site)

TASK [nginx : Make sure destination dir exists] ********************************************************************************************************************************
ok: [host03]

TASK [nginx : Add index.html] **************************************************************************************************************************************************
ok: [host03]

TASK [nginx : Add conf] ********************************************************************************************************************************************************
ok: [host03]

PLAY RECAP *********************************************************************************************************************************************************************
host03                     : ok=10 changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
host04                     : ok=9   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```

## Implement testing role

```bash
root@STG-UB:/home/las/git_repos/07.Ansible.Cruise/Ansible# ansible-playbook -i inv.yaml Tests.yaml

PLAY [vbuh_hosts] **********************************************************************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************************************************************************
ok: [host03]
ok: [host04]

TASK [Show ansible host] ***************************************************************************************************************************************************************
ok: [host03] => {
    "msg": "OS Version = CentOS  7.7 Core"
}
ok: [host04] => {
    "msg": "OS Version = Ubuntu  18.04 bionic"
}

TASK [Tests : Check we have SUDO with NOPASSWD] ****************************************************************************************************************************************
ok: [host03]
ok: [host04]

TASK [Tests : Check connections to public repositories (Debian/CentOS and pip package repository)] *************************************************************************************
ok: [host03] => (item=http://archive.ubuntu.com)
ok: [host04] => (item=http://archive.ubuntu.com)
ok: [host03] => (item=http://mirror.centos.org)
ok: [host04] => (item=http://mirror.centos.org)
ok: [host03] => (item=https://pypi.org)
ok: [host04] => (item=https://pypi.org)

TASK [Tests : Check if we have connection to docker hub registry] **********************************************************************************************************************
ok: [host04]
ok: [host03]

TASK [Tests : print out docker response] ***********************************************************************************************************************************************
ok: [host03] => {
    "msg": "https://hub.docker.com - STATUS Code: 200"
}
ok: [host04] => {
    "msg": "https://hub.docker.com - STATUS Code: 200"
}

TASK [Tests : Check free HDD space (More than 1024 MB)] ********************************************************************************************************************************
ok: [host03] => {
    "changed": false,
    "msg": "SUCCESS. You HDD memory = 18164.3984375 Mb. it is more than 1024 MB"
}
ok: [host04] => {
    "changed": false,
    "msg": "SUCCESS. You HDD memory = 17934.640625 Mb. it is more than 1024 MB"
}

TASK [Tests : Check free RAM space (More than 256 MB)] *********************************************************************************************************************************
ok: [host03] => {
    "changed": false,
    "msg": "SUCCESS. You RAM memory = 3650 Mb. it is more than 256 MB"
}
ok: [host04] => {
    "changed": false,
    "msg": "SUCCESS. You RAM memory = 3592 Mb. it is more than 256 MB"
}

PLAY RECAP *****************************************************************************************************************************************************************************
host03                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
host04                     : ok=8    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```



