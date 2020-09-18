## Vagrant

```bash
 9790* sudo apt install virtualbox
 9791* vboxmanage --version
 9792* sudo apt install vagrant
 9793* vagrant --version
 9794* clear
 9795* vagrant box list
 9796* vagrant plugin install cloud
 9797* cd Documents/git_repos/home/sa.it-academy.by/demo/04.Vagrant/01
 9798* ls
 9799* vagrant init centos/7
 9800* vagrant plugin list
 9801* vagrant init centos/7
 9802* vagrant plugin
 9803* vagrant plugin uninstall
 9804* vagrant plugin uninstall cloud
 9805* vagrant init centos/7
 9806* vim Vagrantfile
 9807* vagrant up
 9808  vagrant cloud
 9809* vagrant status
 9810* vagrant global-status
 9811* vagrant halt
 9812* vagrant desrtoy
 9813* vagrant destroy
 9814* vagrant halt && vagrant destroy
 9815* cd ../
 9816* mkdir {02,03,04,05}
 9817* ls
 9818* cd 02
 9819* vim Vagrantfile
 9820* vagrant up
 9821* home_connect_local
 9822* vagrant ssh
 9823  ping 100.104.146.213
 9824  ifconfig
 9825* vagrant halt && vagrant destroy -f
 9826  ifconfig
 9827* cd ../03
 9828* vagrant up 
 9829* vagrant ssh
 9830* ssh vagrant@192.168.1.244
 9831* vagrant halt && vagrant destroy -f
 9832* cd ../
 9833* cd 04
 9834* vagrant up master node1
 9835  cd /home/spishchyk/Documents/git_repos/home/sa.it-academy.by/demo/
 9836  cd 04.Vagrant
 9837  mkdir 06
 9838  cd 06
 9839* git status
 9840* vagrant status
 9841* vagrant ssh master
 9842* vagrant halt && vagrant destroy -f
 9843  vagrant init hashicorp/precise64
 9844  vagrant up
 9845  vagrant ssh
 9846* cd ../06
 9847* vagrant ssh
 9848  vagrant package --output /tmp/test.box
 9849* top
 9850  vagrant clood login
 9851  vagrant cloud login
 9852  vagrant cloud auth
 9853  vagrant cloud auth login
 9854  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 9855  openssl s_client -connect aristo4stu3.bgu.ac.il:443
 9856  vagrant plugin install cloud
 9857  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 9858  vagrant plugin update
 9859  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 9860  vagrant plugin expunge --reinstall
 9861  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 9862  scp /tmp/test.box plu@192.168.1.100:/tmp
 9863  home_connect_local
 9864  history| open
 9865  history| grep open
 9866* sudo vim /usr/lib/ssl/openssl.cnf
 9867* sudo vim /usr/include/nodejs/openssl.cnf
 9868  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
 9869  vagrant plugin remove cloud
 9870  vagrant plugin uninstall cloud
 9871  vagrant cloud publish --release pluhin/test 1.0 virtualbox /tmp/test.box
```
---

### Vagrant cloud

```bash
sudo -i
apt-get update && apt-get upgrade -yqq && apt-get install vim mc git wget -yqq
rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
```