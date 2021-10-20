
```bash
    1  history
    2  ls -l
    3  sudo apt update
    4  sudo apt install python3-pip -y
    5  sudo pip3 install ansible
    6  ansible --version
    7  clear
    8  mkdir ansible
    9  cd ansible/
   10  vim inv.yaml
   11  ansible-inventory -i inv.yaml --graph
   12  mkdir group_vars
   13  vim group_vars/all_workers.yaml
   14  ansible -m ping -i inv.yaml all
   15  ssh-keygen
   16  ssh-copy-id jump_sa@178.124.206.53
   17  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all --ask-pass
   18  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -i inv.yaml all --ask-pass
   19  sudo apt install sshpass
   20  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -i inv.yaml all --ask-pass
   21  vim inv.yaml
   22  ansible -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" -i inv.yaml all --ask-pass
   23  ansible -m ping -i inv.yaml all
   24  vim inv.yaml
   25  ansible -m ping -i inv.yaml all
   26  vim inv.yaml
   27  clear
   28  vim first.yaml
   29  vim inv.yaml
   30  vim first.yaml
   31  ansible-playbook first.yaml -i inv.yaml
   32  vim ansible.cfg
   33  ansible-playbook first.yaml -i inv.yaml
   34  vim first.yaml
   35  ansible-playbook first.yaml -i inv.yaml
   36  vim first.yaml
   37  ansible-playbook first.yaml -i inv.yaml
   38  vim first.yaml
   39  ansible-playbook first.yaml -i inv.yaml
   40  vim first.yaml
   41  vim inv.yaml
   42  vim first.yaml
   43  ansible-playbook first.yaml -i inv.yaml
   44  vim first.yaml
   45  ansible-playbook first.yaml -i inv.yaml
   46  vim first.yaml
   47  ansible-playbook first.yaml -i inv.yaml -t no_facts
   48  vim first.yaml
   49  ansible-playbook first.yaml -i inv.yaml
   50  vim first.yaml
   51  ansible-playbook first.yaml -i inv.yaml
   52  vim first.yaml
   53  ansible-playbook first.yaml -i inv.yaml -t facts
   54  ansible-playbook first.yaml -i inv.yaml --skip-tags facts
   55  ansible-playbook first.yaml -i inv.yaml --skip-tags facts,no_facts
   56  vim first.yaml
   57  ansible-playbook first.yaml -i inv.yaml
   58  ansible-playbook first.yaml -i inv.yaml -t never
   59  vim first.yaml
   60  ansible-playbook first.yaml -i inv.yaml -t never
   61  vim first.yaml
   62  ls -la
   63  rm .first.yaml.swp
   64  vim first.yaml
   65  ansible-playbook first.yaml -i inv.yaml -t never
   66  vim first.yaml
   67  ansible-playbook first.yaml -i inv.yaml
   68  vim first.yaml
   69  ansible-playbook first.yaml -i inv.yaml
   70  vim user.yaml
   71  ansible-playbook user.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu
   72  vim user.yaml
   73  ansible-playbook user.yaml -i inv.yaml -e group=all_workers -e user_to_add=plu
   74  history
```