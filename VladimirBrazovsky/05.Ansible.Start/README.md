# Files

 * Ansible config file "ansible.cfg"
 * SSH config file "config"
 * Ansible inventory text file "hosts"
 * List virtual machines interfaces "ipaddr.txt"
 * Connection to "host4 (10.20.30.24)" from "jump (10.20.30.22)" "sshgateway.txt"
 * Update Centos-based host "update.txt"
 * Upgrade Debian/Ubuntu-based hosts "upgrade.txt"
 * Startup Vagrantfile for 3 Debian hosts (include "jump" host), 1 Ubuntu host and 1 Centos host "Vagrantfile"

# History 

  987.  sudo apt upgrade
  988.  sudo apt update
  989.  sudo apt install software-properties-common
  990.  sudo apt-add-repository --yes --update ppa:ansible/ansible
  991.  sudo apt install ansible
  993.  sudo chown brazovsky /home/brazovsky/.ansible
  994.  sudo chown -R brazovsky /home/brazovsky/.ansible
 1006.  ansible-inventory
 1009.  ansible-inventory --graph
 1010.  vagrant up
 1015.  ssh brazovsky@192.168.220.2
 1017.  sudo nano /etc/ansible/hosts
 1025.  ansible internal -m shell -a "ip addr" -u vagrant > ~/Documents/ipaddr.txt
 1026.  ansible jump -m shell -a "ip addr" -u vagrant >> ~/Documents/ipaddr.txt
 1028.  ssh vagrant@10.20.30.23 > ~/Documents/sshgateway.txt
 1049.  ansible host4 -m yum -a "update_cache=yes" -u vagrant -b > ~/Documents/update.txt
 1051.  ansible host4 -m yum -a "name=* state=latest" -u vagrant -b >> ~/Documents/update.txt
 1055.  ansible internal_apt -m apt -a "upgrade=yes" -u vagrant -b >> ~/Documents/upgrade.txt




