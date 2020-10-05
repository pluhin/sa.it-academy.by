```bash
10234  mkdir 09.K9s
10235  cd 09.K9s
10236  vim app.yaml
10237  tun_k8s_ec_api_ws
10238  history| grep localhost
10239  ssh -L 6443:localhost:6443 root@192.168.201.22 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10240  ps aux | grep localhost
10241  kill -9 483053 573914
10242  ps aux | grep localhost
10243  ssh -L 6443:localhost:6443 root@192.168.201.22 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10244  kubectl get nodes 
10245  kubectl get pods
10246  ls
10247  kubectl create -f app.yaml
10248  k9s
10249  kubectl delete -f app.yaml
10250  kubectl create -f app.yaml
10251  k9s
10252  pwd
10253* cd /home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/09.K9s
10254* clear
10255  k9s
10256* kubectl apply -f app.yaml
10257* pwd
10258* ls
10259* history
10260* export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
10261* kubectl apply -f app.yaml
10262* ssh root@192.168.201.22
10263* ec_ssh_jump
10264* kubectl apply -f ingress.yaml
10265* kubectl apply -f app.yaml
10266* sudo vim /etc/hosts
10267* ec_ssh_jump
10268* sudo vim /etc/hosts
10269* ec_ssh_jump
10270* ssh root@192.168.201.22
10271* kubectl apply -f app.yaml
10272* echo "test_pass" | base64
10273* echo "dGVzdF9wYXNzCg==" | base64 -d
10274* kubectl apply -f app.yaml
10275* mkdir helm
10276* cd helm
10277* helm repo list
10278* helm create demo-app
10279* ls -l
10280* ls demo-app
10281* sudo vim /etc/hosts
10282* helm package demo-app
10283* helm install demo-app demo-app-0.1.0.tgz
10284* helm uninstall demo-app
10285* helm package demo-app
10286* helm install demo-app demo-app-0.1.0.tgz
10287* helm uninstall demo-app
10288* helm package demo-app
10289* helm install demo-app demo-app-0.1.0.tgz
```