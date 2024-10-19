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
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/1.jpg)  
# Homework Assignment 2: Minikube Kubernetes Cluster Setup
1. Install Minikube and a hypervisor (e.g., VirtualBox/Docker) on your local machine.
  * Work with K8s VM 192.168.208.21
  * Install cubectl

2. Start a Minikube cluster with a single node.
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/09.Kubernetes/img/1.jpg) 
3. Confirm that the cluster is operational using kubectl.

# Homework Assignment 3: GitHub Actions for KinD Cluster Setup
1. Create a GitHub repository for your Kubernetes-related assignments.

2. Write a GitHub Actions workflow that sets up a KinD cluster.

3. Configure the workflow to run on every push to a specific branch.

4. Use a Docker container or GitHub-hosted runner for the workflow execution.

# Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
1. Enhance the existing GitHub repository with another Actions workflow.

2. This time, create a workflow that sets up a Minikube cluster.

3. Configure the workflow to run on pull requests to the repository.

4. Utilize appropriate GitHub Actions features to customize the workflow execution environment.