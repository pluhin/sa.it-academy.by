## K8s deployment

My laptop (Chrome) -> /etc/hosts (178.124.206.53  first.k8s-24.sa) -> jump (nginx:178.124.206.53) -> 192.168.203.24:30001 (ingress-controller) -> service -> pod(1..N) -> container

XXXXXX.k8s-XX.sa

Proxy (external)
```
[root@jump ~]# cat /etc/nginx/conf.d/k8s_24.k8s.sa.conf 
## Ansible managed
## SA group cluster
server {
  listen 80;
  listen [::]:80;

  server_name "~^.*\.k8s-24\.sa$";

  location / {
        proxy_set_header Host $host;
        proxy_pass       http://192.168.203.24:30001;
  }
}[root@jump ~]# 

```
---
```bash
10233  cd Documents/git_repos/home/sa.it-academy.by/demo
10234  git pull
10235  mkdir 09.K8s
10236  cd  09.K8s
10237  ssh root@192.168.203.24
10238  vim ~/.kube/config_ec_ws
10239  history| grep 192.168.203.
10240  ssh -L 6443:localhost:6443 root@192.168.203.24 -f -N; export KUBECONFIG=$HOME/.kube/config_ec_ws
10241  env
10242  k9s
10243  kubectl get pods -n --all-namespaces
10244  kubectl get pods --all-namespaces
10245  vim first-app.yaml
10246  kubectl create -f first-app.yaml
10247* kubectl get pods
10248* export KUBECONFIG=$HOME/.kube/config_ec_ws
10249* kubectl get pods
10250* kubectl describe pod webserver-5fbbfb7956-d8mkv
10251* kubectl get pods
10252* vim first-app.yaml
10253* kubectl apply -f first-app.yaml
10254* kubectl get pods
10255* kubectl scale deployment webserver --replicas=10
10256* kubectl get pods
10257* kubectl scale deployment webserver --replicas=0
10258* kubectl get pods
10259* kubectl scale deployment webserver --replicas=2
10260* kubectl get pods
10261* kubectl delete -f first-app.yaml
10262* kubectl get pods
10263* kubectl apply -f first-app.yaml
10264* kubectl get pods
10265* kubectl delete pods webserver-5fbbfb7956-nxc29
10266  kubectl get pods
10267  vim first-app.yaml
10268  kubectl apply -f first-app.yaml
10269  kubectl get services
10270* ssh root@192.168.203.24
10271  kubectl get services
10272* clear
10273  kubectl get pods --all-namespaces
10274  vim first-app.yaml
10275  kubectl apply -f first-app.yaml
10276  kubectl get ingress
10277* vim ingress.yaml
10278* kubectl create -f ingress.yaml
10279* kubectl get pods --all-namespaces
10280  sudo vim  /etc/hosts
10281* kubectl get pods --all-namespaces
10282* kubectl get services
10283* kubectl get services --all-namespaces
10284* clear
10285  sudo vim  /etc/hosts
10286* ec_ssh_jump
10287  kubectl apply -f first-app.yaml
10288  kubectl get pods --all-namespaces
10289  kubectl apply -f first-app.yaml
10290  kubectl get pods --all-namespaces
10291  kubectl get pods
10292  kubectl exec -it webserver-644c47668f-q8dfn bash
10293  echo "cGFzc3dvcmQK" | base64 -d
10294  echo "password" | base64 
10295  kubectl apply -f first-app.yaml
10296  kubectl get pods
10297  kubectl exec -it webserver-57b886cd47-wh828 bash
10298  helm 
10299  mkdir helm_demo
10300  cd helm_demo
10301  helm create demo-app
10302  ls -l
10303  ls -l demo-app
10304  helm package demo-app
10305  ls -l
10306  helm install demo-app demo-app-0.1.0.tgz
10307* sudo vim  /etc/hosts
10308* k9s
10309* sudo vim  /etc/hosts
10310* k9s

```

