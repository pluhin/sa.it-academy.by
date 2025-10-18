```bash
 164  mkdir 05.Ansible
  165  cd 05.Ansible/
  166  sudo apt update
  167  sudo apt install python3-pip
  168  sudo pip3 install ansible
  169  ansible --version
  170  vim inv.yaml
  171  clear
  172  vim ~/.ssh/config
  173  ssh-copy-id -p 32511 jump_sa@178.124.206.53
  174  ssh -p '32511' 'jump_sa@178.124.206.53'
  175  clear
  176  ssh root@192.168.202.19
  177  ssh root@192.168.202.19 -vvvvvv
  178  vim ~/.ssh/config
  179  ansible-inventory -i inv.yaml --graph
  180  ansible-inventory -i inv.yaml --host=bastion
  181  vim ~/.ssh/config
  182  clear
  183  vim group_vars/all_workers/vars.yaml
  184  vim ansible.cfg
  185  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  186  sudo apt install sshpass
  187  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  188  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  189  ansible -i inv.yaml -m ping -u root all_workers
  190  ansible-vault create group_vars/all_workers/vault.yaml
  191  cat group_vars/all_workers/vault.yaml
  192  ansible-vault edit  group_vars/all_workers/vault.yaml
  193  ansible -i inv.yaml -m ping all_workers
  194  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  195  vim first.yaml
  196  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  197  vim user.yaml
  198  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  199  history
```