# 05.Vagrant
### Installation:
- create `Vagrantfile` in specified folder
- add content from vagrant cloud (see the links to boxes below)
- add instruction `config.vm.network "forwarded_port", guest: 80, host: 4080`
- execute command `vagrant up`
- go to [nginx index page](http://127.0.0.1:4080)

### Boxes:
- [**Debian**](https://app.vagrantup.com/andreyned/boxes/demo_debian)
- [**CentOs**](https://app.vagrantup.com/andreyned/boxes/demo_centos8)

### Files:
#### Debian
Vagrantfile
```shell
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.network "forwarded_port", guest: 80, host: 4080
  config.vm.provision "shell", path: "bootstrap.sh"
end
```
bootstrap.sh
```shell
sudo apt-get update
sudo apt-get upgrade -yqq
sudo apt-get install vim git wget curl -yqq
sudo apt install nginx -yqq

sudo systemctl status nginx

echo "Change default index.html"
sudo cp /vagrant/html/index.html  /var/www/html/index.nginx-debian.html 
```
html/index.html
```html5
<!DOCTYPE html>
<html>
  <head>
    <title>Debian</title>
  </head>
  <body>
    <h1>Hello, I am Debian</h1>
  </body>
</html>
```
#### CentOs
Vagrantfile
```shell
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-8"
  config.vm.network "forwarded_port", guest: 80, host: 4080
  config.vm.provision "shell", path: "bootstrap.sh"
end
```
bootstrap.sh
```shell
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y
sudo yum install vim-enhanced -y
vim --version

sudo yum install git -y
git --version

sudo yum install wget -y
wget --version

sudo yum install curl -y
curl --version

sudo yum install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx

sudo cp /vagrant/html/index.html  /usr/share/nginx/html/index.html
```
html/index.html
```html5
<!DOCTYPE html>
<html>
  <head>
    <title>CentOs 8</title>
  </head>
  <body>
    <h1>Hello, I am CentOs8!</h1>
  </body>
</html>
```
