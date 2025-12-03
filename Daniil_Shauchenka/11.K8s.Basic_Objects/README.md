```
nginx-deployment.yaml — Deployment with replicas, resources, and RollingUpdate strategy
nginx-service.yaml — ClusterIP Service
nginx-ingress.yaml — Ingress rule for the host
kind-config.yaml — kind cluster configuration with port mappings

#Сheck deployment status
kubectl get deploy nginx-deployment
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   4/4     4            4           7d21h



#Check deployment strategy and resources
kubectl describe deploy nginx-deployment
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Sun, 23 Nov 2025 22:34:24 +0300
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               4 desired | 4 updated | 4 total | 4 available | 0 unavailable
StrategyType:           RollingUpdate
...



#Check running pods
kubectl get pods -l app=nginx -o wide
NAME                                READY   STATUS    RESTARTS            AGE     IP           NODE                 NOMINATED NODE   READINESS GATES
nginx-deployment-778dfb9d78-6gnxg   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.3   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-jfc5c   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.5   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-jshzm   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.2   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-vbljp   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.6   kind-control-plane   <none>           <none>



#Check service configuration
kubectl get svc nginx-service

#Test service access inside the cluster
kubectl run tmp --rm -it --image=busybox -- wget -qO- http://nginx-service.default.svc.cluster.local

# Check Ingress configuration
kubectl get ingress nginx-ingress
kubectl describe ingress nginx-ingress
NAME                                READY   STATUS    RESTARTS            AGE     IP           NODE                 NOMINATED NODE   READINESS GATES
nginx-deployment-778dfb9d78-6gnxg   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.3   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-jfc5c   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.5   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-jshzm   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.2   kind-control-plane   <none>           <none>
nginx-deployment-778dfb9d78-vbljp   1/1     Running   3 (<invalid> ago)   7d21h   10.244.0.6   kind-control-plane   <none>           <none>


# Check ingress-nginx controller status
kubectl get pods -n ingress-nginx
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
nginx-service   ClusterIP   10.96.230.193   <none>        80/TCP    7d21h


# Test external access via Ingress (after adding host entry)
curl http://nginx-test.k8s-17.sa
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
...

#Used resources
 kubectl describe deploy nginx-deployment | grep -A5 -E "Limits|Requests"
    Limits:
      cpu:     250m
      memory:  256Mi
    Requests:
      cpu:         100m
      memory:      128Mi

```
