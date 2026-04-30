```bash
  157  mkdir 05.Ansible
  158  cd 05.Ansible/
  159  l
  160  la
  161  sudo apt update
  162  sudo apt install -yqq python3-pip
  163  pip3 install ansible
  164  ansible --version
  165  find ../ name ansible
  166  ls -l ../.local/bin/ansible
  167  vim ~/.bashrc
  168  vim ~/.profile
  169  source ~/.profile
  170  ansible --version
  171  ssh-copy-id -p 32511 jump_sa@178.124.206.53
  172  ssh -p '32511' 'jump_sa@178.124.206.53'
  173  vim ~/.ssh/config
  174  ssh root@192.168.202.15
  175  ssh root@192.168.202.15 -vvvv
  176  vim ~/.ssh/config
  177  vim inv.yaml
  178  ansible-inventory -i inv.yaml --graph
  179  ansible-inventory -i inv.yaml --host host15
  180  ansible-inventory -i inv.yaml --hostbastion
  181  ansible-inventory -i inv.yaml --host bastion
  182  mkdir -p group_vars/all_workers
  183  ansible-inventory -i inv.yaml --graph
  184  vim group_vars/all_workers/vars.yaml
  185  ansible-inventory -i inv.yaml --host host15
  186  vim ansible.cfg
  187  sudo apt install sshpass
  188  ansible -i inv.yaml -m ping -u root all_wokers --ask_pass
  189  ansible -i inv.yaml -m ping -u root all_wokers --ask-pass
  190  vi inv.yaml
  191  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  192  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  193  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers
  194  ansible -i inv.yaml -m ping -u root all_workers
  195  vim inv.yaml
  196  ansible-vault create group_vars/all_workers/vault.yaml
  197  cat group_vars/all_workers/vault.yaml
  198  ansible-vault edit group_vars/all_workers/vault.yaml
  199  ansible -i inv.yaml -m ping all_workers
  200  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  201  vim first.yaml
  202  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  203  cat ansible.cfg
  204  vim first.yaml
  205  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass -t no_facts
  206  vim user.yaml


  207  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  208  history
```