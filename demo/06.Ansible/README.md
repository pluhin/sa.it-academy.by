```bash
311  mkdir 06.Ansible
  312  cd 06.Ansible/
  313  ls
  314  vim inv.yaml
  315  history | grep ansible
  316  ansible -i inv.yaml -m ping mysql, -u root --ask-pass
  317  cp ../05.Ansible/ansible.cfg ./
  318  ansible -i inv.yaml -m ping mysql, -u root --ask-pass
  319  ls -a
  320  ls -al
  321  history | grep ansible
  322  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql, -u root --ask-pass
  323  vim mysql.yaml
  324  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  325  ansible-playbook -i inv.yaml mysql.yaml -u root
  326  history
  327  vim mysql.yaml
  328  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  329  vim mysql.yaml
  330  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  331  vim mysql.yaml
  332  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  333  vim mysql.yaml
  334  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root -t never
  335  vim mysql.yaml
  336  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root -t never
  337  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  338  vim mysql.yaml
  339  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  340  mkdir templates
  341  vim templates/vhost.conf.j2
  342  vim mysql.yaml
  343  [A
  344  vim mysql.yaml
  345  vim templates/vhost.conf.j2
  346  vim mysql.yaml
  347  vim templates/vhost.conf.j2
  348  vim mysql.yaml
  349  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  350  history
```