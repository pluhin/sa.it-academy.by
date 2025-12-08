## Homework Assignment 1. Nginx deployment

Create deployment of nginx service:

 - replicas: 4
 - set resources for pods
 - deployment shouldn't have any outage (service is available all time)
 - ingress rule for host name (nginx-test.k8s-<NUMBER>.sa)

```
kubectl get deployment -n test
```
```
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   4/4     4            4           4m32s
```

```
kubectl get pods -n test
```
```
NAME                     READY   STATUS    RESTARTS   AGE
nginx-58ccc7bd6f-d9m66   1/1     Running   0          47s
nginx-58ccc7bd6f-mf54v   1/1     Running   0          47s
nginx-58ccc7bd6f-nnqcr   1/1     Running   0          47s
nginx-58ccc7bd6f-txmn2   1/1     Running   0          47s
```

```
kubectl get svc -n test
```
```
NAME    TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)   AGE
nginx   ClusterIP   10.107.30.8   <none>        80/TCP    20s

```

```
kubectl get ingress -n test
```
```
NAME            CLASS   HOSTS                  ADDRESS   PORTS   AGE
nginx-ingress   nginx   nginx-test.k8s-27.sa             80      24s
```