# Homework Assignment 1: KinD Kubernetes Cluster Setup
## Step 1:
```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo cp ./kind /usr/local/bin/kind
rm -rf kind
```
### Check:
```bash
root@ubuntu-focal:~# kind version
```
```
kind v0.20.0 go1.20.4 linux/amd64
```
## Step 2:
#### config.yml
```yml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.28.0
```
```bash
root@ubuntu-focal:~# kind create cluster --config=config.yml
```
```
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.28.0) 🖼
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Thanks for using kind! 😊
```
## Step3:
### Install kubectl:
```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
### Check:
```bash
root@ubuntu-focal:~# kubectl get nodes
```
```
NAME                 STATUS   ROLES           AGE     VERSION
kind-control-plane   Ready    control-plane   2m24s   v1.28.0
```
```bash
root@ubuntu-focal:~# docker ps
```
```
CONTAINER ID   IMAGE                  COMMAND                  CREATED         STATUS         PORTS                       NAMES
ca9b9cc5e245   kindest/node:v1.28.0   "/usr/local/bin/entr…"   3 minutes ago   Up 3 minutes   127.0.0.1:40075->6443/tcp   kind-control-plane
```

# Homework Assignment 2: Minikube Kubernetes Cluster Setup
## Step 1-3:
```bash
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
minikube start --vm-driver=docker
```
```
😄  minikube v1.32.0 on Ubuntu 20.04 (vbox/amd64)
✨  Using the docker driver based on user configuration

🧯  The requested memory allocation of 1983MiB does not leave room for system overhead (total system memory: 1983MiB). You may face stability issues.
💡  Suggestion: Start minikube with less memory allocated: 'minikube start --memory=1983mb'

📌  Using Docker driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.28.3 preload ...
    > preloaded-images-k8s-v18-v1...:  403.35 MiB / 403.35 MiB  100.00% 7.17 Mi
    > gcr.io/k8s-minikube/kicbase...:  453.90 MiB / 453.90 MiB  100.00% 3.07 Mi
🔥  Creating docker container (CPUs=2, Memory=1983MB) ...
🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🔎  Verifying Kubernetes components...
🌟  Enabled addons: default-storageclass, storage-provisioner
💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```
```bash
vagrant@ubuntu-focal:~$ kubectl get pods -A
```
```
NAMESPACE              NAME                                         READY   STATUS              RESTARTS        AGE
kube-system            coredns-5dd5756b68-mkw96                     1/1     Running             0               6m47s
kube-system            etcd-minikube                                1/1     Running             0               7m2s
kube-system            kube-apiserver-minikube                      1/1     Running             0               6m59s
kube-system            kube-controller-manager-minikube             1/1     Running             0               7m
kube-system            kube-proxy-4dqpz                             1/1     Running             0               6m47s
kube-system            kube-scheduler-minikube                      1/1     Running             0               6m59s
kube-system            storage-provisioner                          1/1     Running             1 (6m16s ago)   6m57s
kubernetes-dashboard   dashboard-metrics-scraper-7fd5cb4ddc-fxf89   1/1     Running             0               14s
kubernetes-dashboard   kubernetes-dashboard-8694d4445c-498tc        0/1     ContainerCreating   0               14s
```

# Homework Assignment 3: GitHub Actions for KinD Cluster Setup
## Step 1-4:
### .github/workflows/kind.yml
```yml
name: Create cluster using KinD
on:
  push:
    branches:
      - kind
jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: engineerd/setup-kind@v0.5.0
        with:
          version: "v0.11.1"
      - name: Testing
        run: |
          kubectl cluster-info
          kubectl get pods -n kube-system
          echo "current-context:" $(kubectl config current-context)
          echo "environment-kubeconfig:" ${KUBECONFIG}
```

# Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
## Steps 1-4:
### .gitthub/workflows/minikube.yaml
```yaml
name: "Create cluster using minikube"
on:
    - pull_request
jobs:
  minikube:
    runs-on: ubuntu-latest
    name: set up minikube
    steps:
    - uses: actions/checkout@v2
    - name: Start minikube
      uses: medyagh/setup-minikube@master
    - name: Try the cluster !
      run: kubectl get pods -A
```