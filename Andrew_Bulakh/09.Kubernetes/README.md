# 09. Kubernetes

## Homework Assignment 1: KinD Kubernetes Cluster Setup
```bash
sudo apt update && sudo apt uprade
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind
kind create cluster
docker container ls
kubectl get nodes
```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup
```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
sudo systemctl status docker
sudo minikube start --driver=docker
minikube start --nodes 1
minikube status
kubectl get po -A
minikube kubectl -- get po -A
alias kubectl="minikube kubectl --"
minikube dashboard
history
```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup

[kind-cluster](https://github.com/AndrewBulah/Kubernetes/actions/runs/12855209891/job/35840483342)
```bash
name: name: Setup Kind Cluster

on:
  push:
    branches:
      - main 

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Install Kind
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind
      - name: Create Kind cluster
        run: |
          { time kind create cluster; } 2> kind_time.log
      - name: Set kubectl context
        run: |
          echo "Setting kubectl context"
          kubectl cluster-info
      - name: Check node count
        run: |
          echo "Checking number of nodes..."
          NODE_COUNT=$(kubectl get nodes --no-headers | wc -l)
          echo "Number of nodes in the cluster: $NODE_COUNT"
      - name: Get Kubernetes version
        run: |
          K8S_VERSION=$(kubectl version --short | grep 'Server Version' | awk '{print $3}')
          echo "Kubernetes version: $K8S_VERSION"
      - name: Show Kind cluster start time
        run: |
          echo "Kind cluster start time:"
          cat kind_time.log
```

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup

[Minikube-cluster](https://github.com/AndrewBulah/Kubernetes/actions/runs/12855184930/job/35840426481)
```bash
name: Setup Minikube Cluster

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Docker
        uses: docker/setup-buildx-action@v1

      - name: Install Minikube
        run: |
          curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          sudo install minikube-linux-amd64 /usr/local/bin/minikube
          curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
          chmod +x kubectl
          sudo install kubectl /usr/local/bin/
      - name: Start Minikube
        run: |
          { time minikube start --driver=docker; } 2> minikube_time.log
      - name: Set kubectl context
        run: |
          kubectl cluster-info
      - name: Check node count
        run: |
          echo "Checking number of nodes..."
          NODE_COUNT=$(kubectl get nodes --no-headers | wc -l)
          echo "Number of nodes in the cluster: $NODE_COUNT"
      - name: Get Kubernetes version
        run: |
          K8S_VERSION=$(kubectl version --short | grep 'Server Version' | awk '{print $3}')
          echo "Kubernetes version: $K8S_VERSION"
      - name: Show Minikube start time
        run: |
          echo "Minikube start time:"
          cat minikube_time.log
```

          