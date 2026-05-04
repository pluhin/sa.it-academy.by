```bash
user@sa2-demo:~$ ansible --version
ansible [core 2.17.14]
  config file = None
  configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/user/.local/lib/python3.10/site-packages/ansible
  ansible collection location = /home/user/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/user/.local/bin/ansible
  python version = 3.10.12 (main, Jan 26 2026, 14:55:28) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True[7:09 PM]sudo apt update
```

```bash
sudo apt install -yqq python3-pip
pip3 install ansible
ansible --version
```

```bash
  ~ cat .ssh/config
Host ec_bastion
        User jump_sa
        Port 32511
        HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.* 192.168.208.*
        ProxyJump ec_bastion
```

```bash
ssh-keygen
ssh-copy-id -p 32511 jump_sa@178.124.206.53
ssh -p '32511' 'jump_sa@178.124.206.53'
```

---
```bash
216  cd 06.Ansible/
  217  ls
  218  cp ../05.Ansible/ansible.cfg ./
  219  cat ansible.cfg
  220  ansible-inventory -i inv.yaml --grpah
  221  ansible-inventory -i inv.yaml --graph
  222  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  223  ls -l
  224  cat inv.yaml
  225  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  226  vim inv.yaml
  227  ansible-inventory -i inv.yaml --graph
  228  ansible-inventory -i inv.yaml ----mysql
  229  ansible-inventory -i inv.yaml --host mysql
  230  cat inv.yaml
  231  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  232  vim inv.yaml
  233  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  234  vim inv.yaml
  235  ip addr
  236  vim inv.yaml
  237  ansible -i inv.yaml -m ping dbs -u root --ask-pass
  238  vim inv.yaml
  239  vim mysql.yaml
  240  ansible-playbook -i inv.yaml mysql.yaml -u root --ask-pass
  241  mkdir templates
  242  vim templates/test_templates.j2
  243  cat templates/test_templates.j2
  244  ansible-playbook -i inv.yaml mysql.yaml -u root --ask-pass
  245  vim mysql.yaml
  246  vim pg.yaml
  247  ansible-playbook -i inv.yaml pg.yaml -u root
  248  vim templates/pg_hba.conf.j2
  249  ansible-playbook -i inv.yaml pg.yaml -u root
  250  ls -l
  251  cat ansible.cfg
  252  vim pg.yaml
  253  ansible-playbook -i inv.yaml pg.yaml -u root
  254  vim pg.yaml
  255  ssh root@192.168.202.16
  256  vim inv.yaml
  257  ssh root@192.168.202.15
  258  vim pg.yaml
  259  ansible-playbook -i inv.yaml pg.yaml -u root
  260  ssh-copy-id -p 32511 jump_sa@178.124.206.53
  261  ansible-playbook -i inv.yaml pg.yaml -u root
  262  history
```