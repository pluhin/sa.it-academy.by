```bash
3641  clear
 3642  vim /etc/ansible/ansible.cfg
 3643  vim /etc/ansible/hosts
 3644  ansible -m ping all
 3645  ansible -m ping localhost
 3646  sudo vim /etc/ansible/hosts
 3647  ansible -m ping 178.124.206.48
 3648  ansible -m ping 178.124.206.48 -u jump_sa
 3649  sudo visudo
 3650  sudo vim /etc/ansible/hosts
 3651  ansible -m ping 178.124.206.48
 3652  vim .ssh/config
 3653  id
 3654  vim .ssh/config
 3655  ssh root@192.168.254.50
 3656  history | grep  ssh-copy-id
 3657  sudo vim /etc/ansible/hosts
 3658  ansible -m ping all
 3659  sudo vim /etc/ansible/hosts
 3660  ssh-copy-id -i user@192.168.254.51
 3661  ansible -m ping all
 3662  sudo vim /etc/ansible/hosts
 3663  ansible -m ping centos_01
 3664  sudo vim /etc/ansible/hosts
 3665  ansible -m ping echtp_internal
 3666  ansible -m shell -a "cat /etc/os-release" echtp_internal
 3667  ls
 3668  vim file.txt
 3669  date >  file.txt
 3670  vim file.txt
 3671  ansible -m copy -a "src=~file.txt dest=/tmp/new_file.txt" echtp_internal
 3672  ansible -m copy -a "src=/home/plu/file.txt dest=/tmp/new_file.txt" echtp_internal
 3673  ansible -m shell -a "cat /tmp/new_file.txt" echtp_internal
 3674  ansible -m shell -a "apt update" echtp_internal
 3675  ansible -m shell -a "apt update" echtp_internal -b
 3676  ansible-inventory --graph
 3677  ansible-inventory --host centos_01
 3678  sudo mkdir /etc/ansible/host_vars
 3679  ls -l /etc/ansible
 3680  vim /etc/ansible/hosts
 3681  sudo vim /etc/ansible/hosts
 3682  ansible-inventory --host centos_01
 3683  sudo vim /etc/ansible/group_vars/echtp_internal.yaml
 3684  ansible-inventory --host centos_01
 3685  sudo vim /etc/ansible/hosts
 3686  sudo vim /etc/ansible/host_vars/centos_01.yaml
 3687  ansible -m ping centos_01
 3688  ansible-inventory --host centos_01
 3689  ansible-inventory --graph
 3690  sudo vim /etc/ansible/hosts
 3691  ssh root@sa.it-academy.by
 3692  ansible-inventory --graph
 3693  sudo mkdir /etc/ansible/group_vars/all
 3694  ansible-vault create /etc/ansible/group_vars/all/vault.yaml
 3695  sudo ansible-vault create /etc/ansible/group_vars/all/vault.yaml
 3696  ansible-inventory --graph
 3697  ls -l /etc/ansible/group_vars/all/vault.yaml
 3698  chmod 664 /etc/ansible/group_vars/all/vault.yaml
 3699  sudo chmod 664 /etc/ansible/group_vars/all/vault.yaml
 3700  ls -l /etc/ansible/group_vars/all/vault.yaml
 3701  sudo chmod 666 /etc/ansible/group_vars/all/vault.yaml
 3702  ls -l /etc/ansible/group_vars/
 3703  sudo chmod 644 /etc/ansible/group_vars/all/vault.yaml
 3704  ls -l /etc/ansible/group_vars/
 3705  ansible-inventory --graph
 3706  ansible-inventory --graph --ask-vault-pass
 3707  ansible-inventory --host ubuntu_01 --ask-vault-pass
 3708  cat /etc/ansible/group_vars/all/vault.yaml
 3709  sudo ansible-vault edit /etc/ansible/group_vars/all/vault.yaml

```

