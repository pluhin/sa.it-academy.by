## Ansible cruise

### Ansible outputs
#### Nginx role
```bash
e$ ansible-playbook -i inv.yaml nginx.yaml

PLAY [work_hosts] ***********************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
[DEPRECATION WARNING]: Distribution Ubuntu 18.04 on host work_02 should use /usr/bin/python3, but is using
/usr/bin/python for backward compatibility with prior Ansible releases. A future Ansible release will default to
 using the discovered platform python for this host. See
https://docs.ansible.com/ansible/2.9/reference_appendices/interpreter_discovery.html for more information. This
feature will be removed in version 2.12. Deprecation warnings can be disabled by setting
deprecation_warnings=False in ansible.cfg.
ok: [work_02]
ok: [work_01]

TASK [nginx : DEB - Install nginx] ******************************************************************************
skipping: [work_01]
changed: [work_02]

TASK [nginx : DEB - start and enabled nginx] ********************************************************************
skipping: [work_01]
changed: [work_02]

TASK [nginx : RH - Installing epel-repository(required for nginx)] **********************************************
skipping: [work_02]
changed: [work_01]

TASK [nginx : RH - Installing nginx] ****************************************************************************
skipping: [work_02]
changed: [work_01]

TASK [nginx : RH - Start and enabled nginx] *********************************************************************
skipping: [work_02]
changed: [work_01]

TASK [nginx : RH - Enabled firewall port] ***********************************************************************
skipping: [work_02]
ok: [work_01]

TASK [nginx : RH - reload service firewalld] ********************************************************************
skipping: [work_02]
changed: [work_01]

TASK [nginx : Copying configuration template] *******************************************************************
skipping: [work_01] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
skipping: [work_01] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
changed: [work_02] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
changed: [work_01] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
changed: [work_02] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
skipping: [work_02] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
skipping: [work_02] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})
changed: [work_01] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})

TASK [nginx : Createing directory] ******************************************************************************
skipping: [work_01] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
skipping: [work_01] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
changed: [work_02] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
changed: [work_01] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
changed: [work_02] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
skipping: [work_02] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
skipping: [work_02] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})
changed: [work_01] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})

TASK [nginx : Copying first page.] ******************************************************************************
skipping: [work_01] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
skipping: [work_01] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
changed: [work_02] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
changed: [work_01] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
changed: [work_02] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
skipping: [work_02] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
skipping: [work_02] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})
changed: [work_01] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})

TASK [nginx : Restarting nginx] *********************************************************************************
changed: [work_02]
changed: [work_01]

TASK [nginx : Copying hosts template] ***************************************************************************
changed: [work_02]
changed: [work_01]

TASK [nginx : Check content to the sites] ***********************************************************************
ok: [work_02] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
ok: [work_01] => (item={'name': 'site1.deb.local', 'ip': '192.168.202.2'})
ok: [work_02] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
ok: [work_01] => (item={'name': 'site2.deb.local', 'ip': '192.168.202.2'})
ok: [work_02] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
ok: [work_01] => (item={'name': 'site1.rh.local', 'ip': '192.168.202.1'})
ok: [work_02] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})
ok: [work_01] => (item={'name': 'site2.rh.local', 'ip': '192.168.202.1'})

TASK [nginx : Print out] ****************************************************************************************
ok: [work_01] => (item=0) => {
    "msg": [
        "<h1>Hi! This site1.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n",
        "<h1>Hi! This site1.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n"
    ]
}
ok: [work_01] => (item=1) => {
    "msg": [
        "<h1>Hi! This site2.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n",
        "<h1>Hi! This site2.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n"
    ]
}
ok: [work_02] => (item=0) => {
    "msg": [
        "<h1>Hi! This site1.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n",
        "<h1>Hi! This site1.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n"
    ]
}
ok: [work_02] => (item=1) => {
    "msg": [
        "<h1>Hi! This site2.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n",
        "<h1>Hi! This site2.deb.local</h1>\n<p>In hosts 192.168.202.2</p>\n"
    ]
}

PLAY RECAP ******************************************************************************************************
work_01                    : ok=13   changed=9    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
work_02                    : ok=10   changed=7    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
```

