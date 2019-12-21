#!/bin/sh

yum install java wget git -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
usermod -s /bin/bash jenkins
systemctl enable jenkins
systemctl start jenkins
echo "##### Waiting for secret pass"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runsuer -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "##### Secret pass is here"
cat /var/lib/jenkins/secrets/initialAdminPassword
