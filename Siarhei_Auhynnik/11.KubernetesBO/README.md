# 11. Kubernetes. Basic objects

## Homework Assignment 1. Nginx deployment

### Deployment verification

__Input__
```
kubectl get deployment nginx-deployment -n default --context k8s
```

__Output__
```
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   4/4     4            4           12m
```

__Input__
```
kubectl get pods -l app=nginx -n default --context k8s
```
__Output__
```
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-7d44685db9-jncm7   1/1     Running   0          2m23s
nginx-deployment-7d44685db9-sp2pp   1/1     Running   0          2m23s
nginx-deployment-7d44685db9-vxpqw   1/1     Running   0          2m23s
nginx-deployment-7d44685db9-zzv4n   1/1     Running   0          2m23s
```

__Input__
```
kubectl get svc nginx-service -n default --context k8s
```
__Output__
```
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
nginx-service   ClusterIP   10.233.33.49   <none>        80/TCP    10m
```
__Input__
```
kubectl get ingress nginx-ingress -n default --context k8s
```
__Output__
```
NAME            CLASS    HOSTS                 ADDRESS   PORTS   AGE
nginx-ingress   <none>   nginx-test.k8s-1.sa             80      11m
```

### Nginx verification

__Input__
```
kubectl run testpod --rm -it --image=busybox --restart=Never -n default --context k8s -- sh
wget -qO- http://nginx-service
```

__Output__
```
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

## Homework Assignment 2. Self-hosted runner inside k8s (optional)

__Input__
```
kubectl create secret generic github-runner-secret \
  --from-literal=GH_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
  -n default --context k8s
kubectl apply -f runner.yaml -n default --context k8s
kubectl get pods -n default --context k8s
```

__Output__
```
NAME                                READY   STATUS    RESTARTS       AGE
fail-pod                            0/1     Error     0              3d20h
github-runner-79f45ffb5c-hq95h      1/1     Running   0              86s
nginx-deployment-7d44685db9-jncm7   1/1     Running   0              97m
nginx-deployment-7d44685db9-sp2pp   1/1     Running   0              97m
nginx-deployment-7d44685db9-vxpqw   1/1     Running   0              97m
nginx-deployment-7d44685db9-zzv4n   1/1     Running   0              97m
shell                               1/1     Running   94 (18m ago)   3d22h
ubuntu-default                      1/1     Running   0              5d21h
```

## URLs

k8s-runner https://github.com/ArtegaAS/11K8S/settings/actions/runners






