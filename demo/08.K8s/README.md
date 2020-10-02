
```
 9932  mkdir 08.K8s
 9933  cd 08.K8s
 9934  ssh root@192.168.201.22
 9935  cd ~
 9936  kubectl version --client\n
 9937  vim .kube/config_ec_ws
 9938  ls -l .kube/config_ec_ws
 9939  ssh root@192.168.201.22
 9940  vim .kube/config_ec_ws
 9941  ssh -L 6443:localhost:6443 root@192.168.201.22 -f -N; export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_ec_ws
 9942  kubectl get nodes
 9943  ps aux | grep localhost
 9944  vim .bashrc
 9945  vim .kube/config_ec_ws
 9946  kubectl get nodes
 9947  ssh root@192.168.201.12
 9948  ls .kube 
 9949  ls -l 
 9950  ls -la 
 9951  vim .kube/config
 9952  evn
 9953  env
 9954  env | grep KUBE
 9955  kubectl get nodes
 9956  kubectl get pods --all-namespaces
 9957  curl https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/\#/login
 9958  sudo apt install links
 9959  links https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login
 9960  vim anon_access.yaml
 9961  kube create -f anon_access.yaml
 9962  kubectl create -f anon_access.yaml
 9963  history
 9964  ls
 9965  links https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/\#/login
 9966  kubectl get secrets
 9967  kubectl create serviceaccount dashboard-admin-sa
 9968  kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
 9969  kubectl get secrets
 9970  kubectl describe secret dashboard-admin-sa-token-qqd28
 9971  cd /tmp 
 9972  git clone git@github.com:derailed/k9s.git
 9973  cd k9s
 9974  make build && ./execs/k9s
 9975  kubectl get secrets
 9976  vim /etc/environment
 9977  k9s
 9978  ls
 9979  vim metric-server.yaml
 9980  kubectl create -f metric-server.yaml
 9981  vim ksm.yaml
 9982  kubectl create -f ksm.yaml
 9983  kubectl create namespace monitoring
 9984  kubectl create -f ksm.yaml
 9985  histp
 9986  history
 9987  k9s
 9988  ssh root@192.168.202.13
 9989  vim ~/.ssh/config
 9990  ssh root@192.168.202.13
 9991  l
 9992  history | grep sa.k8s.nodes.yaml
 9993  ansible-playbook -i inv/inventory.yaml sa.k8s.nodes.yaml -e "start_counter=2 finish_counter=15 vm_target=k3s parent_host='701'" --ask-vault-pass -t create
 9994  sudo curl -sfL https://get.k3s.io | sh -
 9995  kubectl get nodes
 9996  kubectl get node
 9997  sh /usr/local/bin/k3s-uninstall.sh
 9998  sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig ~/.kube/config_k3s" sh - 
 9999  vim ~/.kube/config_k3s
10000  sudo -i
10001  kubectl get nodes
10002  vim ~/.kube/config
10003  cd ~/.kube/
10004  mv config config_old
10005  kubectl get nodes
10006  sh /usr/local/bin/k3s-uninstall.sh
10007  sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig ~/.kube/config_k3s" sh - 
10008  systemctl status k3s.service
10009  ps aux | grep 6443
10010  kill -9 233042
10011  sh /usr/local/bin/k3s-uninstall.sh
10012  sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig ~/.kube/config_k3s" sh - 
10013  kubectl get nodes
10014  ls
10015  history| grep KUBE
10016  export  KUBECONFIG=$KUBECONFIG:$HOME/.kube/config_k3s
10017  kubectl get nodes
10018  chown spishchyk:spishchyk config_k3s
10019  sudo chown spishchyk:spishchyk config_k3s
10020  kubectl get nodes
10021  sh /usr/local/bin/k3s-uninstall.sh

```
