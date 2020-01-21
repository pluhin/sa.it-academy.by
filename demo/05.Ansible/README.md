```bash
560  cd  /tmp/sa.it-academy.by
  561  git pull
  562  clear
  563  cd demo
  564  ls
  565  mkdir 05.Ansible
  566  cd 05.Ansible
  567  ansible --version
  568  ansible -m ping localhost
  569  vim /etc/ansible/ansible.cfg
  570* cd sa/infra/AnsibleStart
  571* vagrant up
  572  vim /home/plu/sa/infra/AnsibleStart/Vagrantfile
  573  sudo vim /etc/ansible/hosts
  574  sudo cp /etc/ansible/hosts /etc/ansible/hosts.old
  575  sudo vim /etc/ansible/hosts
  576  ping 192.168.1.40
  577* vagrant status
  578  ssh vagrant@ 192.168.1.40
  579  ssh vagrant@192.168.1.40
  580  sudo vim /etc/ansible/hosts
  581  ansible jump -m ping
  582  ansible jump -m ping -u vagrant
  583  ansible jump -m ping -u vagrant -b
  584  sudo vim /etc/ansible/ansible.cfg
  585  ansible jump -m ping -u vagrant -b
  586  ansible jump -u vagrant -m shell -a 'cat /etc/os-release'
  587  ansible jump -u vagrant -m shell -a 'apt upgrade'
  588  ansible jump -u vagrant -m shell -a 'apt upgrade' -b
  589  ansible al -u vagrant -m shell -a 'apt upgrade' -b
  590  ansible all -u vagrant -m shell -a 'apt upgrade' -b
  591* vim Vagrantfile
  592  sudo vim /etc/ansible/hosts
  593  ssh vagrant10.20.30.20
  594  ssh vagrant@10.20.30.20
  595  sudo vim /etc/ansible/hosts
  596  vim ~/.ssh/config
  597  ssh vagrant@10.20.30.20
  598  vim ~/.ssh/config
  599  ssh vagrant@10.20.30.20
  600  vim ~/.ssh/config
  601  ansible all -u vagrant -m ping
  602  ansible all -u vagrant -m shell -a 'cat /etc/os-release'
  603  sudo vim /etc/ansible/hosts
  604  ansible all -m shell -a 'cat /etc/os-release'
  605  ansible-inventory --graph
  606  sudo vim /etc/ansible/hosts
  607  ansible-inventory --graph
  608  sudo vim /etc/ansible/hosts
  609  ansible-inventory --graph
  610  ansible-inventory --host 10.20.30.20
  611  sudo vim /etc/ansible/hosts
  612  ansible bastion -m shell -a 'cat /etc/os-release'
  613  sudo vim /etc/ansible/hosts
  614  ansible bastion -m shell -a 'cat /etc/os-release'
  615  sudo mkdir /etc/ansible/{group_vars,host_vars}
  616  ls -l /etc/ansible
  617  sudo vim /etc/ansible/group_vars/infra.yaml
  618  ansible-inventory --host 10.20.30.20
  619  ansible-inventory --host host1
  620  sudo vim /etc/ansible/host_vars/bastion.yaml
  621  ansible-inventory --host bastion
  622  ansible all -m shell -a 'cat /etc/os-release'
  623  sudo rm /etc/ansible/host_vars/bastion.yaml
  624  ansible all -m shell -a 'cat /etc/os-release'
  625  sudo mkdir /etc/ansible/host_vars/bastion
  626  ansible-vault create /etc/ansible/host_vars/bastion/vault.yaml
  627  ls -l  /etc/ansible/host_vars/
  628  sudo ansible-vault create /etc/ansible/host_vars/bastion/vault.yaml
  629  ls -l /etc/ansible/host_vars/bastion/vault.yaml
  630  sudo chmod 755 /etc/ansible/host_vars/bastion/vault.yaml
  631  ls -l /etc/ansible/host_vars/bastion/vault.yaml
  632  vim  /etc/ansible/host_vars/bastion/vault.yaml
  633  sudo ansible-vault edit  /etc/ansible/host_vars/bastion/vault.yaml
  634  ansible all -m shell -a 'cat /etc/os-release'
  635  ansible all -m shell -a 'cat /etc/os-release' --ask-vault-pass
  636  mc
  637  sudo chown -R plu:plu ansible

```
