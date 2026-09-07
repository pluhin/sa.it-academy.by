## History

```bash
  378  mkdir 08.Ansible.Workshop
  379  cd 08.Ansible.Workshop/
  380  ls
  381  cp ../07.Ansible/ansible.cfg ./
  382  cat ansible.cfg
  383  vim inv.yaml
  384  ansible -i inv.yaml -m ping -u root
  385  ansible -i inv.yaml dbs -m ping -u root
  386  vim mysql.yaml
  387  ansible-playbook -i inv.yaml mysql.yaml -u root
  388  vim mysql.yaml
  389  ansible-playbook -i inv.yaml mysql.yaml -u root
  390  vim mysql.yaml
  391  ansible-playbook -i inv.yaml mysql.yaml -u root
  392  vim mysql.yaml
  393  mkdir templates
  394  vim templates/test_templates.j2
  395  cat templates/test_templates.j2
  396  ansible-playbook -i inv.yaml mysql.yaml -u root
  397  ssh root@192.168.201.5
  398  cat templates/test_templates.j2
  399  vim pg.yaml
  400  vim templates/pg_hba.conf.j2
  401  cat templates/pg_hba.conf.j2
  402  vim pg.yaml
  403  ansible-playbook -i inv.yaml pg.yaml -u root
  404  vim pg.yaml
  405  ansible-playbook -i inv.yaml pg.yaml -u root
  406  vim pg.yaml
  407  ansible-playbook -i inv.yaml pg.yaml -u root
  408  history
```