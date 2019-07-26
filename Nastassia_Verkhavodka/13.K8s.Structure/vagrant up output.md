```
nastiaver@eighteenth ~/03 $ vagrant up
Bringing machine 'minikube' up with 'virtualbox' provider...
==> minikube: Box 'bento/ubuntu-16.04' could not be found. Attempting to find and install...
    minikube: Box Provider: virtualbox
    minikube: Box Version: >= 0
==> minikube: Loading metadata for box 'bento/ubuntu-16.04'
    minikube: URL: https://vagrantcloud.com/bento/ubuntu-16.04
==> minikube: Adding box 'bento/ubuntu-16.04' (v201906.18.0) for provider: virtualbox
    minikube: Downloading: https://vagrantcloud.com/bento/boxes/ubuntu-16.04/versions/201906.18.0/providers/virtualbox.box
    minikube: Download redirected to host: vagrantcloud-files-production.s3.amazonaws.com
==> minikube: Successfully added box 'bento/ubuntu-16.04' (v201906.18.0) for 'virtualbox'!
==> minikube: Importing base box 'bento/ubuntu-16.04'...
==> minikube: Matching MAC address for NAT networking...
==> minikube: Checking if box 'bento/ubuntu-16.04' version '201906.18.0' is up to date...
==> minikube: Setting the name of the VM: 03_minikube_1564142094943_55137
==> minikube: Fixed port collision for 30000 => 30000. Now on port 2204.
==> minikube: Fixed port collision for 80 => 80. Now on port 2205.
==> minikube: Fixed port collision for 443 => 443. Now on port 2206.
==> minikube: Fixed port collision for 22 => 2222. Now on port 2207.
Vagrant is currently configured to create VirtualBox synced folders with
the `SharedFoldersEnableSymlinksCreate` option enabled. If the Vagrant
guest is not trusted, you may want to disable this option. For more
information on this option, please refer to the VirtualBox manual:

  https://www.virtualbox.org/manual/ch04.html#sharedfolders

This option can be disabled globally with an environment variable:

  VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

or on a per folder basis within the Vagrantfile:

  config.vm.synced_folder '/host/path', '/guest/path', SharedFoldersEnableSymlinksCreate: false
==> minikube: Vagrant has detected a configuration issue which exposes a
==> minikube: vulnerability with the installed version of VirtualBox. The
==> minikube: current guest is configured to use an E1000 NIC type for a
==> minikube: network adapter which is vulnerable in this version of VirtualBox.
==> minikube: Ensure the guest is trusted to use this configuration or update
==> minikube: the NIC type using one of the methods below:
==> minikube: 
==> minikube:   https://www.vagrantup.com/docs/virtualbox/configuration.html#default-nic-type
==> minikube:   https://www.vagrantup.com/docs/virtualbox/networking.html#virtualbox-nic-type
==> minikube: Clearing any previously set network interfaces...
==> minikube: Preparing network interfaces based on configuration...
    minikube: Adapter 1: nat
    minikube: Adapter 2: bridged
==> minikube: Forwarding ports...
    minikube: 30000 (guest) => 2204 (host) (adapter 1)
    minikube: 80 (guest) => 2205 (host) (adapter 1)
    minikube: 443 (guest) => 2206 (host) (adapter 1)
    minikube: 22 (guest) => 2207 (host) (adapter 1)
==> minikube: Running 'pre-boot' VM customizations...
==> minikube: Booting VM...
==> minikube: Waiting for machine to boot. This may take a few minutes...
    minikube: SSH address: 127.0.0.1:2207
    minikube: SSH username: vagrant
    minikube: SSH auth method: private key
==> minikube: Machine booted and ready!
==> minikube: Checking for guest additions in VM...
    minikube: The guest additions on this VM do not match the installed version of
    minikube: VirtualBox! In most cases this is fine, but in rare cases it can
    minikube: prevent things such as shared folders from working properly. If you see
    minikube: shared folder errors, please make sure the guest additions within the
    minikube: virtual machine match the version of VirtualBox you have installed on
    minikube: your host and reload your VM.
    minikube: 
    minikube: Guest Additions Version: 6.0.8
    minikube: VirtualBox Version: 5.1
==> minikube: Configuring and enabling network interfaces...
==> minikube: Mounting shared folders...
    minikube: /vagrant => /home/nastiaver/03
==> minikube: Running provisioner: kubectl (shell)...
    minikube: Running: inline script
    minikube: Installing kubectl
    minikube: OK
    minikube: dpkg-preconfigure: unable to re-open stdin: No such file or directory
    minikube: Selecting previously unselected package kubectl.
    minikube: (Reading database ... 
(Reading database ... 65%tabase ... 5%
    minikube: (Reading database ... 70%
    minikube: (Reading database ... 75%
    minikube: (Reading database ... 80%
    minikube: (Reading database ... 85%
    minikube: (Reading database ... 90%
    minikube: (Reading database ... 95%
(Reading database ... 38545 files and directories currently installed.)
    minikube: Preparing to unpack .../kubectl_1.15.1-00_amd64.deb ...
    minikube: Unpacking kubectl (1.15.1-00) ...
    minikube: Setting up kubectl (1.15.1-00) ...
==> minikube: Running provisioner: docker (shell)...
    minikube: Running: inline script
    minikube: Reading package lists...
    minikube: Building dependency tree...
    minikube: 
    minikube: Reading state information...
    minikube: Package 'docker' is not installed, so not removed
    minikube: Package 'docker.io' is not installed, so not removed
    minikube: Package 'docker-engine' is not installed, so not removed
    minikube: 0 upgraded, 0 newly installed, 0 to remove and 25 not upgraded.
    minikube: Reading package lists...
    minikube: Building dependency tree...
    minikube: 
    minikube: Reading state information...
    minikube: apt-transport-https is already the newest version (1.2.32).
    minikube: ca-certificates is already the newest version (20170717~16.04.2).
    minikube: curl is already the newest version (7.47.0-1ubuntu2.13).
    minikube: software-properties-common is already the newest version (0.96.20.8).
    minikube: 0 upgraded, 0 newly installed, 0 to remove and 25 not upgraded.
    minikube: OK
    minikube: dpkg-preconfigure: unable to re-open stdin: No such file or directory
    minikube: Selecting previously unselected package pigz.
    minikube: (Reading database ... 
(Reading database ... 45%tabase ... 5%
(Reading database ... 65%tabase ... 50%
    minikube: (Reading database ... 70%
    minikube: (Reading database ... 75%
    minikube: (Reading database ... 80%
    minikube: (Reading database ... 85%
    minikube: (Reading database ... 90%
    minikube: (Reading database ... 95%
(Reading database ... 38546 files and directories currently installed.)
    minikube: Preparing to unpack .../pigz_2.3.1-2_amd64.deb ...
    minikube: Unpacking pigz (2.3.1-2) ...
    minikube: Selecting previously unselected package aufs-tools.
    minikube: Preparing to unpack .../aufs-tools_1%3a3.2+20130722-1.1ubuntu1_amd64.deb ...
    minikube: Unpacking aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
    minikube: Selecting previously unselected package cgroupfs-mount.
    minikube: Preparing to unpack .../cgroupfs-mount_1.2_all.deb ...
    minikube: Unpacking cgroupfs-mount (1.2) ...
    minikube: Selecting previously unselected package containerd.io.
    minikube: Preparing to unpack .../containerd.io_1.2.6-3_amd64.deb ...
    minikube: Unpacking containerd.io (1.2.6-3) ...
    minikube: Selecting previously unselected package docker-ce-cli.
    minikube: Preparing to unpack .../docker-ce-cli_5%3a19.03.1~3-0~ubuntu-xenial_amd64.deb ...
    minikube: Unpacking docker-ce-cli (5:19.03.1~3-0~ubuntu-xenial) ...
    minikube: Selecting previously unselected package docker-ce.
    minikube: Preparing to unpack .../docker-ce_5%3a19.03.1~3-0~ubuntu-xenial_amd64.deb ...
    minikube: Unpacking docker-ce (5:19.03.1~3-0~ubuntu-xenial) ...
    minikube: Selecting previously unselected package libltdl7:amd64.
    minikube: Preparing to unpack .../libltdl7_2.4.6-0.1_amd64.deb ...
    minikube: Unpacking libltdl7:amd64 (2.4.6-0.1) ...
    minikube: Processing triggers for man-db (2.7.5-1) ...
    minikube: Processing triggers for libc-bin (2.23-0ubuntu11) ...
    minikube: Processing triggers for ureadahead (0.100.0-19.1) ...
    minikube: Processing triggers for systemd (229-4ubuntu21.21) ...
    minikube: Setting up pigz (2.3.1-2) ...
    minikube: Setting up aufs-tools (1:3.2+20130722-1.1ubuntu1) ...
    minikube: Setting up cgroupfs-mount (1.2) ...
    minikube: Setting up containerd.io (1.2.6-3) ...
    minikube: Setting up docker-ce-cli (5:19.03.1~3-0~ubuntu-xenial) ...
    minikube: Setting up docker-ce (5:19.03.1~3-0~ubuntu-xenial) ...
    minikube: Setting up libltdl7:amd64 (2.4.6-0.1) ...
    minikube: Processing triggers for libc-bin (2.23-0ubuntu11) ...
    minikube: Processing triggers for ureadahead (0.100.0-19.1) ...
    minikube: Processing triggers for systemd (229-4ubuntu21.21) ...
    minikube: Unable to find image 'hello-world:latest' locally
    minikube: latest: Pulling from library/hello-world
    minikube: 1b930d010525: Pulling fs layer
    minikube: 1b930d010525: Pull complete
    minikube: Digest: sha256:6540fc08ee6e6b7b63468dc3317e3303aae178cb8a45ed3123180328bcc1d20f
    minikube: Status: Downloaded newer image for hello-world:latest
    minikube: 
    minikube: Hello from Docker!
    minikube: This message shows that your installation appears to be working correctly.
    minikube: 
    minikube: To generate this message, Docker took the following steps:
    minikube:  1. The Docker client contacted the Docker daemon.
    minikube:  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    minikube:     (amd64)
    minikube:  3. The Docker daemon created a new container from that image which runs the
    minikube:     executable that produces the output you are currently reading.
    minikube:  4. The Docker daemon streamed that output to the Docker client, which sent it
    minikube:     to your terminal.
    minikube: 
    minikube: To try something more ambitious, you can run an Ubuntu container with:
    minikube:  $ docker run -it ubuntu bash
    minikube: 
    minikube: Share images, automate workflows, and more with a free Docker ID:
    minikube:  https://hub.docker.com/
    minikube: 
    minikube: For more examples and ideas, visit:
    minikube:  https://docs.docker.com/get-started/
==> minikube: Running provisioner: minikube (shell)...
    minikube: Running: inline script
    minikube: Downloading minikube
    minikube:   % Total    % Received % Xferd  Average Sp
    minikube: eed   Time    Time     Time  Cu
    minikube: rrent
    minikube:                                  Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0 39.8M    0   620    0     0   1291      0  8:59:48 --:--:-
    minikube: -  8:59:48  1288
 33 39.8M   33 13.3M    0     0  9801k      0  0:00:04  0:00:01  0:00:03 9799k
 47 39.8M   47 18.9M    0     0  8139k      0  0:00:05  0:00:02  0:00:03 8140k
 62 39.8M   62 24.8M    0     0  7494k      0  0:00:05  0:00:03  0:00:02 7494k
 76 39.8M   76 30.4M    0     0  7114k      0  0:00:05  0:00:04  0:00:01 7114k
 91 39.8M   91 36.3M    0     0  6901k      0  0:00:05  0:00:05 --:--:-- 7576k
100 39.8M  100 39.8M    0     0  6790k      0  0:00:06  0:00:06 --:--:-- 5
    minikube: 884k
==> minikube: Running provisioner: k8s (shell)...
    minikube: Running: inline script
    minikube: Setting up and starting K8S
    minikube: * minikube v1.2.0 on linux (amd64)
    minikube: * Creating none VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
    minikube: * Configuring environment for Kubernetes v1.15.0 on Docker 19.03.1
    minikube: * Downloading kubelet v1.15.0
    minikube: * Downloading kubeadm v1.15.0
    minikube: * Pulling images ...
    minikube: * Launching Kubernetes ... 
    minikube: * Configuring local host environment ...
    minikube:   - https://github.com/kubernetes/minikube/blob/master/docs/vmdriver-none.md
    minikube: ! The 'none' driver provides limited isolation and may reduce system security and reliability.
    minikube: ! For more information, see:
    minikube: 
    minikube:   - sudo mv /root/.kube /root/.minikube $HOME
    minikube:   - sudo chown -R $USER $HOME/.kube $HOME/.minikube
    minikube: 
    minikube: * This can also be done automatically by setting the env var CHANGE_MINIKUBE_NONE_USER=true
    minikube: * Verifying:
    minikube: ! kubectl and minikube configuration will be stored in /root
    minikube: ! To use kubectl or minikube commands as your own user, you may
    minikube: ! need to relocate them. For example, to overwrite your own settings:
    minikube:  apiserver
    minikube:  proxy
    minikube:  etcd
    minikube:  scheduler
    minikube:  controller
    minikube:  dns
    minikube: 
    minikube: * Done! kubectl is now configured to use "minikube"
    minikube: Kubernetes master is running at https://10.0.2.15:8443
    minikube: KubeDNS is running at https://10.0.2.15:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
    minikube: 
    minikube: To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
    minikube: W0726 12:00:27.318624   19263 proxy.go:142] Request filter disabled, your proxy is vulnerable to XSRF attacks, please be cautious
    minikube: Starting to serve on [::]:8001
    minikube: * Enabling dashboard ...
    minikube: * Verifying dashboard health ...
    minikube: * Launching proxy ...
    minikube: * Verifying proxy health ...
    minikube: http://127.0.0.1:43939/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/
    ```