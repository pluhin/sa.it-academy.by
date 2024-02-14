# 09.Kubernetes
---

## Assignment 1: KinD Kubernetes Cluster Setup

Installing Go

```bash
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
sha256sum go1.16.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.profile
go version
```

Output

```bash
go version go1.16.7 linux/amd64
```

Installing Kind

```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind --version
```

Output

```bash
kind version 0.21.0
```

Installing kubectl

```bash
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
```

Output

```bash
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
```

Create single_control_plane.yaml

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: app-1-cluster
nodes:
# one node hosting a control plane
- role: control-plane
```

Creating kid cluster from single_plane_kind.yaml

```bash
kind create cluster --name kind-test-cluster --config single_control_plane.yaml
```

Output

```bash
Creating cluster "kind-test-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.29.1) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-kind-test-cluster"
You can now use your cluster with:

kubectl cluster-info --context kind-kind-test-cluster

Thanks for using kind! 😊
```

Verifying creation with kubectl

```bash
kubectl cluster-info --context kind-kind-test-cluster
```

Output

```bash
Kubernetes control plane is running at https://127.0.0.1:40995
CoreDNS is running at https://127.0.0.1:40995/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

## 2: Minikube Kubernetes Cluster Setup

Installing Minikube and a hypervisor

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
```

Output

```bash
* minikube v1.32.0 on Ubuntu 22.04
* Automatically selected the docker driver. Other choices: ssh, none
* Using Docker driver with root privileges
* Starting control plane node minikube in cluster minikube
* Pulling base image ...
* Downloading Kubernetes v1.28.3 preload ...
    > preloaded-images-k8s-v18-v1...:  403.35 MiB / 403.35 MiB  100.00% 1.27 Mi
    > gcr.io/k8s-minikube/kicbase...:  453.88 MiB / 453.90 MiB  100.00% 1.19 Mi
* Creating docker container (CPUs=2, Memory=2200MB) ...
* Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

Checking cluster operational

```bash
kubectl get nodes
```

Output

```bash
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   75s   v1.28.3
```

## 3: GitHub Actions for KinD Cluster Setup

Github Repo
[Github for 09.Kubernetes](https://github.com/Goshaker/K8s_start)

Making directory for actions

```bash
mkdir -p .github/workflows
```

kind_cluster_workflow.yaml

```yaml
name: KinD Cluster Setup
on:
  push:
    branches:
      - master

jobs:
  setup-kind-cluster:
    runs-on: [ubuntu-latest]
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Set up KinD cluster
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.21.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind
          kind create cluster

      - name: Extract Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl get pods -A
          kubectl version
```

Cluster Info

```bash
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.29.1
How long spin up (Time): 42s
```

## 4: GitHub Actions for Minikube Cluster Setup

minicube_cluster.yaml

```yaml
name: Minikube Cluster Setup
on:
  push:
    branches:
      - master

jobs:
  setup-minikube-cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Install Minikube
        run: |
          curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
      
      - name: Start Minikube Cluster
        run: minikube start
      
      - name: Check Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl get pods -A
          kubectl version
```

Cluster Info

```bash
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.28.3
How long spin up (Time): 55s
```