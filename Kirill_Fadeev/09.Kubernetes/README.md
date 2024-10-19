# Homework Assignment 1: KinD Kubernetes Cluster Setup
1. Install Docker and KinD on your local machine.
  * Docker
```bash
fadeev@kirill:~$ docker --version
Docker version 27.3.1, build ce12230
```
  * KinD
```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```
2. Create a KinD cluster with a single control plane node.
```bash
kind create cluster --name fadeev
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/1.jpg)  
3. Verify that the cluster is up and running using kubectl.
  * Install kubectl
```bash
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
Client Version: v1.31.1
Kustomize Version: v5.4.2
```
  * Verify KinD
```bash
kubectl cluster-info --context kind-fadeev
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/12.jpg)  
# Homework Assignment 2: Minikube Kubernetes Cluster Setup
1. Install Minikube and a hypervisor (e.g., VirtualBox/Docker) on your local machine.
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```
2. Start a Minikube cluster with a single node.  
```bash
minikube start --driver=docker --force
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/3.jpg)  
3. Confirm that the cluster is operational using kubectl.  
```bash
kubectl get pods -A
kubectl get svc -A
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/4.jpg) 
 ```bash
 minikube dashbord --url
 ssh -L 40203:127.0.0.1:40203 fadeev@192.168.50.1 ##On host machine
 ```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/5.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/6.jpg)  
# Homework Assignment 3: GitHub Actions for KinD Cluster Setup
1. Create a GitHub repository for your Kubernetes-related assignments.
  * https://github.com/Pro100chok91/Kubegit
2. Write a GitHub Actions workflow that sets up a KinD cluster.
```bash
name: Create KinD Cluster

on:
 push: 
  branches: main

jobs:
  create-cluster:
    runs-on: ubuntu-latest
    steps:
      - name: Create k8s Kind Cluster
        uses: helm/kind-action@v1
      - name: Get cluster info
        run: |
          kubectl cluster-info
          kubectl get nodes -A 
```
3. Configure the workflow to run on every push to a specific branch.
```bash
on:
 push: 
  branches: main
```
4. Use a Docker container or GitHub-hosted runner for the workflow execution.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/7.jpg)  
# Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
1. Enhance the existing GitHub repository with another Actions workflow.
  * https://github.com/Pro100chok91/Kubegit
2. This time, create a workflow that sets up a Minikube cluster.
```bash
name: Create minikube cluster
on:
  - pull_request
jobs:
  create-cluster:
    runs-on: ubuntu-latest
    steps:
      - name: start minikube
        id: minikube
        uses: medyagh/setup-minikube@latest
      - name: Get cluster info
        run: |
          kubectl get pods -A
          kubectl get svc -A
          kubectl get nodes -A
```
3. Configure the workflow to run on pull requests to the repository.
```bash
on:
  - pull_request
```
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/11.jpg)  
4. Utilize appropriate GitHub Actions features to customize the workflow execution environment.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/10.jpg)  

# Please check in the last two assignments:

## How many nodes they have
  * KinD - one node "chart-testing-control-plane"
  * Mnicube - one node "minicube"
## Which latest version of Kubernetes they are using
  * KinD - 1.29.2
  * Minikube - 1.31.0
## How long they spin up (you can provide just timing)
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/8.jpg)  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/9.jpg)  