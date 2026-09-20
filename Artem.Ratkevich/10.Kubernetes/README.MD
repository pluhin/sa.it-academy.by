# 10. Kubernetes

## Assignment 1: KinD Kubernetes Cluster Setup

### Install KinD and kubectl
```bash
# Install kind (check https://github.com/kubernetes-sigs/kind/releases for latest)
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

### Run cluster 
```bash
kind create cluster --name homework-cluster --config kind-config.yaml
```

### Verify 

```text
kubectl cluster-info

Kubernetes control plane is running at https://127.0.0.1:45991
CoreDNS is running at https://127.0.0.1:45991/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

kubectl get nodes

NAME                             STATUS   ROLES           AGE     VERSION
homework-cluster-control-plane   Ready    control-plane   3m28s   v1.31.0

kubectl get pods -n kube-system

NAME                                                     READY   STATUS    RESTARTS   AGE
coredns-6f6b679f8f-b458g                                 1/1     Running   0          4m16s
coredns-6f6b679f8f-s2wcg                                 1/1     Running   0          4m16s
etcd-homework-cluster-control-plane                      1/1     Running   0          4m25s
kindnet-bx2d8                                            1/1     Running   0          4m16s
kube-apiserver-homework-cluster-control-plane            1/1     Running   0          4m23s
kube-controller-manager-homework-cluster-control-plane   1/1     Running   0          4m24s
kube-proxy-kzwt4                                         1/1     Running   0          4m16s
kube-scheduler-homework-cluster-control-plane            1/1     Running   0          4m23s

```

## Assignment 2: Minikube Kubernetes Cluster Setupe

### Install Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version
```

### Start the cluster
```bash
minikube start --driver=docker --force
```

### Verify
```text
minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

sudo kubectl get nodes
NAME       STATUS     ROLES           AGE   VERSION
minikube   NotReady   control-plane   49m   v1.37.0
```

## Assignment 3\4: GitHub Actions for KinD\Minikube Cluster Setup

Here are examples of completing tasks.
[KinD](https://github.com/Rollwar/kubernetes_test/actions/runs/35513264367) [Minikube](https://github.com/Rollwar/kubernetes_test/actions/runs/35513936695)

Both clusters use v1.31.0, each had 1 node, and the observed spin-up times were roughly 22s and 53s.