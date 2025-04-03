```bash
244  mkdir 06.Ansible
  245  cd 06.Ansible/
  246  ls
  247  ansible version
  248  ansible --version
  249  cp ../05.Ansible.Start/ansible.cfg ./
  250  cat ansible.cfg
  251  vim inv.yaml
  252  cat inv.yaml
  253  ansible -i inv.yaml -m ping -u root db_all --ask-pass
  254  ssh root@192.168.201.2
  255  ssh root@192.168.201.9
  256  ssh root@192.168.201.10
  257  vim mysql.yaml
  258  cat mysql.yaml
  259  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  260  vim mysql.yaml
  261  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  262  vim mysql.yaml
  263  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  264  vim mysql.yaml
  265  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  266  ssh root@192.168.201.13
  267  vim mysql.yaml
  268  mkdir templates
  269  vim templates/test_template.j2
  270  mkdir templates
  271  vim mysql.yaml
  272  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root -t temp-demo --ask-pass
  273  ssh root@192.168.201.13
  274  history
```