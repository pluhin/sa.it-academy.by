# 11.k8S

## Finish full deployment of k8s cluster

```bash

PLAY RECAP ******************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
node1                      : ok=588  changed=125  unreachable=0    failed=0    skipped=1151 rescued=0    ignored=2   
node2                      : ok=368  changed=76   unreachable=0    failed=0    skipped=635  rescued=0    ignored=1   

Sunday 15 August 2021  00:00:21 +0300 (0:00:00.037)       0:29:30.246 ********* 
=============================================================================== 
download : download_container | Download image if required ---------------------------------------------- 81.54s
kubernetes/control-plane : kubeadm | Initialize first master -------------------------------------------- 79.65s
kubernetes/preinstall : Install packages requirements --------------------------------------------------- 77.93s
download : download_container | Download image if required ---------------------------------------------- 66.05s
download : download_container | Download image if required ---------------------------------------------- 65.30s
download : download_container | Download image if required ---------------------------------------------- 64.58s
download : download_container | Download image if required ---------------------------------------------- 63.21s
download : download_container | Download image if required ---------------------------------------------- 62.92s
download : download_container | Download image if required ---------------------------------------------- 62.61s
download : download_container | Download image if required ---------------------------------------------- 61.52s
download : download_container | Download image if required ---------------------------------------------- 60.57s
download : download_container | Download image if required ---------------------------------------------- 58.52s
download : download_container | Download image if required ---------------------------------------------- 57.55s
container-engine/docker : ensure docker packages are installed ------------------------------------------ 56.91s
download : download_container | Download image if required ---------------------------------------------- 53.41s
download : download_container | Download image if required ---------------------------------------------- 50.88s
kubernetes-apps/ansible : Kubernetes Apps | Lay Down CoreDNS templates ---------------------------------- 33.53s
kubernetes/kubeadm : Join to cluster -------------------------------------------------------------------- 27.20s
download : download_file | Download item ---------------------------------------------------------------- 25.58s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux) -- 21.33s

```

## Minikube logs and enable ingress addon

```bash

minyt@minyt:~/11.K8s$ minikube start
😄  minikube v1.22.0 on Ubuntu 20.04
✨  Automatically selected the docker driver. Other choices: virtualbox, ssh
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
    > gcr.io/k8s-minikube/kicbase...: 258.69 MiB / 361.09 MiB  71.64% 9.85 MiB         > gcr.io/k8s-minikube/kicbase...: 361.08 MiB / 361.09 MiB  100.00% 8.14 MiB
🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
🐳  Preparing Kubernetes v1.21.2 on Docker 20.10.7 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
minyt@minyt:~/11.K8s$ kubectl get nodes
NAME       STATUS   ROLES                  AGE     VERSION
minikube   Ready    control-plane,master   2m15s   v1.21.2
minyt@minyt:~/11.K8s$ minikube addons enable dashboard
    ▪ Using image kubernetesui/dashboard:v2.1.0
    ▪ Using image kubernetesui/metrics-scraper:v1.0.4
💡  Some dashboard features require the metrics-server addon. To enable all features please run:

	minikube addons enable metrics-server	


🌟  The 'dashboard' addon is enabled
minyt@minyt:~/11.K8s$ minikube addons enable metrics-server
    ▪ Using image k8s.gcr.io/metrics-server/metrics-server:v0.4.2
🌟  The 'metrics-server' addon is enabled
minyt@minyt:~/11.K8s$ minikube addons enable ingress
    ▪ Using image k8s.gcr.io/ingress-nginx/controller:v0.44.0
    ▪ Using image docker.io/jettech/kube-webhook-certgen:v1.5.1
    ▪ Using image docker.io/jettech/kube-webhook-certgen:v1.5.1
🔎  Verifying ingress addon...
🌟  The 'ingress' addon is enabled
minyt@minyt:~/11.K8s$ minikube addons list
|-----------------------------|----------|--------------|-----------------------|
|         ADDON NAME          | PROFILE  |    STATUS    |      MAINTAINER       |
|-----------------------------|----------|--------------|-----------------------|
| ambassador                  | minikube | disabled     | unknown (third-party) |
| auto-pause                  | minikube | disabled     | google                |
| csi-hostpath-driver         | minikube | disabled     | kubernetes            |
| dashboard                   | minikube | enabled ✅   | kubernetes            |
| default-storageclass        | minikube | enabled ✅   | kubernetes            |
| efk                         | minikube | disabled     | unknown (third-party) |
| freshpod                    | minikube | disabled     | google                |
| gcp-auth                    | minikube | disabled     | google                |
| gvisor                      | minikube | disabled     | google                |
| helm-tiller                 | minikube | disabled     | unknown (third-party) |
| ingress                     | minikube | enabled ✅   | unknown (third-party) |
| ingress-dns                 | minikube | disabled     | unknown (third-party) |
| istio                       | minikube | disabled     | unknown (third-party) |
| istio-provisioner           | minikube | disabled     | unknown (third-party) |
| kubevirt                    | minikube | disabled     | unknown (third-party) |
| logviewer                   | minikube | disabled     | google                |
| metallb                     | minikube | disabled     | unknown (third-party) |
| metrics-server              | minikube | enabled ✅   | kubernetes            |
| nvidia-driver-installer     | minikube | disabled     | google                |
| nvidia-gpu-device-plugin    | minikube | disabled     | unknown (third-party) |
| olm                         | minikube | disabled     | unknown (third-party) |
| pod-security-policy         | minikube | disabled     | unknown (third-party) |
| registry                    | minikube | disabled     | google                |
| registry-aliases            | minikube | disabled     | unknown (third-party) |
| registry-creds              | minikube | disabled     | unknown (third-party) |
| storage-provisioner         | minikube | enabled ✅   | kubernetes            |
| storage-provisioner-gluster | minikube | disabled     | unknown (third-party) |
| volumesnapshots             | minikube | disabled     | kubernetes            |
|-----------------------------|----------|--------------|-----------------------|

```

## Command for run minikube with different HW options (RAM/CPU)

```bash

minikube start --cpus=4 --memory=4048

```


