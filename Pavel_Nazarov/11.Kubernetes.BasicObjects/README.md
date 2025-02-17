# 11.Kubernetes.BasicObjects
## Homework Assignment 1. Nginx deployment
**Create deployment of nginx service:**

- [nginx_namespace.yaml](nginx_namespace.yaml)
- [nginx_deployment.yaml](nginx_deployment.yaml)

```bash
➜  11.Kubernetes.BasicObjects kubectl apply -f nginx_namespace.yaml 
namespace/nginx-app created

➜  11.Kubernetes.BasicObjects kubectl apply -f nginx_deployment.yaml -n nginx-app
deployment.apps/nginx created
service/nginx-service created
ingress.networking.k8s.io/nginx-ingress created

➜  11.Kubernetes.BasicObjects kubectl get pods -n nginx-app                      
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7bf8968d4c-8xv27   1/1     Running   0          5m53s
nginx-7bf8968d4c-g4pnw   1/1     Running   0          5m53s
nginx-7bf8968d4c-hssmk   1/1     Running   0          5m53s
nginx-7bf8968d4c-mvnlm   1/1     Running   0          5m53s
```