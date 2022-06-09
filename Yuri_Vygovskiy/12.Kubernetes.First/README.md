## 12. Kubernetes. First deployment

### Screenshot wp
![alt text](screenshot1.png)

### Console
```log
vagrant@vagrant:~/sa.it-academy.by/Yuri_Vygovskiy/12.Kubernetes.First$ kubectl get ns
NAME              STATUS   AGE
argocd            Active   6d4h
ci-cd             Active   5d23h
default           Active   16d
ingress-nginx     Active   47h
kube-node-lease   Active   16d
kube-public       Active   16d
kube-system       Active   16d
websrv1           Active   7h28m
vagrant@vagrant:~/sa.it-academy.by/Yuri_Vygovskiy/12.Kubernetes.First$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-79fcfcf567-2jm8t   1/1     Running   0          12m
nginx-deployment-79fcfcf567-th9ps   1/1     Running   0          12m
nginx-deployment-79fcfcf567-w5bpv   1/1     Running   0          12m
webserver-7779977d7f-bhs5m          1/1     Running   0          24h
webserver-7779977d7f-cm76f          1/1     Running   0          24h
webserver-7779977d7f-psjz7          1/1     Running   0          24h
vagrant@vagrant:~/sa.it-academy.by/Yuri_Vygovskiy/12.Kubernetes.First$ kubectl get pods -n ingress-nginx
NAME                                       READY   STATUS      RESTARTS   AGE
ingress-nginx-admission-create-qhkwc       0/1     Completed   0          47h
ingress-nginx-admission-patch-w4m9q        0/1     Completed   0          47h
ingress-nginx-controller-f9d6fc8d8-cxtgf   1/1     Running     0          106s
vagrant@vagrant:~/sa.it-academy.by/Yuri_Vygovskiy/12.Kubernetes.First$ kubectl get pods -n default
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-79fcfcf567-2jm8t   1/1     Running   0          13m
nginx-deployment-79fcfcf567-th9ps   1/1     Running   0          13m
nginx-deployment-79fcfcf567-w5bpv   1/1     Running   0          13m
webserver-7779977d7f-bhs5m          1/1     Running   0          24h
webserver-7779977d7f-cm76f          1/1     Running   0          24h
webserver-7779977d7f-psjz7          1/1     Running   0          24h
vagrant@vagrant:~/sa.it-academy.by/Yuri_Vygovskiy/12.Kubernetes.First$
```
```

## k8s app.yaml:

```yaml
apiVersion: apps/v3
kind: Deployment
metadata:
  name: websrv
  labels:
    app: nginx-websrv
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-websrv
  template:
    metadata:
      labels:
        app: nginx-websrv
    spec:
      containers:
      - name: nginx-server
        image: nginx
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
        - name: persistent-storage
          mountPath: "/usr/share/nginx/html/"
        - name: config-mount
          mountPath: /usr/share/nginx/html/second_page/index.html
          subPath: index.html
      volumes:
      - name: persistent-storage
        persistentVolumeClaim:
          claimName: web-pv-claim
      - name: config-mount
        configMap:
          name: config
---
apiVersion: v1
kind: Service
metadata:
  name: web-service
  labels:
    run: web-service
spec:
#  type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: nginx-websrv
---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: nfs-pv
  labels:
    type: nfs
    name: web-nfs
spec:
  capacity:
    storage: 300Mi
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Recycle
  nfs:
    path: /mnt/IT-Academy/nfs-data/sa2-20-22/Yuri_Vygovskiy/app
    server: 192.168.37.105
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: web-pv-claim
  labels:
    app: nginx-websrv
    name: web-pv-claim
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 2Gi
  selector:
    matchLabels:
      name: web-nfs
      type: nfs

---

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-14.sa"
spec:
 rules:
    - host: app.k8s-13.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: web-service
                port:
                  number: 80
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: config
data:
  index.html: |
    <html>
          <header><title>Custom index.html</title></header>
          <body>Homework 12.Kubernetes First install made for Yuri Vygovskiy!!!</body>
    </html>
```
## Additional task 
##git runner screenshots:

![git_runner_1](runner.jpg)
![git_runner_2](runner1.jpg)
