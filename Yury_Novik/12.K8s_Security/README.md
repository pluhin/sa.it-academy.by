
#Kubernetes. Data. Security

```
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/kubeseal-0.24.2-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xzf  kubeseal-0.24.2-linux-amd64.tar.gz
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.24.2/controller.yaml
```


```
kubectl create secret generic my-secret --from-file=id_rsa.pub --from-file=id_rsa --dry-run=client -o yaml > my-secret.yaml
kubeseal -f my-secret.yaml -w my-sealed-secret.yaml
kubectl apply -f my-sealed-secret.yaml
kubectl apply -f app.yaml
```


```
cat app.yaml

```
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: html-config
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <body>
    <h1>_HOSTNAME_</h1>
    </body>
    </html>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: nginx
spec:
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 2
      maxUnavailable: 0
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
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
        - name: index-html-for-nginx
          mountPath: /usr/share/nginx/html
        - name: ssh-secret
          mountPath: /root/.ssh
      initContainers:
      - name: config
        image: nginx:latest
        command: ["sh", "-c", 'cd /tmp/; sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
        env:
        - name: HTML_CONTENT
          valueFrom:
            configMapKeyRef:
              name: html-config
              key: index.html
        volumeMounts:
        - name: config-mount
          mountPath: /tmp
        - name: index-html-for-nginx
          mountPath: /usr/share/nginx/html
        - name: ssh-secret
          mountPath: /root/.ssh
      volumes:
      - name: config-mount
        configMap:
          name: html-config
      - name: index-html-for-nginx
        emptyDir: {}
      - name: ssh-keys
        emptyDir: {}
      - name: ssh-secret
        secret:
          secretName: my-secret
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: webserver
spec:
  selector:
    app: nginx
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "app-alias.k8s-9.sa"
spec:
  rules:
  - host: app.k8s-9.sa
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80

```

```
cat my-secret.yaml 
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: my-secret
  namespace: default
spec:
  encryptedData:
    id_rsa: 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
    id_rsa.pub: AgADz/0ZNY9cWfwHnmxjWsYJVVHvkWcJ9NZWjjT4FcvI3YOzfkyqKEMBp8qnzYFZ7rpD7iBXR0edlTCQXWFId+o3YwEdNFBKgCW922VhipglEsWjDMhiQzoDPL2I1koNtHDKRWwUTVG9TpJpAps6n83jC5qeoWd27r6YIfbRhVDCqWPI0I/26nAB6QBuI+ETurXIR+XNuGwTYHg15Iq/H3/jk8Gd6FVfsawbDgbMD2kOShXfPL3vkFwAjpsZfoicgiUN7LBtSkspok5rU47x1cSPnmhoKDI/ALrLMVHD4JAivDu3ugIttV0UWWz0zMLan1umOedFrxskneJitS3tAKu3/11yxRKHcx6UO2AW80f1RKPzm+S7fpOPaMemCV7v2yUpK0xvM4niLcUrD9qfhwoEJ+/0dJajbs0hvxsbSblg/Egr2JMUIFODU7pVtn9kVZIu2KmXFfV2RqZChtnbfXzk7WPuQuRR9o8EpDrqITnj3nIzwtg6mrsKCFVszW+tPzINLRX600xK/kpAQyv5xDzLkpPcXQy49P4NyQr06UnQFpHfe9vm7ODNCmY86S480jJwNcIyhBoxCfYkEqVk2Vz5IlCUJkCWWMarAXHL6UWQ7viFFTHlmczE0ssyP6WjFFs3GGm+QqQRzB94Gz7lHtRagpdlftwt4Fw6lNFLey2lmSosRVhyeFEDGRkDE4PdcxJeBAi8M4/byLMr/VKQbfKzrCQyfmpWRBrSp5v8cTlTBk4Zf7cMsmgMpwTkLqibrKz4PzWCIEop3H8RMbRi2Yj17Wgn9MUcHXYVfJX17FtE68knOJrmxe1zM5AQC34Z8+BE8uk3MoDGA2QtGTfdWZEQYkEjDCPZZV9SQYolvq5aeKlv1e4umuD/0d5N4Q2lwPa2qdxFAQZVgdBNK9I0YHelFKaV+JpEVt4nj1NhzSG3cyHLJ5XMWkZiFQ35s1JBZIIIjYrR2gHBbxF1fR8RF+671khdQ13NxtHLzsZzpTYF0NWKiDgYe11RJ/j9rJxmuo2J4nEBXTmUZZVihMBC7G2OAdMt3Io2GzmwjVfL9iAgfqScDM+Ltx0TEYfIxPP1u18fweyt6zLafJjU/oWdo7183nln3it7tvZh9g+RFkmMxMMPOdSZC5w1NAhCxdQdqnuosJZkMcEgFqjMGEdEp5kdbHM+7whD7XyHzwQ7YJacMuPw417lM1/tyX+dltV+kPOdkymEjLZXGbg2hEYyRV9Rjir7IcO0s0GKuMZZr/HUUlgR/bMxH1uMgDGdszbxmo5R67NlG1PLLHKhH8ceSoFBJINuaqpJDdiwMbK66EO7hfW63Qi9VV/S7wL4du78gLXzNGF2E5Zlrs5xDqsq6+Qz9mzqpC11iXeVIqLr+j/HcPB9rTo3Bb+0FQL3YLjDiiZNmUeEeA7RVoBtuIos2Pc25ULpqthF6lDetNbqRCYNGjeQhdAJFOU=
  template:
    metadata:
      creationTimestamp: null
      name: my-secret
      namespace: default
```

![pods](pods.PNG)

![controler](seal_controler.PNG)

![secret](my-secret.PNG)

![secret-more](my-secret-more.PNG)

