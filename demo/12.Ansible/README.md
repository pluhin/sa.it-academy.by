```bash

   80  cd ansible/
   81  ls
   82  vim hosts.yaml 
   83  vim play.yaml
   84  ansible-playbook play.yaml -i hosts.yaml -u root --ask-pass --ask-vault-pass
   85  ssh-copy-id root@192.168.202.24
   86  vim play.yaml
   87  ansible-playbook play.yaml -i hosts.yaml -u root --ask-pass --ask-vault-pass
   88  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass
   89  vim play.yaml
   90  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass
   91  vim play.yaml
   92  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass
   93  vim play.yaml
   94  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass
   95  vim play.yaml
   96  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass
   97  vim play.yaml
   98  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass -t local_vars
   99  vim play.yaml
  100  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags       tags:
  101  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  102  vim play.yaml
  103  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  104  vim hosts.yaml 
  105  vim play.yaml
  106  vim hosts.yaml 
  107  vim play.yaml
  108  vim hosts.yaml 
  109  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  110  vim hosts.yaml 
  111  vim play.yaml
  112  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  113  vim play.yaml
  114  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  115  vim play.yaml
  116  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass --skip-tags remote_vars
  117  vim play.yaml
  118  cp play.yaml user.yaml
  119  vim user.yaml 
  120  ansible-playbook play.yaml -i hosts.yaml -u root --ask-vault-pass -e group=ec2 -e user_to_add=plu
  121  ansible-playbook user.yaml -i hosts.yaml -u root --ask-vault-pass -e group=ec2 -e user_to_add=plu
  122  vim user.yaml 
  123  ansible-playbook user.yaml -i hosts.yaml -u root --ask-vault-pass -e group=ec2 -e user_to_add=plu
  124  vim user.yaml 
  125  history | grep scp
  126  scp -r ../ansible/ spishchyk@192.168.1.25:/home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/12.Ansible
  127  history 
```