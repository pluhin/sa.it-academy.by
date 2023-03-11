# 05.Ansible

```bash
  662  mkdir 05.Ansible
  663  cd 05.Ansible/
  664  ls -la
  665  sudo visudo
  666  sud -i
  667  sudo -i
  668  sudo apt update
  669  sudo install python3-pip
  670  sudo install python3-pip
  671  sudo apt install python3-pip
  672  sudo pip3 install ansible
  673  ansible --ver
  674  ansible --version
  675  ls -la
  676  vim ansible.cfg
  677  ls -la
  678  vim ansible.cfg
  679  ls -la
  680  ansible --version
  681  sudo apt update
  682  apt list --upgradable
  683  ls -la
  684  ls
  685  cat inv.yaml
  686  ssh-copy-id jump_sa@178.124.206.53
  687  ssh 'jump_sa@178.124.206.53'
  688  vim ~/.ssh/config
  689  ssh root@192.168.202.25
  690  ssh root@192.168.202.26
  691  mkdir -p group_vars/all_workers
  692  ls -l group_vars/
  693  vim group_vars/all_workers/vars.yaml
  694  vim ~/.ssh/config
  695  ansible-inventory -i inv.yaml --graph
  696  ssh root@192.168.202.26
  697  vim ~/.ssh/config
  698  ssh root@192.168.202.26
  699  vim ~/.ssh/config
  700  ssh root@192.168.202.26
  701  ssh-keygen -f "/home/dzmtr_k/.ssh/known_hosts" -R "192.168.202.26"
  702  ssh root@192.168.202.26
  703  vim ~/.ssh/config
  704  ansible-inventory -i inv.yaml --graph
  705  ansible-inventory -i inv.yaml --host host25
  706  ansible-inventory -i inv.yaml --host bastion
  707  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  708  sudo apt install sshpass
  709  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  710  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  711  ansible -i inv.yaml -m ping all_workers -u root
  712  vim inv.yaml
  713  ansible-vault create group_vars/all_workers/vault.yaml
  714  cat group_vars/all_workers/vault.yaml
  715  ansible-vault edit group_vars/all_workers/vault.yaml
  716  ansible -i inv.yaml -m ping all_workers
  717  vim ansible.cfg
  718  ansible -i inv.yaml -m ping all_workers
  719  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  720  ls -la
  721  vim first.yaml
  722  ls group_vars/all_workers/
  723  cat group_vars/all_workers/
  724  cat group_vars/all_workers/*
  725  cat group_vars/all_workers/vars.yaml
  726  cat group_vars/all_workers/vault.yaml
  727  ls -la
  728  vim first.yaml
  729  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  730  vim first.yaml
  731  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  732  vim first.yaml
  733  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  734  vim first.yaml
  735  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  736  vim first.yaml
  737  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  738  ls -la
  739  vim README.md
  740  history
  
```

"~/.ssh/config"

```

#Host ec_bastion
#    User jump_sa
#    HostName 178.124.206.53
#Host 192.168.202.26 192.168.203.11 192.168.202.25 192.168.201.11
#   ProxyJump ec_bastion

```