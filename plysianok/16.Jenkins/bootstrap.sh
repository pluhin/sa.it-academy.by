#!/bin/sh
yum install java wget git epel-release nginx -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
## Install docker
curl -fsSL https://get.docker.com/ | sh
systemctl enable docker
systemctl start docker

usermod -s /bin/bash jenkins
usermod -a -G docker jenkins
usermod -a -G jenkins nginx
systemctl enable jenkins
systemctl start jenkins
systemctl enable nginx
systemctl start nginx

setsebool -P httpd_can_network_connect 1

echo "##### Waiting for secret"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "##### Secret here"
cat /var/lib/jenkins/secrets/initialAdminPassword
