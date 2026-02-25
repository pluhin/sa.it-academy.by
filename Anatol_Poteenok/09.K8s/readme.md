
01. Install k8s

```
sudo pip3 install -U -r requirements.txt
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    

sudo apt install python3-venv python3-full -y

# Новые версии Pyton требую запуск в изолированной среде

python3 -m venv venv
user@ubuvm1:~/kuberspray/kubespray$ source venv/bin/activate
(venv) user@ubuvm1:~/kuberspray/kubespray$ 

pip install --upgrade pip
Requirement already satisfied: pip in ./venv/lib/python3.12/site-packages (24.0)
Collecting pip

...
source venv/bin/activate


pip install -r requirements.txt

...
Installing collected packages: resolvelib, PyYAML, pycparser, packaging, netaddr, MarkupSafe, jmespath, jinja2, cffi, cryptography, ansible-core, ansible
Successfully installed MarkupSafe-3.0.3 PyYAML-6.0.3 ansible-11.13.0 ansible-core-2.18.13 cffi-2.0.0 cryptography-46.0.5 jinja2-3.1.6 jmespath-1.1.0 netaddr-1.3.0 packaging-26.0 pycparser-3.0 resolvelib-1.0.1



cd kuberspray/
  git clone https://github.com/kubernetes-sigs/kubespray.git
  

ansible-playbook -i inventory.ini cluster.yml -u root --ask-pass  
  
  error - неверна версия ansible..
  много попыток переустановить на другую 
  ->  pipx uninstall ansible
  pip install -r requirements.txt
  
  ...
  
  много попыток  запустить плейбук -
  
  -----------------
  468  pipx inject ansible netaddr
  469  ansible-playbook -i inventory.ini cluster.yml
  470  pipx reinstall ansible --pip-args="ansible==2.19.0"
  471  sudo pipx reinstall ansible --pip-args="ansible==2.19.0"
  472  ansible --version
  473  pipx reinstall ansible --pip-args="ansible>=2.19.0,<2.20.0"
  474  pipx reinstall ansible --pip-args="ansible==2.19.0"
  475  sudo pipx reinstall ansible --pip-args="ansible==2.19.0"
  476  pipx uninstall ansible
  477  pipx install ansible==2.19.0
  478  pipx install ansible==11.13.0
  479  ansible --version
  480  ansible 
  481  pipx uninstall ansible
  482  history
  483  python3 -m venv venv
  484  pip install --upgrade pip
  485  ip 
  486  ip a
  487  sudo pip3 install -U -r requirements.txt
  488  sudo pip3 install -r requirements.txt
  489  sudo apt install python3-venv python3-full -y
  490  python3 -m venv venv
  491  sudo python3 -m venv venv
  492  pip install -r requirements.txt
  493  sudo python3 -m venv venv
  494  sudo apt install python3-venv
  495  python3 -m venv venv
  496  source venv/bin/activate
  497  sudo pip3 install -U -r requirements.txt
  498  sudo pip3 install -r requirements.txt
  499  sudo pip3 install requirements.txt
  500  pip3 install requirements.txt
  501  ды
  502  ls
  503  pip3 install requirements.txt 
  504  pip3 install -r requirements.txt 
  505  ansible --version
  506  ansible-playbook -i inventory.ini cluster.yml
  507  ansible --version
  508  pip install netaddr
  509  sudo pip install netaddr
  510  pip install netaddr
  511  ansible-playbook -i inventory.ini cluster.yml
  512  python netaddr is installed
  513  ~/.local/share/pipx/venvs/ansible-core/bin/python -c "import netaddr; print('ok')"
  514  pipx list
  515  pip install netaddr
  516  source venv/bin/activate
  517  which ansible-playbook
  518  ansible-playbook -i inventory.ini cluster.yml
  519  ./venv/bin/ansible-playbook -i inventory.ini cluster.yml
  520  ansible-playbook -i inventory.ini cluster.yml
  -----------------
  
  
  
  
  в каждом ошибка  на неустановленный  netaddr 
  
  Проверку netaddr в плейбуке закомментировал в ansible_version.yml
  
   # Skipped: requires netaddr in controller Python. Install: pip install netaddr (in same env as ansible)
    # - name: "Check that python netaddr is installed"
    #   assert:
    #     msg: "Python netaddr is not present"
    #     that: "('127.0.0.1' | ansible.utils.ipaddr) | bool"
    #   tags:
    #     - check   
	
  
  помголо только запуск строго из ./venv/bin/ansible-playbook -i inventory.ini cluster.yml  ..
  
./venv/bin/ansible-playbook -i inventory.ini cluster.yml
  
./venv/bin/ansible-playbook -i inventory.ini cluster.yml
   

```
*результат установки*

