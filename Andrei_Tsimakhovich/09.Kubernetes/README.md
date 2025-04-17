# 09. Kubernetes

## Homework Assignment 0: Finish full install k8s
- Kubernetes was implemented on remote hosts: 192.186.208.19-20

```
Thursday 17 April 2025  00:04:25 +0300 (0:00:00.141)       0:52:07.913 ********
===============================================================================
network_plugin/calico : Calico | Create calico manifests --------------------------------------------------------------------------------------------------------------------------------------- 110.75s
policy_controller/calico : Create calico-kube-controllers manifests ----------------------------------------------------------------------------------------------------------------------------- 71.44s 
kubernetes/preinstall : Install packages requirements ------------------------------------------------------------------------------------------------------------------------------------------- 69.75s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 42.34s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 37.30s 
download : Download_file | Download item -------------------------------------------------------------------------------------------------------------------------------------------------------- 36.87s 
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) ----------------------------------------------------------------------- 36.70s 
kubernetes-apps/ansible : Kubernetes Apps | CoreDNS --------------------------------------------------------------------------------------------------------------------------------------------- 32.36s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 30.89s 
bootstrap-os : Ensure iproute2 is installed ----------------------------------------------------------------------------------------------------------------------------------------------------- 30.18s 
container-engine/containerd : Download_file | Download item ------------------------------------------------------------------------------------------------------------------------------------- 26.43s 
kubespray-defaults : Gather ansible_default_ipv4 ------------------------------------------------------------------------------------------------------------------------------------------------ 25.80s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 25.77s 
kubespray-defaults : Gather ansible_default_ipv6 ------------------------------------------------------------------------------------------------------------------------------------------------ 25.68s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 25.28s 
container-engine/runc : Download_file | Download item ------------------------------------------------------------------------------------------------------------------------------------------- 21.66s 
container-engine/crictl : Download_file | Download item ----------------------------------------------------------------------------------------------------------------------------------------- 21.41s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 21.03s 
container-engine/nerdctl : Download_file | Download item ---------------------------------------------------------------------------------------------------------------------------------------- 20.78s 
download : Download_container | Download image if required -------------------------------------------------------------------------------------------------------------------------------------- 20.47s 
(ansible-env) debian@vbox ~/i/0/kubespray (master)>
```

## Homework Assignment 1: KinD Kubernetes Cluster Setup
1. Install kubectl on Linux
```
debian@vbox ~/it-academy-training (master)> kubectl version --client
Client Version: v1.32.3
Kustomize Version: v5.5.0
```
2. Install Kind
```
debian@vbox ~/it-academy-training (master)> kind --version
kind version 0.27.0
```  
3. Create kind cluster.
```
debian@vbox ~/it-academy-training (master)> kind create cluster
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.32.2) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Thanks for using kind! 😊
```
4. Verify cluster via ```kubectl```

```
debian@vbox ~/it-academy-training (master)> kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:35677
CoreDNS is running at https://127.0.0.1:35677/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
## Homework Assignment 2: Minikube Kubernetes Cluster Setup
1. Install minikube - debian package
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb## Homework Assignment 3: GitHub Actions for KinD Cluster Setup
```

```
debian@vbox ~/it-academy-training (master) [14]> minikube version
minikube version: v1.35.0
commit: dd5d320e41b5451cdf3c01891bc4e13d189586ed-dirty
```
2. Run minikube cluster
```debian@vbox ~/it-academy-training (master)> minikube start
😄  minikube v1.35.0 on Debian 12.10 (vbox/amd64)
✨  Automatically selected the docker driver

🧯  The requested memory allocation of 1967MiB does not leave room for system overhead (total system memory: 1967MiB). You may face stability issues.
💡  Suggestion: Start minikube with less memory allocated: 'minikube start --memory=1967mb'

📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
💾  Downloading Kubernetes v1.32.0 preload ...
    > gcr.io/k8s-minikube/kicbase...:  500.31 MiB / 500.31 MiB  100.00% 5.30 Mi
    > preloaded-images-k8s-v18-v1...:  333.57 MiB / 333.57 MiB  100.00% 3.33 Mi
🔥  Creating docker container (CPUs=2, Memory=1967MB) ...
🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```
3. Verify cluster via kubectl
```
debian@vbox ~/it-academy-training (master)> kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
debian@vbox ~/it-academy-training (master)> kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   10m   v1.32.0
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup
1. Create kind-cluster.yml
2. Push changes
3. Check number of nodes in Github actions 
```
Run kubectl get nodes
  kubectl get nodes
  shell: /usr/bin/bash -e {0}
  
NAME                       STATUS   ROLES           AGE   VERSION
ci-cluster-control-plane   Ready    control-plane   25s   v1.30.0

```
4. Execution time: 1 m 4 s

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

1. Create minikube-setup.yaml
2. Push changes
3. Create additional branch, make some changes and create pull request.
4. Check number of nodes in Github actions
```
Run kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   4s    v1.32.0
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   etcd-minikube                      0/1     Running   0          2s
kube-system   kube-apiserver-minikube            0/1     Running   0          2s
kube-system   kube-controller-manager-minikube   0/1     Running   0          2s
kube-system   kube-scheduler-minikube            0/1     Running   0          2s
kube-system   storage-provisioner                0/1     Pending   0          1s
```
5. Execution time: 51s
