## Homework Assignment 1: Setting Up Ansible

- Playbook file: `playbooks/hello.yaml`
- Run the playbook: `ansible-playbook -i inv.yaml playbooks/hello.yaml --ask-pass`
## Homework Assignment 2: Managing Remote Hosts

- Playbook file: `playbooks/install-netstat.yaml`
- Run the playbook: `ansible-playbook -i inv.yaml playbooks/install-netstat.yaml --ask-vault-pass`
## Homework Assignment 3: Managing Users and Groups

- Playbook files: 
	- `playbooks/manage-users.yaml`
	- `playbooks/verify-users.yaml`