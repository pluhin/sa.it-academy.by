
chrome -> /etc/hosts (178.124.206.53 app.k8s-9.sa app.k8s-10.sa) -> 178.124.206.53:80 -> k8s (ingress-controller):30001 -> service:80 -> pod:80

## "Local" DNS

Windows

> c:\Windows\System32\Drivers\etc\hosts

Linux/Mac

> /etc/hosts

```
178.124.206.53 app.k8s-XX.sa
```

## Nginx config (Jump server)

```
root@jump:~# cat /etc/nginx/conf.d/k8s_sa.k8s.conf
## Ansible managed
## SA group cluster
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*argocd\.k8s-(\d+)\.sa$";

  location / {
       # proxy_set_header Host $host;
        proxy_pass       http://192.168.208.$1:30007;
  }
}
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.208.$1:30001;
  }
}
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k3s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.$1:30001;
  }
}
```

```yaml
Changes in ingress service

---
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.14.0
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
    targetPort: https
```



```bash
545  mkdir 11.K8s
  546  cd 11
  547  cd 11.K8s/
  548  vim pod_exec.yaml
  549  kubectl apply -f pod_exec.yaml
  550  kubectl apply -f pod_exec.yaml --context k8s
  551  source .basr
  552  source ~/.bashrc
  553  kubectl apply -f pod_exec.yaml --context k8s
  554  kubectl delete -f pod_exec.yaml --context k8s
  555  vim pod_live.yaml
  556  kubectl apply -f pod_live.yaml
  557  kubectl apply -f pod_live.yaml  --context k8s
  558  kubectl delete -f pod_live.yaml --context k8s
  559  vim deployment.yaml
  560  kubectl apply -f deployment.yaml
  561  kubectl apply -f deployment.yaml   --context k8s
  562  vim deployment.yaml
  563  kubectl apply -f deployment.yaml   --context k8s
  564  vim deployment.yaml
  565  kubectl apply -f deployment.yaml   --context k8s
  566  vim deployment.yaml
  567  kubectl apply -f deployment.yaml   --context k8s
  568  kubectl delete -f deployment.yaml   --context k8s
  569  vim app.yaml
  570  kubectl apply -f app.yaml   --context k8s
  571  vim app.yaml
  572  kubectl apply -f app.yaml   --context k8s
  573  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/heads/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  574  vim ingress-controller.yaml
  575  kubectl apply -f ingress-controller.yaml --context k8s
  576  vim app.yaml
  577  kubectl apply -f app.yaml   --context k8s
  578  cd 11.K8s/
  579  ls
  580  history
```