# 11. K8s

chrome -> /etc/hosts (178.124.206.53     app.k8s-25.sa app.k8s-26.sa ) -> 178.124.206.53 ->
k8s (ingress-controller):30001 -> service:80 -> pod:80


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
    app.kubernetes.io/version: 1.11.3
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
```

---

## History 
```bash
 550  mkdir 11.K8s
  551  cd  11
  552  cd  11.K8s/
  553  k9s
  554  ls
  555  vim pod_exec.yaml
  556  kubectl apply -f pod_exec.yaml
  557  kubectl apply -f pod_exec.yaml -n default
  558  kubectl descibe pod-exe
  559  kubectl describe pod-exec
  560  kubectl describe pod pod-exec
  561  kubectl logs pod pod-exec
  562  kubectl logs pod-exec
  563  kubectl delete -f pod_exec.yaml
  564  vim pod_live.yaml
  565  kubectl apply -f pod_live.yaml
  566  kubectl delete -f pod_live.yaml
  567  vim deployment.yaml
  568  kubectl apply -f  deployment.yaml
  569  vim deployment.yaml
  570  kubectl apply -f  deployment.yaml
  571  vim deployment.yaml
  572  kubectl apply -f  deployment.yaml
  573  vim app.yaml
  574  kubectl delete -f  deployment.yaml
  575  vim app.yaml
  576  kubectl apply -f app.yaml
  577  vim app.yaml
  578  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/tags/controller-v1.11.3/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  579  vim ingress-controller.yaml
  580  kubectl apply -f ingress-controller.yaml
  581  vim app.yaml
  582  kubectl apply -f app.yaml
  583  vim app.yaml
  584  kubectl apply -f app.yaml
  585  vim app.yaml
  586  kubectl apply -f app.yaml
  587  vim app.yaml
  588  kubectl apply -f app.yaml
  589  history

```