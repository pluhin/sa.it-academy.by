# 09.K8s

### Homework Assignment 1: KinD Kubernetes Cluster Setup
```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
cat <<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
EOF
kind create cluster --config kind-config.yaml --name kind-homework
kubectl get nodes
   NAME                          STATUS   ROLES           AGE   VERSION
   kind-homework-control-plane   Ready    control-plane   34h   v1.31.0
kubectl get pods -A
   NAMESPACE            NAME                                                  READY   STATUS    RESTARTS   AGE
   kube-system          coredns-6f6b679f8f-t28bm                              1/1     Running   0          34h
   kube-system          coredns-6f6b679f8f-tgxhs                              1/1     Running   0          34h
   kube-system          etcd-kind-homework-control-plane                      1/1     Running   0          34h
   kube-system          kindnet-nmsdp                                         1/1     Running   0          34h
   kube-system          kube-apiserver-kind-homework-control-plane            1/1     Running   0          34h
   kube-system          kube-controller-manager-kind-homework-control-plane   1/1     Running   0          34h
   kube-system          kube-proxy-dzgcl                                      1/1     Running   0          34h
   kube-system          kube-scheduler-kind-homework-control-plane            1/1     Running   0          34h
   local-path-storage   local-path-provisioner-57c5987fd4-cqj7p               1/1     Running   0          34h
kubectl version
Client Version: v1.36.1
Kustomize Version: v5.8.1
Server Version: v1.31.0
Warning: version difference between client (1.36) and server (1.31) exceeds the supported minor version skew of +/-1
```

### Homework Assignment 2: Minikube Kubernetes Cluster Setup
```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --driver=docker --kubernetes-version=stable
minikube status
   minikube
   type: Control Plane
   host: Running
   kubelet: Running
   apiserver: Running
   kubeconfig: Configured
kubectl get nodes
   NAME       STATUS   ROLES           AGE   VERSION
   minikube   Ready    control-plane   30h   v1.35.1
kubectl get pods -A
   NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
   kube-system   coredns-7d764666f9-8h9vj           1/1     Running   1 (5m12s ago)   30h
   kube-system   etcd-minikube                      1/1     Running   1 (5m10s ago)   30h
   kube-system   kube-apiserver-minikube            1/1     Running   1 (5m7s ago)    30h
   kube-system   kube-controller-manager-minikube   1/1     Running   1 (5m17s ago)   30h
   kube-system   kube-proxy-tkdzt                   1/1     Running   1 (5m17s ago)   30h
   kube-system   kube-scheduler-minikube            1/1     Running   1 (5m17s ago)   30h
   kube-system   storage-provisioner                1/1     Running   3 (5m5s ago)    30h
kubectl version
   Client Version: v1.36.1
   Kustomize Version: v5.8.1
   Server Version: v1.35.1
```

# Homework Assignment 3-4
|     Параметр      |	KinD Cluster  | Minikube Cluster |
|-------------------|-----------------|------------------|
| Количество узлов  | 1 control-plane |  1 control-plane |
|-------------------|-----------------|------------------|
| Версия Kubernetes |	  v1.30.0     |      v1.27.2     |
|-------------------|-----------------|------------------|
| Время запуска     | 	    52s	      |       1m 10s     |
|-------------------|-----------------|------------------|