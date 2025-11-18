## Homework Assignment 1: KinD Kubernetes Cluster Setup
```
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

kind create cluster --name kind-cluster-homework-1
kubectl cluster-info --context kind-kind-cluster-homework-1
kubectl config get-contexts
kubectl get nodes
kubectl get pods -A
kind delete cluster --name kind-cluster-homework-1
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

minikube start
kubectl config get-contexts
kubectl get nodes
kubectl get pods -A
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup && Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

[Repo romastelchenko/it-academy.09-kubernetes](https://github.com/romastelchenko/it-academy.09-kubernetes)

[GitHub Action run with KinD setup](https://github.com/romastelchenko/it-academy.09-kubernetes/actions/runs/19413253747)

[GitHub Action run with Minikube setup](https://github.com/romastelchenko/it-academy.09-kubernetes/actions/runs/19413246195)

Please find github-action file(s) in repo above or in current directory: *kind_setup.yml* and *minikube_setup.yml*

### Reports:
```
KinD report:
Number of nodes: 1
Kubernetes version: { Client Version: v1.34.2
Kustomize Version: v5.7.1
Server Version: v1.34.0 }
Spin-up time: 33 seconds
```


```
Minikube report:
Number of nodes: 1
Kubernetes version: { Client Version: v1.34.2
Kustomize Version: v5.7.1
Server Version: v1.34.0 }
Spin-up time: 41 seconds

```
