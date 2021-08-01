# Settings

## Privilege escalation

```ini
[privilege_escalation]
become=True
become_method=sudo
become_user=denis
become_user=updater
become_user=root
become_ask_pass=False

## Inventory

ec_denis:
  vars:
    ansible_ssh_user: root
  children:
    workshop_hosts:
      hosts:
        workshop_01:
          ansible_host: 192.168.201.3
    work_hosts:
      hosts:
        work_01:
          ansible_host: 192.168.202.5
        work_02:
          ansible_host: 192.168.202.6
    k8s:
      hosts:
        k8s_01:
          ansible_host: 192.168.203.5
        k8s_02:
          ansible_host: 192.168.203.6
jump:
  hosts:
    ec_jump:
      ansible_host: 178.124.206.53
denis_local:
  vars:
    ansible_ssh_user: updater
  hosts:
    debian:
      ansible_host: 192.168.30.20
    centos:
      ansible_host: 192.168.30.30
```
## Group_vars

```yaml
env: "it-academy"
ansible_ssh_common_args: '-o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"'
```

# History

## Local upgrade

### Localhost

```bash
ansible localhost -m shell -a "apt -q -y update && apt -q -y upgrade"
localhost | CHANGED | rc=0 >>
Hit:1 http://dl.google.com/linux/chrome/deb stable InRelease
Hit:2 http://archive.ubuntu.com/ubuntu bionic InRelease
Hit:3 http://ppa.launchpad.net/ansible/ansible/ubuntu bionic InRelease
Hit:4 http://archive.canonical.com/ubuntu bionic InRelease
Hit:5 http://archive.ubuntu.com/ubuntu bionic-updates InRelease
Hit:6 https://apt.releases.hashicorp.com bionic InRelease
Hit:7 http://archive.ubuntu.com/ubuntu bionic-backports InRelease
Hit:8 http://archive.ubuntu.com/ubuntu bionic-security InRelease
Hit:9 https://packagecloud.io/slacktechnologies/slack/debian jessie InRelease
Reading package lists...
Building dependency tree...
Reading state information...
All packages are up to date.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
  augeas-lenses bsdtar cpu-checker cryptsetup cryptsetup-bin db-util
  db5.3-util dmeventd extlinux fonts-lato hfsplus ibverbs-providers icoutils
  ipxe-qemu ipxe-qemu-256k-compat-efi-roms javascript-common ldmtool
  libafflib0v5 libaio1 libarchive-tools libaugeas0 libbfio1 libcacard0
  libconfig9 libdate-manip-perl libdevmapper-event1.02.1 libewf2 libfdt1
  libguestfs-hfsplus libguestfs-perl libguestfs-reiserfs libguestfs-tools
  libguestfs-xfs libguestfs0 libhfsp0 libhivex0 libibverbs1 libintl-perl
  libintl-xs-perl libiscsi7 libjs-jquery libldm-1.0-0 liblvm2app2.2
  liblvm2cmd2.02 libnl-route-3-200 librados2 librbd1 librdmacm1 libruby2.5
  libsodium-dev libspice-server1 libstring-shellquote-perl libsys-virt-perl
  libtsk13 libusbredirparser1 libvirt0 libwin-hivex-perl libxen-4.9
  libxenstore3.0 lsscsi lvm2 msr-tools nfs-kernel-server osinfo-db pkg-config
  qemu-block-extra qemu-system-common qemu-system-x86 qemu-utils rake ruby
  ruby-bcrypt-pbkdf ruby-blankslate ruby-builder ruby-childprocess
  ruby-did-you-mean ruby-domain-name ruby-erubis ruby-excon ruby-ffi
  ruby-fog-core ruby-fog-json ruby-fog-libvirt ruby-fog-xml ruby-formatador
  ruby-http-cookie ruby-i18n ruby-json ruby-libvirt ruby-listen ruby-log4r
  ruby-mime-types ruby-mime-types-data ruby-minitest ruby-multi-json
  ruby-net-scp ruby-net-sftp ruby-net-ssh ruby-net-telnet ruby-netrc
  ruby-nokogiri ruby-oj ruby-pkg-config ruby-power-assert ruby-rb-inotify
  ruby-rbnacl ruby-rest-client ruby-sqlite3 ruby-test-unit ruby-unf
  ruby-unf-ext ruby2.5 rubygems-integration scrub seabios sgabios sleuthkit
  sqlite3 supermin zerofree
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
```
 
### VirtualBox VM

