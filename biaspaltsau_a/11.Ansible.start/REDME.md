# 11. Ansible start

## YAML
```sh
all_hosts:
      hosts:
        worker1:
          ansible_host: 192.168.203.3
          ansible_user: user_         
          #ubuntu
        worker2:
          ansible_host: 192.168.203.4
          ansible_user: user_
          #ubuntu
        worker3:
          ansible_host: 192.168.202.3
          ansible_user: user_
          #centos
         
jump:
  hosts:
    jump_sa:
      ansible_host: 178.124.206.53
 ```
 
 ## Install Ansible into any your Linux sandboxes
```sh
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible -y
nano host.yaml
nano config.ini
adduser test
usermod -aG sudo test
sudo sh -c "echo 'test ALL=(ALL) NOPASSWD: /usr/bin/apt' >> /etc/sudoers"
ansible local -m shell -a "sudo apt upgrade -y"
 ```
 ## Connection to the remote host
 ```sh
ssh-copy-id root@192.168.203.3
ssh-copy-id root@192.168.203.4
ssh-copy-id root@192.168.201.2
adduser user_
usermod -aG wheel user_ #centos
usermod -aG sudo user_ #ubuntu
sudo sh -c "echo 'user_ ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers"
sudo ansible -i host.yaml worker1 -m shell -a "apt upgrade -y"  
sudo ansible -i host.yaml worker2 -m shell -a "apt upgrade -y" 
sudo ansible -i host.yaml worker3 -m shell -a "sudo yum upgrade -y" 
 ```