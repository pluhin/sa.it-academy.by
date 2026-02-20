```bash
197  mkdir 06.Ansible
  198  cd 06.Ansible/
  199  vim inv.yaml
  200  ansible-inventory -i inv.yaml --graph
  201  ansible -i inv.yaml -m ping -u root
  202  ansible -i inv.yaml -m ping db -u root
  203  ansible -i inv.yaml -m ping dbs -u root
  204  cp ../05.Ansible/ansible.cfg ./
  205  cat ansible.cfg
  206  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  207  ssh-copy-id root@192.168.201.5
  208* ansible -i inv.yaml -m ping dbs -u root
  209  ansible -i inv.yaml -m ping dbs -u root
  210  cat inv.yaml
  211  vim mysql.yaml
  212  ansible-playbook -i inv.yaml mysql.yaml -u root -e name_db=plu -e user_db=plu -e pass_db=plu -t never
  213  ansible-playbook -i inv.yaml mysql.yaml -u root -e name_db=plu -e user_db=plu -e pass_db=plu
  214  ansible-playbook -i inv.yaml mysql.yaml -u root -e name_db=plu -e user_db=plu -e pass_db=plu -t never
  215  vim mysql.yaml
  216  ansible-playbook -i inv.yaml mysql.yaml -u root -e name_db=plu -e user_db=plu -e pass_db=plu
  217  vim pg.yaml
  218  mkdir templates
  219  vim templates/pg_hba.conf.j2
  220  cat templates/pg_hba.conf.j2
  221  vim pg.yaml
  222  ls
  223  ls -l templates/pg_hba.conf.j2
  224  vim pg.yaml
  225  cat templates/pg_hba.conf.j2
  226  vim pg.yaml
  227  ansible-playbook -i inv.yaml pg.yaml -u root
  228  nc -wz 192.168.202.9 5432
  229  nc -w2 192.168.202.9 5432
  230  nc -wv 192.168.202.9 5432
  231  nc -w 192.168.202.9 5432
  232  nc -w10 192.168.202.9 5432
  233  nc -z 192.168.202.9 5432
  234  nc -z 192.168.202.9 22
  235  nc -zv 192.168.202.9 22
  236  nc -zv 192.168.202.9 5432
  237  nc -zv 192.168.201.5 3308
  238  nc -zv 192.168.201.5 3306
  239  vim templates/test_templates.j2
  240  cat templates/test_templates.j2
  241  vim mysql.yaml
  242  ansible-playbook -i inv.yaml mysql.yaml -u root -e name_db=plu -e user_db=plu -e pass_db=plu -t temp-demo
  243  vim mysql.yaml
  244  cat templates/test_templates.j2
  245  vim mysql.yaml
  246  ssh root@192.168.201.5
  247  history
```