

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
