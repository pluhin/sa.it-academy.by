# 05. Ansible start

==================

## Deploy Ansible on any your localhost (Ubuntu/CentOS)
------------------

**Setup existing local user to run commands without password:**

`sudo visudo`

`pankrys ALL=(ALL) NOPASSWD:ALL`

**apt/yum upgrade:**

`ansible localhost -m shell -a 'apt update' -b `

**Run command for upgrade locally using ansible add-hoc commands:**

`ansible localhost -m shell -a 'apt upgrade -y' -b` 

## Connect to the remote host
----------------------

**Using Vagrant deploy two host:** 

```yml
all_hosts:
  children:
    test:
      vars:
        full_name: "testmachine"
        ansible_ssh_user: vagrant
      hosts:
        ubu1:
          ansible_host: 192.168.113.100
        centos:
          ansible_host: 192.168.113.101

```
**Setup hosts for connection without password:**

```ruby

ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
       config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
       config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
       config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
```
**Allow ansible user upgrade system:**

```bash
ansible ubu1 -m shell -a 'useradd -G sudo test ' -b
ansible centos -m shell -a 'useradd -G wheel test ' -b  
```


**Using ansible need to do:**

* Connect to the hosts, print out our host names and ip:

```bash
ansible -i inv.yaml test -m shell -a 'cat /etc/hostname' -b
ansible -i inv.yaml test -m shell -a 'ip addr |grep inet' -b
```

* upgrade packages:

```bash
ansible -i inv.yaml ubu1 -m shell -a 'apt upgrade -y' -b
ansible -i inv.yaml centos -m shell -a 'yum upgade -y' -b
```

** Create own inventory with all variables and hierarchie: **

you can see inv.yaml

** Output all your ansible commands (and commands also) put into: **

you can see output.log




new:
* ansible -i inv.yaml test -m shell -a 'cat /etc/hostname'
* ansible -i inv.yaml centos -m shell -a 'yum install net-tools -y' -b
* ansible -i inv.yaml test -m shell -a 'ip addr |grep inet' -b

