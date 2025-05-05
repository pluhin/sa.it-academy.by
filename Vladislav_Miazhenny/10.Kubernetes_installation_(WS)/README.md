
## Homework Assignment 1. K8s Installation

#### Install kubectl for local run
```bash
courses@courses:~$ kubectl version
Client Version: v1.32.3
Kustomize Version: v5.5.0
Server Version: v1.32.3+k3s1
```

Install k9s to maintain cluster
```bash
courses@courses:~$ k9s version
 ____  __ ________       
|    |/  /   __   \______
|       /\____    /  ___/
|    \   \  /    /\___  \
|____|\__ \/____//____  /
         \/           \/ 

Version:    v0.50.3
Commit:     594c2c6e4c8dce30e5553e84e4a16a3e55e36066
Date:       2025-04-14T00:28:19Z
```

Make print-screen of k9s with pods in all namespaces
`k3s.png`
`k8s.png`


#### Kubernetes host

Deploy shell pod in default namespace which you can you use for internal checks inside the cluster
```bash
kubectl apply -f pod.yaml
```

#### Monitoring of cluster:
check_pods_v1.yaml

https://github.com/infinity-step/10_project/actions/workflows/check_pods_v1.yaml