```
TASK [network_plugin/calico : Check if inventory match current cluster configuration] *********************
ok: [node1] => {
    "changed": false,
    "msg": "All assertions passed"
}
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.053)       0:25:34.098 ***** 
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.037)       0:25:34.136 ***** 
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.031)       0:25:34.168 ***** 
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.033)       0:25:34.201 ***** 
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.027)       0:25:34.228 ***** 
Thursday 19 February 2026  13:05:33 +0000 (0:00:00.027)       0:25:34.256 ***** 

PLAY RECAP ************************************************************************************************
node1                      : ok=639  changed=140  unreachable=0    failed=0    skipped=835  rescued=0    ignored=4   
node2                      : ok=432  changed=89   unreachable=0    failed=0    skipped=472  rescued=0    ignored=0   

Thursday 19 February 2026  13:05:33 +0000 (0:00:00.045)       0:25:34.301 ***** 
=============================================================================== 
download : Download_container | Download image if required --------------------------------------- 390.40s
download : Download_container | Download image if required --------------------------------------- 182.54s
download : Download_container | Download image if required --------------------------------------- 182.40s
system_packages : Manage packages ----------------------------------------------------------------- 63.52s
download : Download_file | Download item ---------------------------------------------------------- 29.99s
download : Download_file | Download item ---------------------------------------------------------- 29.01s
download : Download_file | Download item ---------------------------------------------------------- 23.57s
bootstrap_os : Assign inventory name to unconfigured hostnames (non-CoreOS, non-Flatcar, Suse and ClearLinux, non-Fedora) -- 20.82s
container-engine/containerd : Download_file | Download item --------------------------------------- 20.21s
download : Download_container | Download image if required ---------------------------------------- 20.18s
download : Download_container | Download image if required ---------------------------------------- 19.66s
download : Download_container | Download image if required ---------------------------------------- 18.48s
download : Download_container | Download image if required ---------------------------------------- 18.27s
container-engine/nerdctl : Download_file | Download item ------------------------------------------ 18.27s
download : Download_container | Download image if required ---------------------------------------- 18.27s
download : Download_container | Download image if required ---------------------------------------- 18.11s
container-engine/crictl : Download_file | Download item ------------------------------------------- 16.94s
download : Download_container | Download image if required ---------------------------------------- 16.10s
container-engine/runc : Download_file | Download item --------------------------------------------- 15.91s
download : Download_file | Download item ---------------------------------------------------------- 15.22s

```

*check cluster*

```
 kubectl version
Client Version: v1.35.1
Kustomize Version: v5.7.1
Server Version: v1.35.1
root@node1:~# kubectl get nodes
NAME    STATUS   ROLES           AGE   VERSION
node1   Ready    control-plane   15m   v1.35.1
node2   Ready    <none>          14m   v1.35.1
root@node1:~# kubectl get nodes -o wide
NAME    STATUS   ROLES           AGE   VERSION   INTERNAL-IP     EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION   CONTAINER-RUNTIME
node1   Ready    control-plane   15m   v1.35.1   192.168.208.3   <none>        Debian GNU/Linux 12 (bookworm)   6.1.0-37-amd64   containerd://2.2.1
node2   Ready    <none>          15m   v1.35.1   192.168.208.4   <none>        Debian GNU/Linux 12 (bookworm)   6.1.0-37-amd64   containerd://2.2.1
```



# Homework Assignment 2: Minikube Kubernetes Cluster Setup

