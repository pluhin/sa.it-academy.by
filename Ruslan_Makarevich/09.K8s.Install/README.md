# HA0:

## Finish full install k8s (hosts 192.168.208.5-6)

![K8s cluster](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/09.K8s.Install/k8s_cluster.jpg)

# HA 1: KinD Kubernetes Cluster Setup

## Installing the utility KinD

```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64

chmod +x ./kind

mv ./kind /usr/local/bin/kind

kind --version

kind version 0.24.0
```
## Create cluster

```bash
kind create cluster

Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.31.0) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Thanks for using kind!
```

## Check cluster-info

```bash
kubectl cluster-info

Kubernetes control plane is running at https://127.0.0.1:36657
CoreDNS is running at https://127.0.0.1:36657/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

# HA2: Minikube Kubernetes Cluster Setup

## Install Minikube

```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

## Start

```bash
minikube start

* minikube v1.36.0 on Ubuntu 22.04
* Using the docker driver based on user configuration

X The requested memory allocation of 1963MiB does not leave room for system overhead (total system memory: 1963MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=1963mb'

* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.47 ...
* Creating docker container (CPUs=2, Memory=1963MB) ...
* Preparing Kubernetes v1.33.1 on Docker 28.1.1 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

## Enable dashboard

```bash
minikube addons enable dashboard

minikube addons enable metrics-server

minikube kubectl -- get pods -A
NAMESPACE              NAME                                         READY   STATUS              RESTARTS   AGE
kube-system            coredns-674b8bbfcf-nftjl                     1/1     Running             0          12m
kube-system            etcd-minikube                                1/1     Running             0          12m
kube-system            kube-apiserver-minikube                      1/1     Running             0          12m
kube-system            kube-controller-manager-minikube             1/1     Running             0          12m
kube-system            kube-proxy-vbg8b                             1/1     Running             0          12m
kube-system            kube-scheduler-minikube                      1/1     Running             0          12m
kube-system            metrics-server-7fbb699795-qpkx7              0/1     ContainerCreating   0          4s
kube-system            storage-provisioner                          1/1     Running             0          12m
kubernetes-dashboard   dashboard-metrics-scraper-5d59dccf9b-j5vbb   0/1     ContainerCreating   0          35s
kubernetes-dashboard   kubernetes-dashboard-7779f9b69b-strcv        0/1     ContainerCreating   0          35s
```

## Install kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

kubectl proxy --address='0.0.0.0' --disable-filter=true
```

## Check cluster-info
```bash
minikube status f

minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
```

# HA3: GitHub Actions for KinD Cluster Setup

## setup.yaml

```bash
name: KinD Cluster Setup

on:
  push:
    branches:
      - master

jobs:
  setup-kind:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install kubectl
        run: |
          sudo apt-get update
          sudo apt-get install -y curl
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/

      - name: Install KinD
        run: |
          curl -Lo kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
          chmod +x kind
          sudo mv kind /usr/local/bin/

      - name: Create KinD cluster
        run: |
          kind create cluster --name github-actions

      - name: Get cluster info
        run: |
          kubectl cluster-info
          kubectl get nodes
```

### how many nodes they have: 1

### which latest version of Kubernetes they are using: v1.33.2

### how long they spin up (you can provide just timing): 47s

# HA4: GitHub Actions for Minikube Cluster Setup

## setup.yaml

```bash
name: Minikube Cluster Setup

on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  setup-minikube:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install Minikube
        run: |
          curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          chmod +x minikube
          sudo mv minikube /usr/local/bin/

      - name: Install kubectl
        run: |
          curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
          chmod +x kubectl
          sudo mv kubectl /usr/local/bin/

      - name: Start Minikube
        run: |
          sudo apt-get update && sudo apt-get install -y conntrack
          minikube start --driver=docker

      - name: Get cluster info
        run: |
          kubectl cluster-info
          kubectl get nodes
```

### how many nodes they have: 1

### which latest version of Kubernetes they are using: v1.33.1

### how long they spin up (you can provide just timing): 1m 5s

