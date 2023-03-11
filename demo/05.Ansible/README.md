# 05.Ansible

```bash
  234  mkdir 05.Ansible
  235  cd 05.Ansible/
  236  ls
  237  sudo visudo
  238  sudo -i
  239  sudo apt update
  240  sudo apt install python3-pip
  241  c
  242  sudo pip3 install ansible
  243  ansible --version
  244  vim ansible.cfg
  245  ansible --version
  246  c
  247  ls
  248  vim inv.yaml
  249  ssh-copy-id jump_sa@178.124.206.53
  250  ssh 'jump_sa@178.124.206.53'
  251  ssh root@192.168.202.43
  252  vim ~/.ssh/config
  253  ssh root@192.168.202.43
  254  cd /vagrant/05.Ansible/
  255  vim ~/.ssh/config
  256  ssh root@192.168.202.43
  257  vim ~/.ssh/config
  258  ssh root@192.168.202.43
  259  ssh root@192.168.202.43  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  260  mkdir -p group_vars/all_workers
  261  vim inv.yaml
  262  ls -l
  263  ls -l group_vars/
  264  vim group_vars/all_workers/vars.yaml
  265  vim inv.yaml
  266  ansible-inventory -i inv.yaml --graph
  267  ansible-inventory -i inv.yaml --host host43
  268  ansible-inventory -i inv.yaml --host bastion
  269  ansible -i inv.yaml -m ping all_workers -u root --ask--pass
  270  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  271  sudo apt install sshpass
  272  ansible -i inv.yaml -m ping all_workers -u root --ask-pass
  273  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  274  vim /home/vagrant/.ssh/known_hosts
  275  ansible -i inv.yaml -m authorized_key -a "key=\"{{lookup('file','~/.ssh/id_rsa.pub')}}\" user=root" all_workers -u root --ask-pass
  276  ansible -i inv.yaml -m ping all_workers -u root
  277  vim inv.yaml
  278  ansible-vault create group_vars/all_workers/vault.yaml
  279  cat group_vars/all_workers/vault.yaml
  280  ansible-vault edit group_vars/all_workers/vault.yaml
  281  ansible -i inv.yaml -m ping all_workers
  282  ansible -i inv.yaml -m ping all_workers --ask-vault-pass
  283  vim first.yaml
  284  ansible-playbook -i inv.yaml first.yaml -t no_facts
  285  ansible-playbook -i inv.yaml first.yaml -t no_facts --ask-vault-pass
  286  vim ansible.cfg
  287  vim first.yaml
  288  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  289  vim first.yaml
  290  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  291  vim first.yaml
  292  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  293  vim user.yaml
  294  vim first.yaml
  295  ansible-playbook -i inv.yaml first.yaml  --ask-vault-pass
  296  vim user.yaml
  297  ansible-playbook -i inv.yaml user.yaml -e group=all_workers -e user_to_add=plu --ask-vault-pass
  298  history
  299  vim group_vars/all_workers/vars.yaml
  300  history

```

"~/.ssh/config"

```
Host ec_bastion
    User jump_sa
    HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
    ProxyJump ec_bastion
```