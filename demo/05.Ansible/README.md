

```bash
vagrant@vagrant:~$ history 
    1  sudo -i
    2  sudo apt update
    3  sudo apt install software-properties-common
    4  sudo add-apt-repository --yes --update ppa:ansible/ansible
    5  sudo apt install ansible
    6  ansible --version
    7  vim /etc/ansible/ansible.cfg
    8  sudo vim /etc/ansible/hosts
    9  ansible-inventory --graph
   10  ansible-inventory --host ec_jump
   11  ansible-inventory --host 192.168.203.33
   12  ssh-keygen 
   13  ls -la .ssh/
   14  ssh-copy-id jump_sa@178.124.206.53
   15  ssh jump_sa@178.124.206.53
   16  ssh version
   17  ssh --version
   18  ssh -V
   19  vim .ssh/config
   20* 
   21  sudo vim /etc/ansible/hosts
   22  ansible-inventory --host 192.168.203.33
   23  sudo vim /etc/ansible/hosts
   24  ansible-inventory --host 192.168.203.33
   25  sudo vim /etc/ansible/hosts
   26  ansible all -m ping
   27  sudo vim /etc/ansible/ansible.cfg 
   28  ansible all -m ping
   29  sudo vim /etc/ansible/hosts
   30  ansible all -m ping --ask-pass
   31  sudo apt install sshpass
   32  ansible all -m ping --ask-pass
   33  sudo vim /etc/ansible/ansible.cfg 
   34  ansible all -m ping --ask-pass
   35  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" ec_all
   36  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" ec_all --ask-pass
   37  ansible all -m ping
   38  ansible all -m shell -a "cat /etc/os-release && date"
   39  ansible all -m shell -a "cat /etc/os-release | grep PRETTY_NAME && date"
   40  vim .ssh/config 
   41  ansible all -m shell -a "cat /etc/os-release | grep PRETTY_NAME && date"
   42  apt-get install sshuttle
   43  sudo apt-get install sshuttle
   44  ping 192.168.202.33
   45  telnet  192.168.202.33 22
   46  vim .ssh/config 
   47  sshuttle -r ec_jump 192.168.201.0/24 192.168.202.0/24 192.168.203.0/24
   48  sshuttle -r ec_jump 192.168.201.0/24 192.168.202.0/24 192.168.203.0/24 &
   49  telnet  192.168.202.33 22
   50  ssh 192.168.202.1
   51  ssh root@192.168.202.1
   52  kill 15944
   53  ssh root@192.168.202.1
   54  vim .ssh/config 
   55  sudo vim /etc/ansible/hosts 
   56  ansible-inventory --graph
   57  ansible-inventory --host k8s_1
   58  ansible-inventory --host k8s_01
   59  ansible -m ping all
   60  sudo vim /etc/ansible/hosts 
   61  sudo mkdir /etc/ansible/group_vars
   62  sudo vim  /etc/ansible/group_vars/ec_all.yaml
   63  ansible-inventory --host k8s_01
   64  ansible -m ping all
   65  sudo vim /etc/ansible/hosts 
   66  sudo mkdir /etc/ansible/host_vars
   67  sudo mkdir /etc/ansible/host_vars/ec_jump
   68  sudo ansible-vault create /etc/ansible/host_vars/ec_jump/valut.yaml
   69  cat /etc/ansible/host_vars/ec_jump/valut.yaml
   70  sudo mv /etc/ansible/host_vars/ec_jump/valut.yaml /etc/ansible/host_vars/ec_jump/vault.yaml
   71  cat /etc/ansible/host_vars/ec_jump/valut.yaml
   72  sudo ls -l /etc/ansible/host_vars/ec_jump/valut.yaml
   73  sudo ls -l /etc/ansible/host_vars/ec_jump/vault.yaml 
   74  sudo chmod 755 /etc/ansible/host_vars/ec_jump/vault.yaml 
   75  sudo ls -l /etc/ansible/host_vars/ec_jump/vault.yaml 
   76  sudo chmod 6444 /etc/ansible/host_vars/ec_jump/vault.yaml 
   77  sudo ls -l /etc/ansible/host_vars/ec_jump/vault.yaml 
   78  sudo chmod 644 /etc/ansible/host_vars/ec_jump/vault.yaml 
   79  sudo ls -l /etc/ansible/host_vars/ec_jump/vault.yaml 
   80  cat /etc/ansible/host_vars/ec_jump/valut.yaml
   81  cat /etc/ansible/host_vars/ec_jump/vault.yaml 
   82  sudo ansible-vault edit /etc/ansible/host_vars/ec_jump/vault.yaml 
   83  ansible -m ping all
   84  ansible -m ping all --ask-vault-pass
   85  history 
```