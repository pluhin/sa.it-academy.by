## Minikube

```bash

PS C:\Windows\system32> minikube start --memory 2048 --cpus 2 --driver=virtualbox
* minikube v1.26.1 на Microsoft Windows 10 Pro 10.0.19044 Build 19044
* Используется драйвер virtualbox на основе конфига пользователя
* Downloading VM boot image ...
    > minikube-v1.26.1-amd64.iso....:  65 B / 65 B [---------] 100.00% ? p/s 0s
    > minikube-v1.26.1-amd64.iso:  270.83 MiB / 270.83 MiB  100.00% 4.56 MiB p/
* Запускается control plane узел minikube в кластере minikube
* Скачивается Kubernetes v1.24.3 ...
    > preloaded-images-k8s-v18-v1...:  405.75 MiB / 405.75 MiB  100.00% 3.82 Mi
* Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
! This VM is having trouble accessing https://k8s.gcr.io
* To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
* Подготавливается Kubernetes v1.24.3 на Docker 20.10.17 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
  - Используется образ gcr.io/k8s-minikube/storage-provisioner:v5
* Компоненты Kubernetes проверяются ...
* Включенные дополнения: default-storageclass, storage-provisioner
* Готово! kubectl настроен для использования кластера "minikube" и "default" пространства имён по умолчанию

PS C:\Windows\system32> minikube addons enable ingress
* ingress is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Используется образ k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
  - Используется образ k8s.gcr.io/ingress-nginx/controller:v1.2.1
  - Используется образ k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying ingress addon...
* The 'ingress' addon is enabled

PS C:\Windows\system32> minikube addons list
|-----------------------------|----------|--------------|--------------------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
|-----------------------------|----------|--------------|--------------------------------|
| ambassador                  | minikube | disabled     | 3rd party (Ambassador)         |
| auto-pause                  | minikube | disabled     | Google                         |
| csi-hostpath-driver         | minikube | disabled     | Kubernetes                     |
| dashboard                   | minikube | disabled     | Kubernetes                     |
| default-storageclass        | minikube | enabled ✅   | Kubernetes                     |
| efk                         | minikube | disabled     | 3rd party (Elastic)            |
| freshpod                    | minikube | disabled     | Google                         |
| gcp-auth                    | minikube | disabled     | Google                         |
| gvisor                      | minikube | disabled     | Google                         |
| headlamp                    | minikube | disabled     | 3rd party (kinvolk.io)         |
| helm-tiller                 | minikube | disabled     | 3rd party (Helm)               |
| inaccel                     | minikube | disabled     | 3rd party (InAccel             |
|                             |          |              | [info@inaccel.com])            |
| ingress                     | minikube | enabled ✅   | Kubernetes                     |
| ingress-dns                 | minikube | disabled     | Google                         |
| istio                       | minikube | disabled     | 3rd party (Istio)              |
| istio-provisioner           | minikube | disabled     | 3rd party (Istio)              |
| kong                        | minikube | disabled     | 3rd party (Kong HQ)            |
| kubevirt                    | minikube | disabled     | 3rd party (KubeVirt)           |
| logviewer                   | minikube | disabled     | 3rd party (unknown)            |
| metallb                     | minikube | disabled     | 3rd party (MetalLB)            |
| metrics-server              | minikube | disabled     | Kubernetes                     |
| nvidia-driver-installer     | minikube | disabled     | Google                         |
| nvidia-gpu-device-plugin    | minikube | disabled     | 3rd party (Nvidia)             |
| olm                         | minikube | disabled     | 3rd party (Operator Framework) |
| pod-security-policy         | minikube | disabled     | 3rd party (unknown)            |
| portainer                   | minikube | disabled     | 3rd party (Portainer.io)       |
| registry                    | minikube | disabled     | Google                         |
| registry-aliases            | minikube | disabled     | 3rd party (unknown)            |
| registry-creds              | minikube | disabled     | 3rd party (UPMC Enterprises)   |
| storage-provisioner         | minikube | enabled ✅   | Google                         |
| storage-provisioner-gluster | minikube | disabled     | 3rd party (Gluster)            |
| volumesnapshots             | minikube | disabled     | Kubernetes                     |
|-----------------------------|----------|--------------|--------------------------------|

```

## Minikube command

```bash

minikube start --memory 2048 --cpus 2 --driver=virtualbox
minikube addons enable ingress
minikube addons list

```

![image](https://user-images.githubusercontent.com/110092772/185415242-c4991ef2-a004-411c-9e91-159e5fa27860.png)

## K8s

```bash

PLAY RECAP *******************************************************************************************************************************
localhost                  : ok=3    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=770  changed=144  unreachable=0    failed=0    skipped=1258 rescued=0    ignored=9
node2                      : ok=603  changed=115  unreachable=0    failed=0    skipped=1049 rescued=0    ignored=3

Четверг 18 августа 2022  12:40:39 +0000 (0:00:00.072)       0:41:53.327 *******
===============================================================================
download : download_file | Validate mirrors -------------------------------------------------------------------------------------- 72.40s
kubernetes/preinstall : Install packages requirements ---------------------------------------------------------------------------- 69.33s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ----------------------------------------------------------- 59.41s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources ---------------------------------------------------------------------- 44.48s
network_plugin/calico : Calico | Create calico manifests ------------------------------------------------------------------------- 35.58s
download : download_container | Download image if required ----------------------------------------------------------------------- 32.98s
download : download_container | Download image if required ----------------------------------------------------------------------- 31.96s
kubernetes/control-plane : Joining control plane node to the cluster. ------------------------------------------------------------ 30.10s
kubernetes/control-plane : kubeadm | Initialize first master --------------------------------------------------------------------- 28.96s
download : download_container | Download image if required ----------------------------------------------------------------------- 28.71s
download : download_file | Download item ----------------------------------------------------------------------------------------- 27.53s
download : download_container | Download image if required ----------------------------------------------------------------------- 24.09s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -------- 23.98s
download : download_file | Download item ----------------------------------------------------------------------------------------- 22.88s
network_plugin/calico : Start Calico resources ----------------------------------------------------------------------------------- 20.67s
kubernetes/preinstall : Ensure kube-bench parameters are set --------------------------------------------------------------------- 20.53s
download : download_container | Download image if required ----------------------------------------------------------------------- 20.48s
container-engine/containerd : download_file | Download item ---------------------------------------------------------------------- 20.21s
download : download_container | Download image if required ----------------------------------------------------------------------- 19.46s
download : download_container | Download image if required ----------------------------------------------------------------------- 19.35s
root@kirill:/home/kuber/kubespray#

```
