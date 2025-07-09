```bash
165  mkdir 05.Ansible
  166  cd 05.Ansible/
  167  ls
  168  sudo apt update
  169  sudo apt install python3-pip
  170  sudo pip3 install ansible
  171  clear
  172  ansible --version
  173  ssh-copy-id -p 32511 jump_sa@178.124.206.53
  174  ssh -p '32511' 'jump_sa@178.124.206.53'
  175  vim inv.yaml
  176  ansible-inventory -i inv.yaml --graph
  177  vim inv.yaml
  178  ansible-inventory -i inv.yaml --graph
  179  ansible-inventory -i inv.yaml --host=bastion
  180  vim ~/.ssh/config
  181  ssh root@192.168.202.13
  182  ping 192.168.202.14
  183  ping 192.168.202.12
  184  vim inv.yaml
  185  ping 192.168.202.11
  186  ssh root@192.168.202.11
  187* ssh root@192.168.202.11
  188  ls
  189  mkdir -p group_vars/all_workers/
  190  vim group_vars/all_workers/vars.yaml
  191  vim ~/.ssh/config
  192  vim group_vars/all_workers/vars.yaml
  193  ssh root@192.168.202.11 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"
  194  ssh root@192.168.202.11 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32511"
  195  vim group_vars/all_workers/vars.yaml
  196  sudo apt install sshpass
  197  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  198  vim ansible.cfg
  199  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  200  vim inv.yaml
  201  vim group_vars/all_workers/vars.yaml
  202  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  203  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  204  ansible -i inv.yaml -m ping -u root all_workers
  205  ansible-vault create group_vars/all_workers/vault.yaml
  206  cat group_vars/all_workers/vault.yaml
  207  ansible-vault edit group_vars/all_workers/vault.yaml
  208  ansible -i inv.yaml -m ping all_workers
  209  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  210  vim first.yaml
  211  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  212  vim ansible.cfg
  213  vim user.yaml
  214  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  215  histo
  216  history
```