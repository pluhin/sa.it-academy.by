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