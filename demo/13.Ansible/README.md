```
10984  mkdir 13.Ansible
10985  cd 13.Ansible
10986  mc
10987  mkdir roles/{tasks,files,templates,defaults,handlers}
10988  vim roles/tasks/main.yaml
10989  vim roles/tasks/http_debian.yaml
10990  vim roles/tasks/http_RedHat.yaml
10991  vim roles/defaults/main.yaml
10992  vim roles/tasks/http_RedHat.yaml
10993  vim roles/tasks/http_debian.yaml
10994  vim roles/tasks/http_RedHat.yaml
10995  ansible-playbook play.yaml -i hosts.yaml --ask-pass
10996  mc
10997  ansible-playbook play.yaml -i hosts.yaml --ask-pass
10998  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
10999  vim play.yaml
11000  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11001  vim play.yaml
11002  vim roles/web/tasks/main.yaml
11003  history| grep local
11004  ssh -L 2380:localhost:80 root@192.168.203.23 -f -N;
11005  ssh -L 2480:localhost:80 root@192.168.203.24 -f -N;
11006  vim roles/web/files/index.html
11007  vim roles/web/tasks/main.yaml
11008  vim roles/web/handlers/main.yaml
11009  vim roles/web/tasks/main.yaml
11010  vim roles/web/handlers/main.yaml
11011  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11012  vim roles/web/tasks/main.yaml
11013  vim roles/web/defaults/main.yaml
11014  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11015  vim roles/web/tasks/main.yaml
11016  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11017  vim roles/web/tasks/main.yaml
11018  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11019  vim roles/web/tasks/main.yaml
11020  vim roles/web/templates/hosts.j2
11021  vim roles/web/defaults/main.yaml
11022  vim roles/web/templates/hosts.j2
11023  vim roles/web/defaults/main.yaml
11024  vim hosts.yaml
11025  vim roles/web/defaults/main.yaml
11026  vim roles/web/templates/hosts.j2
11027  vim roles/web/tasks/main.yaml
11028  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11029  vim roles/web/tasks/main.yaml
11030  vim roles/web/defaults/main.yaml
11031  vim roles/web/tasks/main.yaml
11032  vim roles/web/defaults/main.yaml
11033  vim roles/web/tasks/main.yaml
11034  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11035  ssh root@192.168.203.23
11036  vim roles/web/defaults/main.yaml
11037  ansible-playbook play.yaml -i hosts.yaml --ask-vault-pass
11038  ls
11039  sudo apt install ansible-lint
11040  ansible-lint play.yaml
11041  vim roles/web/handlers/main.yaml
11042  vim roles/web/tasks/main.yaml
11043  ansible-lint play.yaml
11044  cd roles/web
11045  molecule init scenario
11046  sudo pip3 install molecule
11047  molecule init scenario
11048  vim molecule/default/molecule.yml
11049  molecule test
11050  docker ps
11051  molecule test
11052  vim molecule/default/molecule.yml
11053  molecule test
11054  cd ../../
11055  ansible-playbook local.yaml
11056  ansible-playbook local.yaml --ask-vault-pass
```