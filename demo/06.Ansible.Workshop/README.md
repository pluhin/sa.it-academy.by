## 06.Ansible

```bash
 281  mkdir 06.Ansible.workshop
  282  cd 06.Ansible.workshop/
  283  cp ../05.Ansible/ansible.cfg ./
  284  cat ana
  285  cat ansible.cfg
  286  ansible --version
  287  vim inv.yaml
  288  cat inv.yaml
  289  ansible-inventory -i inv.yaml --graph
  290  ansible-inventory -i inv.yaml --host mysql
  291  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root mysql, --ask-pass
  292  vim mysql.yaml
  293  cat mysql.yaml
  294  vim mysql.yaml
  295  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  296  vim mysql.yaml
  297  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  298  vim mysql.yaml
  299  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  300  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root -t never
  301  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root
  302  vim mysql.yaml
  303  mkdir templates
  304  vim templates/test_template.j2
  305  vim mysql.yaml
  306  ansible-playbook -i inv.yaml mysql.yaml -e "name_db=plu user_db=plu pass_db=hello_secret" -u root -t temp-demo
  307  history
```