# Homework Assignment 1: KinD Kubernetes Cluster Setup
## 1.Install Docker and KinD on your local machine.

```
x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind
rm -rf kind
```
Проверяем установку
```
rootubuntudev:/09.K8s kind --version
kind version 0.23.0
```
## 2.Create a KinD cluster with a single control plane node.
```
kind create cluster
```
На выходе
``` 
root@ubuntudev:~/09.K8s# kind create cluster
Creating cluster "kind" ...
 Ensuring node image (kindest/node:v1.30.0) 
  Ensuring node image (kindest/node:v1.30.0) 
  Preparing nodes 
  Writing configuration 
  Starting control-plane 
  Installing CNI 
  Installing StorageClass 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Not sure what to do next?   Check out https://kind.sigs.k8s.io/docs/user/quick-start/
```
## 3.Verify that the cluster is up and running using kubectl.

Нужно установить kubectl, так как kind идёт без него
```
curl -LO "https://dl.k8s.io/release/(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
Проверим ноды с помощью kind
```
root@ubuntudev:~/09.K8s# kind get nodes
kind-control-plane

```
И с помощью kubectl

```
kubectl get nodes

root@ubuntudev:~/09.K8s# kubectl get nodes
NAME                 STATUS   ROLES           AGE   VERSION
kind-control-plane   Ready    control-plane   17m   v1.30.0
```

# Homework Assignment 2: Minikube Kubernetes Cluster Setup
## 1.Install Minikube and a hypervisor (e.g., VirtualBox/Docker) on your local machine.
Скачаем minikube и установим. Ссылка на документацию по скачиванию [https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download]
```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

```
## 2.Start a Minikube cluster with a single node.
Команда для старта minikube
```
minikube start --driver=docker
```
Вывод команды
```

kirillubuntudev: minikube start --driver=docker
  minikube v1.33.1 on Ubuntu 22.04 (vbox/amd64)
  Using the docker driver based on user configuration

  The requested memory allocation of 2200MiB does not leave room for system overhead (total system  memory: 2984MiB). You may face stability issues.
  Suggestion: Start minikube with less memory allocated: minikube start --memory=2200mb

  Using Docker driver with root privileges
  Starting "minikube" primary control-plane node in "minikube" cluster
  Pulling base image v0.0.44 ...
  Downloading Kubernetes v1.30.0 preload ...
     preloaded-images-k8s-v18-v1...:  342.90 MiB / 342.90 MiB  100.00% 1.48 Mi
     gcr.io/k8s-minikube/kicbase...:  481.58 MiB / 481.58 MiB  100.00% 1.73 Mi
minikube kubectl get pods
  Creating docker container (CPUs=2, Memory=2200MB) ...
  Preparing Kubernetes v1.30.0 on Docker 26.1.1 ...
     Generating certificates and keys ...
     Booting up control plane ...
     Configuring RBAC rules ...
  Configuring bridge CNI (Container Networking Interface) ...
  Verifying Kubernetes components...
     Using image gcr.io/k8s-minikube/storage-provisioner:v5
  Enabled addons: storage-provisioner, default-storageclass
  kubectl not found. If you need it, try: minikube kubectl -- get pods -A
  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
kirillubuntudev: minikube kubectl get pods
     kubectl.sha256:  64 B / 64 B ------------------------- 100.00% ? p/s 0s
     kubectl:  49.07 MiB / 49.07 MiB -------------- 100.00% 2.88 MiB p/s 17s
No resources found in default namespace.
kirillubuntudev: minikube kubectl get pods
No resources found in default namespace.
```
## 3.Confirm that the cluster is operational using kubectl.
Команда для старта minikube и проверки доступных node
```
minikube kubectl get nodes
```
Вывод команды

```
kirillubuntudev: minikube kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   2m    v1.30.0
```
