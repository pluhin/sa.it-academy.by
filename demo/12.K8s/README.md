## History

```bash
 605  mkdir 12.K8s
  606  cd 12.K8s/
  607  k9s
  608  vim pod_exec.yaml
  609  kubectl apply -f pod_exec.yaml
  610  vim pod_exec.yaml
  611  kubectl apply -f pod_exec.yaml
  612  kubectl delete -f pod_exec.yaml
  613  vim pod_live.yaml
  614  kubectl apply -f pod_live.yaml
  615  vim pod_live.yaml
  616  kubectl delete -f pod_live.yaml
  617  clear
  618  vim deployment.yaml
  619  kubectl apply -f deployment.yaml
  620  vim deployment.yaml
  621  kubectl apply -f deployment.yaml
  622  vim deployment.yaml
  623  kubectl delete -f deployment.yaml
  624  vim app.yaml
  625  kubectl apply -f app.yaml
  626  vim app.yaml
  627  kubectl apply -f pod_live.yaml
  628  vim pod_live.yaml
  629  kubectl delete -f pod_live.yaml
  630  curl -L https://istio.io/downloadIstio | sh -
  631  ls
  632  cd istio-1.31.1/
  633  sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl
  634  istioctl version
  635  istioctl x precheck
  636  kubectl create namespace istio-system 2>/dev/null || true
  637  istioctl install -y --set profile=demo
  638  istioctl verify-install
  639  istioctl help
  640  kubectl label ns default istio-injection=enabled --overwrite
  641  cd ../
  642  rm istio-1.31.1 -rf
  643  vim istio-gw-vs.yaml
  644  kubectl apply -f istio-gw-vs.yaml
  645  vim istio-gw-vs.yaml
  646  history
```


chrome -> /etc/hosts (178.124.206.53 app.k8s-9.sa app.k8s-10.sa) -> 178.124.206.53:80 -> k8s (istio-ingress controller):30001 -> Gateway/VirtualService -> service:80 -> IstionSideCar -> pod:80

## Bastion nginx config


```
server {
  listen 80;
  listen [::]:80;
  server_name "~^.*\.k8s-(\d+)\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
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

---
## Install istioctl

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl
istioctl version
```

## Install istio

```bash
istioctl x precheck
kubectl create namespace istio-system 2>/dev/null || true
istioctl install -y --set profile=demo
```

check

```bash
kubectl get pods -n istio-system
istioctl version
```
-----

## Enable istio in NS default

```bash
kubectl label ns default istio-injection=enabled --overwrite
kubectl rollout restart deploy -n default
```

## Add Gateway and VS

- need to chnage nodePort for istio ingress controller
  - Namespace: istio-system
  - Service: istio-ingressgateway

```yaml
  ports:
  - name: status-port
    nodePort: 31081
    port: 15021
    protocol: TCP
    targetPort: 15021
  - name: http2
    nodePort: 30001    #<---- here
    port: 80
    protocol: TCP
    targetPort: 8080
  - name: https
    nodePort: 31178
    port: 443
    protocol: TCP
```