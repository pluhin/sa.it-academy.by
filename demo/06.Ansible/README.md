```bash
  218  mkdir 06.Ansible
  219  cd 06.Ansible/
  220  ls
  221  cp ../05.Ansible/ansible.cfg ./
  222  ls
  223  cat ansible.cfg
  224  vim inv.yaml
  225  ansible -i inv.yaml -m ping -u root db_all --ask-pass
  226  ls -l
  227  vim mysql.yaml
  228  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  229  ls -l
  230  vim mysql.yaml
  231  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  232  vim mysql.yaml
  233  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  234  mkdir templates
  235  vim templates
  236  vim templates/test_templates.j2
  237  vim mysql.yaml
  238  vim templates/test_templates.j2
  239  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  240  vim templates/test_templates.j2
  241  vim mysql.yaml
  242  vim templates/test_templates.j2
  243  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  244  vim mysql.yaml
  245  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root --ask-pass
  246  history
```