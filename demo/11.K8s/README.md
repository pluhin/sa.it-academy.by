
# 11.K8s


browser => hosts => 178.124.206.53 (nginx) -> ingress (app.k8s-18.sa) -> service -> pod (container)

```conf
jump_sa@jump:~$ cat /etc/nginx/conf.d/k8s_18.k8s.sa.conf
## Ansible managed
## SA group cluster
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-18\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.18:30001;
  }
}
###############
## For argoCD. Need to change service in argocd NodePort 30007
server {
  listen 80;
  listen [::]:80;

  server_name "argocd.k8s-18.sa";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.18:30007;
  }
```

## History

```bash
  503  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.18 -f -N
  504  kubectl get pods
  505  kubectl get pods -A
  506  vim pod_exec.yaml
  507  kubectl apply -f pod_exec.yaml
  508  kubectl delete -f pod_exec.yaml
  509  kubectl apply -f pod_exec.yaml
  510  kubectl delete -f pod_exec.yaml
  511  vim pod_live.yaml
  512  kubectl apply -f pod_live.yaml
  513  kubectl delete -f pod_live.yaml
  514  vim deploy_rolling.yaml
  515  kubectl apply -f deploy_rolling.yaml
  516  vim deploy_rolling.yaml
  517  kubectl apply -f deploy_rolling.yaml
  518  vim deploy_rolling.yaml
  519  kubectl apply -f deploy_rolling.yaml
  520  vim deploy_rolling.yaml
  521  kubectl apply -f deploy_rolling.yaml
  522  vim deploy_rolling.yaml
  523  kubectl apply -f deploy_rolling.yaml
  524  vim deploy_rolling.yaml
  525  kubectl apply -f deploy_rolling.yaml
  526  vim deploy_rolling.yaml
  527  kubectl apply -f deploy_rolling.yaml
  528  vim deploy_rolling.yaml
  529  cp deploy_rolling.yaml app.yaml
  530  vim app.yaml
  531  kubectl apply -f app.yaml
  532  vim app.yaml
  533  kubectl apply -f app.yaml
  534  vim app.yaml
  535  kubectl apply -f app.yaml
  536  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O nginx-controller.yaml
  537  vim nginx-controller.yaml
  538  kubectl apply -f nginx-controller.yaml
  539  vim app.yaml
  540  kubectl apply -f app.yaml
  541  vim app.yaml
  542  history
```

## nginx manifest changes

```yaml
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/part-of: ingress-nginx
    app.kubernetes.io/version: 1.3.0
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
    nodePort: 30001   ## new line
    protocol: TCP
    targetPort: http
  - appProtocol: https
    name: https
    port: 443
    protocol: TCP
    targetPort: https
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
    app.kubernetes.io/name: ingress-nginx
  type: NodePort  ## Changed to NodePort
```

## Changes on client side

made changes inside host file: sudo vim /etc/hosts
```
178.124.206.53 app.k8s-XX.sa
```
here XX - last octet of your master