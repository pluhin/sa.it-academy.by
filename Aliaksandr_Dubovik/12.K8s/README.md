# ConfigMap and Deployment

```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: index-config
data:
  index.html: |
    <html>
    <title>12.K8s</title>
    <body>
    <h3> Hometask12 </h3>
    <br><br><h1> host </h1><br><br>
    <h4> Powered by Nginx
    <h5> Created by A.Dubovik </h5>
    <body bgcolor = „green”>
    </h4>
    </body>
    </head>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: simple-web
spec:
  replicas: 3
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
      - name: php-nginx
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
        - name: index
          mountPath: /usr/share/nginx/html/
        - name: ssh-keys-v
          mountPath: /root/.ssh/
      initContainers:
      - name: init
        image: busybox
        command: ["sh"]
        args: ["-c", "cp /tmp/index.html /usr/share/nginx/html/; 
          sed -i 's/host/$(HOSTNAME)/' /usr/share/nginx/html/index.html" ]
        env:
          - name: HOSTNAME
            valueFrom:
              fieldRef:
                fieldPath: metadata.name
        volumeMounts:
        - name: index-config-mount
          mountPath: /tmp/ 
        - name: index
          mountPath: /usr/share/nginx/html/
      volumes:
      - name: index
        emptyDir: {} 
      - name: index-config-mount
        configMap:
          name: index-config
      - name: ssh-keys-v
        secret:
          secretName: ssh-keys-v
          defaultMode: 0600 
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-web-service
  labels:
    run: nginx-web-service
spec:
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: simple-web
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "test-alias.k8s-7.sa"
spec:
  rules:
    - host: app.k8s-7.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-web-service
                port:
                  number: 80
```
## SealedSecret

```yaml
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: ssh-keys-v
  namespace: default
spec:
  encryptedData:
    id_rsa: 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
    id_rsa.pub: AgAg53FeStDOR3mWEUyZFFeFg/FsPzkQ7w7WPx3d1Df2Jdng9M/6lDbaI++ciXn1nsqXfQa0Y6+xL5MbLUbL62dAkInkodVmif8brEjSkFFe4Ddl7rLev/ZFYuo5UYKdPkSmCEA8RhYhb4s6LcOTrdzzg2fGU0dif03wJqVAG8xTMKgYd//YKsv6iHhinsgq5V6Jkm8V+6QgarMk4BFcICd9bFomYlMc6tk4JDMNRIoE4a1CY+Gvlec+itZrNWtz1vn5USRH45nyHDuEQDjuNapP8XIe2qNAYHWqYlnfcRfhwv9Oj36atODr1G/j8REjUCBTbRQbtR7EnWR8qlFxlsNtHCAaqx+wS2UdukPzYt+4kwL6En9gXXsd7LTdt+PPTFRvTieitAjAo+vhM2YuM76m+UetwaD/SPt6edzyrrST610dm+AWpR+iBElsBaYQjQ6JI9tgn/73rWM5BeEPLG5BWGaNNCyINWcQHiC9P+oHSIVwRoAM/b3B6fHkVbPVJaqlDH75njR8Xv9Cfjbj5SLefhhVxbCN7AwIvWmQ63pCDTCvszHRwHh4YIUoWAIh3ofkfEkAnDOgNsqfPNROfFK3PwnvWsTKK6ZcrxxBNxp4O981LqEOSILXDSqVdqxYNsWNyw+DqMetjuUbAsQLexia3lf3tmoujZfNUbP5LgC4vlSQdhJUN1G9u2NZL2Cu4SmBoNy2IlOVTHsiHSNaEAsKeZ5vDueNO5x2tMwkvi1pmwSt0Y0Mg08LIZWuAHVKloF6dJrs8NrJ36pHIVksTXuceGlnvOQ3xWejQRuRhBUSAh2C0Z3cHMj+/TBycgeEVhz8av/xbHE7ALBv2FpC1DNyjmxSUZEhti+F4HSgakddCHafaVgPq6h/1gx+fYDYCwnx0BgIKUOcg+0V72CGEEL0HtfxDaap1KOeWHIEZ4MOo4BHgd/myY5UttwgLJIYZhnpMQ665Rcj9ybMMhveXxGCpvgElETakjIs90LsME/jcyebY7e2uYNcVqTc8cTAXePaT54Sjwgz65Uuu2AqxQzN34TbNdbAUwr6wKfBGUvuJY9dTTpTgvQ9JI0eMMUEHCromv9n1EcKL+LgL1eqkztV6PA/+XSxoDfREIvzvtwdULz+f96Qj5mtJbv2fLdEz1NEQ0aIkJWnNmL8QLaJa8Zefrmq7mstAA+x/h4h0dzNQ3MeLOx+aMk80FXjCVwkj2Di+ZuN/hE5m1mXSQRPxcJssOUUy+YX9KlWM5KPkJ6QjOSlstPrc+vRavTfOImE2Avz3134FtpS2oTY0utywcUN5sOr73Y/uerT9qukezgpzeRwW2y0dQ72Npt2eg/37MN82JCLl5+MWXxgJyr4dil3r9E5ZAIpN1IeY9w0NfKovayCtqope6F3inWze4ypx24idyeCdAghtYgCzyNJBl3AaY9PYDaO0VfnmPp9RGDraq/aDRt4sgD9JbxWuVEKSw==
  template:
    metadata:
      creationTimestamp: null
      name: ssh-keys-v
      namespace: default
    type: Opaque
```