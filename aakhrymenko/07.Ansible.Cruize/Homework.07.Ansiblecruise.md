# 07.Homework.Ansible.Cruize

## Ansible.Inventory

```bash

➜  ansible cat inv.yaml
Linux:
  vars:
    ansible_ssh_user: root
  children:
    work_hosts:
      hosts:
        work_host1:
          ansible_host: 192.168.202.19
        work_host2:
          ansible_host: 192.168.202.20
    workshop_hosts:
      hosts:
        workshop_host1:
          ansible_host: 192.168.201.10
    k8s:
      hosts:
        k8s_host1:
          ansible_host: 192.168.203.19
        k8s_host2 :
          ansible_host: 192.168.203.20

jump:
  hosts:
    jump_server:
      ansible_host: 178.124.206.53
      ansible_ssh_user: jump_sa





#[Linux:children]
#work_hosts
#workshop_hosts
#k8s

#[Linux:vars]
#ansible_ssh_user=root

#[jump]
#jump_server ansible_host=178.124.206.53 ansible_ssh_user=jump_sa

#[work_hosts]
#192.168.202.19
#192.168.202.20

#[workshop_hosts]
#192.168.201.10

#[k8s]
#192.168.203.19
#192.168.203.20


```

## Task1. Role 'nginx' filesystem hierarchy

```bash

- ansible/
    inv.yaml
    nginx.yaml
  - roles/
    - test_role1_nginx/
      - defaults/
          main.yaml
      - files/
          index2.html
          index.html
          nginx.conf
      - handlers/
          main.yaml
      - tasks/
          main.yaml
          task_nginx_centos.yaml
          task_nginx_ubuntu.yaml
      - templates/
          hosts.j2
          template.conf

```


## Task1. Deploy nginx with 2 virtual hosts for RedHat and Ubuntu

