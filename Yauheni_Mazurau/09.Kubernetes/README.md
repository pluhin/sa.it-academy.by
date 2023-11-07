# 09. Kubernetes

## Homework Assignment 1: KinD Kubernetes Cluster Setup

* Install kind   [https://kind.sigs.k8s.io/docs/user/quick-start/]
```bash
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version
```


* Install Kubectl  [https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/]
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
```

* Create a KinD cluster with a single control plane node.

kind_cluster_conf.yaml
```bash
   kind: Cluster
   apiVersion: kind.x-k8s.io/v1alpha4
   nodes:
     - role: control-plane
```

* Download and start the necessary Docker images to create a single control plane node cluster

NOTE: This command will download and run the necessary Docker images to create a single cluster of control plane nodes
```bash
kind create cluster --config kind_cluster_conf.yaml
```

* Verify that the cluster is up and running using kubectl.
```bash
kubectl cluster-info --context kind-kind
```


## Homework Assignment 2: Minikube Kubernetes Cluster Setup

1. Install Minikube and a hypervisor (e.g., VirtualBox) on your local machine.

* Install Minikube [https://minikube.sigs.k8s.io/docs/start/]
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

* Install VirtualBox
```bash
wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
sudo apt-get install -f
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
```bash
mkdir -p .github/workflows/
```

2. Write a GitHub Actions workflow that sets up a KinD cluster.  [https://github.com/YMazurau/09.Kubernetes]

kind-cluster.yml
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

* Check
```
Run kubectl cluster-info
Kubernetes control plane is running at https://127.0.0.1:41435
CoreDNS is running at https://127.0.0.1:41435/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                       STATUS     ROLES                  AGE   VERSION
my-cluster-control-plane   NotReady   control-plane,master   7s    v1.21.1
WARNING: version difference between client (1.28) and server (1.21) exceeds the supported minor version skew of +/-1
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.21.1
```

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

minikube-cluster.yaml
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

Check
```
Run kubectl cluster-info
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   4s    v1.27.4
Client Version: v1.28.3
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.27.4
```