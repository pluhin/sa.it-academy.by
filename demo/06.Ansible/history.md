```bash
 2080  cd /tmp/sa.it-academy.by
 2081  git pull
 2082  cd demo
 2083  ls
 2084  mkdir 06.Ansible
 2085  cd 06.Ansible
 2086  ls
 2087  vim inv.yaml
 2088  ansible-inventory -i inv.yaml --graph
 2089  mkdir {group_vars,host_vars}
 2090  mkdir group_vars/all
 2091  vim inv.yaml
 2092  ansible-vault create group_vars/all/vault.yaml
 2093  vim inv.yaml
 2094  ansible -m ping -i inv.yaml --ask-vault-pass
 2095  ansible all -m ping -i inv.yaml --ask-vault-pass
 2096  vim inv.yaml
 2097  ls -l
 2098  vim first.yaml
 2099  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass
 2100  vim first.yaml
 2101  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass
 2102  vim first.yaml
 2103  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass
 2104  vim first.yaml
 2105  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass
 2106  vim first.yaml
 2107  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass
 2108  vim first.yaml
 2109  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass -t vars
 2110  vim first.yaml
 2111  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass --skip-tags short_facts
 2112  vim first.yaml
 2113  ansible-playbook first.yaml -i inv.yaml --ask-vault-pass --list-tags
 2114  ls
 2115  vim add_user.yaml
 2116  ansible-playbook add_user.yaml -e "user_to_add=plu" -i inv.yaml --ask-vault-pass
 2117  ansible-playbook add_user.yaml -e "user_to_add=plu" -i inv.yaml --ask-vault-pass -b
```
