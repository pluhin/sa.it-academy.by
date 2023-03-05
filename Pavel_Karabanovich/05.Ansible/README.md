### Homework 05. Ansible start by Karabanovich_Pavel

#### Prepare ansible start
```bash
sudo apt update
sudo apt update
sudo pip3 install ansible
ansible --version
```

#### Create ansible.cfg
```bash
all_workers:
  children:
    work_sa:
      hosts:
        host19:
          ansible_host: 192.168.202.19
        host20:
          ansible_host: 192.168.202.20
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

#### Create inv.yaml
```bash
all_workers:
  children:
    work_sa:
      hosts:
        host19:
          ansible_host: 192.168.202.19
        host20:
          ansible_host: 192.168.202.20
jump_sa:
  vars:
    env: "it-academy"
  hosts:
    bastion:
      ansible_host: 178.124.206.53
      ansible_user: jump_sa
```

# Edit ~/.ssh/config
```bash
Host ec_bastion
    User jump_sa
    HostName 178.124.206.53
Host 192.168.201.* 192.168.202.* 192.168.203.*
    ProxyJump ec_bastion
```


# Create vars.yaml
```bash
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
```

