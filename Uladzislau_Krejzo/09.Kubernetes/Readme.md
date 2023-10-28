 # 09. Kubernetes

 ## [GitHub repository for my Kubernetes-related assignments](https://github.com/jankalep/09.Kubernetes)

 ## history of my commands
```bash
 1262  mkdir 09.Kubernetes
 1263  cd 09.Kubernetes
 1264  git init
 1265  vim Readme.md
 1266  git remote add 09K8s git@github.com:jankalep/09.Kubernetes.git
 1267  git checkout
 1268  git branch -m master
 1269  git add *
 1270  git commit -m "9K8s start"
 1271  mkdir .github/workflows
 1272  mkdir .github
 1273  cd .github
 1274  mkdir workflows
 1275  cd ../
 1276  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
 1277  chmod +x ./kind
 1278  mv ./kind /usr/local/bin/kind
 1279  kind version
 1280  kind create cluster --name mycluster
 1281  kind delete cluster --name mycluster
 1282  vim cluster-config.yaml
 1283  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 1284  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
 1285  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 1286  kubectl version --client
 1287  kubectl cluster-info --context kind-my-cluster
 1288  kind create cluster --name my-cluster --config cluster-config.yaml
 1289  kubectl cluster-info --context kind-my-cluster
 1290  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
 1291  sudo install minikube-linux-amd64 /usr/local/bin/minikube
 1292  minikube start
 1293  kubectl cluster-info
 1294  cd 09.Kubernetes/.github/workflows/
 1295  vim kind-cluster.yaml
 1296  cd ../../
 1297  mv ../cluster-config.yaml ./cluster-config.yaml
 1298  git add *
 1299  git commit -m "kind-cluster"
 1300  git add ./.github/workflows/kind-cluster.yaml
 1301  git commit -m "kind-cluster for GHAction"
 1302  git push 09K8s
 1303  vim ./.github/workflows/minicube-cluster.yaml
 1304  git add *
 1305  git commit -m "Minicube cluster"
 1306  git checkout master
 1307  git stash
 1308  git add ./.github/workflows/minicube-cluster.yaml
 1309  git commit -m "Minicube cluster"
 1310  git push 09K8s
 1311  ls
 1312  history >> Readme.md
```
## Homework Assignment 1: KinD Kubernetes Cluster Setup

>Note:First after Installation I created cluster without config file. It was successful and I deleted them to create again from config cluster-config.yaml

### cluster-config.yaml
```YAML
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup

>Note: I had already VirtualBox VM in which made Homeworks

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

[![Kind Cluster Setup](https://github.com/jankalep/09.Kubernetes/actions/workflows/kind-cluster.yaml/badge.svg)](https://github.com/jankalep/09.Kubernetes/actions/workflows/kind-cluster.yaml)

### kind-cluster.yaml
```YAML
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

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

[![Minicube Cluster Setup](https://github.com/jankalep/09.Kubernetes/actions/workflows/minicube-cluster.yaml/badge.svg)](https://github.com/jankalep/09.Kubernetes/actions/workflows/minicube-cluster.yaml)


### minicube-cluster.yaml
```YAML
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
