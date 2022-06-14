## 17. Testing

### Molecule test

```bash
➜  role molecule test
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/home/demo/.cache/ansible-compat/4b168d/modules:/home/demo/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/demo/.cache/ansible-compat/4b168d/collections:/home/demo/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/home/demo/.cache/ansible-compat/4b168d/roles:/home/demo/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
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
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=instance1)
ok: [localhost] => (item=instance2)

TASK [Delete docker networks(s)] ***********************************************

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax

playbook: /home/demo/Desktop/tests/ansible/role/molecule/default/converge.yml
INFO     Running default > create

PLAY [Create] ******************************************************************

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None)
skipping: [localhost] => (item=None)
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'centos:7', 'name': 'instance1', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'bitnami/python:3.10-debian-11', 'name': 'instance2', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'centos:7', 'name': 'instance1', 'pre_build_image': True})
skipping: [localhost] => (item={'image': 'bitnami/python:3.10-debian-11', 'name': 'instance2', 'pre_build_image': True})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'centos:7', 'name': 'instance1', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'item': {'image': 'bitnami/python:3.10-debian-11', 'name': 'instance2', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/centos:7)
skipping: [localhost] => (item=molecule_local/bitnami/python:3.10-debian-11)

TASK [Create docker network(s)] ************************************************

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'centos:7', 'name': 'instance1', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'bitnami/python:3.10-debian-11', 'name': 'instance2', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=instance1)
changed: [localhost] => (item=instance2)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (299 retries left).
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (298 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '455474022249.91758', 'results_file': '/home/demo/.ansible_async/455474022249.91758', 'changed': True, 'item': {'image': 'centos:7', 'name': 'instance1', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': '48562909729.91786', 'results_file': '/home/demo/.ansible_async/48562909729.91786', 'changed': True, 'item': {'image': 'bitnami/python:3.10-debian-11', 'name': 'instance2', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0    skipped=4    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [instance2]
ok: [instance1]

TASK [Include role] ************************************************************

TASK [role : Print OS/Version] *************************************************
ok: [instance1] => {
    "msg": [
        "OS: CentOS",
        "Version: 7.9"
    ]
}
ok: [instance2] => {
    "msg": [
        "OS: Debian",
        "Version: 11"
    ]
}

TASK [role : Print Mount point/capacity/used] **********************************
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/hosts', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/hostname', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/resolv.conf', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1]
skipping: [instance2] => (item={'mount': '/etc/resolv.conf', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2] => (item={'mount': '/etc/hostname', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2] => (item={'mount': '/etc/hosts', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2]

TASK [role : Print RAM capacity/free] ******************************************
ok: [instance1] => {
    "msg": [
        "Total memory: 3889 MB",
        "Free memory: 525 MB"
    ]
}
ok: [instance2] => {
    "msg": [
        "Total memory: 3889 MB",
        "Free memory: 525 MB"
    ]
}

PLAY RECAP *********************************************************************
instance1                  : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
instance2                  : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > idempotence

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [instance2]
ok: [instance1]

TASK [Include role] ************************************************************

TASK [role : Print OS/Version] *************************************************
ok: [instance1] => {
    "msg": [
        "OS: CentOS",
        "Version: 7.9"
    ]
}
ok: [instance2] => {
    "msg": [
        "OS: Debian",
        "Version: 11"
    ]
}

TASK [role : Print Mount point/capacity/used] **********************************
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/hosts', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/hostname', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1] => (item={'block_used': 3525604, 'uuid': 'N/A', 'size_total': 20471988224, 'block_total': 4998044, 'mount': '/etc/resolv.conf', 'block_available': 1472440, 'size_available': 6031114240, 'fstype': 'ext4', 'inode_total': 1277952, 'options': 'rw,relatime,errors=remount-ro,bind', 'device': '/dev/sda5', 'inode_used': 333111, 'block_size': 4096, 'inode_available': 944841})
skipping: [instance1]
skipping: [instance2] => (item={'mount': '/etc/resolv.conf', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2] => (item={'mount': '/etc/hostname', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2] => (item={'mount': '/etc/hosts', 'device': '/dev/sda5', 'fstype': 'ext4', 'options': 'rw,relatime,errors=remount-ro,bind', 'size_total': 20471988224, 'size_available': 6030897152, 'block_size': 4096, 'block_total': 4998044, 'block_available': 1472387, 'block_used': 3525657, 'inode_total': 1277952, 'inode_available': 944840, 'inode_used': 333112, 'uuid': 'N/A'})
skipping: [instance2]

TASK [role : Print RAM capacity/free] ******************************************
ok: [instance1] => {
    "msg": [
        "Total memory: 3889 MB",
        "Free memory: 521 MB"
    ]
}
ok: [instance2] => {
    "msg": [
        "Total memory: 3889 MB",
        "Free memory: 521 MB"
    ]
}

PLAY RECAP *********************************************************************
instance1                  : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
instance2                  : ok=3    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [instance1] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [instance2] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
instance1                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
instance2                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
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

### Kubeval action

![Image 1](GitHUB_Action.png)


### Slack screenshot
![Image 2](SLAK.png)


### kubeval yaml

```bash
name: Test k8s manifests

on: [push, pull_request]

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
        SLACK_CHANNEL: monitoring-nefedin
        SLACK_COLOR: ${{ job.status }} # or a specific color like 'good' or '#ff00ff'
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: 'Post Content :rocket:'
        SLACK_TITLE: Kubeval checks
        SLACK_USERNAME: GitHub
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}

```
