# 09.Kubernetes
## Homework Assignment 1: KinD Kubernetes Cluster Setup

```bash
➜  09.Kubernetes [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    97  100    97    0     0    244      0 --:--:-- --:--:-- --:--:--   243
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  9.9M  100  9.9M    0     0  3313k      0  0:00:03  0:00:03 --:--:-- 5565k
➜  09.Kubernetes chmod +x ./kind
➜  09.Kubernetes sudo mv ./kind /usr/local/bin/kind
[sudo] password for admin: 
➜  09.Kubernetes kind create cluster --name kind-cluster
Creating cluster "kind-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.32.0) 🖼 
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-kind-cluster

Thanks for using kind! 😊
➜  09.Kubernetes curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   138  100   138    0     0    520      0 --:--:-- --:--:-- --:--:--   522
100 54.6M  100 54.6M    0     0  6103k      0  0:00:09  0:00:09 --:--:-- 6797k

➜  09.Kubernetes sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

➜  09.Kubernetes kubectl cluster-info --context kind-kind-cluster
Kubernetes control plane is running at https://127.0.0.1:33151
CoreDNS is running at https://127.0.0.1:33151/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
➜  09.Kubernetes kubectl get nodes
NAME                         STATUS   ROLES           AGE   VERSION
kind-cluster-control-plane   Ready    control-plane   5m    v1.32.0
```
## Homework Assignment 2: Minikube Kubernetes Cluster Setup

```bash
➜  ~ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \\n  && chmod +x minikube
➜  ~ mkdir -p /usr/local/bin/
➜  ~ sudo install ./minikube /usr/local/bin/
➜  ~ ll /usr/local/bin/minikube 
-rwxr-xr-x. 1 root root 120M янв 20 14:45 /usr/local/bin/minikube

➜  ~ minikube start --driver=docker 
😄  minikube v1.35.0 на Oracle 9.4 (vbox/amd64)
✨  Используется драйвер docker на основе конфига пользователя
📌  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
💾  Скачивается Kubernetes v1.32.0 ...
    > preloaded-images-k8s-v18-v1...:  333.57 MiB / 333.57 MiB  100.00% 28.28 M
    > gcr.io/k8s-minikube/kicbase...:  500.31 MiB / 500.31 MiB  100.00% 29.66 M
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Подготавливается Kubernetes v1.32.0 на Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Компоненты Kubernetes проверяются ...
    ▪ Используется образ gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Включенные дополнения: storage-provisioner, default-storageclass
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Готово! kubectl настроен для использования кластера "minikube" и "default" пространства имён по умолчанию

➜  ~ kubectl cluster-info                                                                                      
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
➜  ~ kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   74s   v1.32.0
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

[GitHub repository](https://github.com/MisterRobo/sa.it-academy.by_09.Kubernetes)

[GitHub action](https://github.com/MisterRobo/sa.it-academy.by_09.Kubernetes/actions/runs/12867666961/job/35872790893)

```
name: Setup KinD Cluster

on:
  push:
    branches:
      - main

jobs:
  setup-kind:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Install KinD
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind

      - name: Install kubectl
        run: |
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/

      - name: Create KinD cluster
        run: |
          kind create cluster --name github-actions

      - name: Verify cluster
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl get pods -A

```

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

[GitHub repository](https://github.com/MisterRobo/sa.it-academy.by_09.Kubernetes)

[GitHub action](https://github.com/MisterRobo/sa.it-academy.by_09.Kubernetes/actions/runs/12867842327/job/35873324300)

```
name: Setup Minikube Cluster

on:
  pull_request:

jobs:
  setup-minikube:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Install Minikube
        run: |
          curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          sudo install minikube-linux-amd64 /usr/local/bin/minikube

      - name: Install kubectl
        run: |
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/

      - name: Install Docker
        run: |
          sudo apt-get update
          sudo apt-get install -y docker.io
          sudo systemctl start docker
          sudo systemctl enable docker

      - name: Start Minikube
        run: |
          minikube start --driver=docker

      - name: Verify Minikube
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl get pods -A

```

- how many nodes they have:
  - Minikube - 1
  - Kind     - 1

- which latest version of Kubernetes they are using:
  - Minikube - v1.32.0
  - Kind     - v1.27.3

- how long they spin up (you can provide just timing)
  - Minikube - 1m 8s
  - Kind     - 28s
