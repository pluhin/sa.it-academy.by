# Testing
## **Molecule test**
### molecule.yml
```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance-centos
    image: quay.io/centos/centos:stream8
    pre_build_image: true
  - name: instance-debian
    image: debian:11
    pre_build_image: true    
provisioner:
  name: ansible
verifier:
  name: ansible

```
### Log
```bash
 molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/home/anton/.cache/ansible-compat/1a1637/modules:/home/anton/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/anton/.cache/ansible-compat/1a1637/collections:/home/anton/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/home/anton/.cache/ansible-compat/1a1637/roles:/home/anton/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
INFO     Lint is disabled.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance-centos)
changed: [localhost] => (item=instance-debian)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=instance-centos)
ok: [localhost] => (item=instance-debian)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /d/Projects/17.Testing/roles/webserver/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance-centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'debian:11', 'name': 'instance-debian', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance-centos', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'debian:11', 'name': 'instance-debian', 'pre_build_image': True}) 

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance-centos', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'debian:11', 'name': 'instance-debian', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:stream8) 
skipping: [localhost] => (item=molecule_local/debian:11)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance-centos', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'debian:11', 'name': 'instance-debian', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance-centos)
changed: [localhost] => (item=instance-debian)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '991368150621.13269', 'results_file': '/home/anton/.ansible_async/991368150621.13269', 'changed': True, 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance-centos', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '230826104222.13295', 'results_file': '/home/anton/.ansible_async/230826104222.13295', 'changed': True, 'item': {'image': 'debian:11', 'name': 'instance-debian', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
fatal: [instance-debian]: FAILED! => {"ansible_facts": {}, "changed": false, "failed_modules": {"ansible.legacy.setup": {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python"}, "failed": true, "module_stderr": "/bin/sh: 1: /usr/bin/python: not found\n", "module_stdout": "", "msg": "The module failed to execute correctly, you probably need to set the interpreter.\nSee stdout/stderr for the exact error", "rc": 127}}, "msg": "The following modules failed to execute: ansible.legacy.setup\n"}
ok: [instance-centos]

TASK [Include webserver] *******************************************************

TASK [webserver : Include deploy for Debian systems] ***************************
skipping: [instance-centos]

TASK [webserver : Include deploy for RedHat systems] ***************************
included: /d/Projects/17.Testing/roles/webserver/tasks/http_rh.yaml for instance-centos

TASK [webserver : NGINX. Install packages] *************************************
changed: [instance-centos]

TASK [webserver : NGINX. Create defaults folders] ******************************
changed: [instance-centos] => (item=/etc/nginx/sites-available/)
changed: [instance-centos] => (item=/etc/nginx/sites-enabled/)
changed: [instance-centos] => (item=/var/www)

TASK [webserver : NGINX. Add directory path in nginx.conf] *********************
changed: [instance-centos]

TASK [webserver : NGINX. Enable and start service] *****************************
fatal: [instance-centos]: FAILED! => {"changed": false, "msg": "Service is in unknown state", "status": {}}

PLAY RECAP *********************************************************************
instance-centos            : ok=5    changed=3    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0
instance-debian            : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

WARNING  Retrying execution failure 2 of: ansible-playbook --inventory /home/anton/.cache/molecule/webserver/default/inventory --skip-tags molecule-notest,notest /d/Projects/17.Testing/roles/webserver/molecule/default/converge.yml
CRITICAL Ansible return code was 2, command was: ['ansible-playbook', '--inventory', '/home/anton/.cache/molecule/webserver/default/inventory', '--skip-tags', 'molecule-notest,notest', '/d/Projects/17.Testing/roles/webserver/molecule/default/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance-centos)
changed: [localhost] => (item=instance-debian)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=instance-centos)
changed: [localhost] => (item=instance-debian)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```



## **GitHub Actions workflow**
>Repo link: [https://github.com/Tony-BY/17-testing.git](https://github.com/Tony-BY/17-testing.git)

[manifest-validation.yaml](manifest-validation.yaml)
```yaml
name: k8s manifests validation

on: push

jobs:
  list-manifests:
    runs-on: ubuntu-latest
    outputs:
       matrix: ${{ steps.set-matrix.outputs.matrix }}
    steps:
      - name: Checkout
        uses: actions/checkout@v2.4.2
      - id: set-matrix
        run: echo "::set-output name=matrix::$(ls manifests/*.yaml | jq -R -s -c 'split("\n")[:-1]')" 
  kubeval:
     needs: list-manifests
     runs-on: ubuntu-latest
     strategy:
         matrix:
             manifest: ${{ fromJson(needs.list-manifests.outputs.matrix) }}
     steps:
       - uses: actions/checkout@v2.4.2     
       - name: Validate manifests by kubeval 
         uses: instrumenta/kubeval-action@master
         with:
           files: ${{ matrix.manifest }}
  slackNotification:
      needs: kubeval
      runs-on: ubuntu-latest
      steps:
      - name: Slack Notify
        uses: rtCamp/action-slack-notify@v2.2.0
        env:
          SLACK_CHANNEL: notifications
          SLACK_COLOR: ${{ job.status }} # or a specific color like 'good' or '#ff00ff'
          SLACK_ICON: https://github.com/rtCamp.png?size=48
          SLACK_MESSAGE: '${{ job.status }} :rocket:'
          SLACK_TITLE: Manifests validation (kubeval)
          SLACK_USERNAME: rtCamp
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}  
```

### Screenshots
#### GitHub Actions
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mIQ1SMqP_KvEx2qfhWFF_GtrR74SbHUpV03EiUUYlRi70mcx0ElJ10D5tTzMBK3s0Z9xDvG-xY5NNcQsOHAXUZFFlOXX7ycbcfvj8WemZtHvYMqAvYNmdbz69WmuqIGFn8w2gJQCUMtTr3aIuAAg71XJIhOGZpAzLLdQWZzk3eoEd8eKefj2gtG7geqcReCDV?width=2043&height=1420&cropmode=none" width="auto" height="auto" />
</dv>

#### Slack
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mRAXRJzP5kaKIttW-XLGMkmX8jVhOt3R56o_ej65DcLqGPxfGlrMxTtUryeMX9KfoKk7l98tVlWy4qAM461gILrfeT0w95Ki_swI-L_iRH3QOcAPiGYY5zKboSn3sZDtB_1bgvX0hhgi30MB6l8tWEZQf2sInKIkCAxUzpRkloZ6PmbBNrARzFLctPcfScQd2?width=2283&height=1467&cropmode=none" width="auto" height="auto" />
</dv>
