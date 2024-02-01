## Ansible workshop

```bash
 282  mkdir 06.Ansible
  283  cd 06.Ansible/
  284  ls
  285  cp ../05.Ansible/ansible.cfg ./
  286  vim ansible.cfg
  287  vim inv.yaml
  288  ansible-inventory -i inv.yaml
  289  ansible-inventory -i inv.yaml --graph
  290  ansible-inventory -i inv.yaml --host mysql
  291  ansible -i inv.yaml -m ping db_all -u root --ask-pass
  292  history
  293  ssh root@192.168.201.5
  294  vim inv.yaml
  295  ansible -i inv.yaml -m ping db_all -u root --ask-pass
  296  history | look
  297  history |  grep look
  298  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql,  --ask-pass
  299  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql,  -u root --ask-pass
  300  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql  -u root --ask-pass
  301  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" mysql  -u root
  302  vim mysql.yaml
  303  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  304  vim mysql.yaml
  305  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  306  vim mysql.yaml
  307  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  308  vim mysql.yaml
  309  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  310  vim mysql.yaml
  311  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  312  vim mysql.yaml
  313  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  314  vim mysql.yaml
  315  ansible-playbook -i inv.yaml mysql.yaml -e name_db=plu -e user_db=plu -e pass_db=hello -u root
  316  history
```