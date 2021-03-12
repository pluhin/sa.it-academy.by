## minikube

[Local](
http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default)

[Vagrant](http://192.168.1.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/error?namespace=kube-system)

```bash
10197  cd demo
10198  ls
10199  mkdir 07.K8s 
10200  cd  07.K8s
10201  mkdir minikube
10202  cd  minikube
10203  ls
10204* minikube start
10205* cd ~
10206* mc 
10207* cp .kube ./
10208* cp .kube/config ./
10209* ls
10210  top
10211* minikube stop
10212* minikube start
10213  vim Vagrantfile
10214  vagrant up
10215* minikube ssh 
10216* minikube addons list
10217* minikube addons enable dashboard
10218* minikube addons list
10219* kubectl get nodes
10220* kubectl get pods
10221* kubectl get pods -n kube-system
10222* kubectl proxy --address='0.0.0.0' --disable-filter=true &
10223* kubectl get pods --all-namespaces
10224* kubectl get pods -n kube-system
10225* kubectl get nodes
10226* vim .kube/config
10227* vim ~/.kube/config
10228* kubectl config use-context list
10229* kubectl config use-context --help
10230* kubectl config list
10231* kubectl config -h
10232* kubectl config view
10233* kubectl config use-context lab-ecx
10234* kubectl get nodes
10235* vl
10236* kubectl get nodes
10237* kubectl config use-context minikube
10238* kubectl get nodes
10239* kubectl get pods -n kube-system
10240* kubectl get pods -n kubernetes-dashboard
10241* minikube stop
10242* ps aux | grep proxy
10243* ps aux | grep "kubectl proxy"
10244* kill 617669
10245* minikube stop
10246* minikube delete
10247  vagrant halt && vagrant destroy -f
10248* ssh jump_sa@178.124.206.53
10249* ssh-keygen -f new_key
10250* ls -l
10251* ls -l ~/.ssh
10252* ssh-copy-id jump_sa@178.124.206.53 --help
10253* ssh-copy-id jump_sa@178.124.206.53 -i new_key.pub
10254* ssh-copy-id -i new_key.pub jump_sa@178.124.206.53
10255* vim ~/.ssh/config
10256* ssh root@192.168.203.24
10257* ssh-copy-id root@192.168.203.24
10258* ssh-copy-id root@192.168.203.25
10259* ssh root@192.168.203.24
10260* ssh root@192.168.203.25
10261* cd ~
10262* cd BK
10263* ls
10264* git clone git@github.com:kubernetes-sigs/kubespray.git
10265* cd kubespray
10266* ansible --version
10267* cp -rfp inventory/sample inventory/ws
10268* vim inventory/ws/inventory.ini
10269* declare -a IPS=(192.168.203.24 192.168.203.25)
10270* echo $IPS
10271* CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
10272* CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
10273* vim inventory/ws/hosts.yaml
10274* ansible-playbook -i inventory/ws/hosts.yaml  -u root cluster.yml
10275  ssh root@192.168.203.24


```

---

## Minikube in EC
```
user@debian10:~$ history 
    1  su - root
    2  su -i
    3  su - root
    4  usermod -aG docker $USER
    5  sudo usermod -aG docker $USER
    6  minikube start
    7  minikube service list
    8  minikube plugin list
    9  minikube addons list
   10  minikube addons enable dashboard
   11  kubectl proxy --address='0.0.0.0' --disable-filter=true &
   12  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   13  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   14  kubectl proxy --address='0.0.0.0' --disable-filter=true &
   15  links http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default
   16  crul -s http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default
   17  curl -s http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default
   18  curl -s http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#
   19  links http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#
   20  curl -s http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#

```

```bash
   41  apt install minikube
   42  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
   43  apt install curl
   44  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
   45  rpm -ivh minikube-latest.x86_64.rpm
   46  rpm -ivh minikube-latest.x86_64.rpm
   47  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
   48  dpkg -i minikube_latest_amd64.deb
   49  minikube start
   50  sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   51  apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   52  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   53  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   54  apt update
   55  apt-get install     apt-transport-https     ca-certificates     curl     gnupg     lsb-release
   56  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   57   echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
   58    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   59   echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
   60    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
   61  apt update
   62  apt-get install docker-ce docker-ce-cli containerd.io
   63  docker run hello-world
   64  minikube start
   65  minikube start --driver=docker
   66  usermod -aG docker $USER
   67  minikube start --driver=docker
   68  useradd user
   69  su - user
   70  usermod -aG docker user
   71  su - user
   72  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   73  install -o root -g root -m 0755 /home/user/kubectl /usr/local/bin/kubectl
   74  su - user
   75  apt install links
   76  links http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default
   77  su - user
   78  history 

```
