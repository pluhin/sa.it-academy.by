#!/bin/sh
mv /vagrant/nginx.repo /etc/yum.repos.d/nginx.repo
yum update
yum install java wget git nginx -y --nogpgcheck -q
systemctl enable nginx && systemctl start nginx

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
usermod -s /bin/bash jenkins
systemctl enable jenkins
systemctl start jenkins
echo '######## Waiting for secret ########'
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
	sleep 2
done
sudo runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "######## Secret here ########"
cat /var/lib/jenkins/secrets/initialAdminPassword
