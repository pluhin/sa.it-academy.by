migel@migel:~/.ansible$  ansible-playbook playnginx.yaml -i inventory.yaml -u root

PLAY [all_workers] ****************************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************************
ok: [centos]
ok: [ubuntu]

TASK [Install nginx] **************************************************************************************************************************************************************************************
ok: [ubuntu]
changed: [centos]

PLAY RECAP ************************************************************************************************************************************************************************************************
centos                     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   


migel@migel:~/.ansible$  ansible -i inventory.yaml -m copy -a "src=/etc/nginx/nginx.conf dest=/etc/nginx/nginx.conf" all_workers
ubuntu | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "checksum": "1cb682ad7b8d36da0f4808f2f0473946c5ad8943",
    "dest": "/etc/nginx/nginx.conf",
    "gid": 0,
    "group": "root",
    "mode": "0644",
    "owner": "root",
    "path": "/etc/nginx/nginx.conf",
    "size": 1490,
    "state": "file",
    "uid": 0
}
centos | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/libexec/platform-python"
    },
    "changed": true,
    "checksum": "1cb682ad7b8d36da0f4808f2f0473946c5ad8943",
    "dest": "/etc/nginx/nginx.conf",
    "gid": 0,
    "group": "root",
    "md5sum": "d419ab8777e5d98481e17896e260dfe6",
    "mode": "0644",
    "owner": "root",
    "size": 1490,
    "src": "/root/.ansible/tmp/ansible-tmp-1660232579.7430274-178907896909121/source",
    "state": "file",
    "uid": 0
}
