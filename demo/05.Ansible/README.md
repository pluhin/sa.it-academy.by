```bash
  244  cd 05.Ansible/
  245  ls
  246  sudo apt update
  247  sudo apt install python3-pip
  248  sudo pip3 install ansible
  249  ansible --version
  250  vim inv.yaml
  251  ssh-copy-id jump_sa@178.124.206.53
  252  ssh-copy-id jump_sa@178.124.206.53 -p 33211
  253  ssh-copy-id jump_sa@178.124.206.53:33211
  254  ssh-copy-id jump_sa@178.124.206.53 -p 33211
  255  ssh-copy-id jump_sa@178.124.206.53 -p 33210
  256  ssh-copy-id -p 33210 jump_sa@178.124.206.53
  257  ssh-copy-id -p 33211 jump_sa@178.124.206.53
  258  ssh-copy-id -p 32510 jump_sa@178.124.206.53
  259  ssh jump_sa@178.124.206.53
  260  ssh jump_sa@178.124.206.53 -p 32510
  261  vim inv.yaml
  262  vim ~/.ssh/config
  263  ssh root@192.168.202.33
  264  vim inv.yaml
  265  ssh root@192.168.201.15
  266  ssh root@192.168.201.15 -vvvvv
  267  vim ~/.ssh/config
  268  ssh root@192.168.201.15 -vvvvv
  269  ssh root@192.168.201.15   -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510"
  270  ssh root@192.168.201.15   -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53 -p 32510" -vvv
  271  ls
  272  ls -la
  273  mkdir -p group_vars/all_workers
  274  vim inv.yaml
  275  vim group_vars/all_workers/vars.yaml
  276  ansible-inventory -i inv.yaml --graph
  277  ansible-inventory -i inv.yaml --host bastion
  278  ansible-inventory -i inv.yaml --host host15
  279  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  280  sudo apt install  sshpass
  281  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  282  vim ansible.cfg
  283  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  284  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  285  ansible -i inv.yaml -m ping all_workers -u root
  286  ansible-vault create group_vars/all_workers/vault.yaml
  287  vim inv.yaml
  288  ansible-vault edit group_vars/all_workers/vault.yaml
  289  cat group_vars/all_workers/vault.yaml
  290  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  291  ansible -i inv.yaml -m ping all_workers
  292  ls -l
  293  vim first.yaml
  294  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  295  vim first.yaml
  296  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  297  vim user.yaml
  298  vim first.yaml
  299  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  300  cat ansible.cfg
  301  vim first.yaml
  302  vim user.yaml
  303  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  304  history
```