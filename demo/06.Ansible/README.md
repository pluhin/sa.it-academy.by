```bash
  307  ls
  308  mkdir 06.Ansible
  309  cp 05.Ansible/inv.yaml 06.Ansible/
  310  cd 06.Ansible/in
  311  cd 06.Ansible/
  312  vim inv.yaml
  313  cat ../05.Ansible/group_vars/all_workers/vars.yaml
  314  vim inv.yaml
  315  ansible-inventory -i inv.yaml --grapth
  316  ansible-inventory -i inv.yaml --graph
  317  ansible -i inv.yaml -m ping db_all --ask-pass
  318  cp ../05.Ansible/ansible.cfg ./
  319  ansible -i inv.yaml -m ping db_all --ask-pass
  320  vim inv.yaml
  321  ansible -i inv.yaml -m ping db_test --ask-pass
  322  history | grep sshp
  323  ansible -i inv.yaml -m ping db_test --ask-pass
  324  vim /home/vagrant/.ssh/known_hosts
  325  ansible -i inv.yaml -m ping db_test --ask-pass
  326  vim inv.yaml
  327  vim mariadb.yaml
  328  vim ansible.cfg
  329  vim mariadb.yaml
  330  vim inv.yaml
  331  vim mariadb.yaml
  332  ansible-playbook -i inv.yaml mariadb.yaml --ask-pass
  333  history | grep auth
  334  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  335  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" db_all -u root --ask-pass
  336  ansible-playbook -i inv.yaml mariadb.yaml
  337  history
  338  ansible-playbook -i inv.yaml mariadb.yaml
  339  vim inv.yaml
  340  ansible -i inv.yaml -m ping host11, --ask-pass
  341  vim inv.yaml
  342  vim mariadb.yaml
  343  ls -l ~/.ssh/id_rsa*
  344  vim mariadb.yaml
  345  ansible-playbook -i inv.yaml mariadb.yaml
  346  vim mariadb.yaml
  347  ansible-playbook -i inv.yaml mariadb.yaml
  348  vim mariadb.yaml
  349  ansible-playbook -i inv.yaml mariadb.yaml
  350  vim mariadb.yaml
  351  ansible-playbook -i inv.yaml mariadb.yaml
  352  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=fisrt_db -e user_db=first_user -e pass_db=first_pass
  353  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=fisrt_db -t never
  354  ansible-playbook -i inv.yaml mariadb.yaml -e name_db=first_db -e user_db=first_user -e pass_db=first_pass
  355  sudo apt install dos2unix
  356  history
  ```