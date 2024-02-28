# Homework Assignment 1. Config maps and secrets

## Add index.php page as config map

```yaml

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
        volumeMounts:
        - mountPath: /usr/share/nginx/html/
          name: index
        - mountPath: /root/.ssh/
          name:  ssh-key

      initContainers:
      - name: test
        image: nginx:1.17.3
        command: ["sh", "-c", 'sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
        volumeMounts:
        - name: test-config-mount
          mountPath: /tmp/index.html
          subPath: index.html
          readOnly: false
        - mountPath: /usr/share/nginx/html/
          name: index
        - mountPath: /root/.ssh/
          name: ssh-key
      volumes:
      - name: test-config-mount
        configMap:
          name: nginx-config
      - name: index
        emptyDir: {}
      - name: ssh-key
        secret:
          secretName: secret-ssh-auth
 
---
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
 apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-14.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-13.sa
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

![cluster pods](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/12.%20Kubernetes.%20Data.%20Security/get_pods.png)
![html with hostnames of pods](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/12.%20Kubernetes.%20Data.%20Security/html_pods.png)

## sealsecret:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret-ssh-auth
type: Opaque
data:
  authorized_keys: |
        c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSURpeGNQV016a2gzWm56MlFzVUYx
        SUk3MXNOZmJmenJzYkpqbWJ3MFZkZG0gTXlzbGl2ZXRzTlZAT0lCSUFUTy1pbmV0LTA1Cg==

```
![ssh key in pod](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/12.%20Kubernetes.%20Data.%20Security/key%20poda.png)