# 10. Kubernetes

## Install minikube, enable plugin "ingress"

```bash
vagrant@vagrant:~$ sudo minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

vagrant@vagrant:~$ sudo minikube addons enable ingress
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/controller:v1.1.1
  - Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
* Verifying ingress addon...
* The 'ingress' addon is enabled

vagrant@vagrant:~$ sudo minikube addons list
|-----------------------------|----------|--------------|--------------------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
|-----------------------------|----------|--------------|--------------------------------|
| ambassador                  | minikube | disabled     | third-party (ambassador)       |
| auto-pause                  | minikube | disabled     | google                         |
| csi-hostpath-driver         | minikube | disabled     | kubernetes                     |
| dashboard                   | minikube | enabled      | kubernetes                     |
| default-storageclass        | minikube | enabled      | kubernetes                     |
| efk                         | minikube | disabled     | third-party (elastic)          |
| freshpod                    | minikube | disabled     | google                         |
| gcp-auth                    | minikube | disabled     | google                         |
| gvisor                      | minikube | disabled     | google                         |
| helm-tiller                 | minikube | disabled     | third-party (helm)             |
| ingress                     | minikube | enabled      | unknown (third-party)          |
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
| storage-provisioner         | minikube | enabled      | google                         |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party)          |
| volumesnapshots             | minikube | disabled     | kubernetes                     |
|-----------------------------|----------|--------------|--------------------------------|
```

## Access to the dashboard from workstation

Screenshot of minikube dashboard screen.jpg is attached into folder 10.Kubernetes

## Command for run minikube with different HW options (RAM/CPU)

```bash
minikube start --memory=2048mb --cpus=2
```

## Deployment of k8s cluster inside IT-ACADEMY environment

Deployed on 2 it-academy.by Debian hosts

## Final summary of ansible play

```bash
PLAY RECAP ***********************************************************************************************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
node1                      : ok=768  changed=149  unreachable=0    failed=0    skipped=1315 rescued=0    ignored=6
node2                      : ok=507  changed=94   unreachable=0    failed=0    skipped=772  rescued=0    ignored=2

Monday 23 May 2022  17:34:08 +0300 (0:00:00.062)       0:48:08.162 ************
===============================================================================
kubernetes/preinstall : Install packages requirements -------------------------------------------------------------------------------------------------------------------------------- 81.33s
download : download_file | Validate mirrors ------------------------------------------------------------------------------------------------------------------------------------------ 73.21s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates --------------------------------------------------------------------------------------------------------------- 66.42s
network_plugin/calico : Calico | Create calico manifests ----------------------------------------------------------------------------------------------------------------------------- 46.77s
kubernetes-apps/ansible : Kubernetes Apps | Start Resources -------------------------------------------------------------------------------------------------------------------------- 43.78s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------- 31.50s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------- 29.64s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------- 28.88s
kubernetes/control-plane : kubeadm | Initialize first master ------------------------------------------------------------------------------------------------------------------------- 28.19s
kubernetes/preinstall : Create kubernetes directories -------------------------------------------------------------------------------------------------------------------------------- 28.18s
download : download_container | Download image if required --------------------------------------------------------------------------------------------------------------------------- 26.92s
policy_controller/calico : Create calico-kube-controllers manifests ------------------------------------------------------------------------------------------------------------------ 26.71s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ------------------------------------------------------------ 24.96s
kubernetes/preinstall : Ensure kube-bench parameters are set ------------------------------------------------------------------------------------------------------------------------- 24.18s
network_plugin/calico : Start Calico resources --------------------------------------------------------------------------------------------------------------------------------------- 22.01s
download : download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------------- 21.84s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down nodelocaldns Template ----------------------------------------------------------------------------------------------------------- 20.49s
container-engine/crictl : download_file | Download item ------------------------------------------------------------------------------------------------------------------------------ 20.42s
container-engine/containerd : download_file | Download item -------------------------------------------------------------------------------------------------------------------------- 19.67s
download : download_file | Download item --------------------------------------------------------------------------------------------------------------------------------------------- 19.37s
```
