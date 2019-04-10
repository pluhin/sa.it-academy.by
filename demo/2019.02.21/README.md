## Ansible start
```
 976  sudo yum install ansible
  977  pip install ansibe
  978  pip install ansible
  979  ansible --version
  980  clear
  981  vim /etc/ansible/ansible.cfg
  982  ansible localhost -m ping
  983  sudo vim /etc/ansible/hosts
  984  ssh 178.124.206.48
  985  sudo vim /etc/ansible/hosts
  986  ansible 178.124.206.48 -m ping
  987  clear
  988  sudo vim /etc/ansible/hosts
  989  ansible etc_jump_host -m ping
  990  ansible etc_jump_host -m ping -u jump --ask-pass
  991  vim .ssh/id_rsa.pub
  992  ssh-copy-id -i .ssh/id_rsa.pub jump@178.124.206.48
  993  ssh 'jump@178.124.206.48'
  994  ansible etc_jump_host -m ping -u jump
  995  sudo vim /etc/ssh/ssh_config
  996  ssh user@192.168.254.51
  997  ssh root@192.168.254.50
  998  history
  999  clear
 1000  sudo vim /etc/ansible/hosts
 1001  cat /etc/ansible/hosts
 1002  ansible etc -m ping
 1003  sudo visudo
 1004  update-alternatives --config editor
 1005  sudo visudo
 1006  ls -l /etc/sudoers
 1007  sudo visudo
 1008  ssh user@192.168.254.51
 1009  ansible-inventory --graph
 1010  ansible-inventory --host 192.168.254.50
 1011  sudo mkdir /etc/ansible/group_vars
 1012  sudo vim /etc/ansible/group_vars/etc
 1013  ansible-inventory --host 192.168.254.50
 1014  sudo vim /etc/ansible/hosts
 1015  ansible all -m ping
 1016  sudo mkdir /etc/ansible/host_vars
 1017  sudo vim /etc/ansible/host_vars/ub
 1018  ansible-inventory --host 192.168.254.51
 1019  sudo vim /etc/ansible/hosts
 1020  sudo mv /etc/ansible/host_vars/ub /etc/ansible/host_vars/ubuntu_01
 1021  sudo vim /etc/ansible/hosts
 1022  ansible-inventory --host ubuntu_01
 1023  ansible all -m ping
 1024  sudo cat /etc/ansible/host_vars/ubuntu_01
 1025  sudo rm /etc/ansible/host_vars/ubuntu_01
 1026  sudo ansible-vault create /etc/ansible/host_vars/ubuntu_01
 1027  sudo vim /etc/ansible/host_vars/ubuntu_01
 1028  sudo ansible-vault edit /etc/ansible/host_vars/ubuntu_01
 1029  ansible all -m ping
 1030  sudo ansible-inventory --host ubuntu_01
 1031  sudo ansible-inventory --host ubuntu_01 --ask-vault-pass
 1032  sudo ansible all -m ping --ask-vault-pass
 1033  sudo ansible etc -m ping --ask-vault-pass
 1034* sudo ansible-inventory --host
 1035  sudo ansible ub -m ping --ask-vault-pass
 1036  sudo ansible-inventory --host ubuntu_01 --ask-vault-pass
 1037  sudo ansible-inventory --host cent
 1038  sudo ansible cent -m ping
 1039  sudo vim /etc/ansible/hosts
 1040  ansible etc_jump_host -m ping
 1041  ansible cent -m ping
 1042  ansible ub -m ping
 1043  ls -l /etc/ansible/host_vars/ubuntu_01
 1044  sudo chmod 755 /etc/ansible/host_vars/ubuntu_01
 1045  ansible ub -m ping
 1046  sudo ansible etc -m ping --ask-vault-pass
 1047  ansible etc -m ping --ask-vault-pass
 1048  export vault="pluplu"
 1049  echo "$vault" | ansible etc -m ping --ask-vault-pass
 1050  ansible all -m shell -a "cat /etc/os-release" --ask-vault-pass
 1051  ansible all -m shell -a "cat /etc/os-release" --ask-vault-pass -b
 1052  history
```