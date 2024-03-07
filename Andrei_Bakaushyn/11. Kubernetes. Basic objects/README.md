```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-project
spec:
  #type: NodePort
  ports:
    - port: 80
  selector:
    app: nginx-project
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-project
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
       maxSurge: 25%
       maxUnavailable: 25% 
  selector:
    matchLabels:
      app: nginx-project
  template:
    metadata:
      labels:
        app: nginx-project
    spec:
      containers:
        - name: nginx
          image: nginx:1.17.3
          ports:
            - containerPort: 80
          resources:
            requests:
              memory: "64Mi"
              cpu: "250m"
            limits:
              memory: "128Mi"
              cpu: "500m"

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-777.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-777.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-project
                port:
                  number: 80
 
```
```bash
skefil@skefil:~/ansible-playbooks$ kubectl apply -f nginx-deployment.yaml
service/nginx-project created
deployment.apps/nginx-project created
ingress.networking.k8s.io/ingress-sa-nginx created
skefil@skefil:~/ansible-playbooks$ kubectl get svc nginx-project
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
nginx-project   ClusterIP   10.233.47.96   <none>        80/TCP    11m
skefil@skefil:~/ansible-playbooks$ kubectl get deployments nginx-project
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
nginx-project   4/4     4            4           11m
skefil@skefil:~/ansible-playbooks$ kubectl get pods -l app=nginx-project
NAME                             READY   STATUS    RESTARTS   AGE
nginx-project-647f459647-986df   1/1     Running   0          11m
nginx-project-647f459647-fb6ll   1/1     Running   0          11m
nginx-project-647f459647-w6249   1/1     Running   0          11m
nginx-project-647f459647-zsr4q   1/1     Running   0          11m
skefil@skefil:~/ansible-playbooks$ kubectl get pods -l app=nginx-project
NAME                             READY   STATUS    RESTARTS   AGE
nginx-project-647f459647-986df   1/1     Running   0          11m
nginx-project-647f459647-fb6ll   1/1     Running   0          11m
nginx-project-647f459647-w6249   1/1     Running   0          11m
nginx-project-647f459647-zsr4q   1/1     Running   0          11m
skefil@skefil:~/ansible-playbooks$ kubectl get ingress ingress-sa-nginx
NAME               CLASS   HOSTS              ADDRESS   PORTS   AGE
ingress-sa-nginx   nginx   nginx.k8s-777.sa             80      11m
skefil@skefil:~/ansible-playbooks$ kubectl get svc -n ingress-nginx
No resources found in ingress-nginx namespace.
skefil@skefil:~/ansible-playbooks$ ^C
skefil@skefil:~/ansible-playbooks$ kubectl get svc -n default
NAME                                               TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
kubernetes                                         ClusterIP      10.233.0.1      <none>        443/TCP                      19d
nginx-ingress-ingress-nginx-controller             LoadBalancer   10.233.10.238   <pending>     80:32669/TCP,443:32645/TCP   25m
nginx-ingress-ingress-nginx-controller-admission   ClusterIP      10.233.12.0     <none>        443/TCP                      25m
nginx-project                                      ClusterIP      10.233.47.96    <none>        80/TCP                       60m

```
```bash
root@node1:~# curl http://nginx.k8s-777.sa:32669
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
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
