#Reverse proxy Jenkins by NGINX
# ALL STEPS AFTER INSTALL UBUNTU 18.04 by VAGRANT
``` bash
vagrant ssh
### Install Jenkins
sudo apt update
sudo apt install openjdk-8-jdk
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
### Install NGINX
sudo apt install nginx
sudo  vim etc/nginx/sites-available/jenkins.conf
sudo ln -s /etc/nginx/sites-available/jenkins.conf /etc/nginx/sites-enabled/
rm -rf etc/nginx/sites-enabled/default
### RESTART SERVICES
sudo systemctl restart nginx
sudo systemctl restart jenkins

```
