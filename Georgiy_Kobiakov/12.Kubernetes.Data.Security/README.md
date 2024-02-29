# 12.Kubernetes.Data.Security
---

Setting up secrets controller

```bash
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.0/controller.yaml
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.26.0/kubeseal-0.26.0-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xzf  kubeseal-0.26.0-linux-amd64.tar.gz
rm kubeseal-0.26.0-linux-amd64.tar.gz
```

## nginx-manifest.yaml
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: html-config
data:
  index.html: |
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Pod Hostname</title>
        <style>
          .text {
          text-align: center;
          }
        </style>
    </head>
    <body>
        <div class="text">
        <h1>Classic: Hello, World!</h1>
        <h2>Pod Name: HOSTNAME</h2>
        </div>
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
            cpu: 51m
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
          secretName: ssh-keys-secret
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: nginx-service
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
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-8.sa"
spec:
  ingressClassName: nginx
  rules:
    - host: nginx.k8s-7.sa
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

## init-secret.yaml
```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: github-token-secret
type: Opaque
data:
  GITHUB_TOKEN: git_token
---
apiVersion: v1
kind: Secret
metadata:
  name: ssh-keys-secret
type: Opaque
data:
  SSH_PUBLIC: ssh_public
  SSH_PRIVATE: ssh_private
```

## sealed-secret.yaml
```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: github-token-secret
  namespace: default
spec:
  encryptedData:
    GITHUB_TOKEN: AgCURSL8+CuMvue5ddFi0Q+R12G6Aeys9cYpEtCEiPYjibz6x79TDXs9VNuydtgz6FJdS3Fq4ypq4dgQwg7IMPaxbSHz+nuu9dEeHfPq5XbaB12J2IlDEfJbcrePW9WNjhCnhu4rNeYLViOE2im7W2v5vP/Mzeszk2tCl8y0RCLYH6il3tJseYjf380Ibx02Z5pRASJ9eVsawyAGAtXydFo1Kmv7gAGQd6wmGgvU4+ClGcSw6prszRQJteMQM863VLWYXkU4CDPb0WLRRHtm2h/uPO3coAz7y1QkPVmzcy6uvj+1KuKezEXFIKFG99ovAX0BMrNMM//Do3vB5vdxSIhUGIWf/BC+BhCCsd1pbMFcT6OLFyFS7N1gHv52eYv1fyIS0PG6rVh1N28yozho3VUE73twfY5SItda2f0HfGDbnZePTtA2xgZ5NU952a4ouVFWRdRnHclLpiIAr8+IpJM5aQs6siQP+bpYW9SxTaMxCwVJhvMiHo2rRsPs060PXNqoMx2OA76jUZ352BbNIdI6h8hLvrej+GZnyeuLoiMw54yORSdb2ppN3EA5o1seaHz0UePJ4L86tL+bVZJCiKg1EGy264/Udat3Bn9V/iJ/QI9Z5Q2ppi+bXBsF6OBgtSPr6ISSJ/4eExsGqRZiNmaPy4oCwVBuZ2BoB4MLj1vkaeVtSldvll/mMiqDr+GS+12Ro/ht+1x05OVm+udzOOmNjnRyGQMF9XCm38fnyEhISilJarttQcXG
  template:
    metadata:
      creationTimestamp: null
      name: github-token-secret
      namespace: default
    type: Opaque
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: ssh-keys-secret
  namespace: default
spec:
  encryptedData:
    SSH_PRIVATE: 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
    SSH_PUBLIC: AgAu/wEV/qZeDTsetA/8cYVSZipf9ay+aZ4edmse6MTRSF4n0vDJcuBozMbU8CC60XMxAPFc9s2BLMQ+q14y3aQftvL7QL9jyKQDM0cOASO0WJQ4/5o2Q0E3q+MqBCSHa000tWNdteGiOkds5BpAT9Q9I+b/akrgQRZm9Kl2YfDOoFWjCjWi7MwG4Z+DDzmVmkz14dt/Pw8h8+BBZ4THtl3XlbYMAZOrm2grxYJ7o/61IqB6ogYgO597BAZu90AynF4DYLI06tMEjCUDI9rtnH1hT8iehVQADAfUMMtwfYUrAHFhyv0paXgyaYXDZeU37t8pxnLVIcPKDrk3EuX/7O1CGZxsciu02KLz93SLDkNhhb+FboK5KexOmDMO5Hv6DDJWjn9z//MoQ+ruO+v9D5LXJrrM5IzHvaMTVkwuFrA1MFFNxf0GI+Av6Xhfrexby6u3NCBAGkiG73QZBaKg3JMOJBDDvudcrgfL4jATwJ1e6edlFqK8sCrbBhX8+owGwU3kElkjpqudYDcpghKZDr3u5tnPJZ2PxitBwW1JOMNfY4JlCR72kDCYhNJ/JOA9NoNLZJVka3WxVkfhG1A2aQtDaaY936gWzEmLyDycsmFuZXBJMx9euIKEvICAjy8Yxk9maG2VHpWry1Uw+UXYnFxYmG4/cNDrGK/8pxPvR3Rj3SKjYuf1utJuDg1JZKcz+qg1I5pcFDjx0qdv4R0SNQXwD9C4Dr5EfnW7m/tw2DriD6DwNUrWG6z/fJT/B4cgDC3g3fgz033p9FQ32DMp56BdlCMs0jISWHON4X217Aakl2f+vGJ53a8cyUt82bu2loolL2WRegVdAS4pYFID0bT1Cd6p8TT8yNvR5fKzNXM3mJB1dOqW4ZTyJZLZicvW5QCDx5cQoyWrFEQ2tBzzLe9RbU2bbzBMltKydxdUfF0Yy5e98+dRicp7n9qD7HRr+3z3dKNZwaiTiXTRc8FEKhg9IeNdo7rrv2TbDtsZgm2DWDs0uE0ay4shXO2rkgbrO7Z9AasBejvjLemKobCPim15FPh0TmxuvvZy5t0h6/UqjV97OWMvlrg=
  template:
    metadata:
      creationTimestamp: null
      name: ssh-keys-secret
      namespace: default
    type: Opaque
```

## nginx.k8s-7.sa
![nginx.k8s-7.sa](https://github.com/Goshaker/DevOpsCourse/blob/master/12.Kubernetes.Data.Security/nginx.k8s-7.sa.png)

## nginx.k8s-8.sa
![nginx.k8s-8.sa](https://github.com/Goshaker/DevOpsCourse/blob/master/12.Kubernetes.Data.Security/nginx.k8s-8.sa.png)

## Github token
![K9s runner](https://github.com/Goshaker/DevOpsCourse/blob/master/12.Kubernetes.Data.Security/github_token.png)

## SSH keys
![Github GUI runner](https://github.com/Goshaker/DevOpsCourse/blob/master/12.Kubernetes.Data.Security/ssh_keys.png)