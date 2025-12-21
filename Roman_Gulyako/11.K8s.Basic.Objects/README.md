# Homework Assignment 1: Nginx Deployment

## Overview
This assignment deploys an **Nginx service** in Kubernetes using Deployment, Service, and Ingress.

## Requirements
- 4 replicas of Nginx
- Resource requests and limits for pods
- Zero downtime during updates
- Ingress rule for hostname: `nginx-test.k8s-<NUMBER>.sa`

## Implementation
- **Deployment**: 4 replicas of `nginx:1.25`, with CPU/memory requests and limits.  
  RollingUpdate strategy (`maxUnavailable=0`, `maxSurge=1`) ensures no downtime.  
- **Service**: ClusterIP service exposing port 80.  
- **Ingress**: Routes traffic to `nginx-service` via hostnames `nginx-test.k8s-5.sa` and `nginx-test.k8s-6.sa`.

## Files
- **`nginx-server.yaml`** — Kubernetes manifest (Deployment, Service, Ingress)

## How to Run
```bash
kubectl apply -f nginx-server.yaml
kubectl get pods -l app=nginx
kubectl get ingress nginx-ingress
```

# Homework Assignment 2: Self-hosted GitHub Runner in Kubernetes

## Overview
This assignment deploys a **self-hosted GitHub Actions runner** inside a Kubernetes cluster.  
The runner connects to a GitHub repository and executes CI/CD jobs directly in the cluster.

## Files
- **github-runner.yaml** — Deployment manifest for the runner Pod

## Implementation
- **Secret** stores GitHub repository URL and registration token.
- **Deployment** runs one Pod using the `myoung34/github-runner` image.
- Environment variables configure runner name, labels, and working directory.
- Runner registers with GitHub and stays available as long as the Pod is running.

## How to Run
```bash
kubectl create secret generic github-runner-secret \
--from-literal=GH_URL=https://github.com/<GH_USERNAME>/<GH_REPO> \
--from-literal=GH_TOKEN=<YOUR_SECRET_TOKEN>
kubectl apply -f github-runner.yaml
kubectl get pods -l app=github-runner
kubectl logs -f deploy/github-runner
```
