#!/bin/sh
sudo apt-get --allow-unauthenticated upgrade
sudo apt-get update
sudo apt install default-jdk wget curl gnupg git -yyq
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -yyq
## Install docker
curl -fsSL https://get.docker.com/ | sh
sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -s /bin/bash jenkins
#firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#firewall-cmd --reload
sudo usermod -a -G docker jenkins
sudo usermod -a -G docker $USER
sudo systemctl enable jenkins
sudo systemctl start jenkins
echo "##### Waiting for secret"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

cp /vagrant/Dockerfile /home/vagrant/Dockerfile
cp /vagrant/jenkins.conf /home/vagrant/jenkins.conf
cp /vagrant/nginx.conf /home/vagrant/nginx.conf



echo "##### Secret here"
cat /var/lib/jenkins/secrets/initialAdminPassword

### If you hide Jenkins of revesy proxy you delete ### and change congiguration jenkins on 127.0.0.1 
### sudo docker build -t nginx-jenkins . 
### sudo docker run --name proxy  -p 80:80 -v /home/vagrant/jenkins.conf:/etc/nginx/conf.d/default.conf  -d --restart=always nginx-jenkins 

