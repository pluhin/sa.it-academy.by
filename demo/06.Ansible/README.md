# Ansible

```bash
   82  mkdir ansible
   83  cd ansible/
   84  ls
   85  sudo apt update
   86  sudo apt install python3-pip
   87  sudo pip3 install ansible
   88  clear
   89  ansible --version
   90  vim ansible.cfg
   91  vim inventory.yaml
   92  ansible-inventory -i inventory.yaml --graph
   93  vim inventory.yaml
   94  ansible-inventory -i inventory.yaml --graph
   95  vim inventory.yaml
   96  ssh-copy-id jump_sa@178.124.206.53
   97  ssh jump_sa@178.124.206.53
   98  ssh -v
   99  ssh -v localhost
  100  clear
  101  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  102  sudo apt install sshpass
  103  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  104  vim ~/.ssh/confing
  105  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  106  mv ~/.ssh/confing ~/.ssh/config
  107  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  108  vim ~/.ssh/config
  109  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  110  vim inventory.yaml
  111  mkdir group_vars/all_workers -p
  112  ll
  113  ll group_vars/
  114  vim group_vars/all_workers/vars.yaml
  115  ssh root@192.168.201.29 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  116  vim group_vars/all_workers/vars.yaml
  117  vim inventory.yaml
  118  ansible-inventory -i inventory.yaml --graph
  119  ansible-inventory -i inventory.yaml --host=host29
  120  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  121  vim ~/.ssh/config
  122  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  123  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  124  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  125  vim group_vars/all_workers/vars.yaml
  126  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  127  ansible-vault create group_vars/all_workers/vault.yaml
  128  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  129  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers --ask-vault-pass
  130  vim group_vars/all_workers/vault.yaml
  131  ansible-vault edit group_vars/all_workers/vault.yaml
  132  clear
  133  vim first.yaml
  134  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  135  vim first.yaml
  136  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  137  vim first.yaml
  138  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  139  vim first.yaml
  140  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  141  vim first.yaml
  142  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t no_facts
  143  vim first.yaml
  144  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t no_facts
  145  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t facts
  146  vim first.yaml
  147  vim ansible.cfg
  148  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t facts
  149  vim first.yaml
  150  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t facts
  151  vim first.yaml
  152  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  153  vim first.yaml
  154  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  155  vim first.yaml
  156  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  157  vim users.yaml
  158  ansible-playbook -i inventory.yaml users.yaml -e group=all_workers user_to_add=plu --ask-vault-pass
  159  ansible-playbook -i inventory.yaml users.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  160  history
```

---

## ~/.ssh/config

```
#Host ec_bastion
#        User jump_sa
#        HostName 178.124.206.53
#Host 192.168.201.* 192.168.202.* 192.168.203.*
#        ProxyJump ec_bastion
```