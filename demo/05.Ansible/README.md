## 05.Ansible
```bash
  225  mkdir 05.Ansible
  226  cd 05.Ansible/
  227  ls
  228  sudo apt update
  229  sudo apt install python3-pip
  230  clear
  231  sudo pip3 install ansible
  232  ansible -version
  233  ansible --version
  234  ls -al
  235  vim inv.yaml
  236  ansible-inventory -i inv.yaml --graph
  237  ansible-inventory -i inv.yaml --host host25
  238  ansible-inventory -i inv.yaml --host bastion
  239  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  240  ssh -p 32510 jump_sa@178.124.206.53
  241  vim ~/.ssh/config
  242  ssh root@192.168.202.25
  243  ssh root@192.168.202.25 -vvvv
  244  vim ~/.ssh/config
  245  ssh root@192.168.202.25 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53  -p 32510"
  246  vim ansible.cfg
  247  sudo apt install sshpass
  248  claer
  249  clear
  250  ansible -i inv.yaml -m ping -u root all_workers --ask-pass
  251  ansible -i inv.yaml -m authorized_key -a "user=root key={{lookup('file', '~/.ssh/id.pub\') }}" -u root all_workers --ask-pass
  252  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id.pub') }}\"" -u root all_workers --ask-pass
  253  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers --ask-pass
  254  ansible -i inv.yaml -m authorized_key -a "user=root key=\"{{lookup('file', '~/.ssh/id_rsa.pub') }}\"" -u root all_workers
  255  mkdir -p group_vars/all_workers
  256  vim group_vars/all_workers/vars.yaml
  257  ansible -i inv.yaml -m ping all_workers
  258  vim group_vars/all_workers/vars.yaml
  259  ansible -i inv.yaml -m ping all_workers
  260  ansible-vault create group_vars/all_workers/vault.yaml
  261  ansible -i inv.yaml -m ping all_workers
  262  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  263  ansible-vault edit group_vars/all_workers/vault.yaml
  264  cat group_vars/all_workers/vault.yaml
  265  vim first.yaml
  266  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  267  vim ansible.cfg
  268  vim first.yaml
  269  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  270  vim first.yaml
  271  vim inv.yaml
  272  vim first.yaml
  273  vim user.yaml
  274  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  275  vim user.yaml
  276  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  277  free
  278  cat /proc/cpuinfo
  279  history
  ```