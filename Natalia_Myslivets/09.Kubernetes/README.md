# HA1: KinD Kubernetes Cluster Setup

```bash
docker --version
Docker version 25.0.2, build 29cf629

Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl /usr/local/bin/kubect
kubectl version --client

Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin

root@srv01:/home/vagrant# kind version
kind v0.11.1 go1.16.4 linux/amd64
 
kind create cluster --name k8s-kind-cluster1       

root@srv01:/home/vagrant# kubectl cluster-info --context kind-k8s-kind-cluster1
Kubernetes control plane is running at https://127.0.0.1:40615
CoreDNS is running at https://127.0.0.1:40615/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

# HA2: Minikube Kubernetes Cluster Setup

```bash
docker --version
Docker version 25.0.2, build 29cf629
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
adduser minik
usermod -aG sudo minik
sudo usermod -aG docker ${USER}
su - ${USER}
minikube start
minikube status

minik@srv02:/home/vagrant$ kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   23h   v1.28.3

minik@srv02:/home/vagrant$minikube kubectl -- get pods --namespace kube-system
NAME                               READY   STATUS    RESTARTS        AGE
coredns-5dd5756b68-xltq6           1/1     Running   0               9m53s
etcd-minikube                      1/1     Running   0               10m
kube-apiserver-minikube            1/1     Running   0               10m
kube-controller-manager-minikube   1/1     Running   0               10m
kube-proxy-pgrjn                   1/1     Running   0               9m53s
kube-scheduler-minikube            1/1     Running   0               10m
storage-provisioner                1/1     Running   1 (9m19s ago)   10m
```

# HA3: GitHub Actions for KinD Cluster Setup

```yaml
name: "Create cluster using KinD"
#on: [push]
on:
  workflow_dispatch:
jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository  
        uses: actions/checkout@master
      - name: Setup kind
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
        shell: bash
      
```

# HA4: GitHub Actions for Minikube Cluster Setup

```yaml
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
      - name: kubectl
        run: |
          kubectl cluster-info 
          kubectl get pods -n kube-system 
          echo "current-context:" $(kubectl config current-context) 
          echo "environment-kubeconfig:" ${KUBECONFIG} 
          kubectl get nodes
          kubectl get pods -A
          kubectl version
        shell: bash
```

# Comparison of results

## KinD

```
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.21.1
Time: 1m
Nodes: 1 - kind-control-plane
```


## Minikube

```
Client Version: v1.29.1
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.28.3
Time: 1m 37s
Nodes: 1-minikube
```
