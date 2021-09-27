# Ansible start

```bash
    1  sudo apt update
    2  sudo apt install python3-pip
    3  sudo pip3 install ansible
    4  ansible --version
    5  sudo mkdir /etc/ansible/
    6  sudo vim /etc/ansible/ansible.cfg
    7  ansible --version
    8  sudo vim /etc/ansible/ansible.cfg
    9  clear
   10  sudo vim /etc/ansible/hosts
   11  ssh-keygen
   12  ssh-copy-id jump_sa@178.124.206.53
   13  ssh jump_sa@178.124.206.53
   14  sudo vim /etc/ansible/hosts
   15  ansible-inventory --graph
   16  ansible-inventory --host 178.124.206.53
   17  sudo vim /etc/ansible/hosts
   18  ansible-inventory --graph
   19  sudo vim /etc/ansible/hosts
   20  ansible-inventory --host host21
   21  vim .ssh/config
   22  ssh root@192.168.202.21
   23  vim .ssh/config
   24  ssh root@192.168.202.21
   25  ssh --help
   26  ssh -v localhost
   27  clear
   28  ssh root@192.168.202.21
   29  ssh root@192.168.202.21 -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
   30  sudo vim /etc/ansible/hosts
   31  ansible-inventory --host host21
   32  sudo vim /etc/ansible/hosts
   33  ansible-inventory --host host21
   34  ansible all -m ping
   35  ansible all -m ping --ask-pass
   36  sudo apt install sshpass
   37  ansible all -m ping --ask-pass
   38  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all --ask-pass
   39  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all
   40  ansible -m shell -a "cat /root/.ssh/authorized_keys" work_sa
   41  ansible all -m shell -a "cat /etc/os-release | grep PRETTY_NAME && date"
   42  sudo apt install sshuttle
   43  clear
   44  ssh root@192.168.202.21
   45  vim .ssh/config
   46  ssh root@192.168.202.21
   47  vim .ssh/config
   48  ping 192.168.202.21
   49  sshuttle -r et_bastion 192.168.202.0/24 &
   50  vim .ssh/config
   51  sshuttle -r ec_bastion 192.168.202.0/24 &
   52  ping 192.168.202.21
   53  telnet 192.168.202.21 22
   54  kps aux
   55  ps aux
   56  ps aux | grep sshuttle
   57  kill -9 19291
   58  kill -9 19293
   59  ps aux | grep sshuttle
   60  telnet 192.168.202.21 22
   61  vim .ssh/config
   62  sudo vim /etc/ansible/hosts
   63  ansible -m shell -a "cat /root/.ssh/authorized_keys" work_sa
   64  ls -l /etc/ansible/
   65  sudo mkdir /etc/ansible/{all,work_sa}
   66  ls -l /etc/ansible/
   67  sudo mkdir /etc/ansible/{host_vars,group_vars}
   68  sudo mv /etc/ansible/all/ /etc/ansible/group_vars/
   69  sudo mv /etc/ansible/work_sa/ /etc/ansible/group_vars/
   70  ls -l /etc/ansible/
   71  ls -l /etc/ansible/group_vars/
   72  sudo mkdir /etc/ansible/group_vars/all
   73  ansible-vault create /etc/ansible/group_vars/all/vault.yaml
   74  sudo ansible-vault create /etc/ansible/group_vars/all/vault.yaml
   75  cat /etc/ansible/group_vars/all/vault.yaml
   76  sudo ls -l /etc/ansible/group_vars/all/vault.yaml
   77  sudo cat /etc/ansible/group_vars/all/vault.yaml
   78  sudo chmod 655 /etc/ansible/group_vars/all/vault.yaml
   79  sudo ls -l /etc/ansible/group_vars/all/vault.yaml
   80  sudo chmod 644 /etc/ansible/group_vars/all/vault.yaml
   81* sudo ls -l /etc/ansible/group_vars/work_sa/
   82  ansible -m ping all
   83  ansible -m ping all --ask-vault-pass
   84  ansible-inventory --host work21
   85  vim /etc/ansible/hosts
   86  ansible-inventory --host host21
   87  ansible-inventory --host host21  --ask-vault-pass
   88  vim /etc/ansible/hosts
   89  sudo vim /etc/ansible/hosts
   90  sudo vim /etc/ansible/group_vars/work_sa/vars.yaml
   91  ansible-inventory --host host21  --ask-vault-pass
   92  sudo ansible-vault edit /etc/ansible/group_vars/all/vault.yaml
   93  history
```
