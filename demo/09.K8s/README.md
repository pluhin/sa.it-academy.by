

Chrome -> hosts -> jump_server -> node(1,2) -> nginx(ingress) -> service -> pod (container)

## NFS
mount -t nfs -o rw 192.168.37.105:/mnt/IT-Academy/nfs-data /mnt/nfs


```bash

10106  cd demo
10107  ls
10108  mkdir 09.K8s
10109  cd 09.K8s
10110  ls
10111  history | grep localhost
10112  ssh -L 6443:localhost:6443 root@192.168.203.21 -f -N; export KUBECONFIG=$HOME/.kube/config_ec_ws
10113  kubectl get pods
10114  kubectl get pods --all-namespaces  
10115  ls
10116  kubectl create -f app_simple.yaml
10117  kubectl get pods
10118* export KUBECONFIG=$HOME/.kube/config_ec_ws
10119* k9s
10120  kubectl exec -it webserver-5fbbfb7956-45vbh bash
10121  kubectl  get deployments.apps
10122  kubectl scale deployment webserver --replicas=0
10123  kubectl scale deployment webserver --replicas=10
10124  kubectl scale deployment webserver --replicas=8
10125  kubectl apply -f app_simple.yaml
10126  kubecly get services
10127  kubectl get services
10128  kubectl apply -f ingress.yaml
10129* k9s
10130  ec_ssh_jump
10131* sudo vim /etc/hosts
10132  kubectl apply -f app_simple.yaml
10133* sudo vim /etc/hosts
10134  history
10135* ssh root@192.168.203.21
10136  kubectl apply -f app_simple.yaml
10137  kubectl delete -f app_simple.yaml
10138  kubectl apply -f app_simple.yaml
10139  echo "password" | base64
10140  kubectl apply -f app_simple.yaml
10141  history| grep replica
10142  kubectl scale deployment webserver --replicas=2
10143  kubectl apply -f app_simple.yaml
10144  mkdir helm_demo
10145  cd helm_demo
10146  cd ../
10147  kubectl delete -f app_simple.yaml
10148  clear
10149  cd helm_demo
10150  helm create demo-app
10151  ls
10152  helm package demo-app
10153  ls -l
10154  helm install demo-app demo-app-0.1.0.tgz
10155  helm uninstall demo-app

```