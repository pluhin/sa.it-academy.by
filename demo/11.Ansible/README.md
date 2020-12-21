```bash

10542  ansible --version
10543  vim  /etc/ansible/ansible.cfg
10544  ansible-playbook --version
10545  ansible-inventory --version
10546  vim  /etc/ansible/ansible.cfg
10547  vim  /home/spishchyk/.ansible.cfg
10548  vim /etc/ansible/hosts
10549  sudo vim  /etc/ansible/hosts
10550  ansible-inventory --graph
10551  ansible-inventory --host jump_sa
10552  sudo vim  /etc/ansible/hosts
10553  sudo vim  /etc/ansible/host_vars/jump_sa.yaml
10554  ansible-inventory --host 192.168.203.1
10555  ansible-inventory --host 192.168.202.1
10556  sudo mkdir  /etc/ansible/group_vars
10557  sudo mkdir  /etc/ansible/group_vars/ec_all
10558  sudo vim  /etc/ansible/group_vars/ec_all/settings.yaml
10559  ansible-inventory --host 192.168.202.1
10560  ansible-inventory --host jump_sa
10561  ansible ec -m ping 
10562  ansible ec -m ping sh-keygen -f "/home/spishchyk/.ssh/known_hosts" -R "192.168.202.2"
10563  ssh-keygen -f "/home/spishchyk/.ssh/known_hosts" -R "192.168.202.2"
10564  ansible ec -m ping 
10565  ansible ec -m ping -u root --ask-pass
10566  vim /home/spishchyk/.ansible.cfg
10567  sudo vim  /etc/ansible/ansible.cfg
10568  ansible ec -m ping -u root --ask-pass
10569  sudo vim  /etc/ansible/ansible.cfg
10570  ansible ec -m ping -u root --ask-pass
10571  vim .ssh/config
10572  vim ~/.ssh/config
10573  sudo vim  /etc/ansible/ansible.cfg
10574  vim /home/spishchyk/.ansible.cfg
10575  ansible ec -m ping -u root --ask-pass
10576  vim /home/spishchyk/.ansible.cfg
10577  ansible ec -m ping -u root --ask-pass
10578  vim /home/spishchyk/.ansible.cfg
10579  ansible ec -m ping -u root --ask-pass
10580  vim /home/spishchyk/.ansible.cfg
10581  export ANSIBLE_CONFIG=/etc/ansible/ansible.cfg
10582  ansible --version
10583  ansible ec -m ping -u root --ask-pass
10584  sudo vim  /etc/ansible/ansible.cfg
10585  ansible ec -m ping -u root --ask-pass
10586  ssh root@192.168.202.2
10587  ansible ec -m ping -u root --ask-pass
10588* history | grep "ansuble "
10589* history | grep "ansible "
10590  ansible ec -m ping -u root --ask-pass
10591  sudo vim  /etc/ansible/group_vars/ec_all/settings.yaml
10592  ansible ec -m ping
10593  ansible 192.168.202.2, -m ping
10594  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /etc/os-release"
10595  tim ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /etc/os-release"
10596  time ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /etc/os-release"
10597  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /etc/os-release" -vvvv
10598  ansible 192.168.202.1,192.168.202.2, -m shell -a "service sshd restart" -vvvv
10599  ansible 192.168.202.1,192.168.202.2, -m shell -a "service sshd restart"
10600  ansible 192.168.202.1,192.168.202.2, -m shell -a "service sshdd restart"
10601  ls
10602  git pull
10603  ansible 192.168.202.1,192.168.202.2, -m copy -a "src=first.groovy dest=/tmp/"
10604  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy"
10605  history
10606  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy && ls -l /tmp"
10607  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy && ls -l /tmp && env"
10608  sudo vim  /etc/ansible/group_vars/ec_all/settings.yaml
10609  sudo ansible-vault creaate  /etc/ansible/group_vars/ec_all/vault.yaml
10610  sudo ansible-vault create  /etc/ansible/group_vars/ec_all/vault.yaml
10611  sudo cat  /etc/ansible/group_vars/ec_all/vault.yaml
10612  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy && ls -l /tmp && env"
10613  ls -l /etc/ansible/group_vars/ec_all/vault.yaml
10614  sudo chmod 644 /etc/ansible/group_vars/ec_all/vault.yaml
10615  ls -l /etc/ansible/group_vars/ec_all/vault.yaml
10616  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy && ls -l /tmp && env"
10617  ansible 192.168.202.1,192.168.202.2, -m shell -a "cat /tmp/first.groovy && ls -l /tmp && env" --ask-vault-pass
10618  cd ../
10619  mkdir 11.Ansible
10620  cd 11.Ansible

```
