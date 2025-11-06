# 09. Kubernetes
## How to install by kubespray

__Input__
```
git clone git@github.com:kubernetes-sigs/kubespray.git
cd k8s/kubespray/
sudo pip install -U -r requirements.txt
cp -rfp inventory/sample/ inventory/plu
vim inventory/plu/inventory.ini
ansible-playbook -i inventory/plu/inventory.ini cluster.yml -u root --ask-vault-pass
kubectl get nodes
```
__Output__
```
NAME    STATUS   ROLES           AGE     VERSION
node1   Ready    control-plane   3h24m   v1.34.1
node2   Ready    <none>          3h24m   v1.34.1
```

__Inventory.ini listing__
```
# This inventory describe a HA typology with stacked etcd (== same nodes as control plane)
# and 3 worker nodes
# See https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html
# for tips on building your # inventory

# Configure 'ip' variable to bind kubernetes services on a different ip than the default iface
# We should set etcd_member_name for etcd cluster. The node that are not etcd members do not need to set the value,
# or can set the empty string value.
node1 ansible_host=192.168.208.1 ip=192.168.208.1 ansible_python_interpreter=/usr/bin/python3
node2 ansible_host=192.168.208.2 ip=192.168.208.2 ansible_python_interpreter=/usr/bin/python3
[kube_control_plane]
node1

[etcd:children]
kube_control_plane

[kube_node]
node1
node2
```

## Homework Assignment 1: KinD Kubernetes Cluster Setup

__Input__
```
curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
sudo chmod +x ./kind && sudo mv ./kind /usr/local/bin/
kind create cluster --name student --image kindest/node:v1.34.0
```
__Output__
```
Creating cluster "student" ...
⠈⠁ Ensuring node image (kindest/node:v1.34.0) 🖼 curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
 ✓ Ensuring node image (kindest/node:v1.34.0) 🖼
 ✓ Preparing nodes 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
Set kubectl context to "kind-student"
You can now use your cluster with:

kubectl cluster-info --context kind-student

Have a question, bug, or feature request? Let us know! https://kind.sigs.k8s.io/#community 🙂
student@learn-m:~$ curl -Lo ./kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    86  100    86    0     0    531      0 --:--:-- --:--:-- --:--:--   534
100 10.5M  100 10.5M    0     0  7572k      0  0:00:01  0:00:01 --:--:-- 17.7M
``` 

__Input__
```
kubectl cluster-info
```
__Otput__
```
Kubernetes control plane is running at https://127.0.0.1:40379
CoreDNS is running at https://127.0.0.1:40379/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```
__Input__
```
kubectl get nodes
```
__Output__
```
NAME                    STATUS   ROLES           AGE     VERSION
student-control-plane   Ready    control-plane   9m35s   v1.34.0
Homework Assignment 2: Minikube Kubernetes Cluster Setup
```
__Input__
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
```
__Output__
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  133M  100  133M    0     0  80278      0  0:29:02  0:29:02 --:--:-- 91425
```
```
* minikube v1.37.0 on Ubuntu 22.04
* Using the docker driver based on existing profile
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.48 ...
* Restarting existing docker container for "minikube" ...
* Preparing Kubernetes v1.34.0 on Docker 28.4.0 ...
* Verifying Kubernetes components...
```
__Input__
```
kubectl get nodes
```
__Otput__
```
NAME       STATUS   ROLES           AGE     VERSION
minikube   Ready    control-plane   2d23h   v1.34.0
```
## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

__Input__
```
mkdir -p KinD
mkdir -p .github/workflows
sudo nano .github/workflows/kind.yml
sudo nano README.md
git init
git remote add origin git@github.com:ArtegaAS/KinD.git
git add .
git commit -m "Git Init"
git push -u origin main
```

### Listing .github/workflows/kind.yml:
```
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: default-storageclass, storage-provisioner
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
name: KinD Cluster CI
on:
  push:
    branches: [ "main" ]
jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up KinD
        uses: helm/kind-action@v1.8.0
      - run: kubectl get nodes -o wide
```

### URLs
```
Git Repo https://github.com/ArtegaAS/KinD
Git Action https://github.com/ArtegaAS/KinD/actions
```

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

__Input__
```
mkdir minikube
mkdir -p minikube/.github/workflows
sudo nano minikube/.github/workflows/minikube.yml
cd minikube/
sudo nano RESDME.md
git init
git remote add origin git@github.com:ArtegaAS/minikube.git
git add .
git push -u origin main
git commit -m "Git init"
git push -u origin main
git pull -u origin main
git pull origin main
git checkout -b test
git branch
sudo nano README.md
git commit -m "Change 2"
git push -u origin test
```

### Listing .github/workflows/minikube.yml
```
name: Minikube Cluster CI

on:
  pull_request:
    branches: [ "main" ]

jobs:
  minikube:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install Minikube
        run: |
          curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          sudo install minikube-linux-amd64 /usr/local/bin/minikube

      - name: Start Minikube
        run: |
          minikube start --driver=docker --kubernetes-version=v1.34.0
          kubectl get nodes -o wide
```

### URLs
```
Git Repo https://github.com/ArtegaAS/minikube
Git Action https://github.com/ArtegaAS/minikube/actions
``` 




