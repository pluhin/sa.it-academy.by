# K8s

browser(app.k8s-35.sa) => /etc/hosts => 178.124.206.53 (nginx) => 192.168.203.35-36:30001 -> ingress-controller -> service -> pod (container)

## History

```bash
  546  k9s
  547  killall ssh
  548  k9s
  549  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.35 -f -N
  550  k9s
  551  cd ../
  552  mkdir 12.K8s
  553  cd 12.K8s/
  554  ls -l
  555  vim pods_live.yaml
  556  kubectl apply -f pods_live.yaml
  557  kubectl get pods
  558  kubectl logs pod-exec

  572  cd -
  573  cd 12.K8s/
  574  kubectl logs pod-exec
  575  cd 12.K8s/
  576  kubectl logs pod-exec
  577  vim pods_live.yaml
  578  kubectl delete -f pods_live.yaml
  579  mv pods_live.yaml pods_exec.yaml
  580  vim pods_live.yaml
  581  kubectl apply -f pods_live.yaml
  582  kubectl describe pod liveness-exec
  583  kubectl delete -f pods_live.yaml
  584  vim deploy_rolling.yaml
  585  kubectl apply -f deploy_rolling.yaml
  586  vim deploy_rolling.yaml
  587  kubectl apply -f deploy_rolling.yaml
  588  vim deploy_rolling.yaml
  589  kubectl apply -f deploy_rolling.yaml
  590  vim deploy_rolling.yaml
  591  kubectl apply -f deploy_rolling.yaml
  592  vim deploy_rolling.yaml
  593  cp deploy_rolling.yaml app.yaml
  594  vim app.yaml
  595  kubectl apply -f app.yaml
  596  kubectl exec webserver-67c89f996-44s2h -it -- bash
  597  vim app.yaml
  598  kubectl apply -f app.yaml
  599  vim app.yaml
  600  kubectl apply -f app.yaml
  601  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O nginx-controller.yaml
  602  ls -l
  603  vim nginx-controller.yaml
  604  kubectl apply -f nginx-controller.yaml
  605  vim nginx-controller.yaml
  606  vim app.yaml
  607  kubectl apply -f app.yaml
  608  vim nginx-controller.yaml
  609  kubectl apply -f nginx-controller.yaml
  610  vim app.yaml
  611  kubectl apply -f app.yaml
  612  vim app.yaml
  613  kubectl apply -f app.yaml
  614  vim app.yaml
  615  history
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
178.124.206.53 app.k8s-XX.sa app.k8s-XY.sa
```
here XX - last octet of your master, XY last octet of your node