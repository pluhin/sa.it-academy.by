## Molecule test

```bash

molecule test

[DEPRECATION WARNING]: [defaults]callback_whitelist option, normalizing names
to new standard, use callbacks_enabled instead. This feature will be removed
from ansible-core in version 2.15. Deprecation warnings can be disabled by
setting deprecation_warnings=False in ansible.cfg.
/usr/lib/python3/dist-packages/requests/__init__.py:89: RequestsDependencyWarning: urllib3 (1.26.12) or chardet (3.0.4) doesn't match a supported version!
  warnings.warn("urllib3 ({}) or chardet ({}) doesn't match a supported "
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/4b5e57/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/4b5e57/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/4b5e57/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
INFO     Running ansible-galaxy collection install -v --pre community.docker:>=3.0.0-a2
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
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=instance1)
ok: [localhost] => (item=instance2)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/17.Testing/roles/web/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance1', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance2', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance1', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance2', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'ubuntu:20.04', 'name': 'instance1', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance2', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/ubuntu:20.04)
skipping: [localhost] => (item=molecule_local/quay.io/centos/centos:stream8)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'ubuntu:20.04', 'name': 'instance1', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'quay.io/centos/centos:stream8', 'name': 'instance2', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (299 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (298 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (297 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '261930249395.4703', 'results_file': '/root/.ansible_async/261930249395.4703', 'changed': True, 'item': {'image': 'ubuntu:20.04', 'name': 'instance1', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (299 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (298 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (297 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (296 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (295 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (294 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (293 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (292 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '859871208587.4731', 'results_file': '/root/.ansible_async/859871208587.4731', 'changed': True, 'item': {'image': 'quay.io/centos/centos:stream8', 'name': 'instance2', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
fatal: [instance1]: FAILED! => {}
ok: [instance2]

TASK [Include web] *************************************************************
[DEPRECATION WARNING]: "include" is deprecated, use include_tasks/import_tasks
instead. This feature will be removed in version 2.16. Deprecation warnings can
 be disabled by setting deprecation_warnings=False in ansible.cfg.
[WARNING]: While constructing a mapping from
/home/17.Testing/roles/web/tasks/centos.yaml, line 5, column 5, found a
duplicate dict key (name). Using last defined value only.
[WARNING]: While constructing a mapping from
/home/17.Testing/roles/web/tasks/centos.yaml, line 5, column 5, found a
duplicate dict key (state). Using last defined value only.

TASK [web : Install Nginx on Debian] *******************************************
skipping: [instance2]

TASK [web : Enable and start Nginx] ********************************************
skipping: [instance2]

TASK [web : Install Nginx on Centos] *******************************************
WARNING  Retrying execution failure 1 of: ansible-playbook --inventory /root/.cache/molecule/web/default/inventory --skip-tags molecule-notest,notest /home/17.Testing/roles/web/molecule/default/converge.yml
CRITICAL Ansible return code was 1, command was: ['ansible-playbook', '--inventory', '/root/.cache/molecule/web/default/inventory', '--skip-tags', 'molecule-notest,notest', '/home/17.Testing/roles/web/molecule/default/converge.yml']
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory

```



## Molecule YAML

```bash

---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance1
    image: ubuntu:20.04
    pre_build_image: true
  - name: instance2
    image: quay.io/centos/centos:stream8
    pre_build_image: true

provisioner:
  name: ansible
verifier:
  name: ansible

```

## Kubeval and notification

```bash

name: k8s manifests

on: [pull_request]

jobs:
  find-k8s-files:
    runs-on: ubuntu-latest
    outputs:
      files: ${{ env.files }}
    steps:
      - name: Get k8s files
        uses: actions/checkout@v2
        id: files
      - run: |
              FILES="$(ls -d ./k8s/* | jq -R -s -c 'split("\n")[:-1]')"
              echo "files=`echo -n $FILES`" >> $GITHUB_ENV
  test-files:
    needs: find-k8s-files
    runs-on: ubuntu-latest
    strategy:
      matrix:
        k8s-files: ${{fromJson(needs.find-k8s-files.outputs.files)}}
      fail-fast: false
    steps:
    - uses: actions/checkout@v2 
    - name: Test files with kubeval
      uses: instrumenta/kubeval-action@master
      with: 
       files: ${{matrix.k8s-files}}
  notification:
    needs: test-files
    runs-on: ubuntu-latest
    steps:
    - name: Slack Notification
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: test-nichiporov
        SLACK_COLOR: ${{ job.status }} # or a specific color like 'good' or '#ff00ff'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: 'Good:rocket:'
        SLACK_TITLE: Kubeval checks
        SLACK_USERNAME: testing-nichiporov
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

```


![image](https://user-images.githubusercontent.com/110092772/190630944-878b3482-a5bc-4ff7-b662-f0a73a4b244c.png)



![image](https://user-images.githubusercontent.com/110092772/190631619-009a206d-6173-4018-aa87-f4a2b1a32a1d.png)






