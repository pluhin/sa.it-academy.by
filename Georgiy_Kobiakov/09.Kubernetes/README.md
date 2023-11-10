# 09.Kubernetes
---

## Assignment 1: KinD Kubernetes Cluster Setup

Installing Kind

```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind --version
```

Output

```bash
kind version 0.20.0
```

Installing kubectl

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

Output

```bash
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
```

Create single_plane_kind.yaml

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
kind create cluster --name kind-test-cluster --config single_plane_kind.yaml
```

Output

```bash
Creating cluster "kind-test-cluster" ...
 ✓ Ensuring node image (kindest/node:v1.27.3) 🖼
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
Kubernetes control plane is running at https://127.0.0.1:35325
CoreDNS is running at https://127.0.0.1:35325/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

## 2: Minikube Kubernetes Cluster Setup

Installing Minikube and a hypervisor

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
kubectl start
```

Output

```bash
* minikube v1.32.0 on Ubuntu 22.04
* Automatically selected the docker driver

X The requested memory allocation of 1928MiB does not leave room for system overhead (total system memory: 1928MiB). You may face stability issues.
* Suggestion: Start minikube with less memory allocated: 'minikube start --memory=1928mb'

* Using Docker driver with root privileges
* Starting control plane node minikube in cluster minikube
* Pulling base image ...
* Downloading Kubernetes v1.28.3 preload ...
    > gcr.io/k8s-minikube/kicbase...:  453.90 MiB / 453.90 MiB  100.00% 7.54 Mi
    > preloaded-images-k8s-v18-v1...:  403.35 MiB / 403.35 MiB  100.00% 3.76 Mi
* Creating docker container (CPUs=2, Memory=1928MB) ...
* Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Verifying Kubernetes components...
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

Checking cluster operational

```bash
kubectl get nodes
```

Output

```bash
NAME       STATUS   ROLES           AGE    VERSION
minikube   Ready    control-plane   9m5s   v1.28.3
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
      - main

jobs:
  setup-kind-cluster:
    runs-on: [ubuntu-latest]
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4

      - name: Set up KinD cluster
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind
          kind create cluster

      - name: Check Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl version
```

- 1 node
- Kebernetes version: Server Version: v1.27.3
- Time to spin out: 30s

## 4: GitHub Actions for Minikube Cluster Setup

Github Repo
[Github for 09.Kubernetes](https://github.com/Goshaker/K8s_start)

minicube_cluster_workflow.yaml

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
          curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
      
      - name: Start Minikube Cluster
        run: minikube start
      
      - name: Check Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl version
```

- 1 node
- Kebernetes version: Server Version: v1.27.3
- Time to spin out: 44s