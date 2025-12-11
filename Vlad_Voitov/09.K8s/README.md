
Repository with Actions files (Actions files in branch hw4-minikube) --- https://github.com/neroseccess/09.K8s/tree/hw4-minikube


# 09.K8s — Kubernetes (Kubespray / KinD / Minikube / GitHub Actions)

## HW0 — Kubernetes with Kubespray
```bash
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray

python3 -m venv .venv
source .venv/bin/activate
python -m pip install -U pip setuptools wheel
pip install -r requirements.txt

cp -rfp inventory/sample inventory/myclaster
nano inventory/myclaster/inventory.ini

ansible-playbook -i inventory/myclaster/inventory.ini cluster.yml -u root --ask-pass
```

Проверка (на control-plane):
```bash
kubectl get nodes -o wide
kubectl get pods -A
```

## HW1 — KinD cluster
```bash
curl -Lo /usr/local/bin/kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
chmod +x /usr/local/bin/kind

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -m 0755 kubectl /usr/local/bin/kubectl

kind create cluster --name hw1
kubectl cluster-info --context kind-hw1
kubectl get nodes
kubectl get pods -A
```

## HW2 — Minikube cluster
```bash
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
install -m 0755 minikube-linux-amd64 /usr/local/bin/minikube

minikube start
kubectl get nodes
kubectl get pods -A
```

## HW3 — GitHub Actions (KinD)
Workflow: `.github/workflows/hw-kind.yml`

Проверки в job:
```bash
kind create cluster --name hw1
kubectl cluster-info
kubectl get nodes
kubectl version --short
```

## HW4 — GitHub Actions (Minikube)
Workflow: `.github/workflows/hw-minikube.yml`

Проверки в job:
```bash
minikube start
kubectl cluster-info
kubectl get nodes
kubectl version --short
```
