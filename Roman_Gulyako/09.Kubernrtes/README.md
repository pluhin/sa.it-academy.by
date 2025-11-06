## Homework Assignment 1: KinD Kubernetes Cluster Setup
1. Install Docker (established in previous lessons)
2. Install KinD
	```bash
	[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.30.0/kind-linux-amd64
	chmod +x ./kind
	sudo mv ./kind /usr/local/bin/kind
	kind --version
	```
3. Create a KinD cluster
	```bash
	kind create cluster --name test-cluster
	```
4. Install `kubectl`
	```bash
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x kubectl
	sudo mv kubectl /usr/local/bin/
	kubectl version --client
	```
5. Verify that the cluster is up and running
	```bash
	kind get clusters
	kubectl cluster-info --context kind-test-cluster
	kubectl get nodes
	```

## Homework Assignment 2: Minikube Kubernetes Cluster Setup
1. Install Docker (established in previous lessons)
2. Install Minikube
	```bash
	curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
	```
3. Start a Minikube cluster
	```bash
	minikube start
	```
4. Confirm that the cluster is operational
	```bash
	kubectl get po -A
	kubectl get nodes
	```

## Homework Assignment 3: GitHub Actions for KinD Cluster Setup
GitHub Action workflow: `kind-cluster.yaml`

**Cluster Metrics:**
- Number of nodes: 1
- Kubernetes version: v1.34.0
- Creation time: 40 seconds

## Homework Assignment 4: GitHub Actions for Minikube Cluster Setup
GitHub Action workflow: `minikube-cluster.yaml`

**Cluster Metrics:**
- Number of nodes: 1
- Kubernetes version: v1.34.0
- Creation time: 82 seconds

GitHub Repository with workflows: https://github.com/romangulyako/k8s-homework