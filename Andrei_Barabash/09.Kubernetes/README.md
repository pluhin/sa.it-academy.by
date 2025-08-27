## 1: KinD Kubernetes Cluster Setup

### 1. Install KinD on your local machine.
```bash
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-$(uname)-amd64

chmod +x ./kind && sudo mv ./kind /usr/local/bin/kind
```

### 2. Create a KinD cluster with a single control plane node.
```bash
kind create cluster
```

### 3. Verify that the cluster is up and running
```bash
kubectl get nodes
```


## 2: Minikube Kubernetes Cluster Setup

### 1. Install Minikube
```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

### 2. Start a Minikube cluster with a single node
```bash
minikube start
```

### 3. Confirm that the cluster is operational
```bash
kubectl get po -A
```
or
```bash
kubectl get nodes
```

