## History

```bash
  328  mkdir 07.Ansible
  329  cd 07.Ansible/
  330  sudo apt update
  331  sudo apt install -yqq python3-pip
  332  pip3 install ansible
  333  ansible --version
  334  ansible
  335  vim .bashrc
  336  vim .profile
  337  cd 07.Ansible/
  338  ls
  339  vim ansible.cfg
  340  vim inv.yaml
  341  mkdir -p group_vars/all_workers
  342  vim group_vars/all_workers/var.yaml
  343  vim inv.yaml
  344  ansible-inventory -i inv.yaml --graph
  345  ansible-inventory -i inv.yaml --host bastion
  346  vim group_vars/all_workers/var.yaml
  347  ansible-inventory -i inv.yaml --host host09
  348  ansible -i inv.yaml -m ping -u root all_workers
  349  yes
  350  ansible -i inv.yaml -m ping -u root all_workers
  351  cd 07.Ansible/
  352  ansible -i inv.yaml -m ping -u root all_workers
  353  ssh -p '32511' 'jump_sa@178.124.206.53'
  354  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" bastion --ask-pass
  355  sudo apt install sshpass
  356  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" bastion --ask-pass
  357  vim inv.yaml
  358  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" bastion --ask-pass
  359  ansible -i inv.yaml -m authorized_key -a "user=jump_sa key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" bastion --ask-pass
  360  ansible -i inv.yaml -m ping -u root all_workers
  361  ansible-vault create group_vars/all_workers/vault.yaml
  362  cat group_vars/all_workers/vault.yaml
  363  ansible-vault edit group_vars/all_workers/vault.yaml
  364  ansible -i inv.yaml -m ping -u root all_workers
  365  ansible -i inv.yaml -m ping -u root all_workers --ask-vault-pass
  366  vim first.yaml
  367  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  368  vim ansible.cfg
  369  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  370  vim first.yaml
  371  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  372  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass -t never
  373  vim first.yaml
  374  vim user.yaml
  375  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  376  history
```