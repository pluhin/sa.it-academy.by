    1  sudo apt update
    2  sudo apt install apt-transport-https ca-certificates curl software-properties-common
    3  git
    4  sudo apt install git
    5  vagrant
    6  sudo apt install vagrant
    7  sudo apt full-upgrade
    8  apt-cache policy docker-ce
    9  sudo apt install docker-ce
   10  cd 1
   11  mkdir 1
   12  cd 1
   13  mkdir test
   14  mkdir 1
   15  cd test
   16  ssh-keygen -t rsa
   17  cat ~/.ssh/id_rsa.pub
   18  git clone git@github.com:Korolev731/test_hub.git
   19  ls
   20  cd test_hub/
   21  ls
   22  git init
   23  nano README.md 
   24  git add .
   25  git commit -m "05"
   26  git config --global user.email "salix731@gmail.com"
   27  git config --global user.name "IKorolev"
   28  git commit -m "05"
   29  git push
   30  cd ..
   31  cd 1/
   32  git clone git@github.com:pluhin/sa.it-academy.by.git
   33  cd sa.it-academy.by/
   34  ls
   35  cd ..
   36  git init
   37  cd sa.it-academy.by/
   38  ls
   39  git remote -a
   40  git remote
   41  cd ..
   42  rm -r sa.it-academy.by/
   43  y
   44  git clone git@github.com:Korolev731/sa.it-academy.by.git
   45  cd sa.it-academy.by/
   46  ls
   47  git init
   48  ls
   49  git branch
   50  git checkout md-sa2-16-21
   51  git remote add 1 git@github.com:Korolev731/sa.it-academy.by.git
   52  ды
   53  ls
   54  git branch
   55  cd IKorolev/
   56  ls
   57  mkdir 05.Docker
   58  cd 05.Docker/
   59  nano README.md
   60  git add .
   61  git commit -m "05"
   62  git push
   63  terminator
   64  sudo apt install terminator
   65  cd ..
   66  cd test/
   67  cd test_hub/
   68  ls
   69  terminator 
   70  cd 1/test/test_hub/
   71  git remote
   72  docker search nginx
   73  sudo snap install docker 
   74  zsh --version
   75  sudo apt install zsh
   76  zsh --version
   77  chsh -s $(which zsh)
   78  git branch
   79  sudo apt  install docker.io 
   80  docker pull nginx
   81  docker inspect nginx
   82  docker search nginx
   83  sudo apt update 
   84  sudo apt upgrade
   85  sudo apt-get install  curl apt-transport-https ca-certificates software-properties-common
   86  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   87  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   88  sudo apt update
   89  apt-cache policy docker-ce
   90  sudo apt install docker-ce
   91  sudo systemctl status docker
   92  sudo docker run hello-world
   93  docker search nginx
   94  docker pull nginx
   95  ls
   96  mkdir docker
   97  cd docker/
   98  mkdir {1..5}
   99  cd 1
  100  sudo docker pull nginx
  101  sudo usermod -aG docker ${dom}
  102  sudo usermod -aG docker ${user}
  103  su - ${user}
  104  docker run hello-world
  105  sudo usermod -aG docker 
  106  sudo dommod -aG docker 
  107  sudo usermod -a -G docker $USER
  108  su - ${user}
  109  docker run hello-world
  110  sudo usermod -a -G docker $dom
  111  cd 1/test/test_hub/docker/
  112  cd 1
  113  su - ${user}
  114  docker run hello-world
  115  sudo groupadd docker
  116  sudo gpasswd -a $USER docker
  117  docker run hello-world
  118  sudo usermod -a -G docker user-name
  119  sudo usermod -a -G docker dom
  120  docker run hello-world
  121  sudo groupadd docker
  122  sudo usermod -aG docker $USER
  123  ~$ groups
  124  groups
  125  sudo chown root:docker /var/run/docker.sock
  126  sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
  127  sudo chmod g+rwx "$HOME/.docker" -R
  128  sudo docker run hello-world
  129  docker run hello-world
  130  sudo docker pull nginx
  131  sudo docker inspect nginx
  132  docker images
  133  sudo docker images
  134  sudo docker run -p 81:80 --name webserver nginx
  135  ocker stop webserver
  136  sudo docker stop webserver
  137  sudo docker build -t first_image:v1.2.0
  138  docker build -t demo:1 -f 01.Dockerfile
  139  sudo docker build -t demo:1 -f 01.Dockerfile
  140  sudo docker images | grep demo
  141  sudo docker inspect demo:1
  142  sudo docker search 
  143  sudo docker search debian
  144  nano q.js
  145  sudo docker build -itt demo:1 .
  146  sudo docker build -it demo:1 .
  147  sudo docker build -i demo:1 -f Dockerfile .
  148  docker build -t demo:1 -f Dockerfile .
  149  docker build -t demo:2 -f 02.Dockerfile . 
  150  sudo docker build -t demo:3 -f 03.Dockerfile .
  151  sudo docker images | grep demo
  152  sudo docker build -t demo:3 -f 03.Dockerfile .
  153  sudo docker images | grep demo
  154  docker build -t demo:4 -f 04.Dockerfile .
  155  docker build -t demo:5 -f 05.Dockerfile .
  156  docker run -p 81:80 --name webserver demo:5
  157  sudo docker run -p 81:80 --name webserver demo:5
  158  docker build -t demo:5 -f 05.Dockerfile .
  159  sudo docker run -p 81:80 --name webserver demo:5
  160  docker run -p 81:80 --name webserver demo:5
  161  sudo docker build -t demo:5 -f 05.Dockerfile .
  162  sudo docker run -p 81:80 --name webserver demo:5
  163  docker run -p 81:80 --name webserver demo:5
  164  docker kill webserver
  165  sudo docker kill webserver
  166  docker run -p 81:80 --name webserver demo:5
  167  sudo docker stop webserver
  168  sudo docker run -p 81:80 --name webserver demo:5
  169  Error response from daemon: Conflict. The container name "/webserver" is already in use by container "eb6aa3635be50fc8fc541e990491d320ae731fb1143f4dbdcbc35b79ef2cec1f". You have to remove (or rename) that container to be able to reuse that name.
  170  docker ps -a
  171  docker start webserver
  172  sudo docker run -d -p 80:80 --rm --name webserver nginx
  173  sudo docker run -p 81:80 --name webserver demo:5
  174  docker kill webserver
  175  docker ps
  176  sudo docker ps
  177  sudo docker run -p 81:80 --name webserver demo:5
  178  docker run -p 81:80 --name webserver demo:5
  179  sudo docker ps
  180  docker ps -a
  181  docker rm $(docker ps -aq)
  182  sudo docker rm $(docker ps -aq)
  183  docker rm $(docker ps -aq)
  184  docker ps
  185  docker run -p 81:80 --name webserver demo:5
  186  docker build -t plkorolev731/test_hub -f 05.Dockerfile .
  187  docker build -t korolev731/test_hub -f 05.Dockerfile .
  188  docker push korolev731/test_hub:5
  189  sudo docker push korolev731/test_hub:5
  190  sudo docker login
  191  Run docker login --username korolev731
  192  sudo  docker login --username korolev731
  193  sudo docker push korolev731/test_hub:5
  194  sudo  docker login --username korolev731
  195  sudo docker login
  196  sudo  docker login --username korolev731
  197  docker build -t korolev731/test_hub -f 05.Dockerfile .
  198  sudo docker push korolev731/test:5
  199  docker build -t korolev731/test_hub -f 05.Dockerfile .
  200  sudo docker push korolev731/test_hub:5
  201  sudo docker build -t korolev731/test_hub -f 05.Dockerfile .
  202  docker ps
  203  docker run -p 81:80 --name webserver demo:5
  204  sudo docker build -t korolev731/test_hub -f 05.Dockerfile .
  205  sudo docker push korolev731/test_hub:latest
  206  sudo docker build -t nmap:my -f 06.Dockerfile .
  207  git add .
  208  git commit -m "05"
  209  git push
  210  nano nginx.conf 
  211  nano index.html 
  212  git add .
  213  git commit -m "05"
  214  git push
  215  docker run -p 81:80 --name webserver demo:5
  216  sudo docker run -p 81:80 --name webserver demo:5
  217  docker build -t nmap:my -f 06.Dockerfile .
  218  ocker container run -d --name my_nginx nginx
  219  sudo docker container run -d --name my_nginx nginx
  220  git add .
  221  git commit -m "05"
  222  git push
  223  ifconfig
  224  sudo apt install net-tools
  225  cd 1/test/test_hub/docker/1/
  226  nano Dockerfile
  227  nano 02.Dockerfile
  228  sudo docker images | grep demo
  229  sudo docker image | grep demo
  230  sudo docker images | grep demo
  231  sudo docker -it demo:2 bash
  232  sudo docker run -it demo:2 bash
  233  nano 03.Dockerfile
  234  ды
  235  ls
  236  nano 03.Dockerfile 
  237  nano 04.Dockerfile
  238  nano 05.Dockerfile
  239  nano nginx.conf
  240  sudo docker images | grep demo
  241  nano index.html
  242  nano 05.Dockerfile
  243  sudo docker images | grep demo
  244  docker run -p 81:80 --name webserver demo:5
  245  nano 06.Dockerfile
  246  cd 1/test/test_hub/docker/
  247  git pull
  248  ls
  249  cd 1
  250  ls
  251  cd 1/test/test_hub/docker/2
  252  ls
  253  cd ..
  254  git pull
  255  cd 2
  256  ls
  257  sudo docker korolev731/test:1 -f Dockerfile
  258  nano Dockerfile
  259  sudo docker korolev731/test:1 -f Dockerfile
  260  sudo docker build -t demo:5 -f Dockerfile 
  261  docker ps
  262  curl localhost:80
  263  curl localhost:6526
  264  sudo docker build -t demo:5 -f Dockerfile 
  265  docker ps
  266  curl localhost:80
  267  docker ps
  268  docker run -d -p 81:80
  269  docker run -d -p 8080:80
  270  docker run -d -p 81:8080
  271  docker run -d -p 8080:8080
  272  sudo docker run -d -p 8080:8080
  273  sudo docker run 
  274  curl http://127.0.0.1:8001
  275  curl
  276  telnet 127.0.0.1 8080
  277  docker ps
  278  cd 1/test/test_hub/
  279  ls
  280  git pull
  281  cd docker/2
  282  ls
  283  docker build -t demo:5 -f Dockerfile .
  284  docker run -p 3000:6526 --name webserver demo:5
  285  sudo docker run -p 3000:6526 --name webserver demo:5
  286  docker run -p 81:80 --name webserver demo:5
  287  docker ps
  288  sudo docker build -t demo:5 -f Dockerfile .
  289  docker ps
  290  docker run -it demo:5
  291  http://localhost:6526/
  292  docker run -d -p 80:8080
  293  curl localhost:80
  294  docker ps
  295  docker run -it demo:5
  296  docker ps
  297  sudo docker run -it demo:5
  298  docker ps
  299  sudo docker build -t demo:5 -f Dockerfile .
  300  sudo docker run -it demo:5
  301  docker ps
  302  sudo docker run -it demo:5
  303  sudo docker build -t demo:5 -f Dockerfile .
  304  sudo docker run -it demo:5
  305  sudo docker build -t demo:5 -f Dockerfile .
  306  sudo docker run -it demo:5
  307  docker run -d -p 80:8080
  308  sudo docker run -d -p 80:8080
  309  sudo docker run -it demo:5
  310  sudo docker run -d -p 80:8080
  311  sudo docker run -it demo:6
  312  sudo docker build -t demo:6 -f Dockerfile .
  313  sudo docker run -d -p 80:8080
  314  sudo docker run -it demo:6
  315  docker run -d -p 80:8080
  316  sudo docker run -it demo:5
  317  ls 1/
  318  cd 1/test/test_hub/
  319  git pull
  320  ls
  321  cd ..
  322  ls
  323  git pull
  324  cd test_hub/
  325  git pull
  326  cd ..
  327  cd 1/sa.it-academy.by/
  328  ls
  329  git pull
  330  cd ..
  331  cd test/test_hub/
  332  ls
  333  cd docker/3
  334  docker build -t demo:1 -f Dockerfile .
  335  sudo docker build -t demo:1 -f Dockerfile .
  336  docker inspect demo:1
  337  sudo docker run -d -p 6589:6589 demo:1
  338  docker build -t demo:1 -f Dockerfile .
  339  docker run -d -p 6589:6589 demo:1
  340  docker ps
  341  git pill
  342  git pull
  343  docker build -t demo:1 -f Dockerfile .
  344  docker run -d -p 6589:6589 demo:1
  345  docker ps
  346  docker run -p 81:80 --name webserver demo:1
  347  sudo docker run -p 81:80 --name webserver demo:1
  348  docker build -t demo:2 -f Dockerfile .
  349  sudo docker run -p 81:80 --name webserver demo:2
  350  docker ps
  351  curl http://localhost
  352  curl http://localhost:6589
  353  curl http://localhost6589
  354  docker ps
  355  docker run -d -p 80:80 
  356  cd ..
  357  cd 2
  358  git pull
  359  docker build -t demo:1 -f Dockerfile .
  360  docker inspect demo:1
  361  sudo docker run -p 81:80 --name webserver demo:1
  362  docker kill webserver
  363  sudo docker kill webserver
  364  docker ps
  365  sudo docker ps
  366  sudo docker stop $(docker ps -aq)
  367  sudo docker rmi $(docker images -q) -f
  368  sudo docker build -t demo:1 -f Dockerfile .
  369  docker run -p 81:80 --name webserver demo:1
  370  sudo docker run -p 81:80 --name webserver demo:1
  371  docker run -it demo:1
  372  sudo docker run -it demo:1
  373  docker ps
  374  sudo docker ps
  375  docker stop
  376  docker run -d -p 8080:80 demo:1
  377  cd ..
  378  cd 3
  379  ls
  380  git pul
  381  git pull
  382  ls
  383  cd
  384  cd 1/test/test_hub/
  385  ls
  386  git pull
  387  cd docker/2
  388  docker build -t demo:1 -f Dockerfile .
  389  docker run -p 81:80 --name webserver demo:1
  390  sudo docker run -p 81:80 --name webserver demo:1
  391  sudo docker run 
  392  docker run -p 81:80
  393  docker run -d -p 81:80
  394  docker run -p 81:80 --name webserver demo:2
  395  docker run -p 81:80 --name web demo:2
  396  docker build -t demo:2 -f Dockerfile .
  397  docker run -p 81:80 --name web demo:2
  398  curl http://localhost
  399  curl http://localhost:80
  400  docker ps
  401  docker images
  402  telnet localhost 80
  403  curl localhost 80
  404  git add .
  405  git commit -m "05"
  406  git push
  407  docker kill webserver
  408  sudo docker kill webserver
  409  docker stop $(docker ps -aq)
  410  sudo docker rmi $(docker images -q) -f
  411  docker build -t demo:1 -f Dockerfile .
  412  docker run -p 81:80 --name webserver demo:4
  413  docker stop $(docker ps -aq)
  414  sudo docker stop $(docker ps -aq)
  415  docker kill
  416  docker ps
  417  git stop 78dd5d87b587
  418  docker kill 78dd5d87b587
  419  docker ps
  420  curl localhost:81
  421  cd ..
  422  git pull
  423  cd 
  424  cd 1/test/test_hub/docker/
  425  ls
  426  git pull
  427  ls
  428  cd ..
  429  cd
  430  cd 1/test/test_hub/
  431  git pull
  432  ls
  433  nano README.md 
  434  git add .
  435  git commit -m "05 "
  436  git pull
  437  cd ..
  438  cd 1/test/
  439  git clone git@github.com:Korolev731/test_hub.git
  440  cd test_hub/
  441  git init
  442  ls
  443  cd docker/
  444  cd 2
  445  ls
  446  cd ..
  447  cd 
  448  cd 1/test/
  449  ls
  450  git clone git@github.com:Korolev731/test_hub.git
  451  ls
  452  cd test_hub/
  453  git add .
  454  git commit -m "05"
  455  git pish
  456  git push
  457  cd docker/2
  458  ls
  459  dockr ps
  460  sudo dockr ps
  461  docker
  462  docker build -t demo:1 -f Dockerfile .
  463  docker run -d -p 80:8080 demo:1 
  464  telnet localhost 80
  465  git add .
  466  git commit -m "05"
  467  git push
  468  docker stop demo
  469  docker push korolev731/test:1
  470  docker push korolev731/test
  471  docker login
  472  docker login --username korolev731
  473  docker push korolev731/test
  474  docker push korolev731/test:1
  475  docker stop $(docker ps -aq)
  476  docker ps
  477  docker stop demo:1
  478  sudo docker stop demo:1
  479  git add .
  480  git commit -m "05"
  481  sudo install minikube /usr/local/bin/
  482  brew install minikube
  483  minikube start --vm-driver=<driver_name>
  484  minikube status
  485  minikube start
  486  kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
  487  sudo snap install kubectl
  488  minikube start
  489  kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
  490  sudo snap install kubectl
  491  virtualbox
  492  sudo apt install virtualbox-qt
  493  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
  494  sudo mkdir -p /usr/local/bin/
  495  sudo install minikube /usr/local/bin/
  496  brew install minikube
  497  minikube start --vm-driver=<driver_name>
  498  minikube start --vm-driver
  499  minikube status
  500  kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.10
  501  grep -E --color 'vmx|svm' /proc/cpuinfo
  502  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64   && chmod +x minikube
  503  sudo install minikube /usr/local/bin/
  504  minikube status
  505  cd 1/test/test_hub/docker/3
  506  ls
  507  sudo terraform 0.13upgrade .
  508  terraform 0.13upgrade .
  509  apt-get install wget unzip
  510  sudo apt-get install wget unzip
  511  mkdir /downloads/terraform -p
  512  cd
  513  mkdir /downloads/terraform -p
  514  terraform 0.13upgrade .
  515  export VER="0.11.10"
  516  wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip
  517  sudo apt-get install unzip
  518  sudo mv terraform /usr/local/bin/
  519  terraform -v
  520  terraform
  521  sudo apt-get install unzip
  522  sudo apt autoremove
  523  sudo mv terraform /usr/local/bin/
  524  sudo adduser testuser
  525  sudo usermod -aG sudo testuser
  526  su testuser
  527  vagrant up
  528  minikube stop
  529  ssh jump_sa@178.124.206.53
  530  $F|BoF4+JK
  531  ssh jump_sa@178.124.206.53
  532  sh-copy-id  root@192.168.203.9
  533  ssh-copy-id  root@192.168.203.9
  534  ssh-copy-id  root@192.168.203.10
  535  cd 1/test/test_hub/docker/3
  536  docker ps
  537  terraform init
  538  git add .
  539  git commit -m "06"
  540  git push
  541  cd
  542  cd 1/1/sa.it-academy.by/IKorolev/06.Docker-compose.Terraform/
  543  git add .
  544  git commit -m "06.Docker-compose"
  545  git push
  546  cd
  547  cd 1/test/test_hub/mkdir k8
  548  cd k8
  549  cd 1/test/test_hub/
  550  mkdir k8
  551  cd k8
  552  minikube start 
  553  nano Vagrantfile
  554  minikube ssh
  555  minikube addns list
  556  minikube adons list
  557  minikube addons list
  558  ifconfig 
  559  minikube addons dashboard enable
  560  kubectl get pods
  561  sudo snap install kubectl
  562  kubectl get nodes
  563  sudo snap install kubectl
  564  sudo install kubectl
  565  url -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  566  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl
  567  chmod +x ./kubectl
  568  sudo mv ./kubectl /usr/local/bin/kubectl
  569  kubectl version --client
  570  sudo apt-get update && sudo apt-get install -y apt-transport-https
  571  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  572  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
  573  sudo apt-get update
  574  sudo apt-get install -y kubectl
  575  kubectl get pods
  576  minikube adons list
  577  minikube start 
  578  minikube adons list
  579  minikube service list
  580  minikube addons list
  581  minikube addons dashboard enable
  582  minikube addons enable dashboard
  583  kubectl get pods
  584  kubectl get nodes
  585  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  586  kubectl config use-context lab-ecx
  587  kubectl get nodes
  588  sudo apt update
  589  sudo apt install ansible
  590  ssh-copy-id -i new_key.pub jump_sa@178.124.206.53
  591  ssh-copy-id jump_sa@178.124.206.53 -i new_key.pub
  592  ssh-copy-id -i new_key.pub jump_sa@178.124.206.53
  593  ssh-copy-id -i jump_sa@178.124.206.53
  594  nano ~/.ssh/config
  595  nano /etc/ssh/ssh_config
  596  nano ~/.ssh/config
  597  curl -O https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz
  598  sha256sum go1.12.1.linux-amd64.tar.gz
  599  sudo tar -xvf go1.12.1.linux-amd64.tar.gz -C /usr/local
  600  sudo chown -R root:root /usr/local/go
  601  mkdir -p $HOME/go/{bin,src}
  602  nano ~/.profile
  603  . ~/.profile
  604  echo $PATH
  605  go version
  606  go get github.com/digitalocean/godo
  607  ll $GOPATH/src/github.com/digitalocean/godo
  608  sudo apt update
  609  mkdir 3
  610  cd 3 
  611  git clone git@github.com:derailed/k9s.git
  612  ls
  613  cd k9s/
  614  make build && ./execs/k9s
  615  kubectl get nodes
  616  mkdir .kube
  617  scp root@192.168.203.9:/root/.kube/config .kube/config
  618  cd
  619  pwd
  620  scp root@192.168.203.9:/root/.kube/config .kube/config
  621  nano ~/.kube
  622  nano ~/.kube/config
  623  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  624  kubectl get nodes
  625  scp root@192.168.203.9:/root/.kube/config .kube/config
  626  nano ~/.kube/config
  627  scp root@192.168.203.9:/root/.kube/config .kube/config
  628  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  629  kubectl get nodes
  630  kubectl get pods --all-namespaces
  631  links https://127.0.0.1:6443/api/v1
  632  curl https://127.0.0.1:6443/api/v1
  633  curl -k https://127.0.0.1:6443/api/v1
  634  nano anon_access.yaml
  635  kubectl create -f dashboard.yaml 
  636  kubectl create -f dashboard.yaml
  637  ps aux | grep proxy
  638  kill 236244
  639  ps aux | grep proxy
  640  kubectl create -f dashboard.yaml
  641  kubectl create -f q.yaml
  642  kubectl create -f dashboard.yaml
  643  autossh --kill dbserver
  644  sudo snap install autossh  # version 1.4, or
  645  autossh --kill dbserver
  646  sudo nano /etc/ssh/sshd_config
  647  sudo systemctl restart ssh.service
  648  scp root@192.168.203.9:/root/.kube/config .kube/config
  649  kubectl create -f dashboard.yaml
  650  ssh -L 6443:127.0.0.1:6443 root@192.168.203.9 -f -N
  651  kubectl create -f dashboard.yaml
  652  kubectl get pods --all-namespaces
  653  kubectl create -f dashboard.yaml
  654  kubectl create -f dashboard.yaml 
  655  curl -k https://127.0.0.1:6443/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
  656  kubectl get pods -n kubernetes-dashboard
  657  /api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.
  658  kubectl create -f dashboard.yaml 
  659  nano w.yaml
  660  cd 1/test/test_hub/
  661  git add .
  662  git commit -m "07"
  663  git push
  664  cd ..
  665  cd 1/sa.it-academy.by/IKorolev/
  666  git push
  667  git pull
  668  git add .
  669  git commit -m "07"
  670  git push
  671  cd ..
  672  cd test/test_hub/k8/
  673  ls
  674  mkdir 1 
  675  cd 1 
  676  nano Vagrant
  677  Vagrant upp
  678  Vagrant up
  679  vagrant
  680  vagrant up
  681  kubectl version
  682  cd ..
  683  kubectl version
  684  ssh-copy-id  root@192.168.203.9
  685  ssh-copy-id  root@192.168.203.10
  686  ssh root@192.168.203.9
  687  ssh root@192.168.203.10
  688  ssh root@192.168.203.9
  689  nano w.yaml
  690  kubectl create -f dashboard.yaml 
  691  kubectl create -f w.yaml 
  692  sudo apt install ansible
  693  sudo nano /etc/ansible/hosts
  694  minikube start
  695  minikube ssh
  696  minikube addons list
  697  minikube addons enable dashboard
  698  minikube addons list
  699  kubectl get nodes
  700  kubectl get pods
  701  kubectl 
  702  kubectl --v
  703* 
  704  kubectl get pods -n kube-system
  705  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  706  kubectl get nodes
  707  kubectl config view
  708  ps aux | grep proxy
  709  ps aux | grep "kubectl proxy"
  710  kill 28324
  711  kill 745352
  712  kill 19005
  713  kill 28324
  714  minikube stop
  715  minikube start
  716  kubectl get nodes
  717  ubectl proxy --address='0.0.0.0' --disable-filter=true &
  718  kubectl proxy --address='0.0.0.0' --disable-filter=true &
  719  ssh jump_sa@178.124.206.53
  720  ssh-keygen
  721  ssh-copy-id jump_sa@178.124.206.53 -i new_key.pub
  722  ssh-copy-id -i new_key.pub jump_sa@178.124.206.9
  723  nano  ~/.ssh/config
  724  ssh root@192.168.203.9
  725  ssh-copy-id root@178.124.206.9
  726  ssh-copy-id root@178.124.203.9
  727  ssh-copy-id root@192.168.203.9
  728  ssh-copy-id root@192.168.203.10
  729  minikube stop
  730  git clone git@github.com:kubernetes-sigs/kubespray.git
  731  cd kubespray
  732  ansible --version
  733  cp -rfp inventory/sample inventory/ws
  734  declare -a IPS=(192.168.203.9 192.168.203.10)
  735  CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  736  CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  737  echo $IPS
  738  declare -a IPS=(192.168.203.9 192.168.203.10)
  739  echo $IPS
  740  ssh-copy-id root@178.124.203.10
  741  declare -a IPS=(192.168.203.9 192.168.203.10)
  742  echo $IPS
  743  CONFIG_FILE=inventory/ws/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
  744  ssh root@192.168.203.9
  745  vim inventory/ws/hosts.yaml
  746  cd ..
  747  history
  748  history >> README.md
  ```
