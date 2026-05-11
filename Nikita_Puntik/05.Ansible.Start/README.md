```bash
  427  exit 
  428  cd ..
  429  ls 
  430  nano ansible.cfg 
  431  nano inv.yaml 
  432  nano ~/.ssh/config 
  433  ssh 192.168.202.11
  434  ssh root@192.168.202.12
  435  ls 
  436  cat inv.yaml 
  437  ansible -i inv.yaml remote -m ping
  438* ansible -i inv.yaml -m ping all_workers --ask-vault-pass -t no_facts
  439  cat inv.yaml 
  440  nano ~/.ssh/config 
  441  pwd
  442  ls
  443  cd ansible-playbooks/
  444  nano install_htop.yml
  445  cd .. 
  446  cp ansible-playbooks/install_htop.yml .
  447  ls 
  448  ansible-playbook -i inv.yaml install_htop.yml
  449  ansible-playbook -i inv.yaml install_htop.yml --ask-valut-pass
  450  ansible-playbook -i inv.yaml install_htop.yml
  451  ansible-playbook -i inv.yaml install_htop.yml --ask-vault-pass
  452  nano inv.yaml 
  453  ls
  454  cd group_vars/
  455  ls 
  456  nano all_workers/
  457  cd all_workers/
  458  ls 
  459  nano vault.yaml 
  460  nano vars.yaml 
  461  ansible-vault decrypt inv.yaml --ask-vault-pass
  462  ansible-vault decrypt group_vars/all/vault.yml --ask-vault-pass
  463  ды 
  464  cd ~/05.Ansible/
  465  ls
  466  cd group_vars/
  467  cd all_workers/
  468  ls 
  469  nano vault.yaml 
  470  pwd
  471  cd .
  472  cd..
  473  cd ..
  474  cd .. 
  475  rm -rf /home/nik/05.Ansible/group_vars
  476  ls 
  477  ansible -i inv.yaml all_workers -m ping
  478  ды 
  479  ls 
  480  nano inv.yaml 
  481  cat inv.yaml 
  482  ansible -i inv.yaml all_workers -m ping
  483  ansible-playbook -i inv.yaml install_htop.yml
  484  ды 
  485  ls 
  486  nano manage_users.yaml
  487  python3 -c 'import crypt; print(crypt.crypt("mysecretpassword", crypt.mksalt(crypt.METHOD_SHA512)))'
  488  nano manage_users.yaml 
  489  ansible-playbook -i inv.yaml manage_users.yaml 
  490  nano manage_users.yaml
  491  ansible-playbook -i inv.yaml manage_users.yaml --syntax-check
  492  ansible-playbook -i inv.yaml manage_users.yaml
  493  python3 -c 'import crypt; print(crypt.crypt("devops123", crypt.mksalt(crypt.METHOD_SHA512)))'
  494  nano manage_users.yaml
  495  ansible-playbook -i inv.yaml manage_users.yaml
  496  ansible -i inv.yaml all_workers -m command -a "id devops_user"
  497  ansible -i inv.yaml all_workers -m command -a "sudo -l -U devops_user" --become 
  499  ls 
  500  cat ansible.cfg 
  501  cd ~/devops/sa.it-academy.by
  502  ls 
  503  cd Nikita_Puntik/
  504  ls 
  505  mkdir 05.Ansible.Start
  506  cd 05.Ansible.Start/
  507  ls 
  508  cp ~/05.Ansible/inv.yaml .
  509  cp ~/05.Ansible/ansible.cfg .
  510  cp ~/05.Ansible/install_htop.yml 
  511  cp ~/05.Ansible/install_htop.yml .
  512  cp ~/05.Ansible/manage_users.yaml .
  513  ls
  514  cp ~/05.Ansible/ansible-playbooks/hello.yaml 
  515  cp ~/05.Ansible/ansible-playbooks/hello.yaml .
  516  ls
  517  cp ~/.ssh/config ssh_config
  518  ls 
  519  cat ssh_config 
  520  history >> README.md
  521  nano README.md 
 ```
