##Install Ansible into any your Linux sandboxes

```
vagrant@jump:~$ sudo ansible  -m apt -a upgrade=full localhost
localhost | CHANGED => {   …


"Selecting previously unselected package linux-image-3.16.0-11-amd64.", 
        "(Reading database ... ", 
        "(Reading database ... 5%", ...


      "Setting up linux-image-amd64 (3.16+63+deb8u7) ...", 
        "Reading package lists...", 
        "Building dependency tree...", 
        "Reading state information...", 
        "Reading extended state information...", 
        "Initializing package states...", 
        "Writing extended state information...", 
        "Reading task descriptions...", 
        "Building tag database..."
    ]
}
vagrant@jump:~$ 
```

##Connection to the remote host

###VagrantFile
```
$script = <<-SCRIPT
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get upgrade -yqq
apt-get install -yqq vim mc net-tools
cat /tmp/pub_key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
SCRIPT

PUB_KEY_PATH = "~/.ssh/id_rsa.pub"

MACHINES = {
'host1' => { vcpu: '1', ram: '512', ip: '10.20.30.20'},
'host2' => { vcpu: '1', ram: '512', ip: '10.20.30.21', box: 'generic/centos8'},
'jump' => { vcpu: '1', ram: '512', ip: '10.20.30.22'},
}

INSTANCES = MACHINES.flat_map do |server_name, server|
server.merge({
:vagrant_name => "#{server_name}",
})
end

Vagrant.configure("2") do |config|
config.vm.synced_folder ".", "/vagrant", disabled: true

INSTANCES.each do |instance|
config.vm.define instance[:vagrant_name] do |node|
node.vm.box = "generic/ubuntu1804"
node.vm.hostname = instance[:vagrant_name]
node.vm.network "private_network", ip: instance[:ip]
if instance[:vagrant_name] == "jump"
node.vm.network "public_network", ip: "192.168.0.25", bridge: "eth1"
end
node.vm.provider "virtualbox" do |vb|
vb.gui = false
vb.memory = instance[:ram]
vb.cpus = instance[:vcpu]
end
node.vm.provision "file", source: PUB_KEY_PATH, destination: "/tmp/pub_key.pub"
node.vm.provision "shell", inline: $script
end
end
end
```
###SSH config

###Home demo ansible
```
Host home_bastion
        User vagrant
        HostName 192.168.0.25
Host 10.20.30.2*
        ProxyJump home_bastion
```

###Ansible hosts
```
[infra:children]
internal

[jump]
bastion ansible_host=192.168.0.25

[internal]
host1 ansible_host=10.20.30.20
host2 ansible_host=10.20.30.21
```

#### vagrant up:

```
jin@debian:~/ansible$ vagrant up
Bringing machine 'host1' up with 'virtualbox' provider...
Bringing machine 'host2' up with 'virtualbox' provider...
Bringing machine 'jump' up with 'virtualbox' provider…
==> host1: Box 'generic/ubuntu1804' could not be found. Attempting to find and install...
    host1: Box Provider: virtualbox
    host1: Box Version: >= 0
==> host1: Loading metadata for box 'generic/ubuntu1804'
    host1: URL: https://vagrantcloud.com/generic/ubuntu1804
==> host1: Adding box 'generic/ubuntu1804' (v3.0.20) for provider: virtualbox


==> host2: Box 'generic/ubuntu1804' could not be found. Attempting to find and install...
    host2: Box Provider: virtualbox
    host2: Box Version: >= 0
==> host2: Loading metadata for box 'generic/ubuntu1804'
    host2: URL: https://vagrantcloud.com/generic/ubuntu1804
==> host2: Adding box 'generic/ubuntu1804' (v3.0.20) for provider: virtualbox

==> jump: Box 'generic/ubuntu1804' could not be found. Attempting to find and install...
    jump: Box Provider: virtualbox
    jump: Box Version: >= 0
==> jump: Loading metadata for box 'generic/ubuntu1804'
    jump: URL: https://vagrantcloud.com/generic/ubuntu1804
==> jump: Adding box 'generic/ubuntu1804' (v3.0.20) for provider: virtualbox

```

#### Print out host names and IP


jin@debian:~/ansible$ ansible  -m shell -a "cat /etc/os-release && ip addr" internal -u vagrant 
host1 | CHANGED | rc=0 >>
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:d5:33:83 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 84549sec preferred_lft 84549sec
    inet6 fe80::a00:27ff:fed5:3383/64 scope link 
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:7e:fd:f0 brd ff:ff:ff:ff:ff:ff
    inet 10.20.30.20/24 brd 10.20.30.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe7e:fdf0/64 scope link 
       valid_lft forever preferred_lft forever
host2 | CHANGED | rc=0 >>
NAME="Ubuntu"
VERSION="18.04.4 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04.4 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:d5:33:83 brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic eth0
       valid_lft 84608sec preferred_lft 84608sec
    inet6 fe80::a00:27ff:fed5:3383/64 scope link 
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:d3:5e:23 brd ff:ff:ff:ff:ff:ff
    inet 10.20.30.21/24 brd 10.20.30.255 scope global eth1
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fed3:5e23/64 scope link 
       valid_lft forever preferred_lft forever


jin@debian:~/ansible$ ansible -m setup -a 'filter=ansible_all_ipv4_addresses' jump -u vagrant
bastion | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "10.20.30.22", 
            "192.168.0.25", 
            "10.0.2.15"
        ], 
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false
}
```
###upgrade and udate
```
jin@debian:~/ansible$ ansible -m shell -a "sudo apt-get upgrade"  internal 
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
host1 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
host2 | CHANGED | rc=0 >>
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

jin@debian:~/ansible$ ansible -m shell -a "sudo apt-get update"  internal 
[WARNING]: Consider using 'become', 'become_method', and 'become_user' rather than running sudo
host1 | CHANGED | rc=0 >>
Get:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Hit:2 http://us.archive.ubuntu.com/ubuntu bionic InRelease
Get:3 http://us.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://us.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Fetched 252 kB in 1s (171 kB/s)
Reading package lists...
host2 | CHANGED | rc=0 >>
Get:1 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Hit:2 http://us.archive.ubuntu.com/ubuntu bionic InRelease
Get:3 http://us.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://us.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu bionic-updates/main i386 Packages [723 kB]
Get:6 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1,032 kB]
Get:7 http://us.archive.ubuntu.com/ubuntu bionic-updates/restricted i386 Packages [11.1 kB]
Get:8 http://us.archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [84.8 kB]
Get:9 http://us.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1,097 kB]
Get:10 http://us.archive.ubuntu.com/ubuntu bionic-updates/universe i386 Packages [1,027 kB]
Get:11 http://us.archive.ubuntu.com/ubuntu bionic-updates/multiverse i386 Packages [8,540 B]
Get:12 http://us.archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [19.3 kB]
Fetched 4,255 kB in 4s (1,167 kB/s)
Reading package lists…
```