```bash
ansible debian -m shell -a "apt -q -y update && apt -q -y upgrade"
[WARNING]: Platform linux on host debian is using the discovered Python
interpreter at /usr/bin/python3, but future installation of another Python
interpreter could change this. See https://docs.ansible.com/ansible/2.9/referen
ce_appendices/interpreter_discovery.html for more information.
debian | CHANGED | rc=0 >>
Get:1 http://security.debian.org/debian-security bullseye-security InRelease [44.1 kB]
Get:2 http://deb.debian.org/debian bullseye InRelease [150 kB]
Get:3 http://deb.debian.org/debian bullseye-updates InRelease [40.1 kB]
Get:4 http://deb.debian.org/debian bullseye-backports InRelease [37.0 kB]
Get:5 http://deb.debian.org/debian bullseye/main Sources.diff/Index [63.6 kB]
Get:6 http://deb.debian.org/debian bullseye/main amd64 Packages.diff/Index [63.6 kB]
Get:7 http://deb.debian.org/debian bullseye/main Translation-en.diff/Index [63.6 kB]
Get:8 http://deb.debian.org/debian bullseye/main Sources T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [985 B]
Get:9 http://deb.debian.org/debian bullseye/main amd64 Packages T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [734 B]
Get:8 http://deb.debian.org/debian bullseye/main Sources T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [985 B]
Get:9 http://deb.debian.org/debian bullseye/main amd64 Packages T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [734 B]
Get:10 http://deb.debian.org/debian bullseye/main Translation-en T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [33 B]
Get:10 http://deb.debian.org/debian bullseye/main Translation-en T-2021-07-08-1401.16-F-2021-07-08-1401.16.pdiff [33 B]
Fetched 463 kB in 25s (18.3 kB/s)
Reading package lists...
Building dependency tree...
Reading state information...
1 package can be upgraded. Run 'apt list --upgradable' to see it.
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages will be upgraded:
  python3-urllib3
apt-listchanges: Reading changelogs...
1 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/114 kB of archives.
After this operation, 1024 B of additional disk space will be used.
(Reading database ... 31852 files and directories currently installed.)
Preparing to unpack .../python3-urllib3_1.26.5-1~exp1_all.deb ...
Unpacking python3-urllib3 (1.26.5-1~exp1) over (1.26.4-1) ...
Setting up python3-urllib3 (1.26.5-1~exp1) ...
WARNING: apt does not have a stable CLI interface. Use with caution in scripts.


WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

ansible centos -m shell -a "yum -q -y update"
[WARNING]: Consider using the yum module rather than running 'yum'.  If you
need to use command because yum is insufficient you can add 'warn: false' to
this command task or set 'command_warnings=False' in ansible.cfg to get rid of
this message.
centos | CHANGED | rc=0 >>
```

## Remote connection

