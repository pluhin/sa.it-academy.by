# 05. Ansible start

``` bash
sudo apt update
sudo apt install ansible
ansible --version
mkdir 05.ansible
cd 05.ansible/
nano hello.yaml
ansible-playbook hello.yaml 
nano README.md
ssh-keygen -t ed25519 -C "ztsv.aleksei@gmail.com" -f ~/.ssh/ztsv_ansible
ssh-copy-id -i ~/.ssh/ztsv_ansible.pub  -p 32511 jump_sa@178.124.206.53
nano ~/.ssh/config
ssh-copy-id -i ~/.ssh/ztsv_ansible.pub root@192.168.202.7
ssh-copy-id -i ~/.ssh/ztsv_ansible.pub root@192.168.202.8
ssh root@192.168.202.7
ssh root@192.168.202.8
nano install_tools.yaml
nano inventory.yaml
ansible-playbook install_tools.yaml -k -K
ansible all_workers -m shell -a "which nmap traceroute ifconfig" -k
mkdir -p group_vars/all_workers
ansible-vault create group_vars/all_workers/vault.yaml
nano group_vars/all_workers/vars.yaml
nano users.yaml
ansible-playbook users.yaml -k --ask-vault-pass
ansible-playbook users.yaml -k --ask-vault-pass -e "user_name=user user_group=dev"
ansible all_workers -m shell -a "id user && grep user /etc/passwd && grep -E 'students|dev' /etc/group" -k --ask-vault-pass
```
