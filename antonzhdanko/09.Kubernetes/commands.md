# Command history

## Tool installation and versions

```bash
brew install kind minikube
kind version
minikube version --short
kubectl version --client
docker info --format '{{.ServerVersion}}'
```

Observed versions:

```text
KinD: v0.32.0
Minikube: v1.38.1
kubectl client: v1.34.1
Docker Engine: 29.4.2
```

## KinD

```bash
kind create cluster \
  --config kind-config.yaml \
  --image kindest/node:v1.36.1@sha256:3489c7674813ba5d8b1a9977baea8a6e553784dab7b84759d1014dbd78f7ebd5 \
  --wait 5m
kubectl wait --for=condition=Ready nodes --all --timeout=180s
kubectl get nodes --output=wide
kubectl get pods --all-namespaces
kind delete cluster --name homework
```

## Minikube

```bash
minikube start \
  --driver=docker \
  --nodes=1 \
  --kubernetes-version=v1.35.1 \
  --wait=all \
  --wait-timeout=6m
kubectl wait --for=condition=Ready nodes --all --timeout=180s
kubectl get nodes --output=wide
kubectl get pods --all-namespaces
minikube delete --all --purge
```

The same commands are executed by GitHub Actions. The CI runs are the source of
the reproducible timing and cluster output documented in `README.md`.