```bash
ansible work_02 -m apt -a "update_cache=yes upgrade=dist force_apt_get=yes"
work_02 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "msg": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\nThe following packages were automatically installed and are no longer required:\n  libgsoap-2.8.60 libvncserver1\nUse 'apt autoremove' to remove them.\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\n", 
    "stderr": "", 
    "stderr_lines": [], 
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nCalculating upgrade...\nThe following packages were automatically installed and are no longer required:\n  libgsoap-2.8.60 libvncserver1\nUse 'apt autoremove' to remove them.\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\n", 
    "stdout_lines": [
        "Reading package lists...", 
        "Building dependency tree...", 
        "Reading state information...", 
        "Calculating upgrade...", 
        "The following packages were automatically installed and are no longer required:", 
        "  libgsoap-2.8.60 libvncserver1", 
        "Use 'apt autoremove' to remove them.", 
        "0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded."
    ]
}
ansible work_01 -m yum -a "name=* state=latest"
 
------Output of that command is very long-----


nsible work_hosts -m shell -a "hostname && ifconfig"
work_01 | CHANGED | rc=0 >>
sa-centos-5
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.202.5  netmask 255.255.0.0  broadcast 192.168.255.255
        inet6 fe80::4480:beff:fe93:42d7  prefixlen 64  scopeid 0x20<link>
        ether 46:80:be:93:42:d7  txqueuelen 1000  (Ethernet)
        RX packets 26973756  bytes 2759861127 (2.5 GiB)
        RX errors 0  dropped 6535010  overruns 0  frame 0
        TX packets 846811  bytes 314582638 (300.0 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2  bytes 304 (304.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2  bytes 304 (304.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
work_02 | FAILED | rc=127 >>
sa-ubuntu-6/bin/sh: 1: ifconfig: not foundnon-zero return code
[denis@denis-PC ansible]$ ansible work_02 -m apt -a "name=net-tools state=present"
work_02 | CHANGED => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "cache_update_time": 1625922531, 
    "cache_updated": false, 
    "changed": true, 
    "stderr": "", 
    "stderr_lines": [], 
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\nThe following packages were automatically installed and are no longer required:\n  libgsoap-2.8.60 libvncserver1\nUse 'apt autoremove' to remove them.\nThe following NEW packages will be installed:\n  net-tools\n0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.\nNeed to get 194 kB of archives.\nAfter this operation, 803 kB of additional disk space will be used.\nGet:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 net-tools amd64 1.60+git20161116.90da8a0-1ubuntu1 [194 kB]\nFetched 194 kB in 0s (628 kB/s)\nSelecting previously unselected package net-tools.\r\n(Reading database ... \r(Reading database ... 5%\r(Reading database ... 10%\r(Reading database ... 15%\r(Reading database ... 20%\r(Reading database ... 25%\r(Reading database ... 30%\r(Reading database ... 35%\r(Reading database ... 40%\r(Reading database ... 45%\r(Reading database ... 50%\r(Reading database ... 55%\r(Reading database ... 60%\r(Reading database ... 65%\r(Reading database ... 70%\r(Reading database ... 75%\r(Reading database ... 80%\r(Reading database ... 85%\r(Reading database ... 90%\r(Reading database ... 95%\r(Reading database ... 100%\r(Reading database ... 88737 files and directories currently installed.)\r\nPreparing to unpack .../net-tools_1.60+git20161116.90da8a0-1ubuntu1_amd64.deb ...\r\nUnpacking net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...\r\nSetting up net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...\r\nProcessing triggers for man-db (2.8.3-2ubuntu0.1) ...\r\n", 
    "stdout_lines": [
        "Reading package lists...", 
        "Building dependency tree...", 
        "Reading state information...", 
        "The following packages were automatically installed and are no longer required:", 
        "  libgsoap-2.8.60 libvncserver1", 
        "Use 'apt autoremove' to remove them.", 
        "The following NEW packages will be installed:", 
        "  net-tools", 
        "0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.", 
        "Need to get 194 kB of archives.", 
        "After this operation, 803 kB of additional disk space will be used.", 
        "Get:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 net-tools amd64 1.60+git20161116.90da8a0-1ubuntu1 [194 kB]", 
        "Fetched 194 kB in 0s (628 kB/s)", 
        "Selecting previously unselected package net-tools.", 
        "(Reading database ... ", 
        "(Reading database ... 5%", 
        "(Reading database ... 10%", 
        "(Reading database ... 15%", 
        "(Reading database ... 20%", 
        "(Reading database ... 25%", 
        "(Reading database ... 30%", 
        "(Reading database ... 35%", 
        "(Reading database ... 40%", 
        "(Reading database ... 45%", 
        "(Reading database ... 50%", 
        "(Reading database ... 55%", 
        "(Reading database ... 60%", 
        "(Reading database ... 65%", 
        "(Reading database ... 70%", 
        "(Reading database ... 75%", 
        "(Reading database ... 80%", 
        "(Reading database ... 85%", 
        "(Reading database ... 90%", 
        "(Reading database ... 95%", 
        "(Reading database ... 100%", 
        "(Reading database ... 88737 files and directories currently installed.)", 
        "Preparing to unpack .../net-tools_1.60+git20161116.90da8a0-1ubuntu1_amd64.deb ...", 
        "Unpacking net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...", 
        "Setting up net-tools (1.60+git20161116.90da8a0-1ubuntu1) ...", 
        "Processing triggers for man-db (2.8.3-2ubuntu0.1) ..."
    ]
}
[denis@denis-PC ansible]$ ansible work_hosts -m shell -a "hostname && ifconfig"
work_02 | CHANGED | rc=0 >>
sa-ubuntu-6
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.202.6  netmask 255.255.0.0  broadcast 192.168.255.255
        inet6 fe80::58de:daff:fe4c:15ab  prefixlen 64  scopeid 0x20<link>
        ether 5a:de:da:4c:15:ab  txqueuelen 1000  (Ethernet)
        RX packets 73077  bytes 7874237 (7.8 MB)
        RX errors 0  dropped 25540  overruns 0  frame 0
        TX packets 5327  bytes 1668177 (1.6 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
work_01 | CHANGED | rc=0 >>
sa-centos-5
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.202.5  netmask 255.255.0.0  broadcast 192.168.255.255
        inet6 fe80::4480:beff:fe93:42d7  prefixlen 64  scopeid 0x20<link>
        ether 46:80:be:93:42:d7  txqueuelen 1000  (Ethernet)
        RX packets 26974504  bytes 2760009920 (2.5 GiB)
        RX errors 0  dropped 6535322  overruns 0  frame 0
        TX packets 846937  bytes 314612825 (300.0 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 2  bytes 304 (304.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2  bytes 304 (304.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```


