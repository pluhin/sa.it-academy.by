## Ansible run

```
 1006  rm -rf tmp/
 1007  mkdir tmp
 1008  cd tmp
 1009  ls
 1010  clear
 1011  vagrant -v
 1012  vagrant status
 1013  vagrant global-status
 1014  vagrant ini
 1015  vagrant init
 1016  ls
 1017  clear
 1018  ls
 1019  vim Vagrantfile
 1020  ifconfig
 1021  vim Vagrantfile
 1022  vagrant up
 1023  vagrant status
 1024  vagrant global-status
 1025  vagrant ssh
 1026  ping 192.168.1.222
 1027  telnet  192.168.1.222 22
 1028  clear
 1029  vagrant halt && vagrant destroy
 1030  vim Vagrantfile
 1031  vim run.sh
 1032  vagrant up
 1033  clrar
 1034  clear
 1035  vagrant status
 1036  curl http://192.168.1.222
 1037  vagrant ssh
 1038  curl http://192.168.1.222
 1039  links http://192.168.1.222
 1040  links
 1041  vim Vagrantfile
 1042  vagrant halt && vagrant destroy
 1043  clear
 1044  mkdir book_01
 1045  cd book_01/
 1046  mkdir inventories
 1047  vim inventories/prod.yaml
 1048  mkdir group_vars
 1049  mkdir group_vars/all
 1050  ansible-vault create group_vars/all/vault.yaml
 1051  vim inventories/prod.yaml
 1052  vim play.yaml
 1053  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass
 1054  vim /etc/ansible/ansible.cfg
 1055  vim play.yaml
 1056  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass
 1057  vim play.yaml
 1058  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass
 1059  vim play.yaml
 1060  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass
 1061  vim play.yaml
 1062  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass
 1063  cp play.yaml user.yaml
 1064  vim user.yaml
 1065  ansible-playbook -i inventories/prod.yaml user.yaml --ask-vault-pass -e "user_add=plu"
 1066  vim user.yaml
 1067  vim play.yaml
 1068  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass -t print_facts
 1069  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass --skip-tags print_facts
 1070  vim play.yaml
 1071  ansible-playbook -i inventories/prod.yaml play.yaml --ask-vault-pass -l jump
 1072  history

```