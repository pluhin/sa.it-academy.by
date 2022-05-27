# K8s

## HTTP flow

browser(app.k8s-57.sa) -> /etc/hosts -> 178.124.206.53 (nginx) -> 192.168.203.57:3001 -> ingress-controller -> app service -> pod

```bash
  482  kubectl get ns
  483  clear
  484  mkdir first_deploy
  485  cd first_deploy/
  486  ls
  487  vim app.yaml
  488  kubectl apply -f app.yaml
  489  kubectl describe webserver-6d984cf5db-47xz6
  490  kubectl describe pod webserver-6d984cf5db-47xz6
  491  kubectl get pods
  492  kubectl get deploy
  493  kubectl scale deployment webserver --replicas=0
  494  kubectl get deploy
  495  kubectl scale deployment webserver --replicas=4
  496  kubectl delete -f app.yaml
  497  kubectl get deploy
  498  kubectl apply -f app.yaml
  499  vim app.yaml
  500  kubectl apply -f app.yaml
  501  kubectl edit deployment/webserver
  502  kubectl exec -it webserver-5f8dc4d7cd-vnq5r bash
  503  vim app.yaml
  504  kubectl apply -f app.yaml
  505  vim app.yaml
  506  kubectl apply -f app.yaml
  507  vim app.yaml
  508  kubectl apply -f app.yaml
  509  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/1.23/deploy.yaml -O nginx-controller.yaml
  510  ls
  511  vim nginx-controller.yaml
  512  kubectl apply -f nginx-controller.yaml
  513  vim app.yaml
  514  kubectl apply -f app.yaml
  515  vim app.yaml
  516  kubectl apply -f app.yaml
  517  vim app.yaml
  518  kubectl apply -f app.yaml
  519  vim app.yaml
  520  kubectl apply -f app.yaml
  521  vim app.yaml
  522  history
```

## Changes on client side

made changes inside host file: sudo vim /etc/hosts

```
178.124.206.53 app.k8s-XX.sa app.k8s-XY.sa
```

here XX - last octet of your master, XY last octet of your node

## Work with NFS on k8s node

```bash
   44  mkdir /mnt/test
   45  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/test/
   46  df -h
   47  ls
   48  ls /mnt/test/
   49  mkdir -p /mnt/test/sa2-20-22/demo_app
   50  vim /mnt/test/sa2-20-22/demo_app/index.php
   51  history
```