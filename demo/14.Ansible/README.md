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
11054  vim molecule/default/molecule.yml
11055  git pull
11056  clear
11057  ssh root@192.168.205.21
11058  vim ~/.ssh/config
11059  ssh root@192.168.205.21
11060  ssh-copy-id root@192.168.205.21
11061  ssh root@192.168.205.21
11062  vim ~/.ssh/config
11063  cd demo/
11064  mkdir 14.Ansible
11065  cd 14.Ansible
11066  ls
11067  vim inv.yaml
11068  ansible-inventory -i inv.yaml --graph
11069  vim inv.yaml
11070  ansible-inventory -i inv.yaml --graph
11071  vim inv.yaml
11072  ansible-inventory -i inv.yaml --graph
11073  vim inv.yaml
11074  ls
11075  ansible -i inv.yaml redmine -m ping
11076  vim play.yaml
11077  mkdir roles/redmine/{defaults,files,handlers,tasks,templates}
11078  mkdir -p roles/redmine/{defaults,files,handlers,tasks,templates}
11079  vim roles/redmine/tasks/main.yaml
11080  vim roles/redmine/defaults/main.yaml
11081  vim roles/redmine/tasks/main.yaml
11082  ansible-playbook -i inv.yaml play.yaml
11083  ansible --version
11084  cp /home/spishchyk/.ansible.cfg ./
11085  mv .ansible.cfg ansible.cfg
11086  vim ansible.cfg
11087  vim roles/redmine/tasks/main.yaml
11088  vim roles/redmine/templates/my.cnf.j2
11089  vim roles/redmine/tasks/main.yaml
11090  vim roles/redmine/handlers/main.yaml
11091  vim roles/redmine/tasks/main.yaml
11092  ansible-playbook -i inv.yaml play.yaml
11093  vim roles/redmine/tasks/main.yaml
11094  vim roles/redmine/defaults/main.yaml
11095  vim roles/redmine/tasks/main.yaml
11096  vim roles/redmine/defaults/main.yaml
11097  vim roles/redmine/tasks/main.yaml
11098  ansible-playbook -i inv.yaml play.yaml
11099  vim roles/redmine/tasks/main.yaml
11100  vim roles/redmine/defaults/main.yaml
11101  vim roles/redmine/tasks/main.yaml
11102  ansible-playbook -i inv.yaml play.yaml
11103  vim roles/redmine/defaults/main.yaml
11104  vim roles/redmine/tasks/main.yaml
11105  ansible-playbook -i inv.yaml play.yaml
11106  vim roles/redmine/tasks/main.yaml
11107  ansible-playbook -i inv.yaml play.yaml
11108  vim roles/redmine/tasks/main.yaml
11109  ansible-playbook -i inv.yaml play.yaml
11110  vim roles/redmine/tasks/main.yaml
11111  vim roles/redmine/templates/database.yml.j2
11112  ansible-playbook -i inv.yaml play.yaml
11113  vim roles/redmine/templates/database.yml.j2
11114  vim roles/redmine/tasks/main.yaml
11115  vim roles/redmine/defaults/main.yaml
11116  ansible-playbook -i inv.yaml play.yaml
11117  vim roles/redmine/tasks/main.yaml
11118  vim roles/redmine/handlers/main.yaml
11119  vim roles/redmine/tasks/main.yaml
11120  vim roles/redmine/handlers/main.yaml
11121  vim roles/redmine/tasks/main.yaml
11122  vim roles/redmine/templates/redmine.site.conf.j2
11123  ansible-playbook -i inv.yaml play.yaml
11124  vim roles/redmine/templates/redmine.site.conf.j2
11125  vim roles/redmine/defaults/main.yaml
11126  ansible-playbook -i inv.yaml play.yaml
11127  vim roles/redmine/tasks/main.yaml
11128  vim roles/redmine/handlers/main.yaml
11129  vim roles/redmine/tasks/main.yaml
11130  ansible-playbook -i inv.yaml play.yaml
11131  vim roles/redmine/tasks/main.yaml
11132  vim roles/redmine/defaults/main.yaml
11133  vim roles/redmine/tasks/main.yaml
11134  ansible-playbook -i inv.yaml play.yaml
11135  vim roles/redmine/defaults/main.yaml
11136  ansible-playbook -i inv.yaml play.yaml
11137  vim roles/redmine/defaults/main.yaml
11138  vim roles/redmine/tasks/main.yaml
11139  ansible-playbook -i inv.yaml play.yaml
11140  history
11141  vim roles/redmine/tasks/main.yaml

```
