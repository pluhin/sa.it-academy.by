## Ansible
```bash
193  mkdir 05.Ansible.Start
  194  cd 05.Ansible.Start/
  195  ls
  196  sudo apt update
  197  sudo apt install python3-pip
  198  sudo pip
  199  sudo apt upgrade
  200  apt --fix-broken install
  201  sudo apt --fix-broken install
  202  sudo reboot
  203  sudo apt install python3-pip
  204  sudo pip3 install ansible
  205  ansible --version
  206  cd 05.Ansible.Start/
  207  ls
  208  clear
  209  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  210  ssh -p '32510' 'jump_sa@178.124.206.53'
  211  vim inv.yaml
  212* ansible-inventory -i inv.yaml --grap
  213  vim ~/.ssh/config
  214  ssh root@192.168.202.25 -vvvv
  215  ssh root@192.168.202.25
  216  vim ansible.cfg
  217  sudo apt install sshpass
  218  vim ~/.ssh/config
  219  ssh root@192.168.202.25 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"
  220  vim inv.yaml
  221  history
  222  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  223  vim inv.yaml
  224  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  225  ansible -i inv.yaml -m ping -u root all_workers
  226  vim group_vars/all_workers/var.yaml
  227  vim inv.yaml
  228  vim group_vars/all_workers/var.yaml
  229  ansible-inventory -i inv.yaml --host=host25
  230  ansible-vault create group_vars/all_workers/vault.yaml
  231  cat group_vars/all_workers/vault.yaml
  232  ansible-vault edit group_vars/all_workers/vault.yaml
  233  ansible -i inv.yaml -m ping all_workers
  234  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  235  vim first.yaml
  236  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  237  cat ansible.cfg
  238  vim first.yaml
  239  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  240*
  241  ansible-playbook -i inv.yaml first.yaml -t no_facts --ask-vault-pass
  242  vim user.yaml
  243  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  244  history
```