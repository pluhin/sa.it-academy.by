```bash
 216  mkdir 06.Ansible
  217  cd 06
  218  cd 06.Ansible/
  219  cp ../05.Ansible/ansible.cfg ./
  220  cat ansible.cfg
  221  vim inv.yaml
  222  cat inv.yaml
  223  vim inv.yaml
  224  ansible -i inv.yaml -m ping db_all --ask-pass
  225  ansible -i inv.yaml -m ping db_all -u root --ask-pass
  226  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root db_all --ask-pass
  227  vim mqsql.yaml
  228  vim mysql.yaml
  229  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  230  vim mysql.yaml
  231  ls -l
  232  vim inv.yaml
  233  ansible -i inv.yaml -m ping mysql6, --ask-pass
  234  ssh root@192.168.201.6
  235  ansible -i inv.yaml -m ping mysql6, -u root --ask-pass
  236  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  237  vim mysql.yaml
  238  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  239  vim mysql.yaml
  240  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  241  mkdir templates
  242  vim templates/test_templates.j2
  243  cat vim templates/test_templates.j2
  244  cat templates/test_templates.j2
  245  vim mysql.yaml
  246  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root -t temp-demo
  247  ssh root@192.168.201.10
  248  vim mysql.yaml
  249  history
```