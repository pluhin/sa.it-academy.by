chrome -> /etc/hosts (178.124.206.53 app.k8s-19.sa app.k8s-20.sa) -> 178.124.206.53:80 -> k8s (ingress-controller):30001 -> service:80 -> pod:80

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
 487  mkdir 11.K8s
  488  cd 11.K8s/
  489  source ~/.bashrc
  490  kubectl get nodes
  491  vim pod_exec.yaml
  492  kubectl apply -f pod_exec.yaml
  493  kubectl delete -f pod_exec.yaml
  494  kubectl config set-context k8s
  495  kubectl apply -f pod_exec.yaml
  496  kubectl config set-context k8s
  497  kubectl config set-context --curent k8s
  498  kubectl config set-context --current k8s
  499  kubectl config use-context k8s
  500  kubectl apply -f pod_exec.yaml
  501  kubectl delete -f pod_exec.yaml
  502  vim pod_live.yaml
  503  kubectl apply -f pod_live.yaml
  504  kubectl delete -f pod_exec.yaml
  505  kubectl delete -f pod_live.yaml
  506  vim app.yaml
  507  kubectl apply -f app.yaml
  508  vim deployment.yaml
  509  kubectl apply -f deployment.yaml
  510  vim deployment.yaml
  511  vim app.yaml
  512  kubectl apply -f deployment.yaml
  513  vim deployment.yaml
  514  kubectl apply -f deployment.yaml
  515  vim deployment.yaml
  516  kubectl delete -f deployment.yaml
  517  vim app.yaml
  518  kubectl apply -f app.yaml
  519  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/heads/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  520  vim ingress-controller.yaml
  521  kubectl apply -f ingress-controller.yaml
  522  vim app.yaml
  523  kubectl apply -f ingress-controller.yaml
  524  kubectl apply -f app.yaml
  525  vim app.yaml
  526  history
```