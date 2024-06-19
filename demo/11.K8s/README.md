# 11.K8s

Chrome (app.k8s-XX.sa) -> /etc/hosts (178.124.206.53 app-alias.k8s-XX.sa app.k8s-XX.sa app.k8s-YY.sa) -> k8s (ingress controller):30001 -> service:80 -> pod:80

## Bastion nginx config 

```
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30001;
  }
}
```

## Line inside hosts file 

Windows

> c:\Windows\System32\Drivers\etc\hosts

Linux/Mac

> /etc/hosts

```
178.124.206.53 app.k8s-XX.sa
```

## History

```bash
  601  ls -l
  602  mkdir 11.K8s.base.objects
  603  cd 11.K8s.base.objects/
  604  ls
  605  vim pod_exec.yaml
  606  kubectl create -f pod_exec.yaml
  607  kubectl describe pod pod-exec
  608  vim pod_exec.yaml
  609  kubectl apply -f pod_exec.yaml
  610  vim pod_exec.yaml
  611  kubectl delete -f pod_exec.yaml
  612  vim pod_live.yaml
  613  kubectl create -f pod_live.yaml
  614  kubectl delete -f pod_live.yaml
  615  vim deployment.yaml
  616  kubectl create -f deployment.yaml
  617  vim deployment.yaml
  618  kubectl apply -f deployment.yaml
  619  vim deployment.yaml
  620  kubectl apply -f deployment.yaml
  621  vim deployment.yaml
  622  kubectl apply -f deployment.yaml
  623  vim deployment.yaml
  624  kubectl apply -f deployment.yaml
  625  vim deployment.yaml
  626  kubectl apply -f deployment.yaml
  627  kubectl create -f pod_live.yaml
  628  kubectl delete -f pod_live.yaml
  629  kubectl delete -f deployment.yaml
  630  vim app.yaml
  631  kubectl create -f app.yaml
  632  vim app.yaml
  633  kubectl apply -f ../pod.yaml
  634  vim app.yaml
  635  kubectl apply -f app.yaml
  636  vim app.yaml
  637  kubectl apply -f app.yaml
  638  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-nginx.yaml
  639  vim ingress-nginx.yaml
```

Changes in ingress service

```yaml
...
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.6.4
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - appProtocol: http
    name: http
    port: 80
    protocol: TCP
    nodePort: 30001      ### Added line
    targetPort: http
  - appProtocol: https
    name: https
    port: 443
    protocol: TCP
    nodePort: 30002      ### Added line
    targetPort: https
....
```


```bash
  640  kubectl create -f ingress-nginx.yaml
  641  kubectl get nodes
  642  kubectl get nodes --wide
  643  kubectl get nodes
  644  vim app.yaml
  645  kubectl create -f ingress-nginx.yaml
  646  kubectl apply -f ingress-nginx.yaml
  647  vim app.yaml
  648  kubectl apply -f ingress-nginx.yaml
  649  kubectl apply -f app.yaml
  650  history
```