```bash

➜  ansible ansible-playbook -i inv.yaml nginx.yaml   

PLAY [work_hosts] *****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:47 +0300 (0:00:00.046)       0:00:00.046 ********* 
ok: [work_host1]
ok: [work_host2]

TASK [test_role1_nginx : nginx.Install] *******************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:49 +0300 (0:00:02.293)       0:00:02.340 ********* 
skipping: [work_host1]
ok: [work_host2]

TASK [test_role1_nginx : nginx.Enable\Start] **************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:52 +0300 (0:00:02.429)       0:00:04.770 ********* 
skipping: [work_host1]
ok: [work_host2]

TASK [test_role1_nginx : nginx.Install] *******************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:53 +0300 (0:00:01.379)       0:00:06.149 ********* 
skipping: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : nginx.Enable\Start] **************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:54 +0300 (0:00:01.304)       0:00:07.454 ********* 
skipping: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : http.Open port] ******************************************************************************************************************************************************************
Saturday 03 July 2021  13:54:55 +0300 (0:00:00.799)       0:00:08.253 ********* 
skipping: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : reload service firewalld] ********************************************************************************************************************************************************
Saturday 03 July 2021  13:54:56 +0300 (0:00:01.320)       0:00:09.574 ********* 
skipping: [work_host2]
changed: [work_host1]

TASK [test_role1_nginx : Creates directories for site1 and site2] *****************************************************************************************************************************************
Saturday 03 July 2021  13:54:57 +0300 (0:00:01.011)       0:00:10.585 ********* 
skipping: [work_host2] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'}) 
ok: [work_host2] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'})
skipping: [work_host2] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'}) 
ok: [work_host1] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'})
skipping: [work_host1] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'}) 
ok: [work_host2] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'})
ok: [work_host1] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'})
skipping: [work_host1] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'}) 

TASK [test_role1_nginx : Copy initial\home webpage for site2] *********************************************************************************************************************************************
Saturday 03 July 2021  13:54:59 +0300 (0:00:01.799)       0:00:12.384 ********* 
ok: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : Copy initial\home webpage for site2] *********************************************************************************************************************************************
Saturday 03 July 2021  13:55:01 +0300 (0:00:01.858)       0:00:14.242 ********* 
ok: [work_host1]
ok: [work_host2]

TASK [test_role1_nginx : Creates directories in Centos] ***************************************************************************************************************************************************
Saturday 03 July 2021  13:55:03 +0300 (0:00:01.595)       0:00:15.838 ********* 
skipping: [work_host2] => (item=/etc/nginx/sites-enabled) 
skipping: [work_host2] => (item=/etc/nginx/sites-available) 
ok: [work_host1] => (item=/etc/nginx/sites-enabled)
ok: [work_host1] => (item=/etc/nginx/sites-available)

TASK [test_role1_nginx : Copy nginx CFG] ******************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:04 +0300 (0:00:01.633)       0:00:17.471 ********* 
skipping: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : Template for nginx  configs] *****************************************************************************************************************************************************
Saturday 03 July 2021  13:55:06 +0300 (0:00:01.200)       0:00:18.672 ********* 
skipping: [work_host2] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'}) 
ok: [work_host2] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'})
skipping: [work_host2] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'}) 
changed: [work_host1] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'})
skipping: [work_host1] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'}) 
changed: [work_host2] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'})
changed: [work_host1] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'})
skipping: [work_host1] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'}) 

TASK [test_role1_nginx : Make Link site1] *****************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:08 +0300 (0:00:02.630)       0:00:21.303 ********* 
skipping: [work_host2]
changed: [work_host1]

TASK [test_role1_nginx : Make Link site2] *****************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:09 +0300 (0:00:00.815)       0:00:22.120 ********* 
changed: [work_host1]
changed: [work_host2]

TASK [test_role1_nginx : Check connection to Localhost] ***************************************************************************************************************************************************
Saturday 03 July 2021  13:55:10 +0300 (0:00:00.831)       0:00:22.951 ********* 
ok: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : print out] ***********************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:11 +0300 (0:00:00.935)       0:00:23.886 ********* 
ok: [work_host1] => {}

MSG:

{'match_groups': [], 'elapsed': 0, 'search_regex': None, 'state': 'started', 'match_groupdict': {}, 'path': None, 'port': 80, 'failed': False, 'changed': False}
ok: [work_host2] => {}

MSG:

{'match_groups': [], 'elapsed': 0, 'search_regex': None, 'state': 'started', 'match_groupdict': {}, 'path': None, 'port': 80, 'failed': False, 'changed': False}

TASK [test_role1_nginx : Templates] ***********************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:11 +0300 (0:00:00.193)       0:00:24.080 ********* 
ok: [work_host1]
ok: [work_host2]

TASK [test_role1_nginx : Check templates] *****************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:12 +0300 (0:00:01.440)       0:00:25.520 ********* 
ok: [work_host2]
ok: [work_host1]

TASK [test_role1_nginx : print out] ***********************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:13 +0300 (0:00:00.949)       0:00:26.470 ********* 
ok: [work_host1] => {}

MSG:

['### Ansible managed', '127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4', '::1       localhost localhost.localdomain localhost6 localhost6.localdomain6', '', '192.168.202.19 centos.test.site', '192.168.202.20 ubuntu.test.site', '192.168.202.19 centos.testsite2.com', '192.168.202.20 ubuntu.testsite2.com']
ok: [work_host2] => {}

MSG:

['### Ansible managed', '127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4', '::1       localhost localhost.localdomain localhost6 localhost6.localdomain6', '', '192.168.202.19 centos.test.site', '192.168.202.20 ubuntu.test.site', '192.168.202.19 centos.testsite2.com', '192.168.202.20 ubuntu.testsite2.com']

TASK [test_role1_nginx : Check content to the sites] ******************************************************************************************************************************************************
Saturday 03 July 2021  13:55:14 +0300 (0:00:00.180)       0:00:26.650 ********* 
ok: [work_host2] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'})
ok: [work_host1] => (item={'name': 'centos.test.site', 'ip': '192.168.202.19'})
ok: [work_host2] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'})
ok: [work_host1] => (item={'name': 'ubuntu.test.site', 'ip': '192.168.202.20'})
ok: [work_host2] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'})
ok: [work_host1] => (item={'name': 'centos.testsite2.com', 'ip': '192.168.202.19'})
ok: [work_host2] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'})
ok: [work_host1] => (item={'name': 'ubuntu.testsite2.com', 'ip': '192.168.202.20'})

TASK [test_role1_nginx : print out] ***********************************************************************************************************************************************************************
Saturday 03 July 2021  13:55:17 +0300 (0:00:03.298)       0:00:29.949 ********* 
ok: [work_host1] => (item=0) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_SITE1, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>


ok: [work_host1] => (item=1) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_SITE1, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>


ok: [work_host1] => (item=2) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_TESTSITE2.COM, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>



ok: [work_host1] => (item=3) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_TESTSITE2.COM, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>



ok: [work_host2] => (item=0) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_SITE1, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>


ok: [work_host2] => (item=1) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_SITE1, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>


ok: [work_host2] => (item=2) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_TESTSITE2.COM, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>



ok: [work_host2] => (item=3) => {}

MSG:

<!DOCTYPE html>
<html>
<body>
<h1>Welcome to nginx_TESTSITE2.COM, deployed by Andrei Ohrimenko via Ansible</h1>
</body>
</html>




RUNNING HANDLER [test_role1_nginx : handler_restart_nginx] ************************************************************************************************************************************************
Saturday 03 July 2021  13:55:17 +0300 (0:00:00.180)       0:00:30.129 ********* 
changed: [work_host1]
changed: [work_host2]

PLAY RECAP ************************************************************************************************************************************************************************************************
work_host1                 : ok=21   changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
work_host2                 : ok=16   changed=3    unreachable=0    failed=0    skipped=7    rescued=0    ignored=0   

Saturday 03 July 2021  13:55:18 +0300 (0:00:01.064)       0:00:31.194 ********* 
=============================================================================== 
test_role1_nginx : Check content to the sites ------------------------------------------------------------------------------------------------------------------------------------------------------ 3.30s
test_role1_nginx : Template for nginx  configs ----------------------------------------------------------------------------------------------------------------------------------------------------- 2.63s
test_role1_nginx : nginx.Install ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 2.43s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 2.29s
test_role1_nginx : Copy initial\home webpage for site2 --------------------------------------------------------------------------------------------------------------------------------------------- 1.86s
test_role1_nginx : Creates directories for site1 and site2 ----------------------------------------------------------------------------------------------------------------------------------------- 1.80s
test_role1_nginx : Creates directories in Centos --------------------------------------------------------------------------------------------------------------------------------------------------- 1.63s
test_role1_nginx : Copy initial\home webpage for site2 --------------------------------------------------------------------------------------------------------------------------------------------- 1.60s
test_role1_nginx : Templates ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.44s
test_role1_nginx : nginx.Enable\Start -------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.38s
test_role1_nginx : http.Open port ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.32s
test_role1_nginx : nginx.Install ------------------------------------------------------------------------------------------------------------------------------------------------------------------- 1.30s
test_role1_nginx : Copy nginx CFG ------------------------------------------------------------------------------------------------------------------------------------------------------------------ 1.20s
test_role1_nginx : handler_restart_nginx ----------------------------------------------------------------------------------------------------------------------------------------------------------- 1.07s
test_role1_nginx : reload service firewalld -------------------------------------------------------------------------------------------------------------------------------------------------------- 1.01s
test_role1_nginx : Check templates ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.95s
test_role1_nginx : Check connection to Localhost --------------------------------------------------------------------------------------------------------------------------------------------------- 0.94s
test_role1_nginx : Make Link site2 ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.83s
test_role1_nginx : Make Link site1 ----------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.82s
test_role1_nginx : nginx.Enable\Start -------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.80s
Playbook run took 0 days, 0 hours, 0 minutes, 31 seconds
➜  ansible 


```

