## app.yaml

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-html
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>Welcome to nginx!</title>
    </head>
    <body>
      <h1>Hello from HTML file!</h1>
      <p>Pod: HOSTNAME</p>
    </body>
    </html>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-nginx
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      initContainers:
        - name: init-nginx-container
          image: nginx:latest
          volumeMounts:
            - name: index-html-configmap
              mountPath: /tmp
            - name: updated-nginx-html
              mountPath: /usr/share/nginx/html
          command: ["sh", "-c", 'sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
      containers:
      - name: nginx
        image: nginx:latest
        ports:
          - containerPort: 80
        resources:
          requests:
            cpu: 51m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
          - name: updated-nginx-html
            mountPath: /usr/share/nginx/html
          - name: ssh-volume
            mountPath: /root/.ssh
      volumes:
        - name: index-html-configmap
          configMap:
            name: nginx-html
        - name: updated-nginx-html
          emptyDir: {}
        - name: ssh-volume
          secret:
            secretName: root-ssh-keys
---
apiVersion: v1
kind: Service
metadata:
  name: app-service
  labels:
    run: app-service
spec:
  ports:
  - protocol: TCP
    port: 80
  selector:
    app: nginx
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa-nginx
  annotations:
    nginx.ingress.kubernetes.io/server-alias: "app.k8s-4.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: app.k8s-3.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: app-service
                port:
                  number: 80
```

## init_secret.yaml

```
apiVersion: v1
kind: Secret
metadata:
  name: root-ssh-keys
  namespace: default
type: Opaque
data:
  privateKey: key_1
  publicKey: key_2
```

## sealed_secret.yaml

```
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: root-ssh-keys
  namespace: default
spec:
  encryptedData:
  privateKey: key_1
  publicKey: key_2
  template:
    metadata:
      creationTimestamp: null
      name: root-ssh-keys
      namespace: default
    type: Opaque
```

## pod-1

![pod-1](https://github.com/2Qic1/04.Github-actions/blob/master/photo/pod-1.jpg)


## pod-2

![pod-2](https://github.com/2Qic1/04.Github-actions/blob/master/photo/pod-2.jpg)


## pod-3

![pod-3](https://github.com/2Qic1/04.Github-actions/blob/master/photo/pod-3.jpg)


## root-ssh-key

![root-ssh-key](https://github.com/2Qic1/04.Github-actions/blob/master/photo/root-ssh-key.jpg)

