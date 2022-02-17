# First deployment

## Ingress flow
browser: app.k8s-23.sa ( client `hosts` file ) -> internet -> bastion(nginx) ->  192.168.203.23:30001 -> ingress controller -> service -> pod

## History

```bash
   84  sshuttle -r ec_bastion 192.168.0.0/16 &
   85  ku
   86  kubectl get config
   87  kubectl get nodes
   88  ls
   89  mkdir first_deploy
   90  cd first_deploy/
   91  vim app.yaml
   92  kubectl get deployment
   93  kubectl get pods
   94  vim app.yaml
   95  kubectl apply -f app.yaml
   96  kubectl get deployment
   97  kubectl get pods
   98  kubectl get ns
   99  kubectl delete -f app.yaml
  100  kubectl apply -f app.yaml
  101  kubectl get pods
  102  kubectl describe pod webserver-6d984cf5db-bg55d
  103  kubectl get deployment
  104  kubectl edit deployment/webserver
  105  kubectl scale deployment webserver --replicas=0
  106  kubectl scale deployment webserver --replicas=4
  107  kubectl apply -f app.yaml
  108  vim app.yaml
  109  clear
  110  kubectl apply -f app.yaml
  111  kubectl get pods
  112  kubectl exec -it webserver-6d984cf5db-594nr --- bash
  113  kubectl exec -it webserver-6d984cf5db-594nr -- bash
  114  clear
  115  ls
  116  wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml -O ingress-controller.yaml
  117  ls
  118  vim ingress-controller.yaml
  119  kubectl apply -f ingress-controller.yaml
  120  vim app.yaml
  121  ping 192.168.203.23
  122  curl --header "Host: app.k8s-22.sa" 192.168.203.23
  123  kubectl apply -f app.yaml
  124  curl --header "Host: app.k8s-22.sa" 192.168.203.23
  125  curl --header "Host: app.k8s-23.sa" 192.168.203.23
  126  curl --header "Host: app.k8s-23.sa" 192.168.203.24
  127  vim app.yaml
  128  kubectl apply -f app.yaml
  129  vim app.yaml
  130  kubectl apply -f app.yaml
  131  vim app.yaml
  132  kubectl apply -f app.yaml
  133  cd ../
  134  cp -r first_deploy/ /vagrant/
  135  history
```


## Changes on client side

made changes inside host file: `sudo vim /etc/hosts`

```
178.124.206.53 app.k8s-XX.sa app.k8s-XY.sa
```

where XX - last octet of your master, XY last octet of your node


## Work with NFS on k8s node

```bash
   44  mkdir /mnt/test
   45  mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/test/
   46  df -h
   47  ls -l /mnt/test/
   ...
   50  mkdir /mnt/test/sa2-19-22
   51  mkdir /mnt/test/sa2-19-22/app
   52  vim /mnt/test/sa2-19-22/app/index.php
   53  history
```