## Ansible

```bash
  114  cd  ../
  115  mkdir 06.Ansible
  116  cd 06.Ansible/
  117  sudo apt update
  118  sudo apt install python3-pip
  119  clear
  120  sudo pip3 install ansible
  121  ansible --version
  122  vim ansibe.cfg
  123  vim inventory.yaml
  124  ansible-inventory -i inventory.yaml --graph
  125  ansible-inventory -i inventory.yaml --host=bastion
  126  ansible-inventory -i inventory.yaml --host=host36
  127  ssh jump_sa@178.124.206.53
  128  ssh-copy-id jump_sa@178.124.206.53
  129  ssh jump_sa@178.124.206.53
  130  ssh root@192.168.201.35 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  131  ssh root@192.168.202.35 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  132  ssh -v localhot
  133  vim ~/.ssh/config
  134  ssh -v localhost
  135  clear
  136  vim ~/.ssh/config
  137  ssh root@192.168.202.35
  138  vim ~/.ssh/config
  139  ssh root@192.168.202.35
  140  mkdir -p group_vars/all_workers
  141  vim group_vars/all_workers/vars.yaml
  142  ssh root@192.168.202.35
  143  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  144  sudo apt install sshpass
  145  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  146  vim inventory.yaml
  147  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  148  vim ~/.ssh/config
  149  vim ansibe.cfg
  150  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  151  ansible --version
  152  mv ansibe.cfg ansible.cfg
  153  ansible -i inventory.yaml -m ping all_workers -u root --ask-pass
  154  vim inventory.yaml
  155  vim group_vars/all_workers/vars.yaml
  156  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
  157  history | grep ansible
  158  ansible -i inventory.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  159  ansible -i inventory.yaml -m ping all_workers -u root
  160  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  161  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers -u root
  162  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers -u root
  163  ansible-vault create group_vars/all_workers/vault.yaml
  164  vim inventory.yaml
  165  vim group_vars/all_workers/vault.yaml
  166  ansible-vault edit  group_vars/all_workers/vault.yaml
  167  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
  168  ansible -i inventory.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers --ask-vault-pass
  169  ls -l
  170  vim first.yaml
  171  vim inventory.yaml
  172  vim first.yaml
  173  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  174  vim first.yaml
  175  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  176  SK [Print variables] **************************************************************************************************************************
  177  Monday 08 August 2022  17:37:14 +0000 (0:00:03.191)       0:00:03.223 *********
  178  ok: [host35] => {
  179  }
  180  ok: [host36] => {
  181  vim first.yaml
  182  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  183  vim first.yaml
  184  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t no_facts
  185  vim first.yaml
  186  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass -t no_facts
  187  vim first.yaml
  188  ansible-playbook -i inventory.yaml first.yaml --ask-vault-pass
  189  vim users.yaml
  190  ansible-playbook -i inventory.yaml users.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  191  history

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