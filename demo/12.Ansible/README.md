```bash

10886  mkdir 12.Ansible
10887  mc
10888  cd 12.Ansible
10889  ansible-inventory -i hosts.yaml --host worker_01 --ask-vault-pass
10890  ansible-inventory -i hosts.yaml --graphs
10891  ansible-inventory -i hosts.yaml --graph
10892  ansible-inventory -i hosts.yaml --graph --ask-vault-pass
10893  ansible-inventory -i hosts.yaml --host worker_01 --ask-vault-pass
10894  ansible-inventory -i hosts.yaml --graph --ask-vault-pass
10895  clear
10896  ansible-playbook -i hosts.yaml
10897  ansible-playbook -i hosts.yaml play.yaml
10898  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass
10899  history| grep "ANSIBLE"
10900  export ANSIBLE_CONFIG=/home/spishchyk/.ansible.cfg
10901  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass
10902  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass 
10903  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t host::vars
10904  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass 
10905  vim ansible.cfg
10906  ansible-playbook -i hosts.yaml add_user.yaml -e  group=ec -e user_to_add=bob --ask-vault-pass

```
