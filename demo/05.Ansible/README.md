## Ansible 

```bash
  172  mkdir 05.Ansible
  173  cd 05.Ansible/
  174  ls
  175  vim inv.yaml
  176  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  177  ssh -p '32510' 'jump_sa@178.124.206.53'
  178  ansible-inventory -i inv.yaml --graph
  179  ansible-inventory -i inv.yaml --host host25
  180  ansible-inventory -i inv.yaml --host bastion
  181  vim ~/.ssh/config
  182  ssh root@192.168.202.25
  183  ssh root@192.168.202.25 --vvvv
  184  ssh root@192.168.202.25 -vvvv
  185  vim ansible.cfg
  186  ssh apt install sshpass
  187  sudo apt install sshpass
  188  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  189  vim ~/.ssh/config
  190  ssh root@192.168.202.25 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"
  191  vim inv.yaml
  192  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  193  ansible -i inv.yaml -m ping -u root all_workers --ask-pass -vvvv
  194  clear
  195  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  196  ansible -i inv.yaml -m ping -u root all_workers
  197  vim inv.yaml
  198  mkdir -p group_vars/all_workers
  199  vim group_vars/all_workers/var.yaml
  200  vim inv.yaml
  201  ansible -i inv.yaml -m ping -u root all_workers
  202  ls
  203  ls group_vars/
  204  ansible-vault create group_vars/all_workers/vault.yaml
  205  catr group_vars/all_workers/vault.yaml
  206  cat group_vars/all_workers/vault.yaml
  207  ansible-vault edit group_vars/all_workers/vault.yaml
  208  cat group_vars/all_workers/vault.yaml
  209  ansible -i inv.yaml -m ping all_workers
  210  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  211  vim first.yaml
  212  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  213  vim first.yaml
  214  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  215  vim first.yaml
  216  history
  217  vim user.yaml
  218  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  219  vim user.yaml
  220  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  221  history  
```