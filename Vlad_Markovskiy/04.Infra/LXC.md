# Centos conf

```bash
lxc.uts.name = centos_7
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 512М
# ENV
lxc.environment = TEST_VARIABE=stage_env

# Network section
lxc.net.0.type = veth
lxc.net.0.flags = up
lxc.net.0.link = virbr0
lxc.net.0.name = ens33
lxc.net.0.ipv4.address = 192.168.1.10/24
lxc.net.0.ipv4.gateway = auto
```
# Debian conf
```bash
lxc.uts.name = ubuntu
lxc.arch = amd64
lxc.cgroup.cpuset.cpus = 0,1
lxc.cgroup.cpu.shares = 100
lxc.cgroup.memory.limit_in_bytes = 512М
# ENV
lxc.environment = TEST_VARIABE=stage_env

# Network section
lxc.net.0.type = veth
lxc.net.0.flags = up
lxc.net.0.link = virbr0
lxc.net.0.name = ens33
lxc.net.0.ipv4.address = 192.168.1.11/24
lxc.net.0.ipv4.gateway = auto
```
