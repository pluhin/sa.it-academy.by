## Ingress flow

Chrome (app.k8s-XX.sa) ->
/etc/hosts (178.124.206.53 app-alias.k8s-XX.sa app.k8s-XX.sa app.k8s-YY.sa) ->
k8s (ingress controller) -> service -> pod

## Nginx bastion

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
```

---

## History

```bash
  596  mkdir 11.K8s
  597  cd 11.K8s/
  598  ls
  599  vim pod_liveness_probe.yaml
  600  kubectl get pods
  601  kubectl apply -f pod_liveness_probe.yaml
  602  kubectldelte -f pod_liveness_probe.yaml
  603  kubectl delte -f pod_liveness_probe.yaml
  604  kubectl delete -f pod_liveness_probe.yaml
  605  vim deploy_rolling.yaml
  606  kubectl apply -f deploy_rolling.yaml
  607  vim deploy_rolling.yaml
  608  kubectl apply -f deploy_rolling.yaml
  609  vim deploy_rolling.yaml
  610  kubectl apply -f deploy_rolling.yaml
  611  vim deploy_rolling.yaml
  612  kubectl apply -f deploy_rolling.yaml
  613  vim deploy_rolling.yaml
  614  kubectl apply -f deploy_rolling.yaml
  615  vim deploy_rolling.yaml
  616  kubectl delete -f deploy_rolling.yaml
  617  vim app.yaml
  618  kune]
  619  kubectl apply -f app.yaml
  620  vim app.yaml
  621  kubectl apply -f app.yaml
  622  vim app.yaml
  623  kubectl apply -f app.yaml
  624  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  625  vim ingress-controller.yaml
  626  kubectl apply -f ingress-controller.yaml
  627  vim app.yaml
  628  kubectl apply -f app.yaml
  629  vim app.yaml
  630  kubectl apply -f app.yaml
  631  history
```

## Changes in ingress contoller deployment (service):

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.9.6
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
    targetPort: http
    nodePort: 30001     #### <= Added
  - appProtocol: https
    name: https
    port: 443
    protocol: TCP
    nodePort: 30002     #### <= Added
    targetPort: https
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  type: NodePort
```