## Task2. Deploy testing role

```bash
➜  ansible ansible-playbook -i inv.yaml check.yaml 

PLAY [work_host2] *****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
Friday 02 July 2021  10:17:28 +0300 (0:00:00.040)       0:00:00.040 *********** 
ok: [work_host2]

TASK [test_role2_check : Check for Ubuntu and sudo permissions] *******************************************************************************************************************************************
Friday 02 July 2021  10:17:31 +0300 (0:00:03.135)       0:00:03.176 *********** 
changed: [work_host2] => (item=avatar)
changed: [work_host2] => (item=jajabinks)
changed: [work_host2] => (item=test_user)
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo

TASK [test_role2_check : Print output] ********************************************************************************************************************************************************************
Friday 02 July 2021  10:17:34 +0300 (0:00:03.379)       0:00:06.555 *********** 
ok: [work_host2] => (item=['    (ALL) NOPASSWD: ALL', '    (ALL) NOPASSWD: /usr/bin/apt']) => {}

MSG:

sudo -l -U avatar | grep NOPASSWD
     (ALL) NOPASSWD: ALL
    (ALL) NOPASSWD: /usr/bin/apt 


ok: [work_host2] => (item=['    (ALL) NOPASSWD: /usr/bin/apt']) => {}

MSG:

sudo -l -U jajabinks | grep NOPASSWD
     (ALL) NOPASSWD: /usr/bin/apt 


ok: [work_host2] => (item=['    (ALL) NOPASSWD: /bin/mkdir, /bin/rmdir']) => {}

MSG:

sudo -l -U test_user | grep NOPASSWD
     (ALL) NOPASSWD: /bin/mkdir, /bin/rmdir 



TASK [test_role2_check : Not Ubuntu] **********************************************************************************************************************************************************************
Friday 02 July 2021  10:17:34 +0300 (0:00:00.174)       0:00:06.729 *********** 
skipping: [work_host2]

TASK [test_role2_check : Test URLs] ***********************************************************************************************************************************************************************
Friday 02 July 2021  10:17:35 +0300 (0:00:00.137)       0:00:06.867 *********** 
ok: [work_host2] => (item=http://by.archive.ubuntu.com/ubuntu/)
ok: [work_host2] => (item=http://ftp.byfly.by/pub/CentOS/8.4.2105/isos/x86_64/)
ok: [work_host2] => (item=https://pypi.org/simple)
ok: [work_host2] => (item=https://hub.docker.com/_/registry)

TASK [test_role2_check : Print output] ********************************************************************************************************************************************************************
Friday 02 July 2021  10:17:47 +0300 (0:00:12.206)       0:00:19.073 *********** 
ok: [work_host2] => (item=200) => {}

MSG:

Status: 200
ok: [work_host2] => (item=200) => {}

MSG:

Status: 200
ok: [work_host2] => (item=200) => {}

MSG:

Status: 200
ok: [work_host2] => (item=200) => {}

MSG:

Status: 200

TASK [test_role2_check : Check free space] ****************************************************************************************************************************************************************
Friday 02 July 2021  10:17:53 +0300 (0:00:06.779)       0:00:25.853 *********** 
ok: [work_host2] => {}

MSG:

We need more space. Clear it!

TASK [test_role2_check : Check free memory] ***************************************************************************************************************************************************************
Friday 02 July 2021  10:17:54 +0300 (0:00:00.155)       0:00:26.008 *********** 
ok: [work_host2] => {}

MSG:

Memory enough more then 1GB

PLAY RECAP ************************************************************************************************************************************************************************************************
work_host2                 : ok=7    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   

Friday 02 July 2021  10:17:54 +0300 (0:00:00.103)       0:00:26.111 *********** 
=============================================================================== 
test_role2_check : Test URLs ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 12.21s
test_role2_check : Print output -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 6.78s
test_role2_check : Check for Ubuntu and sudo permissions ------------------------------------------------------------------------------------------------------------------------------------------- 3.38s
Gathering Facts ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 3.14s
test_role2_check : Print output -------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.17s
test_role2_check : Check free space ---------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.15s
test_role2_check : Not Ubuntu ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.14s
test_role2_check : Check free memory --------------------------------------------------------------------------------------------------------------------------------------------------------------- 0.10s
Playbook run took 0 days, 0 hours, 0 minutes, 26 seconds
➜  ansible 


```

