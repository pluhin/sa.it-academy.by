```bash
 1001  cd /tmp/sa.it-academy.by/
 1002  ls
 1003  git pull
 1004  cd demo/
 1005  ls
 1006  mkdir 10.Jenkins
 1007  cd 10.Jenkins/
 1008  ls
 1009  mkdir {Jenkins_master,Jenkins_node}
 1010  cd Jenkins_master/
 1011  vim Vagrantfile
 1012  ifconfig
 1013  vim Vagrantfile
 1014  vim bootstrap.sh
 1015  vagrant up
 1016  top
 1017  docker search jenkins
 1018  docker run -p 8082:8080 --name=jenkins-master jenkins
 1019  clear
 1020  cd ../
 1021  ls -l
 1022  cd Jenkins_node/
 1023  ls
 1024  vim Vagrantfile
 1025  ifconfig
 1026  vim Vagrantfile
 1027  vagrant up
 1028  vim authorized_keys
 1029  vagrant up
 1030  cd ../Jenkins_master/
 1031  vagrant ssh
 1032  vagrant halt && vagrant destroy -f
 1033  cd ../
 1034  cd Jenkins_node/
 1035  vagrant halt && vagrant destroy -f
 1036  history
```
