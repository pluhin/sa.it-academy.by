# 09. Kubernetes

## Homework Assignment 1: KinD Kubernetes Cluster Setup

1. Install Docker and KinD on your local machine.

Install KinD
[https://kind.sigs.k8s.io/docs/user/quick-start/]

```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

Install kubectl
[https://kubernetes.io/docs/tasks/tools/]

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

kubectl version --client
```

2. Create a KinD cluster with a single control plane node.

```bash
nano cluster-config.yaml
```

cluster-config.yaml:

```yml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
```
Create cluster

```bash
kind create cluster --name my-cluster --config cluster-config.yaml
```

3. Verify that the cluster is up and running using kubectl.

```bash
kubectl cluster-info --context kind-my-cluster
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup

1. Install Minikube and a hypervisor (e.g., VirtualBox) on your local machine.

Install Minikube
[https://minikube.sigs.k8s.io/docs/start/]

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Install VirtualBox

```bash
wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb

sudo dpkg -i virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
```

2. Start a Minikube cluster with a single node.

```bash
minikube start
```

3. Confirm that the cluster is operational using kubectl.

```bash
kubectl cluster-info
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

1. Create a GitHub repository for your Kubernetes-related assignments.

[https://github.com/Mazurovsasha/9.Kubernetes]

```bash
mkdir -p .github/workflows/

cd .github/workflows/
```

nano kind-cluster.yml

```yml
name: KinD Cluster Setup
on:
  push:
    branches:
      - master

jobs:
  setup-kind-cluster:
    runs-on: [ubuntu-latest]
    steps:
      - name: Set up KinD
        run: |
          curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.11.1/kind-linux-amd64
          chmod +x ./kind
          ./kind create cluster --name my-cluster
      - name: Check Cluster Info
        run: | 
          kubectl cluster-info
          kubectl get nodes
          kubectl version
```

```bash
git ac "kind-cluster"

git push -u origin master
```

- 1 nodes
- version of Kubernetes: Server Version: v1.21.1
- time to spin up: 57 s

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

nano minik-cluster.yml

```yml
name: Minikube Cluster Setup
on:
  push:
    branches:
      - master

jobs:
  setup-minikube-cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Install Minikube
        run: |
          curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          chmod +x minikube
          sudo mv minikube /usr/local/bin/
      - name: Start Minikube Cluster
        run: minikube start
      - name: Check Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl version
```

```bash
git ac "Add minikube cluster"

git push -u origin master
```

- 1 nodes
- version of Kubernetes: Server Version: v1.21.1
- time to spin up: 56 s