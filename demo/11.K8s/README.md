
chrome -> /etc/hosts (178.124.206.53 app.k8s-25.sa app.k8s-26.sa ) -> 178.124.206.53:80 
-> k8s (ingress-controller):30001 -> service:80 -> pod:80


Nginx config (Jump server)

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


## "Local" DNS

Windows

> c:\Windows\System32\Drivers\etc\hosts

Linux/Mac

> /etc/hosts

```
178.124.206.53 app.k8s-XX.sa
```

## Ingress-controller changes

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
    app.kubernetes.io/version: 1.12.1
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

History

```
  521  mkdir 11.K8s
  522  cd 11.K8s/
  523  vim pod_exec.yaml
  524  kubectl apply -f pod_exec.yaml
  525  vim pod_exec.yaml
  526  kubectl apply -f pod_exec.yaml
  527  vim pod_exec.yaml
  528  kubectl apply -f pod_exec.yaml
  529  vim pod_exec.yaml
  530  kubectl apply -f pod_exec.yaml
  531  kubectl delere -f pod_exec.yaml
  532  kubectl delete -f pod_exec.yaml
  533  kubectl apply -f pod_exec.yaml
  534  vim pod_exec.yaml
  535  kubectl delete -f pod_exec.yaml
  536  vim pod_live.yaml
  537  kubectl apply -f pod_live.yaml
  538  kubectl delete -f pod_live.yaml
  539  vim deployment.yaml
  540  kubectl apply -f deployment.yaml
  541  vim deployment.yaml
  542  kubectl apply -f deployment.yaml
  543  vim deployment.yaml
  544  kubectl apply -f deployment.yaml
  545  vim deployment.yaml
  546  kubectl apply -f deployment.yaml
  547  vim deployment.yaml
  548  vim app.yaml
  549  kubectl delete -f deployment.yaml
  550  kubectl apply -f app.yaml
  551  vim app.yaml
  552  kubectl apply -f app.yaml
  553  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/tags/controller-v1.12.1/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  554  vim ingress-controller.yaml
  555  kubectl apply -f ingress-controller.yaml
  556  kubectl apply -f app.yaml
  557  vim app.yaml
  558  kubectl apply -f app.yaml
  559  vim app.yaml
  560  history
```