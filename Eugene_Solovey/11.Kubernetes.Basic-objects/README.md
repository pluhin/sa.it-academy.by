# 11.Kubernetes.Basic-objects

## Report

### Curl http

```bash
curl http://nginx-test.k8s-16.sa
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
</head>
<body>
<h1>Welcome to homework page 11<h1>
</body>
</html>
```

### Service

```bash
kubectl get service -A
NAMESPACE       NAME                                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
default         kubernetes                           ClusterIP   10.43.0.1       <none>        443/TCP                      30h
kube-system     kube-dns                             ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP       30h
kube-system     metrics-server                       ClusterIP   10.43.144.214   <none>        443/TCP                      30h
ingress-nginx   ingress-nginx-controller             NodePort    10.43.14.43     <none>        80:30001/TCP,443:31961/TCP   98m
ingress-nginx   ingress-nginx-controller-admission   ClusterIP   10.43.110.59    <none>        443/TCP                      98m
default         simple-web-service                   ClusterIP   10.43.95.85     <none>        80/TCP                       11m
default         nginx-service                        ClusterIP   10.43.104.54    <none>        80/TCP                       2m38s
```

### Ingress

```bash
kubectl get ing -A
NAMESPACE   NAME         CLASS    HOSTS                  ADDRESS          PORTS   AGE
default     ingress-sa   <none>   nginx-test.k8s-16.sa   192.168.203.16   80      7m40s
```
