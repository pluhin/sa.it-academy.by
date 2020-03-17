# Console output for centos Vagrantfile

```
ppa@sm-debian:~/_labs/04.Infra/vagrant/centos$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'centos/7'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: centos-7-test
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: bridged
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: 
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default: 
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: No guest additions were detected on the base box for this VM! Guest
    default: additions are required for forwarded ports, shared folders, host only
    default: networking, and more. If SSH fails on this machine, please install
    default: the guest additions and repackage the box to continue.
    default: 
    default: This is not an error message; everything may continue to work properly,
    default: in which case you may ignore this message.
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Rsyncing folder: /home/ppa/_labs/04.Infra/vagrant/centos/ => /vagrant
==> default: Running provisioner: shell...
    default: Running: inline script
    default: Add user updater
    default: updater   ALL=(ALL) NOPASSWD:ALL
    default: Install Software
    default: No Presto metadata available for base
    default: No Presto metadata available for updates
    default: Public key for libssh2-1.8.0-3.el7.x86_64.rpm is not installed
    default: warning: /var/cache/yum/x86_64/7/base/packages/libssh2-1.8.0-3.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
    default: Public key for curl-7.29.0-54.el7_7.2.x86_64.rpm is not installed
    default: Importing GPG key 0xF4A80EB5:
    default:  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
    default:  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
    default:  Package    : centos-release-7-6.1810.2.el7.centos.x86_64 (@anaconda)
    default:  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
    default: Done...
ppa@sm-debian:~/_labs/04.Infra/vagrant/centos$ vagrant ssh
[vagrant@centos-7-test ~]$ su - updater
Password: 
[updater@centos-7-test ~]$ sudo yum install -y -q mc
[updater@centos-7-test ~]$ mc --version
GNU Midnight Commander 4.8.7
Built with GLib 2.42.2
Using the S-Lang library with terminfo database
With builtin Editor
With subshell support as default
With support for background operations
With mouse support on xterm and Linux console
With internationalization support
With multiple codepages support
Virtual File Systems: cpiofs, tarfs, sfs, extfs, ftpfs, sftpfs, fish, smbfs
Data types: char: 8; int: 32; long: 64; void *: 64; size_t: 64; off_t: 64;
[updater@centos-7-test ~]$ exit
logout
[vagrant@centos-7-test ~]$ curl --version
curl 7.29.0 (x86_64-redhat-linux-gnu) libcurl/7.29.0 NSS/3.44 zlib/1.2.7 libidn/1.28 libssh2/1.8.0
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp scp sftp smtp smtps telnet tftp 
Features: AsynchDNS GSS-Negotiate IDN IPv6 Largefile NTLM NTLM_WB SSL libz unix-sockets 
[vagrant@centos-7-test ~]$ git --version
git version 1.8.3.1
[vagrant@centos-7-test ~]$ nano --version
 GNU nano version 2.3.1 (compiled 04:47:52, Jun 10 2014)
 (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007,
 2008, 2009 Free Software Foundation, Inc.
 Email: nano@nano-editor.org    Web: http://www.nano-editor.org/
 Compiled options: --enable-color --enable-extra --enable-multibuffer --enable-nanorc --enable-utf8
[vagrant@centos-7-test ~]$ exit
logout
Connection to 127.0.0.1 closed.
ppa@sm-debian:~/_labs/04.Infra/vagrant/centos$ vagrant package --output centos-7-test.box
==> default: Attempting graceful shutdown of VM...
==> default: Clearing any previously set forwarded ports...
==> default: Exporting VM...
==> default: Compressing package to: /home/ppa/_labs/04.Infra/vagrant/centos/centos-7-test.box
ppa@sm-debian:~/_labs/04.Infra/vagrant/centos$ 
```
