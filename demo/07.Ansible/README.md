```bash
  749  mv first.yaml  web.yaml
  750  vim web.yaml
  751  ls
  752  mkdir -p roles/web/{defaults,files,templates,handlers,tasks}
  753  ls -l roles/web/
  754  vim roles/web/tasks/main.yaml
  755  vim roles/web/tasks/http_debian.yaml
  756  vim roles/web/tasks/http_RedHat.yaml
  757  ansible-playbook web.yaml -i inv.yaml
  758  vim roles/web/defaults/main.yaml
  759  ansible-playbook web.yaml -i inv.yaml
  760  vim roles/web/tasks/main.yaml
  761  mc
  762  vim ansible.cfg
  763  ansible-playbook web.yaml -i inv.yaml
  764  vim roles/web/defaults/main.yaml
  765  vim roles/web/tasks/main.yaml
  766  vim roles/web/tasks/http_debian.yaml
  767  vim roles/web/tasks/http_RedHat.yaml
  768  ansible-playbook web.yaml -i inv.yaml
  769  vim web.yaml
  770  ansible-playbook web.yaml -i inv.yaml
  771  vim web.yaml
  772  vim roles/web/tasks/http_RedHat.yaml
  773  vim roles/web/tasks/http_debian.yaml
  774  ansible-playbook web.yaml -i inv.yaml
  775  vim roles/web/tasks/main.yaml
  776  vim roles/web/defaults/main.yaml
  777  vim roles/web/files/index.html
  778  curl http://192.168.1.201
  779  curl http://192.168.1.203
  780  curl http://192.168.1.202
  781  ansible-playbook web.yaml -i inv.yaml
  782  curl http://192.168.1.201
  783  curl http://192.168.1.20
  784  curl http://192.168.1.203
  785  curl http://192.168.1.202
  786  clear
  787  vim roles/web/tasks/main.yaml
  788  ansible-playbook web.yaml -i inv.yaml
  789  vim roles/web/tasks/main.yaml
  790  ansible-playbook web.yaml -i inv.yaml
  791  vim roles/web/tasks/main.yaml
  792  vim roles/web/handlers/main.yaml
  793  vim roles/web/tasks/main.yaml
  794  ansible-playbook web.yaml -i inv.yaml
  795  vim roles/web/tasks/main.yaml
  796  ansible-playbook web.yaml -i inv.yaml
  797  vim roles/web/tasks/main.yaml
  798  cat /etc/os-release
  799  cat /etc/os-release | grep NAME=
  800  cat /etc/os-release | egrep "^NAME"
  801  cat /etc/os-release | egrep "^NAME" | cut -d'"' -f 2
  802   cat /etc/os-release | egrep "^NAME" | cut -d'"' -f 2
  803  vim roles/web/tasks/main.yaml
  804  vim roles/web/handlers/main.yaml
  805  vim roles/web/tasks/main.yaml
  806   cat /etc/os-release | egrep "^NAME" | cut -d'"' -f 2
  807  ansible-playbook web.yaml -i inv.yaml
  808  vim roles/web/tasks/main.yaml
  809  ansible-playbook web.yaml -i inv.yaml
  810  vim roles/web/tasks/main.yaml
  811  ansible-playbook web.yaml -i inv.yaml
  812  wq
  813  ansible-playbook web.yaml -i inv.yaml
  814  vim roles/web/tasks/main.yaml
  815  ansible-playbook web.yaml -i inv.yaml
  816  vim roles/web/tasks/main.yaml
  817  ansible-playbook web.yaml -i inv.yaml
  818  vim roles/web/tasks/main.yaml
  819  vim roles/web/files/index.html
  820  vim roles/web/tasks/main.yaml
  821  ansible-playbook web.yaml -i inv.yaml
  822  vim roles/web/tasks/main.yaml
  823  ansible-playbook web.yaml -i inv.yaml
  824  vim roles/web/tasks/main.yaml
  825  vim roles/web/templates/host.j2
  826  vim roles/web/defaults/main.yaml
  827  vim inv.yaml
  828  vim roles/web/templates/host.j2
  829  vim roles/web/defaults/main.yaml
  830  vim roles/web/templates/host.j2
  831  vim ansible.cfg
  832  vim roles/web/templates/host.j2
  833  vim roles/web/defaults/main.yaml
  834  vim roles/web/templates/host.j2
  835  vim roles/web/tasks/main.yaml
  836  mv roles/web/templates/host.j2 roles/web/templates/hosts.j2
  837  ansible-playbook web.yaml -i inv.yaml
  838  vim roles/web/tasks/main.yaml
  839  vim roles/web/templates/hosts.j2
  840  vim roles/web/tasks/main.yaml
  841  ansible-playbook web.yaml -i inv.yaml
  842  ssh vagrant@192.168.1.201
  843  vim /home/plu/.ssh/known_hosts
  844  ssh vagrant@192.168.1.201
  845  ansible-playbook web.yaml -i inv.yaml
  846  history
```
