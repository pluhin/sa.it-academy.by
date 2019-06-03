#!/bin/sh
yum install java git wget -y --nogpgcheck -q #install pakages
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo #load git-repo-jenkins
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q #install jenkins
usermod -s /bin/bash jenkins #create user jenkins&&console
#sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#sudo firewall-cmd --reload
systemctl enable jenkins #enablet&&start service
systemctl start jenkins
echo "##### Waiting for secret"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
   sleep 2
done
sudo runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa' #gen ssh-key
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "##### Secret here"
cat /var/lib/jenkins/secrets/initialAdminPassword
