# 10.Kubernetes

## Homework Assignment 1: KinD Kubernetes Cluster Setup
```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.33.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind create cluster --name k8s-lab-1
user@vm:~ % kubectl get po -A
NAMESPACE            NAME                                              READY   STATUS    RESTARTS   AGE
kube-system          coredns-559f6c778d-6t22n                          1/1     Running   0          2m
kube-system          coredns-559f6c778d-hcxvm                          1/1     Running   0          2m
kube-system          etcd-k8s-lab-1-control-plane                      1/1     Running   0          2m9s
kube-system          kindnet-rgvwn                                     1/1     Running   0          2m
kube-system          kube-apiserver-k8s-lab-1-control-plane            1/1     Running   0          2m9s
kube-system          kube-controller-manager-k8s-lab-1-control-plane   1/1     Running   0          2m9s
kube-system          kube-proxy-p2pdn                                  1/1     Running   0          2m
kube-system          kube-scheduler-k8s-lab-1-control-plane            1/1     Running   0          2m9s
local-path-storage   local-path-provisioner-75f7fc7dc5-rmlx5           1/1     Running   0          2m
user@vm:~ % kind get clusters
enabling experimental podman provider
k8s-lab-1
```
## Homework Assignment 2: MiniKube Kubernetes Cluster Setup
```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
minikube completion zsh > "${fpath[1]}/_minikube"
minikube start --driver=podman
user@kubekosh:~ % kubectl get po -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-559f6c778d-sspjl           1/1     Running   0          5m15s
kube-system   etcd-minikube                      1/1     Running   0          5m21s
kube-system   kindnet-4v6nx                      1/1     Running   0          5m15s
kube-system   kube-apiserver-minikube            1/1     Running   0          5m22s
kube-system   kube-controller-manager-minikube   1/1     Running   0          5m22s
kube-system   kube-proxy-pqprf                   1/1     Running   0          5m15s
kube-system   kube-scheduler-minikube            1/1     Running   0          5m21s
kube-system   storage-provisioner                1/1     Running   0          5m19s
user@kubekosh:~ % kubectl get nodes
NAME       STATUS   ROLES           AGE    VERSION
minikube   Ready    control-plane   6m2s   v1.37.0
```