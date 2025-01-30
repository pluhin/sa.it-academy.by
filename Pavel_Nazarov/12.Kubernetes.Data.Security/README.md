# 12. Kubernetes.Data.Security
## Homework Assignment 1. Config maps and secrets

- [nginx_deployment.yaml](nginx_deployment.yaml)

**nginx_deployment.yaml:**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx
  namespace: nginx-app
  labels:
    app: nginx
spec:
  replicas: 2
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
      maxSurge: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      initContainers:
        - name: init-nginx-index
          image: busybox
          command: ["sh", "-c", "echo Node: $(hostname) > /usr/share/nginx/html/index.html"]
          volumeMounts:
            - name: html-volume
              mountPath: /usr/share/nginx/html
          
      containers:
        - name: nginx
          image: nginx:latest
          ports:
            - containerPort: 80
          resources:
            requests:
              memory: "64Mi"
              cpu: "200m"
            limits:
              memory: "256Mi"
              cpu: "1000m"
          volumeMounts:
            - name: html-volume
              mountPath: /usr/share/nginx/html
          
      volumes:
        - name: html-volume
          emptyDir: {}
```


**Checking:**
```bash
➜  ~ kubectl get pods -n nginx-app                          
NAME                     READY   STATUS    RESTARTS   AGE
nginx-678556b79c-dkhxw   1/1     Running   0          13s
nginx-678556b79c-hls2n   1/1     Running   0          3m43s
➜  ~ curl http://app.k8s-9.sa     
Node: nginx-678556b79c-dkhxw
➜  ~ curl http://app.k8s-9.sa
Node: nginx-678556b79c-hls2n
➜  ~ curl http://app.k8s-9.sa
Node: nginx-678556b79c-dkhxw
➜  ~ 
➜  ~ kubectl delete pods/nginx-678556b79c-dkhxw -n nginx-app
pod "nginx-678556b79c-dkhxw" deleted
➜  ~ kubectl delete pods/nginx-678556b79c-hls2n -n nginx-app
pod "nginx-678556b79c-hls2n" deleted
➜  ~ 
➜  ~ kubectl get pods -n nginx-app                         
NAME                     READY   STATUS    RESTARTS   AGE
nginx-678556b79c-d28xn   1/1     Running   0          21s
nginx-678556b79c-jsjt7   1/1     Running   0          11s
➜  ~ curl http://app.k8s-9.sa     
Node: nginx-678556b79c-jsjt7
➜  ~ curl http://app.k8s-9.sa
Node: nginx-678556b79c-d28xn
```


- [keypair-secret.yaml](keypair-secret.yaml)
- [sealed-keypair-secret.yaml](sealed-keypair-secret.yaml)


Sealed-secrets installing and prepair:
```bash
 1746* ssh-keygen -t rsa -b 2048 -f kubekey -N ""
 1747* ll
 1748* kubectl create secret generic keypair-secret --from-file=private_key=kubekey --from-file=public_key=kubekey.pub --namespace=nginx-app --dry-run=client -o yaml > keypair-secret.yaml
 1749* ll keypair-secret.yaml
 1750* vim keypair-secret.yaml
 1751* kubeseal --format yaml < keypair-secret.yaml > sealed-keypair-secret.yaml
 1752* wget https://github.com/bitnami-labs/sealed-secrets/releases/latest/download/kubeseal-linux-amd64 -O kubeseal
 1753* ll
 1754* rm kubeseal
 1755* ll
 1756* pwd
 1757  ll
 1758  wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.28.0/controller.yaml
 1759  ll
 1760  kubectl apply -f controller.yaml
 1761  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.28.0/kubeseal-0.28.0-linux-amd64.tar.gz"
 1762  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
 1763  ll
 1764  tar -xvzf kubeseal-0.28.0-linux-amd64.tar.gz kubeseal
 1765  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
 1766  ll
 1767  cat keypair-secret.yaml
 1768  kubeseal --format yaml < keypair-secret.yaml > sealed-keypair-secret.yaml
 1769  cat sealed-keypair-secret.yaml
 1770  kubectl apply -f sealed-keypair-secret.yaml
 1771  kubectl apply -f nginx_deployment.yaml -n nginx-app
 1772  k9s
 1773  kubectl get pods -n nginx-app
 1774  kubectl exec -it nginx-7c99857d7b-7hnvj -- ls -l /root/.ssh
 1775  kubectl exec -it nginx-7c99857d7b-7hnvj -n nginx-app -- ls -l /root/.ssh
```

Result:
```bash
➜  12.Kubernetes.Data.Security kubectl exec -it nginx-7c99857d7b-7hnvj -n nginx-app -- ls -l /root/.ssh 
Defaulted container "nginx" out of: nginx, init-nginx-index (init)
total 0
lrwxrwxrwx 1 root root 18 Feb 13 08:05 private_key -> ..data/private_key
lrwxrwxrwx 1 root root 17 Feb 13 08:05 public_key -> ..data/public_key
```