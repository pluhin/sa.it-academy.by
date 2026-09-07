# 07.Ansible.Start

## Assignment 1: Setting Up Ansible
* **Installation:** Installed Ansible using the system package manager (`sudo apt install ansible`).
* **Execution:** Created `playbook_1.yml` and executed it locally using `ansible-playbook playbook_1.yml`.
* **Result:** The console successfully outputted "Hello, Ansible!".

## Assignment 2: Managing Remote Hosts
* **Inventory:** Defined connection details in YAML format (`inventory.yml`).
* **Execution:** Ran `ansible-playbook -i inventory.yml playbook_2.yml` to install `htop`.


## Assignment 3: Managing Users and Groups
* **Playbook:** Created `playbook_3.yml` with parameterized variables for username and group.
* **Security & Encryption:** 
  * Sensitive user passwords are encrypted using **Ansible Vault** inside `vars_secret.yml` to prevent leaking plain text data into Git.

### How to Run Playbook 3 with Custom Parameters
Execute the playbook by passing the vault decryption flag and specifying your custom user and group:
```bash
ansible-playbook -i inventory.yml playbook_3.yml --ask-vault-pass -e "target_user=dev target_group=developers"
```
