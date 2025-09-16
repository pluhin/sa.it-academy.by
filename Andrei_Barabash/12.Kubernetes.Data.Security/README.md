## 1: Config maps and secrets

### k8s cluster

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/12.Kubernetes.Data.Security/screenshots/k8s-cluster.png "k8s cluster")

### pod1

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/12.Kubernetes.Data.Security/screenshots/pod1.png "pod1")

### pod2

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/12.Kubernetes.Data.Security/screenshots/pod2.png "pod2")

### pod3

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/12.Kubernetes.Data.Security/screenshots/pod3.png "pod3")


### ssh keys

![alt text](https://raw.githubusercontent.com/andybar69/sa.it-academy.by/refs/heads/md-sa2-32-25/Andrei_Barabash/12.Kubernetes.Data.Security/screenshots/ssh-keys.png "ssh-keys")


### app.yaml
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
      <meta charset='utf-8'>
      <title>Welcome to nginx!</title>
    </head>
    <body>
      <h1>Hello from index file</h1>
      <p>Hostname: HOSTNAME</p>
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
              mountPath: /opt
            - name: updated-nginx-html
              mountPath: /usr/share/nginx/html
          command: ["sh", "-c", 'sed -e "s/HOSTNAME/$HOSTNAME/" /opt/index.html > /usr/share/nginx/html/index.html']
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 64Mi
          limits:
            cpu: 100m
            memory: 128Mi
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
    nginx.ingress.kubernetes.io/server-alias: "nginx-test.k8s-2.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx-test.k8s-1.sa
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

### initial secrets
```
apiVersion: v1
kind: Secret
metadata:
  name: root-ssh-keys
  namespace: default
type: Opaque
data:
  privateKey: cHJpdmF0ZV9rZXk=
  publicKey: cHJpdmF0ZV9rZXk=
```

### sealed secrets

```
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: root-ssh-keys
  namespace: default
spec:
  encryptedData:
    privateKey: AgCStOakszZlBXf1yhakyt1uc8XMSS9RkiZ30IMD2OiQrTrjvRvAgQlrveMtr/59E+OcfL3qyuMt8RSUYlIGHYoG3wz9z/vOrSzs95q5zmfOKCl03b53rqU71R5N4KTzWoFbHP6UV6jAiTZ9NxriNwJzz8YogdIEMk1YbDKFmJ+p5zzz2+fUWFMTQomdvDnz3Ikvl57UH6PJ3Vcgof/Wtp+4veZXJ0ksmxmF3y6pCzRI74+e9+a19AwnWo/1AmyOddxurH5ygTRJQsJfm9EWadqElcPh8nEJIDIBd3z0oEsI7DOx/tfTDDU8Nd8dXkjH7iP3pC766uNycCzpfNm0oVq2QZupBxLHy0l8L93Nn+b0/OGuXAky0PaEhJqSWHaC+gEiLS0C+JXUuyMzjF7PMD7/C49QHXbTTpGucd+NW0GmGJ7G74wWS1kLe3kMF8xRwB3fgZG//hPgNfSlLYFKH1MS+ZTwO2f5IvXkHZXLx5eeRBhIIruiZFc+xZolBfwjeCvI+UmO3Oy3NmIzL0gfAJQmlwU9U7eJGFqKs7/6s2r5NNZmm7AmpKPB7A8b3izygg13PBcq/VkJQpt3amEJNsVBqUtpHRfIjKo+uzgRG+H7MPVAq5Tf7+uq+9mdY424c87WJUAmB3R2apew2ASo6UkCz3iFbAVh0U3cUEhsacAzBkm5L/dMP1a4mNqMTHNGYUv/ZikChDhHLyl6Xw==
    publicKey: AgCWnC46sw0TXeHGnodt953XwkJbEK95EaW4beGeIk71Uw9/vDngqh/g9ELakn+NFkB+R4JBMqhLE40kIHJ2tMKg0dy16SPpMHfL2GZrhtc3OSCidMlGv5nFyVSM78q8GAy533tSnyoNyxsE4VWmmx4RWAnxBEkR3jJvUPLqz1dye/9XWkGOLh2kcfmJ7OvSpa7GNAJ2LEZaXZxr5XAHVhm581TpCYUE5jeAd13JiESRBp93tEeXpuoMxGnRemIKnTetwduul84xxuY78QIOk7mDIEKb1xLgSqQ6DcbE0fhc/DydZp0OG1TCW3zalzvzRqbGbUkyoMt4CTX7r1clrx80OkIC3r6VTl8G7cPzO/xSBLGEecgZEW9LGtub1sV7JIqRGkxO5vvvVww6bnqPC2sgnyfyen45WEenZOCLB4mQQ3xV/yTe0IF1BNrJmETX5d1B13dG3FE+l8IcxZStjnN94VMzmkofgLPk3OFvJ8m8MYYLz3o9WSI49CY1Dj87HtvR36jP2Jul9CseY2Adg6sNJBsCszFZ6jcbIFEGpVeMzVc8fUxR5L/x/Ba4pCivZ978hkVhRFo4Tym+mmzln5CKrtetCjrTTVbD80IjCdTN6/Fxdq4z0OUYYHojLCyQt75yt/3ptmbD/dOoGrWRgYtiCSPTSef6PTVVXfJacahhAOxibxXo81wG94821U2d5h5LFbY8b5e6gWXE8A==
  template:
    metadata:
      creationTimestamp: null
      name: root-ssh-keys
      namespace: default
    type: Opaque
```    

