## Ansible Workshop

```bash
  272  mkdir 06.Ansible.workshop
  273  cd 06.Ansible.workshop/
  274  ls
  275  cp ../05.Ansible/ansible.cfg ./
  276  vim ansible.cfg
  277  vim inv.yaml
  278  history | grep ssh-cop
  279  ansible -i inv.yaml -m ping db_all -u root --ask-pass
  280  vim inv.yaml
  281  ssh-copy-id root@192.168.201.8
  282  ansible -i inv.yaml -m ping db_all -u root
  283  ssh root@192.168.201.5
  284  history
  285  vim inv.yaml
  286  vim mysql.yaml
  287  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root
  288  vim mysql.yaml
  289  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root
  290  vim mysql.yaml
  291  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root -t never
  292  vim mysql.yaml
  293  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root
  294  mkdir templates
  295  ls -la
  296  vim mysql.yaml
  297  vim templates/test_template.j2
  298  vim mysql.yaml
  299  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root -t temp-demo
  300  vim mysql.yaml
  301  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root -t temp-demo
  302  vim templates/test_template.j2
  303  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello" -u root -t temp-demo
```