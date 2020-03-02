# Terminal output
```bash
anjey@anjey-UX31A:~/devops/07.Ansible$ ansible-playbook -i inventory.yaml  play.yaml -u updater -e 'group=internal'
[WARNING]: Found both group and host with same name: jump

PLAY [internal] ****************************************************************

TASK [Gathering Facts] *********************************************************
Monday 02 March 2020  11:15:51 +0300 (0:00:00.051)       0:00:00.051 ********** 
ok: [centos_host]
ok: [debian_host]

TASK [web : nginx. Install packages] *******************************************
Monday 02 March 2020  11:15:56 +0300 (0:00:05.242)       0:00:05.293 ********** 
skipping: [centos_host]
ok: [debian_host]

TASK [web : nginx. Enable and start service] ***********************************
Monday 02 March 2020  11:15:57 +0300 (0:00:01.347)       0:00:06.641 ********** 
skipping: [centos_host]
ok: [debian_host]

TASK [web : nginx. Install packages] *******************************************
Monday 02 March 2020  11:15:58 +0300 (0:00:00.750)       0:00:07.392 ********** 
skipping: [debian_host]
ok: [centos_host]

TASK [web : nginx. Enable and start service] ***********************************
Monday 02 March 2020  11:15:59 +0300 (0:00:00.901)       0:00:08.293 ********** 
skipping: [debian_host]
ok: [centos_host]

TASK [web : First page] ********************************************************
Monday 02 March 2020  11:16:00 +0300 (0:00:01.010)       0:00:09.304 ********** 
ok: [debian_host]
ok: [centos_host]

TASK [os] **********************************************************************
Monday 02 March 2020  11:16:01 +0300 (0:00:01.145)       0:00:10.449 ********** 
ok: [centos_host] => {
    "msg": "localhost | CentOS | 7.7 "
}
ok: [debian_host] => {
    "msg": "vagrant-ubuntu-trusty-64 | Ubuntu | 14.04 "
}

PLAY RECAP *********************************************************************
centos_host                : ok=5    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
debian_host                : ok=5    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   

Monday 02 March 2020  11:16:01 +0300 (0:00:00.063)       0:00:10.513 ********** 
=============================================================================== 
Gathering Facts --------------------------------------------------------- 5.24s
web : nginx. Install packages ------------------------------------------- 1.35s
web : First page -------------------------------------------------------- 1.15s
web : nginx. Enable and start service ----------------------------------- 1.01s
web : nginx. Install packages ------------------------------------------- 0.90s
web : nginx. Enable and start service ----------------------------------- 0.75s
os ---------------------------------------------------------------------- 0.06s
Playbook run took 0 days, 0 hours, 0 minutes, 10 seconds
anjey@anjey-UX31A:~/devops/07.Ansible$ 

```
