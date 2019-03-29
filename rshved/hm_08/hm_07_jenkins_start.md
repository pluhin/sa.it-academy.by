# Lesson 7: Jenkins.Start
## "vagrant up" will automatically install jenkins behind nginx. And will work on 80 https
### Vagrant's directory:
```bash
romanshved:~/work/git/vagrantfiles/jenkins_cent_os tree
.
├── Vagrantfile
├── provision
│   ├── jenkins_with_nginx.yml
│   ├── restart_nginx.yml
│   └── roles
│       └── nginx_jenkins
│           ├── defaults
│           │   └── main.yml
│           ├── handlers
│           │   └── main.yml
│           ├── tasks
│           │   └── main.yml
│           └── templates
│               ├── config
│               └── nginx.conf
└── setup-jenkins.sh

7 directories, 9 files
```

### Vagrantfile:
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "centos/7"
    config.vm.define "Jenkins"
    config.vm.network "public_network", ip: "192.168.100.200",  bridge: "en0: Wi-Fi (AirPort)"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = 2000
        vb.cpus = 1
    end
    config.vm.provision :shell, :path => "setup-jenkins.sh"
    config.vm.provision "shell" do |s|
        ssh_pub_key = File.readlines("/Users/romanshved/.ssh/id_rsa.pub").first.strip
        s.inline = <<-SHELL
          mkdir /home/vagrant/.ssh
          mkdir /root/.ssh
          echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
          echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
        SHELL
    end
########### Provision Ansible ###############
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "provision/jenkins_with_nginx.yml"
        ansible.verbose = true
    end
########### vagrant plugin install vagrant-reload ###########    
    config.vm.provision :reload

########### After reload restart nginx ##############
    config.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "provision/restart_nginx.yml"
        ansible.verbose = true
    end
end
```

### setup-jenkins.sh:
```bash
#!/bin/sh
yum install java wget git -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
usermod -s /bin/bash jenkins
#sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#sudo firewall-cmd --reload
systemctl enable jenkins
systemctl start jenkins
echo "##### Waiting for secret"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]; do
    sleep 2
done
sudo runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "##### Secret here"
cat /var/lib/jenkins/secrets/initialAdminPassword
```

### jenkins_with_nginx.yml:
```yml
---
- hosts: all
  gather_facts: yes
  become: true
  roles:
    - nginx_jenkins
```

### tasks/main.yml
```bash
---
- name: add epel repo
  yum:
      name: epel-release
      state: present

- name: update packages on cent_os
  yum:
    name: "*"
    state: latest

- name: install packages
  yum:
    name:
      - vim
      - net-tools
      - nginx
    state: latest

- name: start and enable nginx
  service: 
    name: nginx
    state: started
    enabled: yes

- name: insert nginx.conf with proxy_pass
  template:
    src: nginx.conf
    dest: /etc/nginx/nginx.conf
  notify:
    - nginx_restart

- name: insert selinux config
  template:
    src: config
    dest: /etc/selinux/config

#- name: reboot server
#  reboot:
#     reboot_timeout: 600 
```

### templates/config for SElinux:
```
SELINUX=disabled
SELINUXTYPE=targeted
```

### templates/nginx.conf:
```
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;

events {
    worker_connections 1024;
}

