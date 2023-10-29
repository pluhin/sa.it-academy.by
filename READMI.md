
# KinD Kubernetes Cluster Setup

```
   21  > cluster-config.yaml
   22  nano cluster-config.yaml
   23  kind create cluster --config cluster-config.yaml
   24  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
   25  chmod +x ./kind
   26  sudo mv ./kind /usr/local/bin/kind
   34  curl -LO https://dl.k8s.io/release/v1.28.3/bin/linux/amd64/kubectl
   35  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   36  kubectl version --client
   37  kind create cluster --name test-cluster --config cluster-config.yaml
   30  kubectl cluster-info --context kind-test-cluster
   35  kubectl cluster-info
```
 
# Minikube Kubernetes Cluster Setup

```
   45 curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   46 sudo install minikube-linux-amd64 /usr/local/bin/minikube
   47 wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
   48 sudo dpkg -i virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
   49 minikube start
   50 kubectl cluster-info
 ```

# GitHub Actions for KinD and minikub Cluster Setup

```
   60  mkdir -p .github/workflows/
   61  cd .github/workflows/
   64  nano kind-cluster.yaml
   65  nano minikub-cluster.yml
   67  nano kind-cluster.yml

  159  git remote add origin git@github.com:yurymn/09.Kubernetes.git
  163  ll .github/workflows/
  164  git add --all
  167  git commit -m "Cluster_setup_commit2"
  168  git push -u origin main
```

   Kind Cluster Setup #1: Commit 2d9b470 pushed by yurymn main	58s, 1 node

   Minikube Cluster Setup #1: Commit 2d9b470 pushed by yurymn main 1m 13s, 1 node
