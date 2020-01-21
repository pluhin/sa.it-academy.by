 ```bash
 1024  git pull
 1025  clear
 1026  cd demo
 1027  ls
 1028  mkdir 09.Ansible
 1029  cd 09.Ansible
 1030  ls
 1031  vim inv.yaml
 1032  ansible-inventory --graph -i inv.yaml
 1033  vim ~/.ssh/config
 1034  ansible -i inv.yaml -m ping all
 1035  ssh-copy-id root@192.168.31.21
 1036  ansible -i inv.yaml -m ping all
 1037  vim inv.yaml
 1038  ls -l
 1039  vim hosts.retry
 1040  ansible -m ping all -u root --ask-pass -l @hosts.retry
 1041  ls
 1042  vim play.yaml
 1043  mkdir roles/redmine/{defaults,tasks,templates,handlers,files} -p
 1044  ls -lr
 1045  ls -lR
 1046  ls
 1047  vim roles/redmine/tasks/main.yaml
 1048  ansible-playbook -i inv.yaml play.yaml
 1049  cp inv.yaml all.yaml
 1050  vim all.yaml
 1051  vim hosts.retry
 1052  cat play.yaml
 1053  vim all.yaml
 1054  vim utils.yaml
 1055  ansible-playbook -i all.yaml utils.yaml --ask-pass
 1056  claer
 1057  clear
 1058  vim roles/redmine/tasks/main.yaml
 1059  vim roles/redmine/defaults/main.yaml
 1060  ansible-playbook -i inv.yaml play.yaml
 1061  vim roles/redmine/defaults/main.yaml
 1062  vim roles/redmine/tasks/main.yaml
 1063  vim roles/redmine/templates/my.cnf.j2
 1064  vim roles/redmine/tasks/main.yaml
 1065  vim roles/redmine/h
 1066  vim roles/redmine/handlers/main.yaml
 1067  vim ../08.Ansible/play.yaml
 1068  vim ../07.Ansible/roles/web/tasks/main.yaml
 1069  vim roles/redmine/tasks/main.yaml
 1070  ansible-playbook -i inv.yaml play.yaml
 1071  vim roles/redmine/tasks/main.yaml
 1072  vim roles/redmine/handlers/main.yaml
 1073  history
 1074  vim roles/redmine/tasks/main.yaml
 1075  vim roles/redmine/defaults/main.yaml
 1076  ansible-playbook -i inv.yaml play.yaml
 1077* vim LG/.autostart/vpn_tunnel.sh
 1078  vim roles/redmine/defaults/main.yaml
 1079  vim roles/redmine/tasks/main.yaml
 1080  ansible-playbook -i inv.yaml play.yaml
 1081  vim roles/redmine/tasks/main.yaml
 1082  vim roles/redmine/templates/database.yml.j2
 1083  vim roles/redmine/tasks/main.yaml
 1084  ansible-playbook -i inv.yaml play.yaml -t db::config
 1085  vim roles/redmine/tasks/main.yaml
 1086  ansible-playbook -i inv.yaml play.yaml -t setup
 1087  ssh root@192.168.31.21
 1088  vim roles/redmine/defaults/main.yaml
 1089  ansible-playbook -i inv.yaml play.yaml -t setup
 1090* ssh root@192.168.31.21
 1091* cd  /tmp/sa.it-academy.by/demo/09.Ansible
 1092* ls
 1093* mc
 1094* vim roles/redmine/tasks/main.yaml \n: 1579635962:0;vim roles/redmine/tasks/main.yaml
 1095* vim roles/redmine/handlers/main.yaml
 1096* vim roles/redmine/tasks/main.yaml
 1097* ansible-playbook -i inv.yaml play.yaml -t apache::setup
 1098* vim roles/redmine/templates/redmine.site.conf.j2
 1099* ansible-playbook -i inv.yaml play.yaml -t apache::setup
 1100* vim roles/redmine/tasks/main.yaml
 1101* vim roles/redmine/handlers/main.yaml
 1102* ansible-playbook -i inv.yaml play.yaml -t apache::setup
 1103* ansible -i inv.yaml all -m shell -a "service apache2 restart" -b
 1104  ansible-playbook -i inv.yaml play.yaml -t setup
 1105* vim ~/.ssh/config
 1106* vim roles/redmine/defaults/main.yaml
 1107  vim roles/redmine/tasks/main.yaml
 1108  ansible-playbook -i inv.yaml play.yaml -t setup
 1109* vim roles/redmine/tasks/main.yaml
 1110* ansible-playbook -i inv.yaml play.yaml -t test
```
