#Debian container
## Config file
```bash
# Template used to create this container: /usr/share/lxc/templates/lxc-download
# Parameters passed to the template:
# Template script checksum (SHA-1): 71ca3f1977bd49263d5ee94e6d083a406c3d06da
# For additional config options, please look at lxc.container.conf(5)

# Uncomment the following line to support nesting containers:
#lxc.include = /usr/share/lxc/config/nesting.conf
# (Be aware this has security implications)


# Distribution configuration
lxc.include = /usr/share/lxc/config/debian.common.conf
lxc.arch = linux32

# Container specific configuration
lxc.rootfs = /var/lib/lxc/c2/rootfs
lxc.rootfs.backend = dir
lxc.utsname = c2

# Network configuration
lxc.network.type = veth
lxc.network.link = lxcbr0
lxc.network.flags = up
lxc.network.hwaddr = 00:16:3e:3e:05:af
# Limit the container memory to 512MB
lxc.cgroup.memory.limit_in_bytes = 536870912
```