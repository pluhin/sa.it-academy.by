
## 10.Kubernetes_Alex_Muzhichenko

### Minikube_commands

```bash

alex@ubntukab:~$ minikube version
minikube version: v1.25.2
commit: 362d5fdc0a3dbee389b3d3f1034e8023e72bd3a7
alex@ubntukab:~$ kubectl version --short
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.
Client Version: v1.24.0
Kustomize Version: v4.5.4
Server Version: v1.23.3
alex@ubntukab:~$ minikube start
* minikube v1.25.2 on Ubuntu 20.04
* Using the virtualbox driver based on existing profile

* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=2200mb'

* Starting control plane node minikube in cluster minikube
* Restarting existing virtualbox VM for "minikube" ...
* Preparing Kubernetes v1.23.3 on Docker 20.10.12 ...
  - kubelet.housekeeping-interval=5m
  - Using image kubernetesui/dashboard:v2.3.1
  - Using image kubernetesui/metrics-scraper:v1.0.7
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Verifying Kubernetes components...
* Enabled addons: default-storageclass, storage-provisioner, dashboard
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

alex@ubntukab:~$ kubectl proxy --address='0.0.0.0' --disable-filter=true &
[1] 2096
alex@ubntukab:~$ W0522 11:34:26.369650    2096 proxy.go:175] Request filter disabled, your proxy is vulnerable to XSRF attacks, please be cautious
Starting to serve on [::]:8001


alex@ubntukab:~$ minikube addons enable dashboard
  - Using image kubernetesui/dashboard:v2.3.1
  - Using image kubernetesui/metrics-scraper:v1.0.7
* Some dashboard features require the metrics-server addon. To enable all features please run:
* The 'dashboard' addon is enabled
alex@ubntukab:~$ minikube addons enable ingress
  - Using image k8s.gcr.io/ingress-nginx/controller:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying ingress addon...
* The 'ingress' addon is enabled


alex@ubntukab:~$ minikube addons list
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



alex@ubntukab:~$ minikube start --memory 2200 --cpus 2    # Run with memory and cpu

```

### Dashboard screen:
![minikube](Minikube_Alex_Muzhichenko.jpg)


### Final summary of ansible play kubespray (IT-ACADEMY environment) 

```bash

PLAY RECAP ******************************************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=768  changed=149  unreachable=0    failed=0    skipped=1315 rescued=0    ignored=6
node2                      : ok=507  changed=94   unreachable=0    failed=0    skipped=772  rescued=0    ignored=2

Sunday 22 May 2022  13:40:14 +0000 (0:00:00.053)       0:41:08.766 ************
===============================================================================
download : download_file | Validate mirrors ------------------------------------------------------------------------------------------------------------------------------------------------- 72.97s
kubernetes/preinstall : Install packages requirements --------------------------------------------------------------------------------------------------------------------------------------- 71.09s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ---------------------------------------------------------------------------------------------------------------------- 58.52s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources --------------------------------------------------------------------------------------------------------------------------------- 43.56s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------------------------------------------------------------------ 34.96s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 29.75s
kubernetes/control-plane : kubeadm | Initialize first master -------------------------------------------------------------------------------------------------------------------------------- 28.31s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 28.15s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 27.16s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 26.56s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ------------------------------------------------------------------- 23.78s
policy_controller/calico : Create calico-kube-controllers manifests ------------------------------------------------------------------------------------------------------------------------- 23.73s
network_plugin/calico : Start Calico resources ---------------------------------------------------------------------------------------------------------------------------------------------- 21.76s
download : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------- 20.94s
download : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------- 19.84s
container-engine/containerd : download_file | Download item --------------------------------------------------------------------------------------------------------------------------------- 19.23s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 18.59s
download : download_container | Download image if required ---------------------------------------------------------------------------------------------------------------------------------- 18.54s
kubernetes/preinstall : Ensure kube-bench parameters are set -------------------------------------------------------------------------------------------------------------------------------- 18.50s
download : download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------------------- 18.34s

```
