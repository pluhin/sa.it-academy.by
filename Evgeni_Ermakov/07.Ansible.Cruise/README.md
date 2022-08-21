# 07 Ansible play

## Install Nginx server and setup two virtual hosts
```bash
evgeni@legion:~/IdeaProjects/sa.it-academy.by/Evgeni_Ermakov/07.Ansible.Cruise$ ansible-playbook -i inventory.yaml nginx.yaml --ask-vault-pass > text
Vault password: 
 ____________________
< PLAY [all_workers] >
 --------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
ok: [centos]
 _____________________________________________
< TASK [webserver : deploy for debian system] >
 ---------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [centos]
included: /home/evgeni/IdeaProjects/sa.it-academy.by/Evgeni_Ermakov/07.Ansible.Cruise/webserver/tasks/debian.yaml for ubuntu
 __________________________________
< TASK [webserver : install nginx] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
 _________________________________
< TASK [webserver : nginx enable] >
 ---------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
 __________________________________
< TASK [webserver : restart nginx] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [ubuntu]
 ____________________________________________
< TASK [webserver : creating home directory] >
 --------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.10'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.10'})
 ___________________________________________________
< TASK [webserver : copying configuration template] >
 ---------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.10'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.10'})
 ____________________________________
< TASK [webserver : copy index.html] >
 ------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.10'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.10'})
 __________________________________
< TASK [webserver : nginx restart] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [ubuntu]
 _____________________________________
< TASK [webserver : check index.html] >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu] => (item={'name': 'ubuntu1.test', 'ip': '192.168.202.10'})
ok: [ubuntu] => (item={'name': 'ubuntu2.test', 'ip': '192.168.202.10'})
 _______________________________
< TASK [webserver : print info] >
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<div> Host was updated by Evgeni Ermakov </div>",
                "content_length": "47",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 21 Aug 2022 13:04:02 GMT",
                "elapsed": 0,
                "etag": "\"630229bf-2f\"",
                "failed": false,
                "failed_when_result": false,
                "item": {
                    "ip": "192.168.202.10",
                    "name": "ubuntu1.test"
                },
                "last_modified": "Sun, 21 Aug 2022 12:49:03 GMT",
                "msg": "OK (47 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<div> Host was updated by Evgeni Ermakov </div>",
                "content_length": "47",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 21 Aug 2022 13:04:03 GMT",
                "elapsed": 0,
                "etag": "\"630229c0-2f\"",
                "failed": false,
                "failed_when_result": false,
                "item": {
                    "ip": "192.168.202.10",
                    "name": "ubuntu2.test"
                },
                "last_modified": "Sun, 21 Aug 2022 12:49:04 GMT",
                "msg": "OK (47 bytes)",
                "redirected": false,
                "server": "nginx/1.18.0 (Ubuntu)",
                "status": 200,
                "url": "http://ubuntu2.test"
            }
        ],
        "skipped": false
    }
}
 _____________________________________________
< TASK [webserver : deploy for Centos system] >
 ---------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

skipping: [ubuntu]
included: /home/evgeni/IdeaProjects/sa.it-academy.by/Evgeni_Ermakov/07.Ansible.Cruise/webserver/tasks/centos.yaml for centos
 __________________________________
< TASK [webserver : install nginx] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos]
 _________________________________
< TASK [webserver : nginx enable] >
 ---------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos]
 _________________________________________
< TASK [webserver : enable firewall port] >
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos]
 __________________________________
< TASK [webserver : nginx restart] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [centos]
 ____________________________________________
< TASK [webserver : creating home directory] >
 --------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.9'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.9'})
 ___________________________________________________
< TASK [webserver : copying configuration template] >
 ---------------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.9'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.9'})
 __________________________________
< TASK [webserver : nginx restart] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [centos]
 ____________________________________
< TASK [webserver : copy index.html] >
 ------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.9'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.9'})
 __________________________________
< TASK [webserver : nginx restart] >
 ----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

changed: [centos]
 _____________________________________
< TASK [webserver : check index.html] >
 -------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => (item={'name': 'cent1.test', 'ip': '192.168.202.9'})
ok: [centos] => (item={'name': 'cent2.test', 'ip': '192.168.202.9'})
 _______________________________
< TASK [webserver : print info] >
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => {
    "msg": {
        "changed": false,
        "msg": "All items completed",
        "results": [
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<div> Host was updated by Evgeni Ermakov </div>",
                "content_length": "47",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 21 Aug 2022 13:04:13 GMT",
                "elapsed": 0,
                "etag": "\"63022a15-2f\"",
                "failed": false,
                "failed_when_result": false,
                "item": {
                    "ip": "192.168.202.9",
                    "name": "cent1.test"
                },
                "last_modified": "Sun, 21 Aug 2022 12:50:29 GMT",
                "msg": "OK (47 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://cent1.test"
            },
            {
                "accept_ranges": "bytes",
                "ansible_loop_var": "item",
                "changed": false,
                "connection": "close",
                "content": "<div> Host was updated by Evgeni Ermakov </div>",
                "content_length": "47",
                "content_type": "text/html",
                "cookies": {},
                "cookies_string": "",
                "date": "Sun, 21 Aug 2022 13:04:14 GMT",
                "elapsed": 0,
                "etag": "\"63022a17-2f\"",
                "failed": false,
                "failed_when_result": false,
                "item": {
                    "ip": "192.168.202.9",
                    "name": "cent2.test"
                },
                "last_modified": "Sun, 21 Aug 2022 12:50:31 GMT",
                "msg": "OK (47 bytes)",
                "redirected": false,
                "server": "nginx/1.14.1",
                "status": 200,
                "url": "http://cent2.test"
            }
        ],
        "skipped": false
    }
}
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

centos                     : ok=13   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
ubuntu                     : ok=11   changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0 
```

## Testing

```bash
evgeni@legion:~/IdeaProjects/sa.it-academy.by/Evgeni_Ermakov/07.Ansible.Cruise$ ansible-playbook -i inventory.yaml test.yaml --ask-vault-pass > text
Vault password: 
 ____________________
< PLAY [all_workers] >
 --------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
ok: [centos]
 ___________________________________________
< TASK [tests : сheck sudo with nopassword] >
 -------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
ok: [centos]
 _________________________________
< TASK [tests : check connection] >
 ---------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => (item=https://deb.debian.org/debian)
ok: [ubuntu] => (item=https://deb.debian.org/debian)
ok: [centos] => (item=https://cloud.centos.org/centos)
ok: [ubuntu] => (item=https://cloud.centos.org/centos)
ok: [centos] => (item=https://pypi.org/simple)
ok: [ubuntu] => (item=https://pypi.org/simple)
 _____________________________
< TASK [tests : check docker] >
 -----------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [ubuntu]
ok: [centos]
 ___________________________________________
< TASK [tests : check random-access memory] >
 -------------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => {
    "msg": "ram > 512mb"
}
ok: [ubuntu] => {
    "msg": "ram > 512mb"
}
 ______________________________________
< TASK [tests : check Hard disk drive] >
 --------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [centos] => {
    "msg": "HDD > 15GB"
}
ok: [ubuntu] => {
    "msg": "HDD > 15GB"
}
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

centos                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
ubuntu                     : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```
