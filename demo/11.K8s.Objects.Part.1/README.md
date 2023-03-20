
Browser (laptop) -> hosts -> jump_host -> ingress controller -> service -> pod


```nginx
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

c:\Windows\System32\Drivers\etc\hosts
```
178.124.206.53 app-alias.k8s-XX.sa app.k8s-XX.sa
```

## History

```
  624  ssh root@192.168.203.20  -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53"
  625  k9s
  626  cd /vagrant/11.K8s.Objects.Part.1/
  627  ls
  628  vim pod_exec.yaml
  629  kubectl get ns
  630  kubectl apply -f pod_exec.yaml
  631*
  632  kubectl delete -f pod_exec.yaml
  633  vim pod_live.yaml
  634  kubectl apply -f pod_live.yaml
  635* kubectl delete -f pod_live.yaml
  636  vim deploy_rolling.yaml
  637  kubectl apply -f deploy_rolling.yaml
  638  vim deploy_rolling.yaml
  639  kubectl apply -f deploy_rolling.yaml
  640  vim deploy_rolling.yaml
  641  kubectl apply -f deploy_rolling.yaml
  642  vim deploy_rolling.yaml
  643  kubectl apply -f deploy_rolling.yaml
  644  vim deploy_rolling.yaml
  645  kubectl apply -f deploy_rolling.yaml
  646  vim deploy_rolling.yaml
  647  kubectl apply -f deploy_rolling.yaml
  648  vim deploy_rolling.yaml
  649  kubectl delete -f deploy_rolling.yaml
  650  kubectl create ns test
  651  kubectl get ns
  652  kubectl apply -f deploy_rolling.yaml -n test
  653  kubectl get pods
  654  kubectl get pods -n test
  655  kubectl get pods -A
  656  kubectl get pods -A | grep
  657  kubectl delete ns test
  658  vim app.yaml
  659  kubectl apply -f app.yaml
  660  kubectl get svc simple-web-service
  661  kubectl get svc simple-web-service -o yaml
  662  vim app.yaml
  663  kubectl apply -f app.yaml
  664  vim app.yaml
  665  kubectl apply -f app.yaml
  666  kubectl exec -it ubuntu -- bash
  667  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml
  668  kubectl exec -it ubuntu -- bash
  669  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  670  vim ingress-controller.yaml
  671  kubectl apply -f ingress-controller.yaml
  672  kubectl exec -it ubuntu -- bash
  673  vim app.yaml
  674  kubectl apply -f app.yaml
  675  kubectl exec -it ubuntu -- bash
  676  vim pod_exec.yaml
  677  history
```

## Changes in ingress service

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