http {
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile            on;
    tcp_nopush          on;
    tcp_nodelay         on;
    keepalive_timeout   65;
    types_hash_max_size 2048;

    include             /etc/nginx/mime.types;
    default_type        application/octet-stream;

    server {
        listen       80 default_server;
        listen       [::]:80 default_server;
        server_name  _;
        root         /usr/share/nginx/html;

        include /etc/nginx/default.d/*.conf;

        location / {
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
    }

    server {
 	 listen 192.168.100.200:80;
  	 access_log /var/log/nginx/proxy.log;
  	 location / {
    	 proxy_pass http://192.168.100.200:8080;
         }
    }
}
```

### handlers/main.yml
```yml
---
- name: nginx_restart
  service:
    name: nginx
    state: restarted
```

### restart_nginx.yml (after vagrant reload):
```yml
---
- hosts: all
  gather_facts: no
  become: true
  tasks:

  - name: restart nginx
    service:
      name: nginx
      state: restarted
      enabled: yes
```

# OUTPUT (a lot of text, sorry):
```bash
romanshved:~/work/git/vagrantfiles/jenkins_cent_os vagrant up
Bringing machine 'Jenkins' up with 'virtualbox' provider...
==> Jenkins: Importing base box 'centos/7'...
==> Jenkins: Matching MAC address for NAT networking...
==> Jenkins: Checking if box 'centos/7' version '1902.01' is up to date...
==> Jenkins: Setting the name of the VM: jenkins_cent_os_Jenkins_1552314300471_20087
==> Jenkins: Clearing any previously set network interfaces...
==> Jenkins: Preparing network interfaces based on configuration...
    Jenkins: Adapter 1: nat
    Jenkins: Adapter 2: bridged
==> Jenkins: Forwarding ports...
    Jenkins: 22 (guest) => 2222 (host) (adapter 1)
==> Jenkins: Running 'pre-boot' VM customizations...
==> Jenkins: Booting VM...
==> Jenkins: Waiting for machine to boot. This may take a few minutes...
    Jenkins: SSH address: 127.0.0.1:2222
    Jenkins: SSH username: vagrant
    Jenkins: SSH auth method: private key
    Jenkins: 
    Jenkins: Vagrant insecure key detected. Vagrant will automatically replace
    Jenkins: this with a newly generated keypair for better security.
    Jenkins: 
    Jenkins: Inserting generated public key within guest...
    Jenkins: Removing insecure key from the guest if it's present...
    Jenkins: Key inserted! Disconnecting and reconnecting using new SSH key...
==> Jenkins: Machine booted and ready!
==> Jenkins: Checking for guest additions in VM...
    Jenkins: No guest additions were detected on the base box for this VM! Guest
    Jenkins: additions are required for forwarded ports, shared folders, host only
    Jenkins: networking, and more. If SSH fails on this machine, please install
    Jenkins: the guest additions and repackage the box to continue.
    Jenkins: 
    Jenkins: This is not an error message; everything may continue to work properly,
    Jenkins: in which case you may ignore this message.
==> Jenkins: Configuring and enabling network interfaces...
==> Jenkins: Rsyncing folder: /Users/romanshved/work/git/vagrantfiles/jenkins_cent_os/ => /vagrant
==> Jenkins: Running provisioner: shell...
    Jenkins: Running: /var/folders/mk/ldt900x12cn8n_s_4wjs38dw0000gn/T/vagrant-shell20190311-9556-mqkw7j.sh
    Jenkins: --2019-03-11 14:25:53--  http://pkg.jenkins-ci.org/redhat/jenkins.repo
    Jenkins: Resolving pkg.jenkins-ci.org (pkg.jenkins-ci.org)... 
    Jenkins: 52.202.51.185
    Jenkins: Connecting to pkg.jenkins-ci.org (pkg.jenkins-ci.org)|52.202.51.185|:80... 
    Jenkins: connected.
    Jenkins: HTTP request sent, awaiting response... 
    Jenkins: 200 OK
    Jenkins: Length: 71
    Jenkins: Saving to: ‘/etc/yum.repos.d/jenkins.repo’
    Jenkins: 
    Jenkins:      0K                                                       100% 9.65M=0s
    Jenkins: 
    Jenkins: 2019-03-11 14:25:53 (9.65 MB/s) - ‘/etc/yum.repos.d/jenkins.repo’ saved [71/71]
    Jenkins: jenkins.service is not a native service, redirecting to /sbin/chkconfig.
    Jenkins: Executing /sbin/chkconfig jenkins on
    Jenkins: ##### Waiting for secret
    Jenkins: Generating public/private rsa key pair.
    Jenkins: Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): Created directory '/var/lib/jenkins/.ssh'.
    Jenkins: Your identification has been saved in /var/lib/jenkins/.ssh/id_rsa.
    Jenkins: Your public key has been saved in /var/lib/jenkins/.ssh/id_rsa.pub.
    Jenkins: The key fingerprint is:
    Jenkins: SHA256:iZYtx9N9Ig4+4fPlL3jF3kUJA1+aOuRFXuBypZ/XCVY jenkins@10.0.2.15
    Jenkins: The key's randomart image is:
    Jenkins: +---[RSA 2048]----+
    Jenkins: |           ..o.E |
    Jenkins: |            =oO  |
    Jenkins: |           o %o .|
    Jenkins: |       = oo.* o.=|
    Jenkins: |      = S o+o..=o|
    Jenkins: |     . = = ..oo o|
    Jenkins: |        = ...o ..|
    Jenkins: |         +.oo . .|
    Jenkins: |          ...o.  |
    Jenkins: +----[SHA256]-----+
    Jenkins: Enter passphrase (empty for no passphrase): Enter same passphrase again: 
    Jenkins: -----BEGIN RSA PRIVATE KEY-----
    Jenkins: MIIEowIBAAKCAQEAmHyMQfs9HNBNwyF9HnYOo5rGL+bKtxXlorCjL0kpEXRLbvT/
    Jenkins: 96fKECxnIwv6vv5CWwAgP51WEWtilXXYlesuN/XQeagvT9ALJ3nUTgA91t91kxm+
    Jenkins: gnON/7s1lGYXfvFwtBMIsnAcDtl0f9HtlmQv8n2AF9akC7XiW0dZLS0X13HLnrMu
    Jenkins: yXNdpKOoWqjXt+JtleNS6GznsdOW3d4WDT5dMNCPffOpgrIDSutOoroc0tDILCg8
    Jenkins: o7LtfBhCm4I3QeTw2EWfdBNdLyFhfHhQBXyllY/NI3f9TtfNna2q1y8xQbYyMIw9
    Jenkins: 891VG+9yf9pGSOwpgUXeTb/bmum27Rgd8+G4pwIDAQABAoIBABgmKWRNsKj+iEIt
    Jenkins: 7I3Fbp4UZeyyJUqHij2QsddMQ9fCzit9W4hSJ1sWXSMcw5I53DJjO7g3Z6kMk6lN
    Jenkins: 54Yen8w2/tQ1gYCnVwzia3AK88Ay1YD9Y8FvIX7tnBerb28oN4wdM5Rm0tq7L4sK
    Jenkins: qRDXPwytOXsNAB/mpzmDfCj+ajcxTNQ6Ua0a3WEK5I9VsfsIFz5AMZqHlXJrWM2C
    Jenkins: jsGxbnObrTZpEJm/rVRagFyGnfepAjy079i49QIDOZ0Gv9FF4x1FB0UAjGUsKpF1
    Jenkins: C1+JJyNoZNjuLJJMHIFemtdmKp4gfbSKeX9pocuowuTdsDpVhbMABiraxcDU9WGY
    Jenkins: 9PhSiYECgYEAxmVfcbKMDPOrLmJiPB7VWirUtcVxDfn7AeixLf4O/fGEV/cW9tOD
    Jenkins: PDrf/UtIIF5mkaCnkROrd/aK6fawYvqh/RMoQEO8OCGi4OxUBpS5qzqbIJ9DE60G
    Jenkins: EYlsTJFleH63BRrQyQhHCqvfpO5mdoQVLGbmbrLTBOatZK9Kly83oMECgYEAxMLC
    Jenkins: BOEewCfTUNjriUDx/JgvALeDT/A2CGTy/G00QJASs70RwKY/QINoUAJNMrxpxYk6
    Jenkins: qB4t8YOr/VoM7kyx9e/IMIvT/XjSvX7PycJXUotPogBFpd1+AFDa4RJvUsngLRWH
    Jenkins: zo5sZ3Yj6ojH0aSVeiSEWwmTHcyDZqzWUWLHy2cCgYB3S1djt3etBgvFfVUST3v8
    Jenkins: lsqGbi13uPusfy2iuSRsn//zINlHG5HK8p/i35SEGh9Uq6R2gLxXCwEmg7Y2Hfyv
    Jenkins: fwhx9AjGO7uDwbcYqe8mvbuvlvQvbZe7jcV4GOlJ1e/Y+vHWH8sP6J82vj8QPoW4
    Jenkins: yDsBDzgBt29Fnn2cgMDTQQKBgHJBRbjfoKOkfKjtzZgeBmbPWDvqVG4O5tFpDVBX
    Jenkins: eYgkITgOCkj8QK6Nn/0V2Q4lKqZyUYVeQP+FnlG4ANo/3vcZDf5is+70QiuXf8GB
    Jenkins: AIQGMW+5CLiQLaKxUOhxdAN3Bp4nan0fZwONLr36P04VbFdI7TKQFMWxBHyS0MDh
    Jenkins: w3LxAoGBAIgiQW70psU6vy46G+m7Re2I3+hDL0JmuPz4I184Wro/zZvohqKqK8Rg
    Jenkins: Ht1gWYW3Zzn3MgSEnS+mTu2ZKUJvIxlrYMgy4lI/feg/p3rq+Vg5CGN+/2/phULK
    Jenkins: fkrkTzHGAEKImXg/KvPbt8BPOgaBhmPlCCOrioUTQNGWDdiWdcp8
    Jenkins: -----END RSA PRIVATE KEY-----
    Jenkins: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYfIxB+z0c0E3DIX0edg6jmsYv5sq3FeWisKMvSSkRdEtu9P/3p8oQLGcjC/q+/kJbACA/nVYRa2KVddiV6y439dB5qC9P0AsnedROAD3W33WTGb6Cc43/uzWUZhd+8XC0EwiycBwO2XR/0e2WZC/yfYAX1qQLteJbR1ktLRfXccuesy7Jc12ko6haqNe34m2V41LobOex05bd3hYNPl0w0I9986mCsgNK606iuhzS0MgsKDyjsu18GEKbgjdB5PDYRZ90E10vIWF8eFAFfKWVj80jd/1O182drarXLzFBtjIwjD3z3VUb73J/2kZI7CmBRd5Nv9ua6bbtGB3z4bin jenkins@10.0.2.15
    Jenkins: ##### Secret here
    Jenkins: 327682a4f1d24423ac4acf4df154cf82
==> Jenkins: Running provisioner: shell...
    Jenkins: Running: inline script
    Jenkins: mkdir: cannot create directory ‘/home/vagrant/.ssh’: File exists
==> Jenkins: Running provisioner: ansible_local...
    Jenkins: Installing Ansible...
Vagrant has automatically selected the compatibility mode '2.0'
according to the Ansible version installed (2.7.8).

Alternatively, the compatibility mode can be specified in your Vagrantfile:
https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

    Jenkins: Running ansible-playbook...
cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="Jenkins" --inventory-file=/tmp/vagrant-ansible/inventory -v provision/jenkins_with_nginx.yml
Using /etc/ansible/ansible.cfg as config file
/tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory did not meet host_list requirements, check plugin documentation if this is unexpected
/tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory did not meet script requirements, check plugin documentation if this is unexpected

PLAY [all] *********************************************************************

TASK [Gathering Facts] *********************************************************
ok: [Jenkins]

TASK [nginx_jenkins : add epel repo] *******************************************
ok: [Jenkins] => {"changed": false, "msg": "", "rc": 0, "results": ["epel-release-7-11.noarch providing epel-release is already installed"]}

TASK [nginx_jenkins : update packages on cent_os] ******************************
changed: [Jenkins] => {"changed": true, "msg": "", "rc": 0, "results": ["Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.ip-connect.vn.ua\n * epel: mirror.logol.ru\n * extras: centos.ip-connect.vn.ua\n * updates: centos.ip-connect.vn.ua\nResolving Dependencies\n--> Running transaction check\n---> Package polkit.x86_64 0:0.112-18.el7 will be updated\n---> Package polkit.x86_64 0:0.112-18.el7_6.1 will be an update\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package        Arch           Version                    Repository       Size\n================================================================================\nUpdating:\n polkit         x86_64         0.112-18.el7_6.1           updates         168 k\n\nTransaction Summary\n================================================================================\nUpgrade  1 Package\n\nTotal download size: 168 k\nDownloading packages:\nNot downloading deltainfo for updates, MD is 358 k and rpms are 168 k\nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Updating   : polkit-0.112-18.el7_6.1.x86_64                               1/2 \n  Cleanup    : polkit-0.112-18.el7.x86_64                                   2/2 \n  Verifying  : polkit-0.112-18.el7_6.1.x86_64                               1/2 \n  Verifying  : polkit-0.112-18.el7.x86_64                                   2/2 \n\nUpdated:\n  polkit.x86_64 0:0.112-18.el7_6.1                                              \n\nComplete!\n"]}

TASK [nginx_jenkins : install packages] ****************************************
changed: [Jenkins] => {"changed": true, "msg": "", "rc": 0, "results": ["Loaded plugins: fastestmirror\nLoading mirror speeds from cached hostfile\n * base: centos.ip-connect.vn.ua\n * epel: mirror.de.leaseweb.net\n * extras: centos.ip-connect.vn.ua\n * updates: centos.ip-connect.vn.ua\nResolving Dependencies\n--> Running transaction check\n---> Package net-tools.x86_64 0:2.0-0.24.20131004git.el7 will be installed\n---> Package nginx.x86_64 1:1.12.2-2.el7 will be installed\n--> Processing Dependency: nginx-all-modules = 1:1.12.2-2.el7 for package: 1:nginx-1.12.2-2.el7.x86_64\n--> Processing Dependency: nginx-filesystem = 1:1.12.2-2.el7 for package: 1:nginx-1.12.2-2.el7.x86_64\n--> Processing Dependency: nginx-filesystem for package: 1:nginx-1.12.2-2.el7.x86_64\n--> Processing Dependency: libprofiler.so.0()(64bit) for package: 1:nginx-1.12.2-2.el7.x86_64\n---> Package vim-enhanced.x86_64 2:7.4.160-5.el7 will be installed\n--> Processing Dependency: vim-common = 2:7.4.160-5.el7 for package: 2:vim-enhanced-7.4.160-5.el7.x86_64\n--> Processing Dependency: libgpm.so.2()(64bit) for package: 2:vim-enhanced-7.4.160-5.el7.x86_64\n--> Running transaction check\n---> Package gperftools-libs.x86_64 0:2.6.1-1.el7 will be installed\n---> Package gpm-libs.x86_64 0:1.20.7-5.el7 will be installed\n---> Package nginx-all-modules.noarch 1:1.12.2-2.el7 will be installed\n--> Processing Dependency: nginx-mod-http-geoip = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n--> Processing Dependency: nginx-mod-http-image-filter = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n--> Processing Dependency: nginx-mod-http-perl = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n--> Processing Dependency: nginx-mod-http-xslt-filter = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n--> Processing Dependency: nginx-mod-mail = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n--> Processing Dependency: nginx-mod-stream = 1:1.12.2-2.el7 for package: 1:nginx-all-modules-1.12.2-2.el7.noarch\n---> Package nginx-filesystem.noarch 1:1.12.2-2.el7 will be installed\n---> Package vim-common.x86_64 2:7.4.160-5.el7 will be installed\n--> Processing Dependency: vim-filesystem for package: 2:vim-common-7.4.160-5.el7.x86_64\n--> Running transaction check\n---> Package nginx-mod-http-geoip.x86_64 1:1.12.2-2.el7 will be installed\n---> Package nginx-mod-http-image-filter.x86_64 1:1.12.2-2.el7 will be installed\n--> Processing Dependency: gd for package: 1:nginx-mod-http-image-filter-1.12.2-2.el7.x86_64\n--> Processing Dependency: libgd.so.2()(64bit) for package: 1:nginx-mod-http-image-filter-1.12.2-2.el7.x86_64\n---> Package nginx-mod-http-perl.x86_64 1:1.12.2-2.el7 will be installed\n---> Package nginx-mod-http-xslt-filter.x86_64 1:1.12.2-2.el7 will be installed\n---> Package nginx-mod-mail.x86_64 1:1.12.2-2.el7 will be installed\n---> Package nginx-mod-stream.x86_64 1:1.12.2-2.el7 will be installed\n---> Package vim-filesystem.x86_64 2:7.4.160-5.el7 will be installed\n--> Running transaction check\n---> Package gd.x86_64 0:2.0.35-26.el7 will be installed\n--> Processing Dependency: libXpm.so.4()(64bit) for package: gd-2.0.35-26.el7.x86_64\n--> Running transaction check\n---> Package libXpm.x86_64 0:3.5.12-1.el7 will be installed\n--> Finished Dependency Resolution\n\nDependencies Resolved\n\n================================================================================\n Package                       Arch     Version                    Repository\n                                                                           Size\n================================================================================\nInstalling:\n net-tools                     x86_64   2.0-0.24.20131004git.el7   base   306 k\n nginx                         x86_64   1:1.12.2-2.el7             epel   530 k\n vim-enhanced                  x86_64   2:7.4.160-5.el7            base   1.0 M\nInstalling for dependencies:\n gd                            x86_64   2.0.35-26.el7              base   146 k\n gperftools-libs               x86_64   2.6.1-1.el7                base   272 k\n gpm-libs                      x86_64   1.20.7-5.el7               base    32 k\n libXpm                        x86_64   3.5.12-1.el7               base    55 k\n nginx-all-modules             noarch   1:1.12.2-2.el7             epel    16 k\n nginx-filesystem              noarch   1:1.12.2-2.el7             epel    17 k\n nginx-mod-http-geoip          x86_64   1:1.12.2-2.el7             epel    23 k\n nginx-mod-http-image-filter   x86_64   1:1.12.2-2.el7             epel    26 k\n nginx-mod-http-perl           x86_64   1:1.12.2-2.el7             epel    36 k\n nginx-mod-http-xslt-filter    x86_64   1:1.12.2-2.el7             epel    26 k\n nginx-mod-mail                x86_64   1:1.12.2-2.el7             epel    54 k\n nginx-mod-stream              x86_64   1:1.12.2-2.el7             epel    76 k\n vim-common                    x86_64   2:7.4.160-5.el7            base   5.9 M\n vim-filesystem                x86_64   2:7.4.160-5.el7            base    10 k\n\nTransaction Summary\n================================================================================\nInstall  3 Packages (+14 Dependent packages)\n\nTotal download size: 8.5 M\nInstalled size: 28 M\nDownloading packages:\n--------------------------------------------------------------------------------\nTotal                                              4.1 MB/s | 8.5 MB  00:02     \nRunning transaction check\nRunning transaction test\nTransaction test succeeded\nRunning transaction\n  Installing : 2:vim-filesystem-7.4.160-5.el7.x86_64                       1/17 \n  Installing : 2:vim-common-7.4.160-5.el7.x86_64                           2/17 \n  Installing : gpm-libs-1.20.7-5.el7.x86_64                                3/17 \n  Installing : gperftools-libs-2.6.1-1.el7.x86_64                          4/17 \n  Installing : 1:nginx-filesystem-1.12.2-2.el7.noarch                      5/17 \n  Installing : libXpm-3.5.12-1.el7.x86_64                                  6/17 \n  Installing : gd-2.0.35-26.el7.x86_64                                     7/17 \n  Installing : 1:nginx-mod-http-xslt-filter-1.12.2-2.el7.x86_64            8/17 \n  Installing : 1:nginx-mod-http-perl-1.12.2-2.el7.x86_64                   9/17 \n  Installing : 1:nginx-mod-mail-1.12.2-2.el7.x86_64                       10/17 \n  Installing : 1:nginx-mod-http-geoip-1.12.2-2.el7.x86_64                 11/17 \n  Installing : 1:nginx-mod-stream-1.12.2-2.el7.x86_64                     12/17 \n  Installing : 1:nginx-1.12.2-2.el7.x86_64                                13/17 \n  Installing : 1:nginx-mod-http-image-filter-1.12.2-2.el7.x86_64          14/17 \n  Installing : 1:nginx-all-modules-1.12.2-2.el7.noarch                    15/17 \n  Installing : 2:vim-enhanced-7.4.160-5.el7.x86_64                        16/17 \n  Installing : net-tools-2.0-0.24.20131004git.el7.x86_64                  17/17 \n  Verifying  : libXpm-3.5.12-1.el7.x86_64                                  1/17 \n  Verifying  : 1:nginx-filesystem-1.12.2-2.el7.noarch                      2/17 \n  Verifying  : gd-2.0.35-26.el7.x86_64                                     3/17 \n  Verifying  : net-tools-2.0-0.24.20131004git.el7.x86_64                   4/17 \n  Verifying  : 1:nginx-mod-http-xslt-filter-1.12.2-2.el7.x86_64            5/17 \n  Verifying  : 2:vim-enhanced-7.4.160-5.el7.x86_64                         6/17 \n  Verifying  : 1:nginx-mod-http-perl-1.12.2-2.el7.x86_64                   7/17 \n  Verifying  : gperftools-libs-2.6.1-1.el7.x86_64                          8/17 \n  Verifying  : 1:nginx-1.12.2-2.el7.x86_64                                 9/17 \n  Verifying  : 1:nginx-mod-mail-1.12.2-2.el7.x86_64                       10/17 \n  Verifying  : 1:nginx-all-modules-1.12.2-2.el7.noarch                    11/17 \n  Verifying  : 1:nginx-mod-http-geoip-1.12.2-2.el7.x86_64                 12/17 \n  Verifying  : gpm-libs-1.20.7-5.el7.x86_64                               13/17 \n  Verifying  : 1:nginx-mod-http-image-filter-1.12.2-2.el7.x86_64          14/17 \n  Verifying  : 2:vim-common-7.4.160-5.el7.x86_64                          15/17 \n  Verifying  : 1:nginx-mod-stream-1.12.2-2.el7.x86_64                     16/17 \n  Verifying  : 2:vim-filesystem-7.4.160-5.el7.x86_64                      17/17 \n\nInstalled:\n  net-tools.x86_64 0:2.0-0.24.20131004git.el7    nginx.x86_64 1:1.12.2-2.el7   \n  vim-enhanced.x86_64 2:7.4.160-5.el7           \n\nDependency Installed:\n  gd.x86_64 0:2.0.35-26.el7                                                     \n  gperftools-libs.x86_64 0:2.6.1-1.el7                                          \n  gpm-libs.x86_64 0:1.20.7-5.el7                                                \n  libXpm.x86_64 0:3.5.12-1.el7                                                  \n  nginx-all-modules.noarch 1:1.12.2-2.el7                                       \n  nginx-filesystem.noarch 1:1.12.2-2.el7                                        \n  nginx-mod-http-geoip.x86_64 1:1.12.2-2.el7                                    \n  nginx-mod-http-image-filter.x86_64 1:1.12.2-2.el7                             \n  nginx-mod-http-perl.x86_64 1:1.12.2-2.el7                                     \n  nginx-mod-http-xslt-filter.x86_64 1:1.12.2-2.el7                              \n  nginx-mod-mail.x86_64 1:1.12.2-2.el7                                          \n  nginx-mod-stream.x86_64 1:1.12.2-2.el7                                        \n  vim-common.x86_64 2:7.4.160-5.el7                                             \n  vim-filesystem.x86_64 2:7.4.160-5.el7                                         \n\nComplete!\n"]}

TASK [nginx_jenkins : start and enable nginx] **********************************
changed: [Jenkins] => {"changed": true, "enabled": true, "name": "nginx", "state": "started", "status": {"ActiveEnterTimestampMonotonic": "0", "ActiveExitTimestampMonotonic": "0", "ActiveState": "inactive", "After": "tmp.mount systemd-journald.socket -.mount nss-lookup.target basic.target network.target remote-fs.target system.slice", "AllowIsolate": "no", "AmbientCapabilities": "0", "AssertResult": "no", "AssertTimestampMonotonic": "0", "Before": "shutdown.target", "BlockIOAccounting": "no", "BlockIOWeight": "18446744073709551615", "CPUAccounting": "no", "CPUQuotaPerSecUSec": "infinity", "CPUSchedulingPolicy": "0", "CPUSchedulingPriority": "0", "CPUSchedulingResetOnFork": "no", "CPUShares": "18446744073709551615", "CanIsolate": "no", "CanReload": "yes", "CanStart": "yes", "CanStop": "yes", "CapabilityBoundingSet": "18446744073709551615", "ConditionResult": "no", "ConditionTimestampMonotonic": "0", "Conflicts": "shutdown.target", "ControlPID": "0", "DefaultDependencies": "yes", "Delegate": "no", "Description": "The nginx HTTP and reverse proxy server", "DevicePolicy": "auto", "ExecMainCode": "0", "ExecMainExitTimestampMonotonic": "0", "ExecMainPID": "0", "ExecMainStartTimestampMonotonic": "0", "ExecMainStatus": "0", "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -s HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "FailureAction": "none", "FileDescriptorStoreMax": "0", "FragmentPath": "/usr/lib/systemd/system/nginx.service", "GuessMainPID": "yes", "IOScheduling": "0", "Id": "nginx.service", "IgnoreOnIsolate": "no", "IgnoreOnSnapshot": "no", "IgnoreSIGPIPE": "yes", "InactiveEnterTimestampMonotonic": "0", "InactiveExitTimestampMonotonic": "0", "JobTimeoutAction": "none", "JobTimeoutUSec": "0", "KillMode": "process", "KillSignal": "3", "LimitAS": "18446744073709551615", "LimitCORE": "18446744073709551615", "LimitCPU": "18446744073709551615", "LimitDATA": "18446744073709551615", "LimitFSIZE": "18446744073709551615", "LimitLOCKS": "18446744073709551615", "LimitMEMLOCK": "65536", "LimitMSGQUEUE": "819200", "LimitNICE": "0", "LimitNOFILE": "4096", "LimitNPROC": "7098", "LimitRSS": "18446744073709551615", "LimitRTPRIO": "0", "LimitRTTIME": "18446744073709551615", "LimitSIGPENDING": "7098", "LimitSTACK": "18446744073709551615", "LoadState": "loaded", "MainPID": "0", "MemoryAccounting": "no", "MemoryCurrent": "18446744073709551615", "MemoryLimit": "18446744073709551615", "MountFlags": "0", "Names": "nginx.service", "NeedDaemonReload": "no", "Nice": "0", "NoNewPrivileges": "no", "NonBlocking": "no", "NotifyAccess": "none", "OOMScoreAdjust": "0", "OnFailureJobMode": "replace", "PIDFile": "/run/nginx.pid", "PermissionsStartOnly": "no", "PrivateDevices": "no", "PrivateNetwork": "no", "PrivateTmp": "yes", "ProtectHome": "no", "ProtectSystem": "no", "RefuseManualStart": "no", "RefuseManualStop": "no", "RemainAfterExit": "no", "Requires": "basic.target -.mount", "RequiresMountsFor": "/var/tmp", "Restart": "no", "RestartUSec": "100ms", "Result": "success", "RootDirectoryStartOnly": "no", "RuntimeDirectoryMode": "0755", "SameProcessGroup": "no", "SecureBits": "0", "SendSIGHUP": "no", "SendSIGKILL": "yes", "Slice": "system.slice", "StandardError": "inherit", "StandardInput": "null", "StandardOutput": "journal", "StartLimitAction": "none", "StartLimitBurst": "5", "StartLimitInterval": "10000000", "StartupBlockIOWeight": "18446744073709551615", "StartupCPUShares": "18446744073709551615", "StatusErrno": "0", "StopWhenUnneeded": "no", "SubState": "dead", "SyslogLevelPrefix": "yes", "SyslogPriority": "30", "SystemCallErrorNumber": "0", "TTYReset": "no", "TTYVHangup": "no", "TTYVTDisallocate": "no", "TasksAccounting": "no", "TasksCurrent": "18446744073709551615", "TasksMax": "18446744073709551615", "TimeoutStartUSec": "1min 30s", "TimeoutStopUSec": "5s", "TimerSlackNSec": "50000", "Transient": "no", "Type": "forking", "UMask": "0022", "UnitFilePreset": "disabled", "UnitFileState": "disabled", "Wants": "system.slice", "WatchdogTimestampMonotonic": "0", "WatchdogUSec": "0"}}

TASK [nginx_jenkins : insert nginx.conf with proxy_pass] ***********************
changed: [Jenkins] => {"changed": true, "checksum": "f512901f71da8061bd631cb0af9bbfbe5e63c8cd", "dest": "/etc/nginx/nginx.conf", "gid": 0, "group": "root", "md5sum": "b61814521150df8f5acdc5a2dfafa28d", "mode": "0644", "owner": "root", "secontext": "system_u:object_r:httpd_config_t:s0", "size": 1274, "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1552314458.48-43160030375557/source", "state": "file", "uid": 0}

TASK [nginx_jenkins : insert selinux config] ***********************************
changed: [Jenkins] => {"changed": true, "checksum": "b33818b2f2cb4f389cc61f433eea533fa17a5961", "dest": "/etc/selinux/config", "gid": 0, "group": "root", "md5sum": "c3f9c2d13f889e89af86e42f4e2e5f25", "mode": "0644", "owner": "root", "secontext": "system_u:object_r:selinux_config_t:s0", "size": 37, "src": "/home/vagrant/.ansible/tmp/ansible-tmp-1552314458.93-84371163724005/source", "state": "file", "uid": 0}

RUNNING HANDLER [nginx_jenkins : nginx_restart] ********************************
changed: [Jenkins] => {"changed": true, "name": "nginx", "state": "started", "status": {"ActiveEnterTimestamp": "Mon 2019-03-11 14:27:38 UTC", "ActiveEnterTimestampMonotonic": "152057195", "ActiveExitTimestampMonotonic": "0", "ActiveState": "active", "After": "system.slice nss-lookup.target systemd-journald.socket remote-fs.target basic.target tmp.mount network.target -.mount", "AllowIsolate": "no", "AmbientCapabilities": "0", "AssertResult": "yes", "AssertTimestamp": "Mon 2019-03-11 14:27:38 UTC", "AssertTimestampMonotonic": "151996898", "Before": "shutdown.target multi-user.target", "BlockIOAccounting": "no", "BlockIOWeight": "18446744073709551615", "CPUAccounting": "no", "CPUQuotaPerSecUSec": "infinity", "CPUSchedulingPolicy": "0", "CPUSchedulingPriority": "0", "CPUSchedulingResetOnFork": "no", "CPUShares": "18446744073709551615", "CanIsolate": "no", "CanReload": "yes", "CanStart": "yes", "CanStop": "yes", "CapabilityBoundingSet": "18446744073709551615", "ConditionResult": "yes", "ConditionTimestamp": "Mon 2019-03-11 14:27:38 UTC", "ConditionTimestampMonotonic": "151996898", "Conflicts": "shutdown.target", "ControlGroup": "/system.slice/nginx.service", "ControlPID": "0", "DefaultDependencies": "yes", "Delegate": "no", "Description": "The nginx HTTP and reverse proxy server", "DevicePolicy": "auto", "ExecMainCode": "0", "ExecMainExitTimestampMonotonic": "0", "ExecMainPID": "7719", "ExecMainStartTimestamp": "Mon 2019-03-11 14:27:38 UTC", "ExecMainStartTimestampMonotonic": "152057110", "ExecMainStatus": "0", "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -s HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[Mon 2019-03-11 14:27:38 UTC] ; stop_time=[Mon 2019-03-11 14:27:38 UTC] ; pid=7717 ; code=exited ; status=0 }", "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[Mon 2019-03-11 14:27:38 UTC] ; stop_time=[Mon 2019-03-11 14:27:38 UTC] ; pid=7714 ; code=exited ; status=0 }", "FailureAction": "none", "FileDescriptorStoreMax": "0", "FragmentPath": "/usr/lib/systemd/system/nginx.service", "GuessMainPID": "yes", "IOScheduling": "0", "Id": "nginx.service", "IgnoreOnIsolate": "no", "IgnoreOnSnapshot": "no", "IgnoreSIGPIPE": "yes", "InactiveEnterTimestampMonotonic": "0", "InactiveExitTimestamp": "Mon 2019-03-11 14:27:38 UTC", "InactiveExitTimestampMonotonic": "151998035", "JobTimeoutAction": "none", "JobTimeoutUSec": "0", "KillMode": "process", "KillSignal": "3", "LimitAS": "18446744073709551615", "LimitCORE": "18446744073709551615", "LimitCPU": "18446744073709551615", "LimitDATA": "18446744073709551615", "LimitFSIZE": "18446744073709551615", "LimitLOCKS": "18446744073709551615", "LimitMEMLOCK": "65536", "LimitMSGQUEUE": "819200", "LimitNICE": "0", "LimitNOFILE": "4096", "LimitNPROC": "7098", "LimitRSS": "18446744073709551615", "LimitRTPRIO": "0", "LimitRTTIME": "18446744073709551615", "LimitSIGPENDING": "7098", "LimitSTACK": "18446744073709551615", "LoadState": "loaded", "MainPID": "7719", "MemoryAccounting": "no", "MemoryCurrent": "18446744073709551615", "MemoryLimit": "18446744073709551615", "MountFlags": "0", "Names": "nginx.service", "NeedDaemonReload": "no", "Nice": "0", "NoNewPrivileges": "no", "NonBlocking": "no", "NotifyAccess": "none", "OOMScoreAdjust": "0", "OnFailureJobMode": "replace", "PIDFile": "/run/nginx.pid", "PermissionsStartOnly": "no", "PrivateDevices": "no", "PrivateNetwork": "no", "PrivateTmp": "yes", "ProtectHome": "no", "ProtectSystem": "no", "RefuseManualStart": "no", "RefuseManualStop": "no", "RemainAfterExit": "no", "Requires": "basic.target -.mount", "RequiresMountsFor": "/var/tmp", "Restart": "no", "RestartUSec": "100ms", "Result": "success", "RootDirectoryStartOnly": "no", "RuntimeDirectoryMode": "0755", "SameProcessGroup": "no", "SecureBits": "0", "SendSIGHUP": "no", "SendSIGKILL": "yes", "Slice": "system.slice", "StandardError": "inherit", "StandardInput": "null", "StandardOutput": "journal", "StartLimitAction": "none", "StartLimitBurst": "5", "StartLimitInterval": "10000000", "StartupBlockIOWeight": "18446744073709551615", "StartupCPUShares": "18446744073709551615", "StatusErrno": "0", "StopWhenUnneeded": "no", "SubState": "running", "SyslogLevelPrefix": "yes", "SyslogPriority": "30", "SystemCallErrorNumber": "0", "TTYReset": "no", "TTYVHangup": "no", "TTYVTDisallocate": "no", "TasksAccounting": "no", "TasksCurrent": "18446744073709551615", "TasksMax": "18446744073709551615", "TimeoutStartUSec": "1min 30s", "TimeoutStopUSec": "5s", "TimerSlackNSec": "50000", "Transient": "no", "Type": "forking", "UMask": "0022", "UnitFilePreset": "disabled", "UnitFileState": "enabled", "WantedBy": "multi-user.target", "Wants": "system.slice", "WatchdogTimestampMonotonic": "0", "WatchdogUSec": "0"}}

PLAY RECAP *********************************************************************
Jenkins                    : ok=8    changed=6    unreachable=0    failed=0   

==> Jenkins: Running provisioner: reload...
==> Jenkins: Attempting graceful shutdown of VM...
==> Jenkins: Checking if box 'centos/7' version '1902.01' is up to date...
==> Jenkins: Clearing any previously set forwarded ports...
==> Jenkins: Clearing any previously set network interfaces...
==> Jenkins: Preparing network interfaces based on configuration...
    Jenkins: Adapter 1: nat
    Jenkins: Adapter 2: bridged
==> Jenkins: Forwarding ports...
    Jenkins: 22 (guest) => 2222 (host) (adapter 1)
==> Jenkins: Running 'pre-boot' VM customizations...
==> Jenkins: Booting VM...
==> Jenkins: Waiting for machine to boot. This may take a few minutes...
==> Jenkins: Machine booted and ready!
==> Jenkins: Checking for guest additions in VM...
    Jenkins: No guest additions were detected on the base box for this VM! Guest
    Jenkins: additions are required for forwarded ports, shared folders, host only
    Jenkins: networking, and more. If SSH fails on this machine, please install
    Jenkins: the guest additions and repackage the box to continue.
    Jenkins: 
    Jenkins: This is not an error message; everything may continue to work properly,
    Jenkins: in which case you may ignore this message.
==> Jenkins: Configuring and enabling network interfaces...
==> Jenkins: Rsyncing folder: /Users/romanshved/work/git/vagrantfiles/jenkins_cent_os/ => /vagrant
==> Jenkins: Machine already provisioned. Run `vagrant provision` or use the `--provision`
==> Jenkins: flag to force provisioning. Provisioners marked to run always will still run.
==> Jenkins: Running provisioner: ansible_local...
Vagrant has automatically selected the compatibility mode '2.0'
according to the Ansible version installed (2.7.8).

Alternatively, the compatibility mode can be specified in your Vagrantfile:
https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode

    Jenkins: Running ansible-playbook...
cd /vagrant && PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ansible-playbook --limit="Jenkins" --inventory-file=/tmp/vagrant-ansible/inventory -v provision/restart_nginx.yml
Using /etc/ansible/ansible.cfg as config file
/tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory did not meet host_list requirements, check plugin documentation if this is unexpected
/tmp/vagrant-ansible/inventory/vagrant_ansible_local_inventory did not meet script requirements, check plugin documentation if this is unexpected

PLAY [all] *********************************************************************

TASK [restart nginx] ***********************************************************
changed: [Jenkins] => {"changed": true, "enabled": true, "name": "nginx", "state": "started", "status": {"ActiveEnterTimestamp": "Mon 2019-03-11 14:27:52 UTC", "ActiveEnterTimestampMonotonic": "5029727", "ActiveExitTimestampMonotonic": "0", "ActiveState": "active", "After": "network.target nss-lookup.target system.slice systemd-journald.socket -.mount basic.target remote-fs.target tmp.mount", "AllowIsolate": "no", "AmbientCapabilities": "0", "AssertResult": "yes", "AssertTimestamp": "Mon 2019-03-11 14:27:51 UTC", "AssertTimestampMonotonic": "4050610", "Before": "shutdown.target multi-user.target", "BlockIOAccounting": "no", "BlockIOWeight": "18446744073709551615", "CPUAccounting": "no", "CPUQuotaPerSecUSec": "infinity", "CPUSchedulingPolicy": "0", "CPUSchedulingPriority": "0", "CPUSchedulingResetOnFork": "no", "CPUShares": "18446744073709551615", "CanIsolate": "no", "CanReload": "yes", "CanStart": "yes", "CanStop": "yes", "CapabilityBoundingSet": "18446744073709551615", "ConditionResult": "yes", "ConditionTimestamp": "Mon 2019-03-11 14:27:51 UTC", "ConditionTimestampMonotonic": "4050610", "Conflicts": "shutdown.target", "ControlGroup": "/system.slice/nginx.service", "ControlPID": "0", "DefaultDependencies": "yes", "Delegate": "no", "Description": "The nginx HTTP and reverse proxy server", "DevicePolicy": "auto", "ExecMainCode": "0", "ExecMainExitTimestampMonotonic": "0", "ExecMainPID": "2445", "ExecMainStartTimestamp": "Mon 2019-03-11 14:27:52 UTC", "ExecMainStartTimestampMonotonic": "5029665", "ExecMainStatus": "0", "ExecReload": "{ path=/bin/kill ; argv[]=/bin/kill -s HUP $MAINPID ; ignore_errors=no ; start_time=[n/a] ; stop_time=[n/a] ; pid=0 ; code=(null) ; status=0/0 }", "ExecStart": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx ; ignore_errors=no ; start_time=[Mon 2019-03-11 14:27:52 UTC] ; stop_time=[Mon 2019-03-11 14:27:52 UTC] ; pid=2441 ; code=exited ; status=0 }", "ExecStartPre": "{ path=/usr/sbin/nginx ; argv[]=/usr/sbin/nginx -t ; ignore_errors=no ; start_time=[Mon 2019-03-11 14:27:51 UTC] ; stop_time=[Mon 2019-03-11 14:27:52 UTC] ; pid=2417 ; code=exited ; status=0 }", "FailureAction": "none", "FileDescriptorStoreMax": "0", "FragmentPath": "/usr/lib/systemd/system/nginx.service", "GuessMainPID": "yes", "IOScheduling": "0", "Id": "nginx.service", "IgnoreOnIsolate": "no", "IgnoreOnSnapshot": "no", "IgnoreSIGPIPE": "yes", "InactiveEnterTimestampMonotonic": "0", "InactiveExitTimestamp": "Mon 2019-03-11 14:27:51 UTC", "InactiveExitTimestampMonotonic": "4051014", "JobTimeoutAction": "none", "JobTimeoutUSec": "0", "KillMode": "process", "KillSignal": "3", "LimitAS": "18446744073709551615", "LimitCORE": "18446744073709551615", "LimitCPU": "18446744073709551615", "LimitDATA": "18446744073709551615", "LimitFSIZE": "18446744073709551615", "LimitLOCKS": "18446744073709551615", "LimitMEMLOCK": "65536", "LimitMSGQUEUE": "819200", "LimitNICE": "0", "LimitNOFILE": "4096", "LimitNPROC": "7098", "LimitRSS": "18446744073709551615", "LimitRTPRIO": "0", "LimitRTTIME": "18446744073709551615", "LimitSIGPENDING": "7098", "LimitSTACK": "18446744073709551615", "LoadState": "loaded", "MainPID": "2445", "MemoryAccounting": "no", "MemoryCurrent": "18446744073709551615", "MemoryLimit": "18446744073709551615", "MountFlags": "0", "Names": "nginx.service", "NeedDaemonReload": "no", "Nice": "0", "NoNewPrivileges": "no", "NonBlocking": "no", "NotifyAccess": "none", "OOMScoreAdjust": "0", "OnFailureJobMode": "replace", "PIDFile": "/run/nginx.pid", "PermissionsStartOnly": "no", "PrivateDevices": "no", "PrivateNetwork": "no", "PrivateTmp": "yes", "ProtectHome": "no", "ProtectSystem": "no", "RefuseManualStart": "no", "RefuseManualStop": "no", "RemainAfterExit": "no", "Requires": "-.mount basic.target", "RequiresMountsFor": "/var/tmp", "Restart": "no", "RestartUSec": "100ms", "Result": "success", "RootDirectoryStartOnly": "no", "RuntimeDirectoryMode": "0755", "SameProcessGroup": "no", "SecureBits": "0", "SendSIGHUP": "no", "SendSIGKILL": "yes", "Slice": "system.slice", "StandardError": "inherit", "StandardInput": "null", "StandardOutput": "journal", "StartLimitAction": "none", "StartLimitBurst": "5", "StartLimitInterval": "10000000", "StartupBlockIOWeight": "18446744073709551615", "StartupCPUShares": "18446744073709551615", "StatusErrno": "0", "StopWhenUnneeded": "no", "SubState": "running", "SyslogLevelPrefix": "yes", "SyslogPriority": "30", "SystemCallErrorNumber": "0", "TTYReset": "no", "TTYVHangup": "no", "TTYVTDisallocate": "no", "TasksAccounting": "no", "TasksCurrent": "18446744073709551615", "TasksMax": "18446744073709551615", "TimeoutStartUSec": "1min 30s", "TimeoutStopUSec": "5s", "TimerSlackNSec": "50000", "Transient": "no", "Type": "forking", "UMask": "0022", "UnitFilePreset": "disabled", "UnitFileState": "enabled", "WantedBy": "multi-user.target", "Wants": "system.slice", "WatchdogTimestampMonotonic": "0", "WatchdogUSec": "0"}}

PLAY RECAP *********************************************************************
Jenkins                    : ok=1    changed=1    unreachable=0    failed=0  
```

### Slack integration:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_08/pictures/slack_notif.png?raw=true)

### Console output:
![](https://github.com/hutemai/sa.it-academy.by/blob/m-sa2-06-19/rshved/hm_08/pictures/console_output.png?raw=true)