``` bash
 sudo apt get update
    8  sudo apt update
    9  sudo apt upgrade
   10  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
   11  groups minikube-user
   12  minikube start
   13  sudo dpkg -i minikube_latest_amd64.deb
   14  apt install -y curl wget apt-transport-https ca-certificates
   15  sudo apt install -y curl wget apt-transport-https ca-certificates
   16  apt install -y apt-transport-https ca-certificates curl software-properties-common
   17  sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   18  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
   19  mkdir -p /etc/apt/keyrings
   20  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   21  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   22  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null
   23  mkdir -p /etc/apt/keyrings
   24  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   25  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   26  sudo bash -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg"
   27  sudo install -m 0755 -d /etc/apt/keyrings
   28  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   29  sudo chmod a+r /etc/apt/keyrings/docker.asc
   30  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
   31  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   32  sudo apt update
   33  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
   34  docker --version
   35  minikube start
   36  minikube start --driver=docker
   37  sudo minikube start --driver=docker
   38  docker info --format '{{.OSType}}'
   39  sudo docker info --format '{{.OSType}}'
   40  docker --version
   41  sudo usermod -aG docker $USER && newgrp docker
   42  ip a
   43  minikube start
   
   #install kubectl
   
   45  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key |   sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
   46  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
  https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' |   sudo tee /etc/apt/sources.list.d/kubernetes.list
   47  sudo apt-get update
   48  sudo apt update
   49  sudo rm /etc/apt/sources.list.d/kubernetes.list
   50  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key |   sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
   51  echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" |   sudo tee /etc/apt/sources.list.d/kubernetes.list
   52  sudo apt update
   53  sudo apt install -y kubectl
   54  kubectl get pods
   55  kubectl get ns
   56  kubectl get pods default
   57  minikube status
   58  minikube kubectl -- get pods
   
   #Установить namespace по умолчанию для текущего контекста
   59  kubectl config use-context minikube
   60  kubectl get nodes
   61  kubectl get pods
   62  kubectl get pods -A

```
*Check Minikube*

```

user@pc2:~$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

user@pc2:~$ kubectl config use-context minikube
Switched to context "minikube".
user@pc2:~$ kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   66m   v1.35.1
user@pc2:~$ kubectl get pods
No resources found in default namespace.
user@pc2:~$ kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-7d764666f9-6pqtr           1/1     Running   0          66m
kube-system   coredns-7d764666f9-tgxrp           1/1     Running   0          66m
kube-system   etcd-minikube                      1/1     Running   0          66m
kube-system   kube-apiserver-minikube            1/1     Running   0          66m
kube-system   kube-controller-manager-minikube   1/1     Running   0          66m
kube-system   kube-proxy-xcz42                   1/1     Running   0          66m
kube-system   kube-scheduler-minikube            1/1     Running   0          66m
kube-system   storage-provisioner                1/1     Running   0          66m
```

# Homework Assignment 3: GitHub Actions for KinD Cluster Setup


``` bash
/k8s_minikube_workflow$ tree -r -a
.
├── README.md
├── .github
│   └── workflows
│       └── kind.yml
```

*kind.yml*

