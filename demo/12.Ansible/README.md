```bash
10847  cd demo/12.Ansible
10848  ansible-playbook -i hosts.yaml play.yaml
10849  ansible-playbook -i hosts.yaml play.yaml --ask-vaul-pass
10850  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass
10851  ansible --version
10852  cp /home/spishchyk/.ansible.cfg ./
10853  mv .ansible.cfg ansible.cfg
10854  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass
10855  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t vars
10856  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t facts::print_one
10857  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass -t check::inv
10858  ansible-playbook -i hosts.yaml play.yaml --ask-vault-pass --skip-tags facts
10859  ansible-playbook -i hosts.yaml user_add.yaml -e "group=ec user_to_add=plu" --ask-vault-pass
```