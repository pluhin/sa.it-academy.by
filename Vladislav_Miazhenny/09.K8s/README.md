## Homework Assignment 1: KinD Kubernetes Cluster Setup
```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

```bash
kind version
kind v0.27.0 go1.23.6 linux/amd64
```

```bash
sudo kind create cluster --name my-cluster --kubeconfig ~/.kube/config-kind
Creating cluster "new-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.32.2) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-new-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-new-cluster
```
```bash
kubectl get nodes --context kind-my-cluster
NAME                       STATUS   ROLES           AGE     VERSION
my-cluster-control-plane   Ready    control-plane   4m31s   v1.32.2

```
```bash
kubectl get pods -A --context kind-my-cluster
NAMESPACE            NAME                                               READY   STATUS    RESTARTS   AGE
kube-system          coredns-668d6bf9bc-kh5r5                           1/1     Running   0          4m3s
kube-system          coredns-668d6bf9bc-q5d9z                           1/1     Running   0          4m3s
kube-system          etcd-my-cluster-control-plane                      1/1     Running   0          4m11s
kube-system          kindnet-w78wp                                      1/1     Running   0          4m3s
kube-system          kube-apiserver-my-cluster-control-plane            1/1     Running   0          4m10s
kube-system          kube-controller-manager-my-cluster-control-plane   1/1     Running   0          4m10s
kube-system          kube-proxy-9t4np                                   1/1     Running   0          4m3s
kube-system          kube-scheduler-my-cluster-control-plane            1/1     Running   0          4m10s
local-path-storage   local-path-provisioner-7dc846544d-lpl58            1/1     Running   0          4m3s
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup

```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

```
```bash
minikube version
minikube version: v1.35.0
commit: dd5d320e41b5451cdf3c01891bc4e13d189586ed-dirty
```

```bash
😄  minikube v1.35.0 на Ubuntu 22.04
✨  Automatically selected the docker driver. Other choices: none, ssh
📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
💾  Скачивается Kubernetes v1.32.0 ...
    > preloaded-images-k8s-v18-v1...:  333.57 MiB / 333.57 MiB  100.00% 6.08 Mi
    > gcr.io/k8s-minikube/kicbase...:  500.31 MiB / 500.31 MiB  100.00% 6.96 Mi
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Подготавливается Kubernetes v1.32.0 на Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Компоненты Kubernetes проверяются ...
    ▪ Используется образ gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Включенные дополнения: storage-provisioner, default-storageclass
🏄  Готово! kubectl настроен для использования кластера "minikube" и "default" пространства имён по умолчанию
```

```bash
kubectl get nodes
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   3m31s   v1.32.0
```

```bash
 kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-668d6bf9bc-fwctq           1/1     Running   0               3m37s
kube-system   etcd-minikube                      1/1     Running   0               3m42s
kube-system   kube-apiserver-minikube            1/1     Running   0               3m42s
kube-system   kube-controller-manager-minikube   1/1     Running   0               3m42s
kube-system   kube-proxy-lz4z9                   1/1     Running   0               3m37s
kube-system   kube-scheduler-minikube            1/1     Running   0               3m43s
kube-system   storage-provisioner                1/1     Running   1 (3m37s ago)   3m41s
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup
https://github.com/infinity-step/09_project/actions

```bash
Run kubectl cluster-info

Kubernetes control plane is running at [https://127.0.0.1:37399](https://127.0.0.1:37399)

CoreDNS is running at [https://127.0.0.1:37399/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy](https://127.0.0.1:37399/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy)

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

NAME STATUS ROLES AGE VERSION

my-cluster-control-plane Ready control-plane 23s v1.32.3
```

kind v0.28.0-alpha+1e95d05eeccdf6 go1.23.6 linux/amd64
Cluster creation took 43 seconds


## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
https://github.com/infinity-step/09_project/actions

```bash
Run kubectl cluster-info

Kubernetes control plane is running at [https://192.168.49.2:8443](https://192.168.49.2:8443)

CoreDNS is running at [https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy](https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy)

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

NAME STATUS ROLES AGE VERSION

minikube Ready control-plane 4s v1.32.0

NAMESPACE NAME READY STATUS RESTARTS AGE

kube-system etcd-minikube 0/1 Running 0 2s

kube-system kube-apiserver-minikube 0/1 Running 0 2s

kube-system kube-controller-manager-minikube 0/1 Running 0 2s

kube-system kube-scheduler-minikube 0/1 Running 0 2s

kube-system storage-provisioner 0/1 Pending 0 0s
```

minikube version: v1.35.0
Cluster creation took 37 seconds