#
# 09. Kubernetes
#

## Homework Assignment 1: KinD Kubernetes Cluster Setup

### My commands
``` bash
docker --version 
Docker version 25.0.3, build 4debf41

#install kind
# For AMD64 / x86_64\n
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64\n
kind --version
kind version 0.22.0

# install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
kubectl version
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3

kind create cluster --name my-kind-cla1

kubectl cluster-info --context kind-my-kind-cla1
#Output
Kubernetes control plane is running at https://127.0.0.1:41819
CoreDNS is running at https://127.0.0.1:41819/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup

### My commands

``` bash
#Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64\nsudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version 
minikube version: v1.32.0
commit: 8220a6eb95f0a4d75f7f2d7b14cef975f050512d

minikube start  
minikube status
kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   18h   v1.28.3
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

### KinD Workflow

``` bash
name: "Create cluster KinD"
on: [push]

jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository  
        uses: actions/checkout@master
      - name: Setup KinD
        uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.11.1"
      - name: Testing
        run: |
          kubectl cluster-info 
          kubectl get pods -n kube-system 
          echo "current-context:" $(kubectl config current-context) 
          echo "environment-kubeconfig:" ${KUBECONFIG} 
          kubectl get nodes
          kubectl get pods -A
          kubectl version
```

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

### Minikube Workflow

``` bash
name: Create cluster using Minikube
on: [push]
jobs:
  minikube:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository  
        uses: actions/checkout@master
      - name: start minikube
        id: minikube
        uses: medyagh/setup-minikube@latest
      # now you can run kubectl to see the pods in the cluster
      - name: Check kubectl Cluster Info
        run: |
          kubectl cluster-info
          kubectl get nodes
          kubectl get pods -A
          kubectl version
```