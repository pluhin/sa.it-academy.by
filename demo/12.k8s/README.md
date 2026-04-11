
```bash
 590  curl -L https://istio.io/downloadIstio | sh -
  591  cd istio-*
  592  sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl
  593  cd../
  594  cd ../
  595  rm istio-1.29.0 -rf
  596  istioctl version
  597  kubectl config use-context k8s
  598  istioctl version
  599  afsdfdsf
  600  istioctl x precheck
  601  kubectl create namespace istio-system 2>/dev/null || true
  602  istioctl install -y --set profile=demo
  603  kubectl label ns default istio-injection=enabled --overwrite
  604  kubectl rollout restart deploy -n default
  605  vim istio-enable.yaml
  606  kubectl apply -f  istio-enable.yaml
  607  k9s --headless
  608  cd 11.K8s/
  609  ls
  610  cd ../
  611  mkdir 12.k8s
  612  cd 12.k8s/
  613  cp ../11.K8s/app.yaml ./
  614  la
  615  vim app.yaml
  616  kubectl apply -f app.yaml
  617  vim app.yaml
  618  kubectl apply -f app.yaml
  619  vim app.yaml
  620  kubectl apply -f app.yaml
  621  vim app.yaml
  622  kubectl apply -f app.yaml
  623  vim app.yaml
  624  vim kustomization.yaml
  625  vim namespace.yaml
  626  vim patch_nfs_details.yaml
  627  kubectl apply -k .
  628  vim app.yaml
  629  kubectl apply -f app.yaml
  630  vim app.yaml
  631  kubectl apply -f app.yaml
  632  vim app.yaml
  633  vim patch_nfs_details.yaml
  634  vim storage_class_app.yaml
  635  kubectl apply -f storage_class_app.yaml
  636  vim app.yaml
  637  kubectl apply -f app.yaml
  638  vim init_secret.yaml
  639  echo "cGFzcw==" | base64 -d
  640  echo -n "pass" | base64
  641  kubectl apply -f init_secret.yaml
  642  vim app.yaml
  643  kubectl apply -f app.yaml
  644  vim init_secret.yaml
  645  kubectl delete -f init_secret.yaml
  646  kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.36.0/controller.yaml
  647  curl -OL "https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.36.0/kubeseal-0.36.0-linux-amd64.tar.gz"
  648  tar -xvzf kubeseal-0.36.0-linux-amd64.tar.gz kubeseal
  649  sudo install -m 755 kubeseal /usr/local/bin/kubeseal
  650  kubeseal
  651  cat init_secret.yaml | kubeseal --format yaml > sealed_secret.yaml
  652  vim sealed_secret.yaml
  653  kubectl apply -f sealed_secret.yaml
  654  vim sealed_secret.yaml
  655  history
```

---
## Install istioctl

```bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
sudo install -m 0755 bin/istioctl /usr/local/bin/istioctl

istioctl version
Istio is not present in the cluster: no running Istio pods in namespace "istio-system"
client version: 1.29.0
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
istioctl verify-install
istioctl version
```
-----

## Enable istio in NS default

```bash
kubectl label ns default istio-injection=enabled --overwrite
kubectl rollout restart deploy -n default
```

## Add Gateway and VS

- you can disable ingress controller or chnage port 30001 -> any another
- need to chnage nodePort for istio ingress controller

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



```yaml
---
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: simple-web-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - app.k8s-9.sa
        - app.k8s-10.sa
---
apiVersion: networking.istio.io/v1beta1
kind: VirtualService
metadata:
  name: simple-web-vs
  namespace: default
spec:
  hosts:
    - app.k8s-9.sa
    - app.k8s-10.sa
  gateways:
    - simple-web-gateway
  http:
    - match:
        - uri:
            prefix: /
      route:
        - destination:
            host: simple-web-service
            port:
              number: 80
```

and apply

```bash
kubectl apply -f istio-gw-vs.yaml
```