```
name: KinD cluster

on:
  push:
    branches:
      - main

jobs:
  kind:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Create KinD cluster
        run: |
          curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
          chmod +x ./kind
          sudo mv ./kind /usr/local/bin/kind
          kind create cluster --wait 2m

      - name: Verify cluster
        run: |
          curl -Lo /tmp/kubectl https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
          chmod +x /tmp/kubectl
          sudo mv /tmp/kubectl /usr/local/bin/kubectl
          kubectl cluster-info --context kind-kind
          kubectl get nodes -o wide

```
*result workflow*
```
kind
succeeded 1 hour ago in 50s
Search logs
0s
1s
45s
Run curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100    97  100    97    0     0    401      0 --:--:-- --:--:-- --:--:--   402

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0

100 9697k  100 9697k    0     0  18.3M      0 --:--:-- --:--:-- --:--:-- 18.3M
Creating cluster "kind" ...
 • Ensuring node image (kindest/node:v1.31.0) 🖼  ...
 ✓ Ensuring node image (kindest/node:v1.31.0) 🖼
 • Preparing nodes 📦   ...
 ✓ Preparing nodes 📦 
 • Writing configuration 📜  ...
 ✓ Writing configuration 📜
 • Starting control-plane 🕹️  ...
 ✓ Starting control-plane 🕹️
 • Installing CNI 🔌  ...
 ✓ Installing CNI 🔌
 • Installing StorageClass 💾  ...
 ✓ Installing StorageClass 💾
 • Waiting ≤ 2m0s for control-plane = Ready ⏳  ...
 ✓ Waiting ≤ 2m0s for control-plane = Ready ⏳
 • Ready after 18s 💚
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Thanks for using kind! 😊
1s
Run curl -Lo /tmp/kubectl https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 55.8M  100 55.8M    0     0   197M      0 --:--:-- --:--:-- --:--:--  198M
Kubernetes control plane is running at https://127.0.0.1:34495
CoreDNS is running at https://127.0.0.1:34495/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
NAME                 STATUS   ROLES           AGE   VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION      CONTAINER-RUNTIME
kind-control-plane   Ready    control-plane   23s   v1.31.0   172.18.0.2    <none>        Debian GNU/Linux 12 (bookworm)   6.11.0-1018-azure   containerd://1.7.18
0s
Post job cleanup.
/usr/bin/git version
git version 2.52.0
Temporarily overriding HOME='/home/runner/work/_temp/ab40c7a7-fa22-439d-b734-50c5f8fe889c' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/k8s_minikube_workflow/k8s_minikube_workflow
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
/usr/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
/usr/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
0s
Cleaning up orphan processes```



*minikube workflow*

```
name: Minikube cluster

on:
  pull_request:

jobs:
  minikube:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Set up Minikube
        run: |
          curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
          chmod +x minikube
          sudo mv minikube /usr/local/bin/
          minikube start --driver=docker --wait=all

      - name: Verify cluster
        run: |
          minikube kubectl -- get nodes -o wide
          minikube status

```

