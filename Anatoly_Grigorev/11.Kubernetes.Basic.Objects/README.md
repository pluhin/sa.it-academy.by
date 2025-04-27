# 11. Kubernetes. Basic objects

## Homework Assignment 1. Nginx deployment

```shell
root@debian10:~/nginx# kubectl get all -o wide
NAME                                    READY   STATUS              RESTARTS   AGE     IP          NODE       NOMINATED NODE   READINESS GATES
pod/nginx-deployment-54bbc5d654-ggmfw   0/1     ContainerCreating   0          20s     <none>      debian10   <none>           <none>
pod/nginx-deployment-54bbc5d654-tbxxs   0/1     ContainerCreating   0          20s     <none>      debian10   <none>           <none>
pod/nginx-deployment-54bbc5d654-vcqzw   0/1     ContainerCreating   0          20s     <none>      debian10   <none>           <none>
pod/nginx-deployment-54bbc5d654-vs4zs   0/1     ContainerCreating   0          20s     <none>      debian10   <none>           <none>
pod/ubuntu-default                      1/1     Running             0          6d18h   10.42.0.5   debian10   <none>           <none>

NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE     SELECTOR
service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP   6d18h   <none>
service/nginx-service   ClusterIP   10.43.204.146   <none>        80/TCP    13s     app=nginx

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS   IMAGES         SELECTOR
deployment.apps/nginx-deployment   0/4     4            0           20s   nginx        nginx:latest   app=nginx

NAME                                          DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES         SELECTOR
replicaset.apps/nginx-deployment-54bbc5d654   4         4         0       20s   nginx        nginx:latest   app=nginx,pod-template-hash=54bbc5d654
```

```shell 
root@debian10:~/nginx# kubectl describe ingress nginx-ingress
Name:             nginx-ingress
Labels:           <none>
Namespace:        default
Address:
Ingress Class:    nginx
Default backend:  <default>
Rules:
  Host                 Path  Backends
  ----                 ----  --------
  nginx-test.k8s-1.sa
                       /   nginx-service:80 (10.42.0.6:80,10.42.0.8:80,10.42.0.9:80 + 1 more...)
Annotations:           kubernetes.io/ingress.class: nginx
                       nginx.ingress.kubernetes.io/server-alias: nginx-test.k8s-2.sa
Events:                <none>
```

```shell 
root@debian10:~# kubectl get pods -A | grep nginx
default       nginx-deployment-54bbc5d654-ggmfw         1/1     Running   0          37m
default       nginx-deployment-54bbc5d654-tbxxs         1/1     Running   0          37m
default       nginx-deployment-54bbc5d654-vcqzw         1/1     Running   0          37m
default       nginx-deployment-54bbc5d654-vs4zs         1/1     Running   0          37m
```
