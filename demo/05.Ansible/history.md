```bash
 1987  clear
 1988  sudo yum install ansible
 1989  sudo pip install ansible
 1990  ansible -V
 1991  ansible --version
 1992  sudo vim /etc/ansible/hosts
 1993  vim /etc/ssh/ssh_config
 1994  ssh jump_sa@178.124.206.48
 1995  vim /etc/ssh/ssh_config
 1996  ssh root@192.168.254.50
 1997  ssh --version
 1998  ssh -v
 1999  yum install ssh
 2000  sudo yum info open-ssh
 2001  sudo yum info ssh
 2002  sudo yum info openssh
 2003  vim /etc/ssh/ssh_config
 2004  ansible-inventory --grap
 2005  ansible-inventory --graph
 2006  ansible 178.124.206.48 -m ping
 2007  ansible ec_htp -m ping
 2008  sudo vim /etc/ansible/hosts
 2009  ansible ec_htp -m ping
 2010  ansible all -m shell -a 'cat /etc/os-release'
 2011  ls
 2012  vim utl.base
 2013  vim ssh_config
 2014  date > file.txt
 2015  ls
 2016  ansible all -m copy -a  "src=file.txt dest=/tmp/"
 2017  ansible all -m shell -a 'cat /tmp/file.txt'
 2018  ansible-inventory --host cent_01
 2019  sudo mkdir /etc/ansible/{group_vars,host_vars}
 2020  ls -l /etc/ansible
 2021  sudo  vim /etc/ansible/host
 2022  sudo  vim /etc/ansible/hosts
 2023  sudo mkdir /etc/ansible/group_vars/ec_htp
 2024  sudo vim /etc/ansible/group_vars/ec_htp/variables.yaml
 2025  sudo  vim /etc/ansible/hosts
 2026  sudo vim /etc/ansible/group_vars/ec_htp/variables.yaml
 2027  sudo  vim /etc/ansible/hosts
 2028  ansible-inventory --host=cent_01
 2029  sudo  vim /etc/ansible/hosts
 2030  sudo vim /etc/ansible/group_vars/ec_htp/variables.yaml
 2031  sudo mkdir /etc/ansible/group_vars/ec_htp_internal
 2032  sudo  vim /etc/ansible/hosts
 2033  ansible-vault create /etc/ansible/group_vars/ec_htp_internal/vault.yaml
 2034  sudo ansible-vault create /etc/ansible/group_vars/ec_htp_internal/vault.yaml
 2035  sudo vim /etc/ansible/group_vars/ec_htp_internal/vault.yaml
 2036  sudo ansible-vault edit /etc/ansible/group_vars/ec_htp_internal/vault.yaml
 2037  ansible all -m shell -a 'cat /tmp/file.txt'
 2038  ls -l /etc/ansible/group_vars
 2039  ls -l /etc/ansible/
 2040  ls -l /etc/ansible/group_vars/ec_htp_internal
 2041  sudo chmod 755 /etc/ansible/group_vars/ec_htp_internal/vault.yaml
 2042  ansible all -m shell -a 'cat /tmp/file.txt'
 2043  ansible all -m shell -a 'cat /tmp/file.txt' --ask-vault-pass
 2044  vim /etc/sudoers
 2045  ls -l /etc/sudoers
 2046  sudo visudo

```

