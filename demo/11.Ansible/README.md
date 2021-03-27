
---
[Ansible variables](https://docs.ansible.com/ansible/2.9/user_guide/playbooks_variables.html)

```
    1  ls -l
    2  ansible --version
    3  mkdir ansible
    4  cd ansible/
    5  vim ansible.cfg
    6  ls 
    7  ansible --version
    8  vim hosts
    9  ansible-inventory -i hosts --graph
   10  ansible-inventory --graph
   11  ansible-inventory -i hosts --host jump_sa
   12  vim hosts 
   13  ansible-inventory -i hosts --host 192.168.202.9
   14  vim hosts 
   15  ssh-copy-id jump_sa@178.124.206.53
   16  ssh 'jump_sa@178.124.206.53'
   17  vim hosts 
   18  ansible -i hosts jump_sa 
   19  ansible -i hosts jump_sa -m ping
   20  vim hosts 
   21  ansible -i hosts jump_sa -m ping -u jump_sa
   22  vim ansible.cfg 
   23  ansible -i hosts jump_sa -m ping -u jump_sa
   24  ansible -i hosts jump_sa -m ping -u jump_sa --ask-pass
   25  vim hosts 
   26  ansible -i hosts ec -m ping -u root --ask-pass
   27  ansible -i hosts 192.168.202.3,192.168.202.202 -m ping -u root --ask-pass
   28  ansible -i hosts 192.168.202.3,192.168.202.202, -m ping -u root --ask-pass
   29  ansible -i hosts ec -m shell -a "cat /etc/os-release" -u root --ask-pass
   30  ansible -i hosts ec -m shell -a "service sshd restart" -u root --ask-pass
   31  ls
   32  ansible -i hosts ec -m copy -a "src=hosts dest=/tmp/" -u root --ask-pass
   33  vim ansible.cfg 
   34  ansible -i hosts ec -m copy -a "src=hosts dest=/tmp/" -u root --ask-pass -e "serial=1"
   35  ansible -i hosts ec -m copy -a "src=hosts dest=/tmp/" -u root --ask-pass --fork 1
   36  vim hosts 
   37  mkdir group_vars
   38  vim hosts 
   39  vim  group_vars/ec_all.yaml
   40  vim hosts 
   41  ansible-inventory -i hosts --host 192.168.202.3
   42  mkdir host_group
   43  mv host_group host_vars
   44  mkdir host_vars/jump
   45  vim host_vars/jump/vars.yaml
   46  ansible-inventory -i hosts --host jump_sa
   47  mv host_vars/jump host_vars/jump_sa
   48  ansible-inventory -i hosts --host jump_sa
   49  vim host
   50  vim hosts
   51  ansible -i hosts jump_sa -m shell -a "cat /etc/os-release && ls -l && env"
   52  ansible -i hosts jump_sa -m shell -a "cat /etc/os-release && ls -l && env" -u jump_sa
   53  vim hosts 
   54  ansible-vault create host_vars/jump_sa/vault.yaml
   55  cat host_vars/jump_sa/vault.yaml
   56  ansible-vault edit host_vars/jump_sa/vault.yaml
   57  ansible -i hosts jump_sa -m shell -a "cat /etc/os-release && ls -l && env"
   58  ansible -i hosts jump_sa -m shell -a "cat /etc/os-release && ls -l && env" --ask-vault-pass
   59  vim hosts 
   60  vim hosts hosts.yaml
   61  mv hosts hosts.yaml
   62  vim hosts.yaml 
   63  ansible-inventory -i hosts --host jump_sa
   64  ansible-inventory -i hosts.yaml --host jump_sa
   65  ansible-inventory -i hosts.yaml --host jump_sa --ask-vault-pass
   66  ansible-inventory -i hosts.yaml --graph --ask-vault-pass
   67  vim hosts.yaml 
   68  ansible-inventory -i hosts.yaml --graph --ask-vault-pass
   69  scp -r ../ansible/ spishchyk@192.168.1.25:/home/spishchyk/BK
   70  history
```