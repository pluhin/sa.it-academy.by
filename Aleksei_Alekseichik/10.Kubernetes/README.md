## Install minikube
``` bash
vagrant@vagrant:~$ minikube start
* minikube v1.25.2 on Ubuntu 20.04 (vbox/amd64)
* Automatically selected the docker driver. Other choices: none, ssh
* Starting control plane node minikube in cluster minikube
* Pulling base image ...
* Downloading Kubernetes v1.23.3 preload ...
    > gcr.io/k8s-minikube/kicbase: 379.06 MiB / 379.06 MiB  100.00% 258.49 KiB
    > preloaded-images-k8s-v17-v1...: 505.68 MiB / 505.68 MiB  100.00% 300.83 K
* Creating docker container (CPUs=2, Memory=2200MB) ...
* Preparing Kubernetes v1.23.3 on Docker 20.10.12 ...
  - kubelet.housekeeping-interval=5m
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

vagrant@vagrant:~$ minikube addons enable ingress
  - Using image k8s.gcr.io/ingress-nginx/controller:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying ingress addon...
* The 'ingress' addon is enabled
vagrant@vagrant:~$ minikube addons list
|-----------------------------|----------|--------------|--------------------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
|-----------------------------|----------|--------------|--------------------------------|
| ambassador                  | minikube | disabled     | third-party (ambassador)       |
| auto-pause                  | minikube | disabled     | google                         |
| csi-hostpath-driver         | minikube | disabled     | kubernetes                     |
| dashboard                   | minikube | enabled ✅   | kubernetes                     |
| default-storageclass        | minikube | enabled ✅   | kubernetes                     |
| efk                         | minikube | disabled     | third-party (elastic)          |
| freshpod                    | minikube | disabled     | google                         |
| gcp-auth                    | minikube | disabled     | google                         |
| gvisor                      | minikube | disabled     | google                         |
| helm-tiller                 | minikube | disabled     | third-party (helm)             |
| ingress                     | minikube | enabled ✅   | unknown (third-party)          |
| ingress-dns                 | minikube | disabled     | google                         |
| istio                       | minikube | disabled     | third-party (istio)            |
| istio-provisioner           | minikube | disabled     | third-party (istio)            |
| kong                        | minikube | disabled     | third-party (Kong HQ)          |
| kubevirt                    | minikube | disabled     | third-party (kubevirt)         |
| logviewer                   | minikube | disabled     | unknown (third-party)          |
| metallb                     | minikube | disabled     | third-party (metallb)          |
| metrics-server              | minikube | disabled     | kubernetes                     |
| nvidia-driver-installer     | minikube | disabled     | google                         |
| nvidia-gpu-device-plugin    | minikube | disabled     | third-party (nvidia)           |
| olm                         | minikube | disabled     | third-party (operator          |
|                             |          |              | framework)                     |
| pod-security-policy         | minikube | disabled     | unknown (third-party)          |
| portainer                   | minikube | disabled     | portainer.io                   |
| registry                    | minikube | disabled     | google                         |
| registry-aliases            | minikube | disabled     | unknown (third-party)          |
| registry-creds              | minikube | disabled     | third-party (upmc enterprises) |
| storage-provisioner         | minikube | enabled ✅   | google                         |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party)          |
| volumesnapshots             | minikube | disabled     | kubernetes                     |
|-----------------------------|----------|--------------|--------------------------------|

vagrant@vagrant:~$ minikube start --memory 3072 --cpus 3
* minikube v1.25.2 on Ubuntu 20.04 (vbox/amd64)
* Using the docker driver based on existing profile
! Your cgroup does not allow setting memory.
  - More information: https://docs.docker.com/engine/install/linux-postinstall/#your-kernel-does-not-support-cgroup-swap-limit-capabilities

X The requested memory allocation of 3072MiB does not leave room for system overhead (total system memory: 3935MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=3072mb'

! Your cgroup does not allow setting memory.
  - More information: https://docs.docker.com/engine/install/linux-postinstall/#your-kernel-does-not-support-cgroup-swap-limit-capabilities

X The requested memory allocation of 3072MiB does not leave room for system overhead (total system memory: 3935MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=3072mb'

! You cannot change the memory size for an existing minikube cluster. Please first delete the cluster.
! You cannot change the CPUs for an existing minikube cluster. Please first delete the cluster.
* Starting control plane node minikube in cluster minikube
* Pulling base image ...
* Updating the running docker "minikube" container ...
* Preparing Kubernetes v1.23.3 on Docker 20.10.12 ...
  - kubelet.housekeeping-interval=5m
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
  - Using image kubernetesui/dashboard:v2.3.1
  - Using image kubernetesui/metrics-scraper:v1.0.7
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/controller:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying ingress addon...
* Enabled addons: storage-provisioner, default-storageclass, ingress, dashboard
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
vagrant@vagrant:~$

```
---
## Screen
[Screen](https://github.com/alexfiz/sa.it-academy.by/blob/md-sa2-20-22/Aleksei_Alekseichik/10.Kubernetes/Dashboard.jpg)
---
## Final summary of ansible play (IT-ACADEMY environment)
``` bash
PLAY RECAP *********************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=768  changed=149  unreachable=0    failed=0    skipped=1315 rescued=0    ignored=6
node2                      : ok=507  changed=94   unreachable=0    failed=0    skipped=772  rescued=0    ignored=2

Monday 23 May 2022  08:54:39 +0000 (0:00:00.139)       0:53:17.021 ************
===============================================================================
kubernetes/preinstall : Install packages requirements ------------------ 87.45s
download : download_file | Validate mirrors ---------------------------- 79.47s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates -- 60.08s
download : download_container | Download image if required ------------- 59.62s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ------------ 39.97s
network_plugin/calico : Calico | Create calico manifests --------------- 36.33s
download : download_container | Download image if required ------------- 31.41s
download : download_container | Download image if required ------------- 30.77s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 30.23s
download : download_container | Download image if required ------------- 29.76s
kubernetes/control-plane : kubeadm | Initialize first master ----------- 27.48s
kubernetes/preinstall : Ensure kube-bench parameters are set ----------- 25.75s
policy_controller/calico : Create calico-kube-controllers manifests ---- 24.13s
container-engine/containerd : containerd | Remove orphaned binary ------ 24.05s
container-engine/containerd : download_file | Download item ------------ 23.52s
download : download_file | Download item ------------------------------- 23.15s
kubernetes/preinstall : Create kubernetes directories ------------------ 21.94s
download : download_file | Download item ------------------------------- 20.86s
download : download_container | Download image if required ------------- 20.75s
download : download_file | Download item ------------------------------- 20.38s
vagrant@Ubuntu20:~/k8s/kubespray$

```
