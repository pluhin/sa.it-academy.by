```bash
  159  cd 05.Ansible/
  160  ls
  161  sudo apt update
  162  sudo apt install python3-pip
  163  sudo pip3 install ansible
  164  ansible --verssion
  165  ansible --version
  166  vim inv.yaml
  167  ssh-copy-id -p 32511 jump_sa@178.124.206.53
  168  ssh -p '32511' 'jump_sa@178.124.206.53'
  169  vim ~/.ssh/config
  170  ssh root@192.168.202.9
  171  ssh root@192.168.202.9 -vvvv
  172  vim ~/.ssh/config
  173  mkdir -p group_vars/all_workers
  174  vim group_vars/all_workers/vars.yaml
  175  ansible-inventory -i inv.yaml
  176  ansible-inventory -i inv.yaml --graph
  177  ansible-inventory -i inv.yaml --host host9
  178  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  179  sudo apt install sshpass
  180  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  181  vim ansible.cfg
  182  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  183  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  184  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers
  185  ansible -i inv.yaml -m ping -u root all_workers
  186  vim inv.yaml
  187  ansible-vault create group_vars/all_workers/vault.yaml
  188  cat  group_vars/all_workers/vault.yaml
  189  ansible-vault edit group_vars/all_workers/vault.yaml
  190  ansible -i inv.yaml -m ping all_workers
  191  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  192  vim first.yaml
  193  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  194  vim user.yaml
  195  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  196  history
```