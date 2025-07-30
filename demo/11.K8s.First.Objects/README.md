chrome -> /etc/hosts (178.124.206.53 app.k8s-11.sa app.k8s-12.sa) -> 178.124.206.53:80 -> k8s (ingress-controller):30001 -> service:80 -> pod:80

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
    app.kubernetes.io/version: 1.13.1
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
  537  mkdir 11.K8s
  538  cd 11.K8s/
  539  ls
  540  vim pod_exec.yaml
  541  kubectl apply -f pod_exec.yaml
  542  source ~/.bashrc
  543  kubectl apply -f pod_exec.yaml
  544  kubectl delete -f pod_exec.yaml
  545  vim pod_live.yaml
  546  kubectl apply -f pod_live.yaml
  547  vim pod_live.yaml
  548  kubectl delete -f pod_live.yaml
  549  vim app.yaml
  550  kubectl apply -f app.yaml
  551  kubectl delete -f app.yaml
  552  vim deployment.yaml
  553  kubectl apply -f deployment.yaml
  554  vim deployment.yaml
  555  kubectl apply -f deployment.yaml
  556  vim deployment.yaml
  557  kubectl apply -f deployment.yaml
  558  vim deployment.yaml
  559  kubectl apply -f deployment.yaml
  560  vim deployment.yaml
  561  kubectl apply -f deployment.yaml
  562  vim deployment.yaml
  563  kubectl apply -f deployment.yaml
  564  kubectl delete -f deployment.yaml
  565  vim app.yaml
  566  kubectl apply -f app.yaml
  567  vim app.yaml
  568  kubectl apply -f app.yaml
  569  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/heads/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  570  vim ingress-controller.yaml
  571  kubectl apply -f ingress-controller.yaml
  572  vim app.yaml
  573  kubectl apply -f app.yaml
  574  vim app.yaml
  575  history
```