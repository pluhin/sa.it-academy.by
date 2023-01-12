# 12.K8s.Security

## Manifest app.yaml
---yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: webserver-nginx
  name: test-config
data:
  index.php: |
    <?php
    $aliashost = $_SERVER['SERVER_NAME'];
    $containername = gethostname();
    echo "<h1> Hello from K3S! </h1>";
    echo "<h2> This is {$aliashost} </h2>";
    echo "<h2> Containername is {$containername} </h2>";
    echo "<h3> Kind regards by Sergei Sechkov </h3>";
    ?>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  namespace: webserver-nginx
  name: webserver
  labels:
    app: simple-web
spec:
  replicas: 1
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: "33%"
      maxUnavailable: "33%"
  selector:
    matchLabels:
      app: simple-web
  template:
    metadata:
      labels:
        app: simple-web
    spec:
      containers:
      - name: nginx
        image: eboraas/apache-php
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
        - name: nginx
          mountPath: /var/www/html
        - name: mount-ssh
          mountPath: "/root/.ssh"          
      volumes:
      - name: nginx
        configMap:
          name: test-config
      - name: mount-ssh
        secret:
          secretName: mount-ssh
          defaultMode: 0600 
---
apiVersion: v1
kind: Service
metadata:
  namespace: webserver-nginx
  name: simple-web
  labels:
    run: simple-web
spec:
 #type: LoadBalancer
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: simple-web
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  namespace: webserver-nginx
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-15.sa"
spec:
  rules:
    - host: nginx.k8s-15.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: simple-web
                port:
                  number: 80
---yaml

## Manifest saled_secret
---yaml
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: mount-ssh
  namespace: webserver-nginx
spec:
  encryptedData:
    id_rsa: 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
    id_rsa.pub: AgBvZytGyFO3gt96UuiODAxPeTXSznbMyLBUYyec7GsCZBXUJo/q0a3bnoi0Nxlry1x8pci14zsiOemwu9EXnzA+ooXP60rfOOlavW4Fr/DKVAF/YOpSooB0cYu1rIxE+eT67flXyQpEYcefNvBulKub+VsPUmQ58JRWfFLst0kH3iAmgPMBTgTCstLBIZkzxSVAC6XhK+K8j+AHv6r4QoS0RrH5K7SDUWb6htJvhMp2VIHQVSloA2jrdzkIYPnfO5jx6En1JEvy9wuEIG46xad2ChTYUVEQZc0u1ED4Jz+EYY+0eBUWarFQBSRIiEleEzpJDqgP/4BBDczcgM69tXIiyirXXWnl8WUwBTooId6eimHr2Crd2SJiP+sTTiy3rpTr8ZSVAGHv2KWftZgRkEbYyb3OOu+b+J8tpGEJ5zmgiiD8yDZx7j6n+1nPG/2HIX0DawKbAZ9pFSedXJFU+vf6ZxGhqSm4ZdiqPjG9scBTCxP3mOLQy+z2a8QBD0utsJtNGpqkH/XTcFvnDWPgIoAOFYpCyBbq2LogFJmaUdBdJieMpBcLaFWRxozuARMPYrwWkRB49zBJN2PpMwLvTOo4HVyP7DzfD+8u2b2N6smE43dkTb4Db5Bn7+AdFV3dWODI7i4F0EmasxOH89hOj7YaXnokUwoZ1dUcmZp57VDGs5AkVkye5Be18HUWSKdSbh/nl3DHlxroFqHSUB+4Hc+aAs+AyENWCIGhzxmIwj1/ezgrk9YkbZO/Npm6xciT5YbnIlaYGiQNOjK1ruvNJyau2GPky5VSqXERYpTKUQz2by+8tpWAdfKuETEZoK8YVnUafEzL6hmoYammrOYifWCmzGbVdN8P64sUXLKAi7E+o8mx1R9UV/6DzqgQSz/NWQUNb3KDuIw0yP4mOsWnVLGSAZGRGxI1v66WSVwrvas6KZZBXmz7Sud706+Vs+MZtaOZei+2WreKwvBa8hTXvsfGcxvZulFnwWNp9k7fJ2TVrSyDOwwNQAEoOX+AyP7J2Erd8HLwTNXHdqSv1WLaaQiqhCvhoSEKb0t0Up5e/eRjFv1xkrUhY8TFk8+odxoffwAFtfq/A6NCSQUEj97fi4zFC6e7oQuHH73Oq6KLf+GjCYYuTC806xMkYQjlDRn9rd0Wjd0NcJ5OyTqtBXypg/un6RDLQ7tL02i0Eu8c+Y27ViWUkVkVeNC/z0HwynFkdlUN1c0HoBgtu4VdzD+PhawGNo8WL9h5Vj94UaDUZHu58/rosKAZ9zLgFc8lGaSXVZri5bY72wlRspdZ09n4BlEKzsKfErUFMbjr36dbsVCpjRmfcgPxvdi0AJLsmYm3coZVXK3Z/PfqKzLHy2FljhQmpuJrB5w9eHVi2fZs3WgjAxAkSM10S3lEA0/9QTtDaResoHKnNVcyeJ/r7FxxDCfykzx8860qaf0Syxcjsz4Rf5Eilqi4cwLvo8U=
  template:
    metadata:
      creationTimestamp: null
      name: mount-ssh
      namespace: webserver-nginx
---

## Screenshots
![mount ssh on host](https://github.com/frame0310/sa.it-academy.by/raw/md-sa2-22-22/12.K8s.Sec/ssh-host.png)
![mount sealed_secret.yaml](https://github.com/frame0310/sa.it-academy.by/raw/md-sa2-22-22/12.K8s.Sec/Sealedsecret.png)
![check hostname](https://github.com/frame0310/sa.it-academy.by/raw/md-sa2-22-22/12.K8s.Sec/hello_check.png)