

first.k8s-33.sa(browser) -> bastion(nginx) -> |k8s ->  ingress_k8s -> service -> pod(s) -> container

```bash
curl --header "Host: first.k8s-33.sa" 192.168.203.33:30001
```

vim /etc/nginx/conf.d/k8s_33.k8s.sa.conf


```
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-33\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.33:30001;
        proxy_ssl_verify              off;
  }
}
```

vim /etc/hosts
```
178.124.206.53  first.k8s-33.sa
```


## mount 
```bash
   52  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/test/
   53  df - h
   54  df -h
   55  ls -l /mnt/test/
   56  mkdir /mnt/test/sa2-17-21
   57  ls -l /mnt/test/sa2-16-21/
   58  umount /mnt/test 
   59  history 
```
---
```bash
  150  ssh -L 6443:127.0.0.1:6443 root@192.168.203.33 -f -N
  151  kubectl get nodes
  152  vim app.yaml
  153  kubectl create -f app.yaml 
  154  vim app.yaml
  155  kubectl create -f app.yaml 
  156  kubectl apply -f app.yaml 
  157  vim app.yaml
  158  kubectl apply -f app.yaml 
  159  vim ../ingress.yaml 
  160  vim app.yaml
  161  kubectl apply -f app.yaml 
  162  vim app.yaml
  163  kubectl apply -f app.yaml 
  164  vim app.yaml
  165  kubectl apply -f app.yaml 
  166  vim app.yaml
  167  kubectl apply -f app.yaml 
  168  vim app.yaml
  169  cd /tmp
  170  chmod 700 get_helm.sh
  171  ./get_helm.sh 
  172  cd -
  173  helm --version
  174  helm version
  175  mkdir helm_demo
  176  cd helm_demo/
  177  helm create demo-app
  178  ls -l 
  179  ls -l demo-app/
  180  vim demo-app/templates/ingress.yaml 
  181  vim demo-app/values.yaml 
  182  vim ../app.yaml 
  183  vim demo-app/values.yaml 
  184  helm package demo-app
  185  sl -l
  186  ls -l 
  187  vim demo-app/Chart.yaml 
  188  helm install demo-app demo-app-0.1.0.tgz 
  189  helm uninstall demo-app
  190  rm demo-app-0.1.0.tgz 
  191  vim demo-app/values.yaml 
  192  helm package demo-app
  193  helm install demo-app demo-app-0.1.0.tgz 
  194  cd ../
  195  history 
```
