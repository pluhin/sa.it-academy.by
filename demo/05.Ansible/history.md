```bash
 490  mkdir 03.Ansible
  491  cd 03
  492  cd 03.Ansible
  493  mkdir 02
  494  cd 02
  495  mkdir {group_vars,inventory}
  496  ls
  497  vim inventory/main.yaml
  498  mkdir group_vars/all
  499  ansible-vault create group_vars/all/vault.yaml
  500  ansible-inventory --graph
  501  ansible-inventory --graph -i inventory/main.yaml
  502  ansible-inventory --host=sa_cent -i inventory/main.yaml
  503  ansible-inventory --host=sa_cent -i inventory/main.yaml --ask-vault-pass
  504  ansible -m ping -i inventory/main.yaml all
  505  ansible -m ping -i inventory/main.yaml all --ask-vault-pass
  506  vim inventory/main.yaml
  507  ansible-inventory --graph -i inventory/main.yaml
  508  vim play.yaml
  509  ansible-playbook play.yaml -i inventory/main.yaml
  510  export ANSIBLE_VAULT=pluplu
  511  env | grep AN
  512  echo "$ANSIBLE_VAULT" | ansible-playbook play.yaml -i inventory/main.yaml --ask-vault-pass
  513  echo "$ANSIBLE_VAULT"
  514  echo "$ANSIBLE_VAULT" | ansible-playbook play.yaml -i inventory/main.yaml --ask-vault-pass
  515  ansible-playbook play.yaml -i inventory/main.yaml --ask-vault-pass
  516  pluplu > ~/.ansible_vault
  517  echo pluplu > ~/.ansible_vault
  518  cat ~/.ansible
  519  cat ~/.ansible_vault
  520  chmod 600 ~/.ansible_vault
  521  ls  ~/.ansible_vault
  522  ls  ~/.ansible_vault -l
  523  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file
  524  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault
  525  vim play.yaml
  526  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t facts_check
  527  vim play.yaml
  528  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t facts_check
  529  vim play.yaml
  530  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t short_facts
  531  vim play.yaml
  532  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t inventory::check
  533  vim play.yaml
  534  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t inventory::check
  535  vim play.yaml
  536  wq
  537  vim play.yaml
  538  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t inventory::check
  539  vim play.yaml
  540  ansible-playbook play.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -t inventory::check
  541  vim add_user.yaml
  542  ansible-playbook add_user.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault
  543  vim add_user.yaml
  544  ansible-playbook add_user.yaml -i inventory/main.yaml --vault-password-file ~/.ansible_vault -e "user_to_add=pluhin" -b
  545  mc
  546* cd /tmp
  547* cd sa.it-academy.by
  548* git pull
  549* cp /home/plu/projects/m-sa2-08-19/03.Ansible demo -r
  550* ls demo
  551* git add demo/03.Ansible
  552* git commit -m "Ansible02"
```