* Workflow for pull_request  (to check Create branch -> push to github -> create pull required

*Result of pullReq*

```
minikube
succeeded 1 minute ago in 1m 37s
Search logs
1s
Current runner version: '2.331.0'
Runner Image Provisioner
Operating System
Runner Image
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Getting action download info
Download action repository 'actions/checkout@v4' (SHA:34e114876b0b11c390a56381ad16ebd13914f8d5)
Complete job name: minikube
0s
Run actions/checkout@v4
Syncing repository: poteenoka/k8s_minikube_workflow
Getting Git version info
Temporarily overriding HOME='/home/runner/work/_temp/a6ab36f8-b187-46b8-8581-6b06be988286' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/k8s_minikube_workflow/k8s_minikube_workflow
Deleting the contents of '/home/runner/work/k8s_minikube_workflow/k8s_minikube_workflow'
Initializing the repository
Disabling automatic garbage collection
Setting up auth
Fetching the repository
Determining the checkout info
/usr/bin/git sparse-checkout disable
/usr/bin/git config --local --unset-all extensions.worktreeConfig
Checking out the ref
/usr/bin/git log -1 --format=%H
29ee5814b5d650baebba12a6211849610e200c51
1m 32s
Run curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0  128M    0 47874    0     0   397k      0  0:05:31 --:--:--  0:05:31  396k
100  128M  100  128M    0     0   147M      0 --:--:-- --:--:-- --:--:--  147M
* minikube v1.38.1 on Ubuntu 24.04
* Using the docker driver based on user configuration
! Starting v1.39.0, minikube will default to "containerd" container runtime. See #21973 for more info.
* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.50 ...
* Downloading Kubernetes v1.35.1 preload ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
    > gcr.io/k8s-minikube/kicbase...:  0 B [_______________________] ?% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB [>_] 0.00% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB [>_] 0.00% ? p/s ?    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.67 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.67 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.67 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.50 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.50 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.50 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.34 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.34 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.34 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.19 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.19 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.19 KiB p/    > gcr.io/k8s-minikube/kicbase...:  1.60 KiB / 519.58 MiB  0.00% 2.05 KiB p/    > gcr.io/k8s-minikube/kicbase...:  97.75 KiB / 519.58 MiB  0.02% 2.05 KiB p    > gcr.io/k8s-minikube/kicbase...:  4.00 MiB / 519.58 MiB  0.77% 2.05 KiB p/    > gcr.io/k8s-minikube/kicbase...:  10.94 MiB / 519.58 MiB  2.11% 1.18 MiB p    > gcr.io/k8s-minikube/kicbase...:  20.94 MiB / 519.58 MiB  4.03% 1.18 MiB p    > gcr.io/k8s-minikube/kicbase...:  32.70 MiB / 519.58 MiB  6.29% 1.18 MiB p    > gcr.io/k8s-minikube/kicbase...:  54.71 MiB / 519.58 MiB  10.53% 5.81 MiB     > gcr.io/k8s-minikube/kicbase...:  80.00 MiB / 519.58 MiB  15.40% 5.81 MiB     > gcr.io/k8s-minikube/kicbase...:  109.58 MiB / 519.58 MiB  21.09% 5.81 MiB    > gcr.io/k8s-minikube/kicbase...:  140.00 MiB / 519.58 MiB  26.95% 14.61 Mi    > gcr.io/k8s-minikube/kicbase...:  170.75 MiB / 519.58 MiB  32.86% 14.61 Mi    > gcr.io/k8s-minikube/kicbase...:  200.34 MiB / 519.58 MiB  38.56% 14.61 Mi    > gcr.io/k8s-minikube/kicbase...:  231.43 MiB / 519.58 MiB  44.54% 23.50 Mi    > gcr.io/k8s-minikube/kicbase...:  261.92 MiB / 519.58 MiB  50.41% 23.50 Mi    > gcr.io/k8s-minikube/kicbase...:  292.22 MiB / 519.58 MiB  56.24% 23.50 Mi    > gcr.io/k8s-minikube/kicbase...:  323.04 MiB / 519.58 MiB  62.17% 31.83 Mi    > gcr.io/k8s-minikube/kicbase...:  353.08 MiB / 519.58 MiB  67.95% 31.83 Mi    > gcr.io/k8s-minikube/kicbase...:  384.25 MiB / 519.58 MiB  73.95% 31.83 Mi    > gcr.io/k8s-minikube/kicbase...:  414.39 MiB / 519.58 MiB  79.75% 39.60 Mi    > gcr.io/k8s-minikube/kicbase...:  445.12 MiB / 519.58 MiB  85.67% 39.60 Mi    > gcr.io/k8s-minikube/kicbase...:  476.00 MiB / 519.58 MiB  91.61% 39.60 Mi    > gcr.io/k8s-minikube/kicbase...:  506.09 MiB / 519.58 MiB  97.40% 46.91 Mi    > gcr.io/k8s-minikube/kicbase...:  519.58 MiB / 519.58 MiB  100.00% 71.30 M
0s
Run minikube kubectl -- get nodes -o wide
NAME       STATUS   ROLES           AGE   VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE                         KERNEL-VERSION      CONTAINER-RUNTIME
minikube   Ready    control-plane   53s   v1.35.1   192.168.49.2   <none>        Debian GNU/Linux 12 (bookworm)   6.11.0-1018-azure   docker://29.2.1
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured

0s
Post job cleanup.
/usr/bin/git version
git version 2.52.0
Temporarily overriding HOME='/home/runner/work/_temp/6c02d8f8-7566-4b25-9266-8ece61d138f8' before making global git config changes
Adding repository directory to the temporary git global config as a safe directory
/usr/bin/git config --global --add safe.directory /home/runner/work/k8s_minikube_workflow/k8s_minikube_workflow
/usr/bin/git config --local --name-only --get-regexp core\.sshCommand
/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'core\.sshCommand' && git config --local --unset-all 'core.sshCommand' || :"
/usr/bin/git config --local --name-only --get-regexp http\.https\:\/\/github\.com\/\.extraheader
http.https://github.com/.extraheader
/usr/bin/git config --local --unset-all http.https://github.com/.extraheader
/usr/bin/git submodule foreach --recursive sh -c "git config --local --name-only --get-regexp 'http\.https\:\/\/github\.com\/\.extraheader' && git config --local --unset-all 'http.https://github.com/.extraheader' || :"
/usr/bin/git config --local --name-only --get-regexp ^includeIf\.gitdir:
/usr/bin/git submodule foreach --recursive git config --local --show-origin --name-only --get-regexp remote.origin.url
0s
Cleaning up orphan processes
```