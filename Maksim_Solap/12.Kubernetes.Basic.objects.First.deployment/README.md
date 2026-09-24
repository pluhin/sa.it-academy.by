# 12. Kubernetes. Basic objects. First deployment
## 📁 Repository Structure
```text
12.Kubernetes.Basic.objects.First.deployment/
├── README.md               
├── nginx-deployment.yaml   # Nginx Deployment (4 replicas, resource limits, RollingUpdate) & Service
└── nginx-istio.yaml        # Istio Gateway and VirtualService configuration
```
## Homework Assignment 1. Nginx deployment

### Step 1: Created the nginx-deployment.yaml manifest:
```kubectl apply -f nginx-deployment.yaml --context k8s
```

```
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
```
```
        resources:
          requests:
            memory: "64Mi"
            cpu: "100m"
          limits:
            memory: "128Mi"
            cpu: "200m"
```
---
### Step 2: Create the Istio manifest (nginx-istio.yaml)
```
install istio
curl -L https://istio.io/downloadIstio | sh -  
cd istio-1.31.1/
sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl
istioctl version
istioctl x precheck --context k8s
istioctl version --context k8s
istioctl x precheck --context k8s
kubectl create namespace istio-system --context k8s 2>/dev/null || true
istioctl install -y --set profile=demo --context k8s
kubectl label ns default istio-injection=enabled --overwrite --context k8s
vi istio-gw-vs.yaml
kubectl apply -f istio-gw-vs.yaml --context k8s
sudo vi /etc/hosts
curl app.k8s-7.sa
kubectl delete -f istio-gw-vs.yaml --context k8s

kubectl apply -f nginx-istio.yaml --context k8s
curl nginx-test.k8s-7.sa
```
<img width="975" height="373" alt="image" src="https://github.com/user-attachments/assets/6d7f07d6-41af-4afa-a366-7619b71fd331" />

<img width="975" height="346" alt="image" src="https://github.com/user-attachments/assets/de9cee73-9807-4c19-a489-e45f0ddc6d55" />


---

