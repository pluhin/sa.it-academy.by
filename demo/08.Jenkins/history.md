```bash
  759  mkdir 08.Jenkins
  760  cd 08.Jenkins
  761  ls
  762  mkdir 01.Install
  763  cd 01.Install
  764  Vagrantfile
  765  vim Vagrantfile
  766  vim bootstrap.sh
  767  vagrant up
  768* ping 192.168.1.200
  769* top
  770  vim Dockerfile
  771  docker build . -t jenkins_demo
  772* docker search jenkins
  773* docker run -d -p 8081:8080 jenkins
  774  docker build . -t jenkins_demo
  775* docker ps
  776* sudo firewall-cmd --list-all
  777* top
  778* docker ps
  779* docker stop 31b1fce8162b
  780* docker run -d -p 8081:8080 jenkins/jenkins
  781* vim /etc/sysctl.conf
  782* sudo vim /etc/sysctl.conf
  783* sudo systemctl restart networkr
  784* sudo systemctl restart network
  785* docker ps
  786* docker stop 20ccea4391f1
  787* docker run -d -p 8081:8080 jenkins/jenkins
  788* docker ps
  789* docker exec -it 93643d679510 bash
  790* uname -a
  791* docker ps
  792* docker stop 93643d679510
  793* docker stop fb455cd79266
  794  mkdir node01
  795  cd node01
  796  vim Vagrantfile
  797  vim authorized_keys
  798  vagrant up
  799* top
  800  vim Vagrantfile
  801  ping 192.168.1.200
  802  ping 192.168.1.201
  803  ssh vagrant@192.168.1.200
  804  vim /home/plu/.ssh/known_hosts
  805  ssh vagrant@192.168.1.201
  806  vim /home/plu/.ssh/known_hosts
  807  ssh vagrant@192.168.1.201
  808  vagrant ssh
  809  vim Vagrantfile
  810  vagrant ssh
  811  vagrant halt && vagrant destroy -f
  812  cd ../
  813  ls
  814  vagrant halt && vagrant destroy -f
  815  git status
  816  cd ../../
  817  cd ../
  818  git status
  819  git add demo/08.Jenkins
  820  git commit -m "Jenkins 01"
  821  git push
```
