#!/bin/sh
yum install java wget git -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
yum install epel-release -y 
yum install nginx -y --nogpgcheck -q

cp /tmp/nginx.conf /etc/nginx/nginx.conf
cp /tmp/jenkins.conf /etc/nginx/conf.d/jenkins.conf

setsebool -P httpd_can_network_connect 1
usermod -s /bin/bash jenkins
systemctl enable jenkins
systemctl start jenkins
systemctl enable nginx
systemctl start nginx
echo "********** Waiting for secret ***********"

while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done

runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "********** Secret here **********"
cat /var/lib/jenkins/secrets/initialAdminPassword
