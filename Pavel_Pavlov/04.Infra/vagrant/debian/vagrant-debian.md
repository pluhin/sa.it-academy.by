# Console output for debian Vagrantfile

```
ppa@sm-debian:~/_labs/04.Infra/vagrant/debian$ vagrant up 
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'debian/buster64'...
==> default: Matching MAC address for NAT networking...
==> default: Setting the name of the VM: debian-10-test
==> default: Fixed port collision for 22 => 2222. Now on port 2200.
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: bridged
==> default: Forwarding ports...
    default: 22 (guest) => 2200 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2200
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
    default: The guest additions on this VM do not match the installed version of
    default: VirtualBox! In most cases this is fine, but in rare cases it can
    default: prevent things such as shared folders from working properly. If you see
    default: shared folder errors, please make sure the guest additions within the
    default: virtual machine match the version of VirtualBox you have installed on
    default: your host and reload your VM.
    default: 
    default: Guest Additions Version: 5.2.0 r68940
    default: VirtualBox Version: 6.1
==> default: Setting hostname...
==> default: Configuring and enabling network interfaces...
==> default: Installing rsync to the VM...
==> default: Rsyncing folder: /home/ppa/_labs/04.Infra/vagrant/debian/ => /vagrant
==> default: Running provisioner: shell...
    default: Running: inline script
    default: Add user updater
    default: updater   ALL=(ALL) NOPASSWD:ALL
    default: Install Software
    default: Reading package lists...
    default: Building dependency tree...
    default: Reading state information...
    default: nano is already the newest version (3.2-3).
    default: The following additional packages will be installed:                            
    default:   git-man libcurl4 liberror-perl patch
    default: Suggested packages:
    default:   git-daemon-run | git-daemon-sysvinit git-doc git-el git-email git-gui gitk
    default:   gitweb git-cvs git-mediawiki git-svn ed diffutils-doc
    default: The following NEW packages will be installed:
    default:   curl git git-man libcurl4 liberror-perl patch
    default: 0 upgraded, 6 newly installed, 0 to remove and 1 not upgraded.
    default: Need to get 7,993 kB of archives.                                               
    default: After this operation, 39.3 MB of additional disk space will be used.
    default: .....
    default: .....
    default: .....           
    default: Done...

==> default: Machine 'default' has a post `vagrant up` message. This is a message
==> default: from the creator of the Vagrantfile, and not from Vagrant itself:
==> default: 
==> default: Vanilla Debian box. See https://app.vagrantup.com/debian for help and bug reports
ppa@sm-debian:~/_labs/04.Infra/vagrant/debian$ vagrant ssh
Linux debian-10-test 4.19.0-8-amd64 #1 SMP Debian 4.19.98-1 (2020-01-26) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
vagrant@debian-10-test:~$ curl --version
curl 7.64.0 (x86_64-pc-linux-gnu) libcurl/7.64.0 OpenSSL/1.1.1d zlib/1.2.11 libidn2/2.0.5 libpsl/0.20.2 (+libidn2/2.0.5) libssh2/1.8.0 nghttp2/1.36.0 librtmp/2.3
Release-Date: 2019-02-06
Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet tftp 
Features: AsynchDNS IDN IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets HTTPS-proxy PSL 
vagrant@debian-10-test:~$ nano --version
 GNU nano, version 3.2
 (C) 1999-2011, 2013-2018 Free Software Foundation, Inc.
 (C) 2014-2018 the contributors to nano
 Email: nano@nano-editor.org    Web: https://nano-editor.org/
 Compiled options: --disable-libmagic --disable-wrapping-as-root --enable-utf8
vagrant@debian-10-test:~$ git --version 
git version 2.20.1
vagrant@debian-10-test:~$ su - updater
Password: 
updater@debian-10-test:~$ whoami
updater
updater@debian-10-test:~$ apt install mc
E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
updater@debian-10-test:~$ sudo apt-get -y -q install mc
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libglib2.0-0 libglib2.0-data libgpm2 mc-data shared-mime-info unzip xdg-user-dirs
Suggested packages:
  gpm arj catdvi | texlive-binaries dbview djvulibre-bin epub-utils genisoimage gv
  imagemagick libaspell-dev links | w3m | lynx odt2txt poppler-utils python-boto python-tz
  xpdf | pdf-viewer zip
The following NEW packages will be installed:
  libglib2.0-0 libglib2.0-data libgpm2 mc mc-data shared-mime-info unzip xdg-user-dirs
0 upgraded, 8 newly installed, 0 to remove and 1 not upgraded.
Need to get 5,201 kB of archives.
After this operation, 26.0 MB of additional disk space will be used.
.....
.....
.....
updater@debian-10-test:~$ mc --version
GNU Midnight Commander 4.8.22
Built with GLib 2.58.2
Using the S-Lang library with terminfo database
With builtin Editor
With subshell support as default
With support for background operations
With mouse support on xterm and Linux console
With support for X11 events
With internationalization support
With multiple codepages support
Virtual File Systems: cpiofs, tarfs, sfs, extfs, ext2undelfs, ftpfs, sftpfs, fish
Data types: char: 8; int: 32; long: 64; void *: 64; size_t: 64; off_t: 64;
updater@debian-10-test:~$ mc

updater@debian-10-test:~$ exit
logout
vagrant@debian-10-test:~$ exit
logout
Connection to 127.0.0.1 closed.
ppa@sm-debian:~/_labs/04.Infra/vagrant/debian$ vagrant package --output debian-10-test.box
==> default: Attempting graceful shutdown of VM...
==> default: Clearing any previously set forwarded ports...
==> default: Exporting VM...
==> default: Compressing package to: /home/ppa/_labs/04.Infra/vagrant/debian/debian-10-test.box
ppa@sm-debian:~/_labs/04.Infra/vagrant/debian$ 
