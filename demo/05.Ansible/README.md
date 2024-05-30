```bash
  206  mkdir 05.Ansible
  207  cd 05.Ansible/
  208  ls
  209  ansible
  210  pip
  211  sudo  apt update
  212  sudo apt install python3-pip
  213  c
  214  sudo pip3 install ansiable
  215  sudo pip3 install ansible
  216  ansible --version
  217  c
  218  vim inv.yaml
  219  ansible-inventory -i inv.yaml --graph
  220  ansible-inventory -i inv.yaml --hosts bastion
  221  ansible-inventory -i inv.yaml --host bastion
  222  cat inv.yaml
  223  ansible-inventory -i inv.yaml --host host15
  224  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  225  ssh -p 32510 jump_sa@178.124.206.53
  226  vim ~/.ssh/config
  227  ssh ec_bastion
  228  vim ~/.ssh/config
  229  ssh root@192.168.202.15
  230  ssh root@192.168.202.15 -vvvv
  231  vim ansible.cfg
  232  ansible -i inv.yaml -m ping -u root  all_workers --ask-pass
  233  sudo install sshpass
  234  sudo apt install sshpass
  235  ansible -i inv.yaml -m ping -u root  all_workers --ask-pass
  236  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -u root all_workers --ask-pass
  237  ansible -i inv.yaml -m ping -u root  all_workers
  238  history
  239  mkdir -p group_vars/all_workers/
  240  vim group_vars/all_workers/vars.yaml
  241  vim ~/.ssh/config
  242  ansible -i inv.yaml -m ping -u root all_workers
  243  vim group_vars/all_workers/vars.yaml
  244  ssh root@192.168.201.15 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
  245  ssh root@192.168.202.15 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
  246  vim group_vars/all_workers/vars.yaml
  247  ansible-vault create group_vars/all_workers/vault.yaml
  248  cat group_vars/all_workers/vault.yaml
  249  ansible-vault edit group_vars/all_workers/vault.yaml
  250  ansible -i inv.yaml -m ping -u root all_workers
  251  ansible -i inv.yaml -m ping -u root all_workers --ask-vault-pass
  252  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  253  cat group_vars/all_workers/vault.yaml
  254  vim first.yaml
  255  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  256  vim first.yaml
  257  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  258  vim first.yaml
  259  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  260  vim first.yaml
  261  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass -t no_facts
  262  vim first.yaml
  263  vim user.yaml
  264  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  265  vim user.yaml
  266  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  267  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  268  vim first.yaml
  269  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  270  vim first.yaml
  271  history
```