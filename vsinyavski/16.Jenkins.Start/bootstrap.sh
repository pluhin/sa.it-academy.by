#!/bin/sh
yum install java wget git -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
## Install docker
curl -fsSL https://get.docker.com/ | sh
systemctl enable docker
systemctl start docker
usermod -s /bin/bash jenkins
#firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#firewall-cmd --reload
usermod -a -G docker jenkins
systemctl enable jenkins
systemctl start jenkins
## Install nginx
yum install epel-release -y 
yum install nginx -y
systemctl start nginx
systemctl enable nginx
usermod -aG jenkins nginx
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --reload
cp /tmp/jenkins.conf /etc/nginx/conf.d/jenkins.conf
systemctl restart nginx
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
