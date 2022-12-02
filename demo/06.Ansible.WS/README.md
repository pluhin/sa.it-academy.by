# 06.Ansible workshop

```bash
144  mkdir 06.Ansible.WS
  145  cd 06.Ansible.WS/
  146  ls
  147  vim inv.yaml
  148  ansible-inventory -i inv.yaml --graph
  149  vim inv.yaml
  150  ansible -i inv.yaml -m ping dbs --ask-pass
  151  cp ../05.Ansible/ansible.cfg ./
  152  ansible -i inv.yaml -m ping dbs --ask-pass
  153  ls -l
  154  vim inv.yaml
  155  vim ansible.cfg
  156  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" dbs -u root --ask-pass
  157  ansible -i inv.yaml -m ping dbs
  158  ls -l
  159  vim mariadb.yaml
  160  ansible-playbook -i inv.yaml mariadb.yaml
  161  vim mariadb.yaml
  162  ansible-playbook -i inv.yaml mariadb.yaml
  163  vim mariadb.yaml
  164  ansible-playbook -i inv.yaml mariadb.yaml
  165  vim mariadb.yaml
  166  ansible-playbook -i inv.yaml mariadb.yaml
  167  vim mariadb.yaml
  168  ansible-playbook -i inv.yaml mariadb.yaml
  169  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=firstpass"
  170  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  171  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"   tasks:
  172  vim mariadb
  173  ls -l
  174  rm mariadb_repo_setup
  175  vim mariadb.yaml
  176  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  177  vim mariadb.yaml
  178  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  179  vim mariadb.yaml
  180  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  181  vim mariadb.yaml
  182  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  183  vim mariadb.yaml
  184  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass" -t install
  185  vim mariadb.yaml
  186  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  187  vim mariadb.yaml
  188  ansible-playbook -i inv.yaml mariadb.yaml -e "name_db=fisrt_db user_db=first_user pass_db=first_pass"
  189  history
```