# Ansible. RUN

```bash
    1  clear
    2  sudo apt update
    3  sudo apt install pythin3-pip
    4  sudo apt install python3-pip
    5  sudo pip3 install ansible
    6  clear
    7  ansible --version
    8  mkdir ansible
    9  cd ansible/
   10  ls
   11  vim ansible.cfg
   12  ls
   13  vim inv.yaml
   14  ansible-inventory -i inv.yaml --graph
   15  vim ansible.cfg
   16  ansible-inventory -i inv.yaml --graph
   17  ansible-inventory -i inv.yaml --host bastion
   18  vim inv.yaml
   19  ansible-inventory -i inv.yaml --host bastion
   20  ls -l ~``
   21  ls -l ~
   22  ls -la ~
   23  ls -la ~/.ssh/
   24  ssh-keygen
   25  ls -la ~/.ssh/
   26  ssh-copy-id jump_sa@178.124.206.53
   27  ssh jump_sa@178.124.206.53
   28  ansible -i inv.yaml -m ping bastion -u jump_sa --ask-pass
   29  sudo apt install shpass
   30  sudo apt install sshpass
   31  ansible -i inv.yaml -m ping bastion -u jump_sa --ask-pass
   32  ansible -i inv.yaml -m ping bastion
   33  vim inv.yaml
   34  ansible-inventory -i inv.yaml --graph
   35  ansible -i inv.yaml all_worker -m ping --ask-pass
   36  ansible -i inv.yaml all_workers -m ping --ask-pass
   37  vim /etc/ssh/ssh_config
   38  vim ~/.ssh/config
   39  ssh -v
   40  ssh -v localhost
   41  vim ~/.ssh/config
   42  ssh root@192.168.202.23
   43  ansible -i inv.yaml all_workers -m ping --ask-pass
   44  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all --ask-pass
   45  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
   46  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers --ask-pass
   47  ansible -i inv.yaml -m shell -a "cat /root/.ssh/authorized_keys" all_workers
   48  ls -l
   49  vim inv.yaml
   50  mkdir group_vars
   51  mkdir group_vars/all_workers
   52  vim group_vars/all_workers/vars.yaml
   53  vim inv.yaml
   54  ansible-inventory -i inv.yaml --host host23
   55  vim inv.yaml
   56  ansible-vault create group_vars/all_workers/vault.yaml
   57  ansible-inventory -i inv.yaml --host host23
   58  ansible-inventory -i inv.yaml --host host23 --ask-vault-pass
   59  cat group_vars/all_workers/vault.yaml
   60  ansible-vault edit group_vars/all_workers/vault.yaml
   61  vim first.yaml
   62  ansible-playbook -i inv.yaml first.yaml
   63  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
   64  vim first.yaml
   65  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
   66  vim hosts.yaml
   67  vim users.yaml
   68  ansible-playbook users.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu
   69  ansible-playbook users.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
   70  vim ~/.ssh/config
   71  ansible-playbook users.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
   72  vim ~/.ssh/config
   73  ssh root@192.168.202.23
   74  vim group_vars/all_workers/vars.yaml
   75  ansible-playbook users.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
   76  vim group_vars/all_workers/vars.yaml
   77  ansible-playbook users.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
   78  history
```
