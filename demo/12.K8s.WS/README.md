

```bash
    1  ls -la
    2  ls -la .ssh/
    3  ssh-keygen 
    4  ssh-copy-id jump_sa@178.124.206.53
    5  vim .ssh/config
    6  ssh root@192.168.203.33
    7  ssh-copy-id root@192.168.203.33
    8  apt-get -qq update && apt-get install -qqy apt-transport-https conntrack
    9  sudo apt-get -qq update && sudo  apt-get install -qqy apt-transport-https conntrack
   10  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
   11  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
   12  sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubectl.list
   13  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubectl.list
   14  sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubectl.list
   15  vim  /etc/apt/sources.list.d/kubectl.list
   16  sudo vim /etc/apt/sources.list.d/kubectl.list
   17  sudo apt update
   18  sudo apt install kubectl
   19  ls -la
   20  kubectl version
   21  mkdir .kube
   22  ls -la
   23  scp root@192.168.203.33:/root/.kube/config ~/.kube/
   24  ls -l .kube/config 
   25  kubectl get nodes
   26  ssh -L 6443:127.0.0.1:6443 root@192.168.203.33 -f -N
   27  telnet 127.0.0.1 6443
   28  kubectl get nodes
   29  vim .kube/config 
   30  kubectl get pods --all-namespaces
   31  ls
   32  vim dashboard.yaml
   33  kubectl create -f dashboard.yaml 
   34  kubectl get pods --all-namespaces
   35  vim dashboard.yaml
   36  kubectl get pods --all-namespaces
   37  kubectl get services
   38  kubectl get services --all-namespaces
   39  vim dashboard.yaml
   40  kubectl create -f dashboard.yaml 
   41  kubectl apply  -f dashboard.yaml 
   42  kubectl get ingress --all-namespaces
   43  kubectl delete ingress kubernetes-dashboard
   44  vim dashboard.yaml
   45  kubectl apply  -f dashboard.yaml 
   46  kubectl get ingress --all-namespaces
   47  vim dashboard.yaml
   48  kubectl apply  -f dashboard.yaml 
   49  kubectl get ingress --all-namespaces
   50  kubectl apply  -f dashboard.yaml 
   51  vim dashboard.yaml
   52  kubectl apply  -f dashboard.yaml 
   53  vim dashboard.yaml
   54  kubectl apply  -f dashboard.yaml 
   55  kubectl get ingress --all-namespaces
   56  vim dashboard.yaml
   57  kubectl apply  -f dashboard.yaml 
   58  kubectl get ingress --all-namespaces
   59  kubectl get services --all-namespaces
   60  vim ingress.yaml
   61  kubectl apply -f ingress.yaml
   62  kubectl get services --all-namespaces
   63  kubectl get ingress --all-namespaces
   64  ls -l
   65  kubectl delete ingress kubernetes-dashboard
   66  kubectl delete ingress kubernetes-dashboard -n kube-system
   67  kubectl apply  -f dashboard.yaml 
   68  kubectl get ingress --all-namespaces
   69  kubectl delete  -f dashboard.yaml 
   70  kubectl apply  -f dashboard.yaml 
   71  kubectl get ingress --all-namespaces
   72  vim dashboard.yaml 
   73  kubectl apply  -f dashboard.yaml 
   74  kubectl get ingress --all-namespaces
   75  kubectl get pods
   76  kubectl get pods --all-namespaces
   77  kubectl get secrets
   78  kubectl get secrets --all-namespaces
   79  kubectl describe secret admin-user-token-5bcvs -n kube-system
   80  vim dashboard.yaml 
   81  kubectl get secret -n kube-system $(kubectl get serviceaccount admin-user -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode > token_adm.txt
   82  cat token_adm.txt 
   83  kubectl create serviceaccount dashboard-admin-sa
   84  kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
   85  kubectl get secrets
   86  kubectl describe secret dashboard-admin-sa-token-6s7bt
   87  kubectl get secret -n kube-system $(kubectl get serviceaccount admin-user -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode > token_adm.txt
   88  kubectl get certs -n kube-system
   89  kubectl get certs --all-namesapces
   90  kubectl get certs --all-namespaces
   91  history 
   92  kubectl describe secret dashboard-admin-sa-token-6s7bt
   93  kubectl get secret -n kube-system $(kubectl get serviceaccount admin-user -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" | base64 --decode > token_adm.txt
   94  cat token_adm.txt 
   95  history 
   96  wget
   97  wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz
   98  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz
   99  sudo rm -rf /usr/local/go && sudo  tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz
  100  export PATH=$PATH:/usr/local/go/bin
  101  go version
  102  git clone https://github.com/derailed/k9s.git
  103  cd k9s/
  104  make build 
  105  sudo apt install gcc
  106  make build 
  107  sudo apt install make
  108  make build 
  109  echo $PATH
  110  sudo cp execs/k9s /usr/local/bin/
  111  whereis k9s
  112  k9s
  113  history 
  114  cd ../
  115  ls
  116  vim metric-server.yaml
  117  kubectl create -f metric-server.yaml 
  118  k9s
  119  history 

```