### Test molecule
```bash
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

PLAY [Destroy] **************************************************************************************************

TASK [Destroy molecule instance(s)] *****************************************************************************
changed: [localhost] => (item=instance_centos)
changed: [localhost] => (item=instance_ubuntu)
changed: [localhost] => (item=instance_alpine)

TASK [Wait for instance(s) deletion to complete] ****************************************************************
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '696749323897.24240', 'results_file': '/home/owl/.ansible_async/696749323897.24240', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '119337546808.24265', 'results_file': '/home/owl/.ansible_async/119337546808.24265', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '738926710747.24303', 'results_file': '/home/owl/.ansible_async/738926710747.24303', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] *********************************************************************************

PLAY RECAP ******************************************************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/owl/git/my/sa.it-academy.by/Raman_Artyomov/07_ansible_cruise/ansible/roles/tests/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ***************************************************************************************************

TASK [Log into a Docker registry] *******************************************************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True})

TASK [Check presence of custom Dockerfiles] *********************************************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] **********************************************************************
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True})

TASK [Discover local Docker images] *****************************************************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 2, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] ******************************************************************
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/centos:7)
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/ubuntu:latest)
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/alpine)

TASK [Create docker network(s)] *********************************************************************************

TASK [Determine the CMD directives] *****************************************************************************
ok: [localhost] => (item={'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True})

TASK [Create molecule instance(s)] ******************************************************************************
changed: [localhost] => (item=instance_centos)
changed: [localhost] => (item=instance_ubuntu)
changed: [localhost] => (item=instance_alpine)

TASK [Wait for instance(s) creation to complete] ****************************************************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '731823517219.24632', 'results_file': '/home/owl/.ansible_async/731823517219.24632', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '689350276436.24657', 'results_file': '/home/owl/.ansible_async/689350276436.24657', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '219957580821.24697', 'results_file': '/home/owl/.ansible_async/219957580821.24697', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP ******************************************************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] *************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************
ok: [instance_alpine]
ok: [instance_ubuntu]
ok: [instance_centos]

TASK [Include tests] ********************************************************************************************

TASK [tests : Checking we have sudo with nopass] ****************************************************************
ok: [instance_ubuntu]
ok: [instance_centos]
ok: [instance_alpine]

TASK [tests : Checking repository URL's] ***********************************************************************
ok: [instance_centos] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_ubuntu] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_alpine] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_centos] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_ubuntu] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_alpine] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_ubuntu] => (item=https://pypi.org/simple)
ok: [instance_ubuntu] => (item=https://hub.docker.com/_/registry)
ok: [instance_centos] => (item=https://pypi.org/simple)
ok: [instance_alpine] => (item=https://pypi.org/simple)
ok: [instance_centos] => (item=https://hub.docker.com/_/registry)
ok: [instance_alpine] => (item=https://hub.docker.com/_/registry)

TASK [tests : Output cheked repository] ************************************************************************
ok: [instance_alpine] => {
    "msg": "All items completed"
}
ok: [instance_ubuntu] => {
    "msg": "All items completed"
}
ok: [instance_centos] => {
    "msg": "All items completed"
}

TASK [tests : Check free RAM space (1GB)] **********************************************************************
ok: [instance_alpine] => {
    "changed": false,
    "msg": "Good. Yoy have 1.9990234375 Gb RAM free. It will serve"
}
ok: [instance_centos] => {
    "changed": false,
    "msg": "Good. Yoy have 2.0068359375 Gb RAM free. It will serve"
}
ok: [instance_ubuntu] => {
    "changed": false,
    "msg": "Good. Yoy have 2.005859375 Gb RAM free. It will serve"
}

TASK [tests : Check free HDD space (10GB)] *********************************************************************
ok: [instance_alpine] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85116958618164 Mb HDD free. It will serve"
}
ok: [instance_centos] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85173416137695 Mb HDD free. It will serve"
}
ok: [instance_ubuntu] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85131072998047 Mb HDD free. It will serve"
}

PLAY RECAP *****************************************************************************************************
instance_alpine            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_centos            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_ubuntu            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0

INFO     Running default > idempotence

PLAY [Converge] ************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [instance_ubuntu]
ok: [instance_alpine]
ok: [instance_centos]

TASK [Include tests] *******************************************************************************************

TASK [tests : Checking we have sudo with nopass] ***************************************************************
ok: [instance_centos]
ok: [instance_ubuntu]
ok: [instance_alpine]

TASK [tests : Checking repository URL's] ***********************************************************************
ok: [instance_centos] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_alpine] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_ubuntu] => (item=http://ftp.byfly.by/pub/CentOS/)
ok: [instance_centos] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_ubuntu] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_alpine] => (item=http://archive.ubuntu.com/ubuntu/)
ok: [instance_centos] => (item=https://pypi.org/simple)
ok: [instance_centos] => (item=https://hub.docker.com/_/registry)
ok: [instance_alpine] => (item=https://pypi.org/simple)
ok: [instance_alpine] => (item=https://hub.docker.com/_/registry)

ok: [instance_ubuntu] => (item=https://pypi.org/simple)
ok: [instance_ubuntu] => (item=https://hub.docker.com/_/registry)

TASK [tests : Output cheked repository] ************************************************************************
ok: [instance_alpine] => {
    "msg": "All items completed"
}
ok: [instance_ubuntu] => {
    "msg": "All items completed"
}
ok: [instance_centos] => {
    "msg": "All items completed"
}

TASK [tests : Check free RAM space (1GB)] **********************************************************************
ok: [instance_alpine] => {
    "changed": false,
    "msg": "Good. Yoy have 2.0205078125 Gb RAM free. It will serve"
}
ok: [instance_ubuntu] => {
    "changed": false,
    "msg": "Good. Yoy have 2.0224609375 Gb RAM free. It will serve"
}
ok: [instance_centos] => {
    "changed": false,
    "msg": "Good. Yoy have 2.021484375 Gb RAM free. It will serve"
}

TASK [tests : Check free HDD space (10GB)] *********************************************************************
ok: [instance_alpine] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85186767578125 Mb HDD free. It will serve"
}
ok: [instance_ubuntu] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85186767578125 Mb HDD free. It will serve"
}
ok: [instance_centos] => {
    "changed": false,
    "msg": "Good. Yoy have 43.85221862792969 Mb HDD free. It will serve"
}

PLAY RECAP *****************************************************************************************************
instance_alpine            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_centos            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_ubuntu            : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] **************************************************************************************************

TASK [Example assertion] ***************************************************************************************
ok: [instance_ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [instance_alpine] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [instance_centos] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *****************************************************************************************************
instance_alpine            : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_centos            : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0
instance_ubuntu            : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored
0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *************************************************************************************************

TASK [Destroy molecule instance(s)] ****************************************************************************
changed: [localhost] => (item=instance_centos)
changed: [localhost] => (item=instance_ubuntu)
changed: [localhost] => (item=instance_alpine)

TASK [Wait for instance(s) deletion to complete] ***************************************************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '582116191066.33009', 'results_fil
': '/home/owl/.ansible_async/582116191066.33009', 'changed': True, 'failed': False, 'item': {'image': 'docker.io
pycontribs/centos:7', 'name': 'instance_centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '907977261097.33034', 'results_fil
': '/home/owl/.ansible_async/907977261097.33034', 'changed': True, 'failed': False, 'item': {'image': 'docker.io
pycontribs/ubuntu:latest', 'name': 'instance_ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '38280439534.33073', 'results_file
: '/home/owl/.ansible_async/38280439534.33073', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/p
contribs/alpine', 'name': 'instance_alpine', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

TASK [Delete docker network(s)] ********************************************************************************

PLAY RECAP *****************************************************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored
0

INFO     Pruning extra files from scenario ephemeral directory
```

