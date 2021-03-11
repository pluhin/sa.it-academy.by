
User:

```
    1  top
    2  kubectl 
    3  kubectl --version
    4  kubectl varsion
    5  kubectl version
    6  ssh-copy-id root@192.168.1.24
    7  ssh-copy-id root@192.168.203.24
    8  ssh-copy-id root@192.168.203.25
    9  ssh root@192.168.203.24
   10  vat .ssh/config 
   11  cat .ssh/config 
   12  ssh root@192.168.203.24
   13  ls -la
   14  mkdir .kube
   15  vim .kube/config
   16  scp root@192.168.203.24:/root/kube/config .kube/config 
   17  scp root@192.168.203.24:/root/.kube/config .kube/config 
   18  pwd
   19  vim .kube/config 
   20  ssh -L 6443:127.0.0.1:6443 root@192.168.203.24 -f -N
   21  kubectl get nodes
   22  vim .kube/config 
   23  netstat ant | grep 6443
   24  netstat anpt | grep 6443
   25  netstat -anpt | grep 6443
   26  clear
   27  pwd
   28  ls -la
   29  ls -la .kube/config 
   30  ps aux | grep 6443
   31  kubectl get pods --all-namespaces
   32  curl -s https://127.0.0.1:6443/api/vi1
   33  curl -s https://127.0.0.1:6443/api/vi
   34  curl -s https://127.0.0.1:6443/api/v1/
   35  curl https://127.0.0.1:6443/api/v1/
   36  curl https://127.0.0.1:6443/api/
   37  curl -k https://127.0.0.1:6443/api/v1
   38  kubectl get pods --all-namespaces
   39  kubectl get pods
   40  history 
   41  curl -k https://127.0.0.1:6443/api/v1
   42  vim dashboard.yaml
   43  ls -l
   44  vim dashboard.yaml
   45  kubectl create -f dashboard.yaml 
   46  clear
   47  kubectl get pods --all-namespaces
   48  vim dashboard.yaml
   49  curl -k https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#/login
   50  kubectl get services -n kube-system
   51  kubectl describe servoce kubernetes-dashboard 
   52  kubectl describe service kubernetes-dashboard 
   53  kubectl describe service kubernetes-dashboard  -n kube-system
   54  kubectl delete -f dashboard.yaml 
   55  kubectl create -f dashboard.yaml 
   56  kubectl get pods --all-namespaces
   57  wget https://golang.org/dl/go1.16.1.linux-amd64.tar.gz
   58  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.1.linux-amd64.tar.gz
   59  go version
   60  env | grep PATH
   61  ls
   62  git clone https://github.com/derailed/k9s.git
   63  cd k9s/
   64  make build && ./execs/k9s
   65  env | grep PATH
   66  cp ./execs/k9s  /usr/local/bin
   67  history 
   68  k9s
   69  vim ksm.yaml
   70  ls -l
   71  kubectl create -f ksm.yaml 
   72  vim ms.yaml
   73  kubectl create -f ms.yaml 
   74  k9s
   75  history 

```
---

Root

```
root@ubuntu-bionic:/home/user# history 
    1  su - user
    2  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.1.linux-amd64.tar.gz
    3  su - user
    4  cd /home/user/
    5  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.1.linux-amd64.tar.gz
    6  go version
    7  vim /etc/profile
    8  source /etc/profile
    9  go --version
   10  go version
   11  su - user
   12  cp /home/user/k9s/execs/k9s  /usr/local/bin/
   13  ls -l /usr/local/bin/k9s
   14  su - user
   15  history 

```