## Task3. Check with molecule(molecule work!, but users not created)

```bash

➜  ansible cd roles/test_role2_check 
➜  test_role2_check molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] ********************************************************************************************************************************************************************************************

TASK [Destroy molecule instance(s)] ***********************************************************************************************************************************************************************
changed: [localhost] => (item=instance_cen)
changed: [localhost] => (item=instance_deb)

TASK [Wait for instance(s) deletion to complete] **********************************************************************************************************************************************************
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '657982461078.27925', 'results_file': '/home/andrei/.ansible_async/657982461078.27925', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '806853260894.27951', 'results_file': '/home/andrei/.ansible_async/806853260894.27951', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] ***************************************************************************************************************************************************************************

PLAY RECAP ************************************************************************************************************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/andrei/ansible/roles/test_role2_check/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] *********************************************************************************************************************************************************************************************

TASK [Log into a Docker registry] *************************************************************************************************************************************************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}) 

TASK [Check presence of custom Dockerfiles] ***************************************************************************************************************************************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] ****************************************************************************************************************************************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}) 

TASK [Discover local Docker images] ***********************************************************************************************************************************************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] ************************************************************************************************************************************************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:7) 
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/debian:latest) 

TASK [Create docker network(s)] ***************************************************************************************************************************************************************************

TASK [Determine the CMD directives] ***********************************************************************************************************************************************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True})

TASK [Create molecule instance(s)] ************************************************************************************************************************************************************************
changed: [localhost] => (item=instance_cen)
changed: [localhost] => (item=instance_deb)

TASK [Wait for instance(s) creation to complete] **********************************************************************************************************************************************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '484436756436.28198', 'results_file': '/home/andrei/.ansible_async/484436756436.28198', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '579531083724.28223', 'results_file': '/home/andrei/.ansible_async/579531083724.28223', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP ************************************************************************************************************************************************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] *******************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
ok: [instance_deb]
ok: [instance_cen]

TASK [Include test_role2_check] ***************************************************************************************************************************************************************************

TASK [test_role2_check : Check for Ubuntu and sudo permissions] *******************************************************************************************************************************************
skipping: [instance_cen] => (item=avatar) 
skipping: [instance_cen] => (item=jajabinks) 
skipping: [instance_cen] => (item=test_user) 
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
failed: [instance_deb] (item=avatar) => {"ansible_loop_var": "item", "changed": true, "cmd": "sudo -l -U avatar | grep NOPASSWD\n", "delta": "0:00:00.009610", "end": "2021-07-02 07:24:35.023799", "item": "avatar", "msg": "non-zero return code", "rc": 1, "start": "2021-07-02 07:24:35.014189", "stderr": "sudo: unknown user: avatar", "stderr_lines": ["sudo: unknown user: avatar"], "stdout": "", "stdout_lines": []}
failed: [instance_deb] (item=jajabinks) => {"ansible_loop_var": "item", "changed": true, "cmd": "sudo -l -U jajabinks | grep NOPASSWD\n", "delta": "0:00:00.005770", "end": "2021-07-02 07:24:36.290955", "item": "jajabinks", "msg": "non-zero return code", "rc": 1, "start": "2021-07-02 07:24:36.285185", "stderr": "sudo: unknown user: jajabinks", "stderr_lines": ["sudo: unknown user: jajabinks"], "stdout": "", "stdout_lines": []}
failed: [instance_deb] (item=test_user) => {"ansible_loop_var": "item", "changed": true, "cmd": "sudo -l -U test_user | grep NOPASSWD\n", "delta": "0:00:00.007392", "end": "2021-07-02 07:24:37.575914", "item": "test_user", "msg": "non-zero return code", "rc": 1, "start": "2021-07-02 07:24:37.568522", "stderr": "sudo: unknown user: test_user", "stderr_lines": ["sudo: unknown user: test_user"], "stdout": "", "stdout_lines": []}

TASK [test_role2_check : Print output] ********************************************************************************************************************************************************************
fatal: [instance_cen]: FAILED! => {"msg": "The task includes an option with an undefined variable. The error was: 'dict object' has no attribute 'stdout_lines'\n\nThe error appears to be in '/home/andrei/ansible/roles/test_role2_check/tasks/main.yaml': line 9, column 3, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n\n- name: Print output\n  ^ here\n"}

PLAY RECAP ************************************************************************************************************************************************************************************************
instance_cen               : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0
instance_deb               : ok=1    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0


CRITICAL Ansible return code was 2, command was: ansible-playbook --inventory /home/andrei/.cache/molecule/test_role2_check/default/inventory --skip-tags molecule-notest,notest /home/andrei/ansible/roles/test_role2_check/molecule/default/converge.yml
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] ********************************************************************************************************************************************************************************************

TASK [Destroy molecule instance(s)] ***********************************************************************************************************************************************************************
changed: [localhost] => (item=instance_cen)
changed: [localhost] => (item=instance_deb)

TASK [Wait for instance(s) deletion to complete] **********************************************************************************************************************************************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '574602300317.29650', 'results_file': '/home/andrei/.ansible_async/574602300317.29650', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_cen', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '77455872908.29675', 'results_file': '/home/andrei/.ansible_async/77455872908.29675', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'instance_deb', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] ***************************************************************************************************************************************************************************

PLAY RECAP ************************************************************************************************************************************************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
➜  test_role2_check 


```
