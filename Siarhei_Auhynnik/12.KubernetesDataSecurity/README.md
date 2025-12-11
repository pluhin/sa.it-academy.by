# 12. Kubernetes. Data. Security

## Install Kubectl


__Input__

```
 sudo snap install helm --classic
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm install sealed-secrets sealed-secrets/sealed-secrets   -n kube-system   --create-namespace   --kube-context=k8s
```

## Create and deploy secret
```
kubectl apply -f nginx-pass.yaml
kubeseal   --controller-name=sealed-secrets   --controller-namespace=kube-system   --context=k8s   --format=yaml < nginx-pass.yaml > nginx-pass-sealed.yaml
kubectl apply -f nginx-pass-sealed.yaml --context=k8s
kubectl get pods -n kube-system --context=k8s | grep sealed
```

__Output__

```
sealed-secrets-574cb47d88-wtmwt            1/1     Running   0          1m
```

__Input__
```
kubectl get secret nginx-passwords -n default --context k8s
```

__Output___
```
NAME              TYPE     DATA   AGE
nginx-passwords   Opaque   2      13m
```
__Input__
```
kubectl describe secret nginx-passwords -n default --context k8s
```

__Output__
```
Name:         nginx-passwords
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
admin-password:  14 bytes
root-password:   13 bytes
```
__Input__
```
kubectl get pods -n default --context k8s -o wide | grep nginx
```
__Output__
```
nginx-deployment-688bb49cf4-24kfc   2/2     Running   0               41s     10.233.75.28     node2   <none>           <none>
nginx-deployment-688bb49cf4-b5x8v   2/2     Running   0               43s     10.233.75.27     node2   <none>           <none>
nginx-deployment-688bb49cf4-sw5s9   2/2     Running   0               41s     10.233.102.143   node1   <none>           <none>
nginx-deployment-688bb49cf4-vd2qd   2/2     Running   0               43s     10.233.102.142   node1   <none>           <none>
```
__Input__
```
kubectl exec -it nginx-deployment-688bb49cf4-24kfc -n default --context k8s -c nginx -- ls /etc/nginx/secret
```
__Output__
```
admin-password  root-password
```
## Check Nginx H1 Output

__Input__
```
kubectl exec -it nginx-deployment-688bb49cf4-24kfc -n default --context=k8s -- curl -s http://127.0.0.1/index.php
```
__Output __
```
Defaulted container "nginx" out of: nginx, php-fpm
<h1>Pod: nginx-deployment-688bb49cf4-24kfc</h1><h1>Node: node2</h1>
```
