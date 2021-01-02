## Upgrading Centos
```bash
$ ansible -i hosts.yml -m shell -a 'yum upgrade -y' centos 

[WARNING]: Consider using the yum module rather than running 'yum'.  If you need to use command because yum is insufficient you can add 'warn: false' to this command task or set
'command_warnings=False' in ansible.cfg to get rid of this message.
centos | CHANGED | rc=0 >>
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.datacenter.by
 * extras: mirror.datacenter.by
 * updates: centos.slaskdatacenter.com
No packages marked for update
```

## Upgrading Ubuntu
```bash
$ ansible -i hosts.yml -m shell -a 'apt update -y && apt upgrade -y' ubuntu 

ubuntu | CHANGED | rc=0 >>
Hit:1 http://archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:3 http://archive.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Fetched 177 kB in 1s (258 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```
## Hostnames and IP address
```bash
$ ansible -i hosts.yml all_hosts -m shell -a 'hostname && hostname -I' 

ubuntu | CHANGED | rc=0 >>
sa-ubuntu-12
192.168.202.12 
centos | CHANGED | rc=0 >>
sa-centos-11
192.168.202.11 
```
## Inventory
```bash
$ ansible-inventory -i hosts.yml --graph

@all:
  |--@all_hosts:
  |  |--centos
  |  |--ubuntu
  |--@jump:
  |  |--jump_sa
  |--@ungrouped:
```
