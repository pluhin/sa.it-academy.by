# 11.K8s

chrome -> /etc/hosts (178.124.206.53 app.k8s-25.sa app.k8s-26.sa ) -> 178.124.206.53 -> k8s (ingress-controller):30001 -> service:80 -> pod:80

```
root@jump:~# cat /etc/nginx/conf.d/k8s_sa.k8s.conf
## Ansible managed
## SA group cluster
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.208.$1:30001;
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

```bash
Changes in ingress service

...
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.12.0
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

---

## History

```
466  cd 11.K8s/
  467  ls
  468  rm k9s_Linux_amd64.tar.gz
  469  rm kubectl
  470  vim pod_exec.yaml
  471  kubectl apply -f pod_exec.yaml
  472  vim pod_exec.yaml
  473  kubectl delete -f pod_exec.yaml
  474  vim pod_live.yaml
  475  kubectl apply -f pod_live.yaml
  476  kubectl describe pod liveness-exec
  477  kubectl delete -f pod_live.yaml
  478  vim app.yaml
  479  kubectl apply -f app.yaml
  480  vim app.yaml
  481  kubectl apply -f app.yaml
  482  vim app.yaml
  483  kubectl apply -f app.yaml
  484  vim app.yaml
  485  kubectl apply -f app.yaml
  486  vim app.yaml
  487  kubectl apply -f app.yaml
  488  vim app.yaml
  489  kubectl apply -f app.yaml
  490  vim app.yaml
  491  kubectl apply -f app.yaml
  492  vim app.yaml
  493  kubectl apply -f app.yaml
  494  vim app.yaml
  495  kubectl apply -f app.yaml
  496  vim app.yaml
  497  kubectl apply -f app.yaml
  498  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/tags/controller-v1.12.0/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  499  vim ingress-controller.yaml
  500  kubectl apply -f ingress-controller.yaml
  501  vim app.yaml
  502  kubectl apply -f app.yaml
  503  history
```