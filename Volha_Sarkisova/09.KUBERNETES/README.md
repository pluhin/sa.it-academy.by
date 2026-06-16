<img width="603" height="613" alt="Clip2net_260611082812" src="https://github.com/user-attachments/assets/3e253f1a-6324-458e-991d-b68e1c31f9bf" />

```bash
## Homework Assignment 1: KinD Kubernetes Cluster Setup
#Install Docker and KinD on your local machine.
#Create a KinD cluster with a single control plane node.
#Verify that the cluster is up and running using .kubectl
 
 1822  cd 09.K8s.Install/
 1823  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/min
ikube-linux-amd64
 1824  docker --version
 1825  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
 1826  chmod +x ./kind
 1827  sudo mv ./kind /usr/local/bin/kind
 1828  kind version
 1829  nano kind-config.yaml
 1830  kind create cluster --config kind-config.yaml
 1831  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/s
table.txt)/bin/linux/amd64/kubectl"
 1832  chmod +x kubectl
 1833  sudo mv kubectl /usr/local/bin/
 1834  kubectl cluster-info
 1835  kubectl get nodes
 
		NAME                             STATUS   ROLES           AGE     VERSION
		homework-cluster-control-plane   Ready    control-plane   2m48s   v1.32.2
	
 1836  kubectl get pods -A
 1837  kubectl version 
 
##Homework Assignment 2: Minikube Kubernetes Cluster Setup
#Install Minikube and a hypervisor (e.g., VirtualBox/Docker) on your local machine.
#Start a Minikube cluster with a single node.
#Confirm that the cluster is operational using .kubectl
 
 
 1838  curl -fsSL https://get.docker.com -o get-docker.sh
 1839  sudo sh get-docker.sh
 1840  sudo usermod -aG docker $USER
 1841  newgrp docker
 1842  curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
 1843  chmod +x minikube-linux-amd64
 1844  sudo mv minikube-linux-amd64 /usr/local/bin/minikube
 1845  minikube version
 
		minikube version: v1.38.1
		commit: c93a4cb9311efc66b90d33ea03f75f2c4120e9b0

 1846  minikube start --driver=docker
 1847  minikube status
 
		minikube
		type: Control Plane
		host: Running
		kubelet: Running
		apiserver: Running
		kubeconfig: Configured

 1848  kubectl cluster-info
 1849  kubectl get nodes
 
		NAME       STATUS   ROLES           AGE   VERSION
		minikube   Ready    control-plane   20m   v1.28.0

 1850  kubectl get pods -A
 1851  minikube addons lists
 1852  minikube addons list
 1853  minikube addons enable dashboard
 1854  minikube addons enable metrics-server
 1855  minikube kubectl -- get pods -A
 1856  minikube kubectl -- proxy --address='0.0.0.0' --disable-filter=true

##Homework Assignment 3: GitHub Actions for KinD Cluster Setup
#Create a GitHub repository for your Kubernetes-related assignments.<img width="1853" height="621" alt="runner 1" src="https://github.com/user-attachments/assets/6b7e6beb-c9f8-42ea-9b10-c59bb0a7c20c" />

#Write a GitHub Actions workflow that sets up a KinD cluster.
#Configure the workflow to run on every push to a specific branch.
#Use a Docker container or GitHub-hosted runner for the workflow execution.
```

<img width="1853" height="621" alt="runner 1" src="https://github.com/user-attachments/assets/15f4435c-a910-466e-afbf-341f74718603" />
<img width="954" height="958" alt="runner 2" src="https://github.com/user-attachments/assets/4eeacd3d-0603-43cf-b344-25048ab04d9c" />

```bash
##Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
#Enhance the existing GitHub repository with another Actions workflow.
#This time, create a workflow that sets up a Minikube cluster.
#Configure the workflow to run on pull requests to the repository.
#Utilize appropriate GitHub Actions features to customize the workflow execution environment.
```

<img width="1854" height="795" alt="minikube 2" src="https://github.com/user-attachments/assets/4d8f9daf-f426-48d6-880a-c61e9f75d4e9" />
<img width="894" height="431" alt="minikube 1" src="https://github.com/user-attachments/assets/76a1f184-39cd-4fe3-aba0-4592c76d81f4" />
