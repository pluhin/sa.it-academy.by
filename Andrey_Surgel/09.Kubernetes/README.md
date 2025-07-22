# HA1
```bash
    1  sudo apt-get update
    2  sudo apt-get install ca-certificates curl
    3  sudo install -m 0755 -d /etc/apt/keyrings
    4  sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
    5  sudo chmod a+r /etc/apt/keyrings/docker.asc
    6  echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    7  sudo apt-get update
    8  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    9  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.29.0/kind-linux-amd64
   10  ls
   11  mv kind /usr/local/bin/
   12  chmod +x /usr/local/bin/kind
   13  kind
   14  kind create cluster
   15  curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
   16  curl -LO https://dl.k8s.io/release/v1.33.0/bin/linux/amd64/kubectl
   17  chmod +x ./kubectl
   18  sudo mv ./kubectl /usr/local/bin/kubectl
   19  kubectl version --client
   20  kubectl get pods
   21  kubectl get nodes
   22  kubectl get nodes -o wide
   23  history
```
# HA2

```bash
   27  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
   28  sudo mkdir -p /usr/local/bin/
   29  sudo install minikube /usr/local/bin/
   30  minikube start --vm-driver=docker
   31  minikube start --vm-driver=docker --force
   32  minikube status
   33  kubectl get pods
   34  kubectl get nodes
```

# HA3

-   how many nodes they have: 1
-   which latest version of Kubernetes they are using: 1.32.0
-   how long they spin up (you can provide just timing): 43

# HA4

-   how many nodes they have: 1
-   which latest version of Kubernetes they are using: 1.32.0
-   how long they spin up (you can provide just timing): 1m 36s