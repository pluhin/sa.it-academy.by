# Ansible playbook command
```
bash
## First playbook
ansible-playbook -i inv.yaml  playbok.yaml  --ask-vault-pass
## Second playbook
ansible-playbook -i inv.yaml  adduser.yaml  -e "new_user=bu" --ask-vault-pass
```
