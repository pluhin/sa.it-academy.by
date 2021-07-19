
[Remote](http://192.168.50.201:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/error?namespace=default)
[local](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/error?namespace=default)

## Minikube local 

```bash
10041  cd ~/Documents/git_repos/home/sa.it-academy.by/demo
10042  git pull
10043  clear
10044  cd demo
10045  ls
10046  mkdir 11.K8s
10047  cd 11.K8s
10048  ls
10049  vim Vagrantfile
10050  vagrant up
10051* minikube start
10052* top
10053* snx -d
10054* kubectl get nodes
10055* vim Vagrantfile
10056* kubectl proxy --address='0.0.0.0' --disable-filter=true  &
10057* minikube addons list
10058* minikube addons dashboard enable
10059* minikube addons enable dashboard
10060* minikube addons enable metrics-server
10061* minikube addons list
10062* ping http://192.168.1.201/
10063* ping 192.168.1.201
10064* ifconfig| grep  "inet "
10065* top
10066* kubectl get pods
10067* kubectl get pods --all-namespaces
10068* minikube stop
10069* minikube delete
10070* minikube start --help
10071  vagrant down
10072  vagrant halt
10073  vim Vagrantfile
10074  vagrant up
10075* ping 192.168.50.201
10076  vagrant ssh
10077* hsito
10078* history
10079* vim Vagrantfile
10080* ps aux | grep proxy
10081* kill 321225
10082* vim Vagrantfile
10083  vagrant halt && vagrant destroy -f
10084  ssh root@192.168.202.33
10085  ssh root@192.168.202.34
10086* vim Vagrantfile
```



## Ansible + kubespray

Preparation

```bash
root@sa-ubuntu-34:~/kubespray# history 
    1  apt update
    2  apt intsall python3-pip
    3  apt install python3-pip
    4  apt install git vim
    5  git clone git@github.com:kubernetes-sigs/kubespray.git
    6  git clone https://github.com/kubernetes-sigs/kubespray.git
    7  cd kubespray/
    8  ls
    9  vim requirements.txt
   10  pip3 install -r requirements.txt
   11  apt install sshpass
   12  cp -rfp inventory/sample inventory/ec
   13  declare -a IPS=(192.168.203.33 192.168.203.34)
   14  CONFIG_FILE=inventory/ec/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
   15  vim inventory/ec/hosts.yaml 
   16  ansible-playbook -i inventory/ec/hosts.yaml -u root cluster.yml --ask-pass
   17  history 
```

Result

```
PLAY RECAP *****************************************************************************************************
localhost                  : ok=4    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
node1                      : ok=588  changed=125  unreachable=0    failed=0    skipped=1148 rescued=0    ignored=2   
node2                      : ok=368  changed=76   unreachable=0    failed=0    skipped=632  rescued=0    ignored=1   

Monday 12 July 2021  18:04:45 +0000 (0:00:00.094)       0:26:03.756 *********** 
=============================================================================== 
download : download_container | Download image if required --------------------------------------------- 82.07s
download : download_container | Download image if required --------------------------------------------- 81.56s
kubernetes/control-plane : kubeadm | Initialize first master ------------------------------------------- 78.17s
kubernetes/preinstall : Install packages requirements -------------------------------------------------- 67.10s
download : download_container | Download image if required --------------------------------------------- 66.32s
download : download_container | Download image if required --------------------------------------------- 65.36s
download : download_container | Download image if required --------------------------------------------- 64.28s
download : download_container | Download image if required --------------------------------------------- 62.59s
download : download_container | Download image if required --------------------------------------------- 61.84s
download : download_container | Download image if required --------------------------------------------- 61.52s
download : download_container | Download image if required --------------------------------------------- 59.50s
download : download_container | Download image if required --------------------------------------------- 58.15s
download : download_container | Download image if required --------------------------------------------- 57.17s
container-engine/docker : ensure docker packages are installed ----------------------------------------- 55.67s
download : download_container | Download image if required --------------------------------------------- 54.94s
download : download_container | Download image if required --------------------------------------------- 52.95s
kubernetes/kubeadm : Join to cluster ------------------------------------------------------------------- 32.24s
download : download_file | Download item --------------------------------------------------------------- 21.34s
bootstrap-os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux) -- 21.14s
kubernetes/preinstall : Update package management cache (APT) ------------------------------------------ 20.65s

```

## EC Minikube on 192.168.202.*
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

