# 05 Ansible

```bash
   85  cd ../
   86  mkdir 05.Ansible
   87  cd 05.Ansible/
   88  sudo apt update
   89  sudo apt install python3-pip
   90  sudo pip3 install ansible
   91  ansible --version
   92  vim ansible.cfg
   93  inv.yaml
   94  vim inv.yaml
   95  ssh-copy-id jump_sa@178.124.206.53
   96  ssh jump_sa@178.124.206.53
   97  ssh root@192.168.202.40
   98  vim ~/.ssh/config
   99  ssh root@192.168.202.40
  100  vim ~/.ssh/config
  101* ssh root@192.168.202.4
  102  ssh root@192.168.202.40  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  103  vim inv.yaml
  104* mkdir -p group_vars/all_workers
  105  vim group_vars/all_workers/vars.yaml
  106  ansible-inventory -i inv.yaml --graph
  107  ansible-inventory -i inv.yaml --host=host39
  108  ansible-inventory -i inv.yaml --host=bastion
  109  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  110  sudo apt install sshpass
  111  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  112  vim inv.yaml
  113  ssh root@192.168.202.37  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  114  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  115  vim /home/vagrant/.ssh/known_hosts
  116  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  117  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  118  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers -u root
  119  ansible-vault create group_vars/all_workers/vault.yaml
  120  cat group_vars/all_workers/vault.yaml
  121  ansible-vault edit group_vars/all_workers/vault.yaml
  122  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  123  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers --ask-vault-pass
  124  vim first.yaml
  125  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  126  vin ansible.cfg
  127  vim ansible.cfg
  128  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass -t never
  129  vim first.yaml
  130  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  131  vim first.yaml
  132  ansible-playbook -i inv.yaml first.yaml --ask-vault-pass
  133  vim first.yaml
  134  vim user.yaml
  135  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  136  vim user.yaml
  137  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  138  ansible-playbook -i inv.yaml user.yaml -e user_to_add=plu --ask-vault-pass
  139  cp ~/.ssh/config ./
  140  ls
  141  history
```