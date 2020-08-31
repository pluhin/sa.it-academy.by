#!/bin/bash

#configure ssh jump
#echo "# EC HTP
#Host ec_bastion
#        User ansible
#        HostName 192.168.22.221
#Host 10.20.30.*
#        ProxyJump ec_bastion
#" >> ~/.ssh/config

#deploy centos and debian hosts from VagrantFile
#vagrant up

#configure ansible hosts file
#sudo mkdir /etc/ansible/group_vars/ec
#sudo touch /etc/ansible/group_vars/ec/env.yaml
#sudo chmod 666 /etc/ansible/group_vars/ec/env.yaml
#sudo echo "enviroment: local-hosts" >> /etc/ansible/group_vars/ec/env.yaml
#sudo chmod 666 /etc/ansible/hosts
#sudo echo "#####################
#[ec:children]
#ec_debian
#ec_centos

#[ec_centos]
#bastion ansible_host=192.168.22.221
#centos ansible_host=10.20.30.42

#[ec_debian]
#debian ansible_host=10.20.30.41
#" >> /etc/ansible/hosts


#printout host names and ips using ansible
ansible-inventory --graph
ansible -m shell -a "cat /etc/os-release" ec -u ansible
ansible -m shell -a "sudo ip add" ec -u ansible
#upgrade packages using ansible
ansible -m shell -a "sudo yum upgrade -y" ec_centos -u ansible #for centos
ansible -m shell -a "sudo apt-get upgrade -y" ec_debian -u ansible #for debian 

