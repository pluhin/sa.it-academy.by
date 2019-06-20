## Ansible start
```bash  
  407  clear
  408  sudo yum install ansible
  409  pip install ansible==2.8
  410  ansible -v
  411  ansible --version
  412  sudo yum install ansible
  413  ansible --version
  414  pip3 install ansible==2.8
  415  pip install ansible==2.8
  416  pip install --upgrade ansible
  417  sudo pip install --upgrade ansible
  418  clear
  419  ansible
  420  ansible --version
  421  cleat
  422  clear
  423  vim /etc/ansible/ansible.cfg
  424  ansible localhost -m ping
  425  touch /var/log/ansible.log
  426  sudo touch  /var/log/ansible.log
  427  sudo chmod +w  /var/log/ansible.log
  428  ansible localhost -m ping
  429  sudo chown plu:plu  /var/log/ansible.log
  430  ansible localhost -m ping
  431  ping sa.it-academy.by
  432  sudo vim /etc/ansible/hosts
  433  ansible ec_htp -m ping
  434  ansible ec_htp -m ping -u jump_sa
  435  ansible 178.124.206.48  -m ping -u jump_sa
  436  ansible jump  -m ping -u jump_sa
  437  sudo vim /etc/ansible/hosts
  438  ssh root@178.124.206.48
  439  sudo vim /etc/ansible/hosts
  440  ansible jump  -m ping -u jump_sa
  441  sudo vim /etc/ansible/hosts
  442  ansible ec_htp  -m ping
  443  ansible-inventory --graoh
  444  ansible-inventory --graph
  445  sudo vim /etc/ansible/hosts
  446  ansible-inventory --host cent01
  447  sudo vim /etc/ansible/hosts
  448  ansible-inventory --host cent01
  449  sudo vim /etc/ansible/hosts
  450  vim /etc/ssh/ssh_config
  451  sudo vim /etc/ssh/ssh_config
  452  ssh root@192.168.254.50
  453  ansible ec_htp -m shell -a 'cat /etc/os-release'
  454  sudo mkdir /etc/ansible/{group_vars,host_vars}
  455  ls -l /etc/ansible
  456  sudo vim /etc/ansible/hosts
  457  sudo vim /etc/ansible/group_vars/ec_htp
  458  sudo vim /etc/ansible/hosts
  459  ansible-inventory --host cent01
  460  sudo vim /etc/ansible/group_vars/ec_htp
  461  ansible-inventory --host cent01
  462  sudo vim /etc/ansible/hosts
  463  sudo mkdir /etc/ansible/host_vars/ub01
  464  sudo ansible-vault create /etc/ansible/host_vars/ub01/vault.yaml
  465  cat  /etc/ansible/host_vars/ub01/vault.yaml
  466  sudo chmod 775  /etc/ansible/host_vars/ub01/vault.yaml
  467  cat  /etc/ansible/host_vars/ub01/vault.yaml
  468  sudo ansible-vault edit /etc/ansible/host_vars/ub01/vault.yaml
  469  ansible ec_htp -m shell -a 'cat /etc/os-release'
  470  ansible ec_htp -m shell -a 'cat /etc/os-release' --ask_vault_pass
  471  ansible ec_htp -m shell -a 'cat /etc/os-release' --ask-vault-pass
  472  mc
  473  ansible ub01 -m shell -a 'apt update' --ask-vault-pass
  474  ansible ub01 -m shell -a 'apt update' -b  --ask-vault-pass
```
