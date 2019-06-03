#!/bin/sh
#Add Jenkins Repo and key
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Packs part
apt update
apt-get install mc -y
apt-get install nginx -y
apt-get install git -y
apt-get install openjdk-8-jdk -y
apt-get install jenkins -y

#yum install java wget git -y --nogpgcheck -q
#wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
#rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#yum install jenkins -y --nogpgcheck -q
#usermod -s /bin/bash jenkins
#sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#sudo firewall-cmd --reload

systemctl enable jenkins
systemctl start jenkins
echo "##### Waiting for secret"
while [ ! -f /var/lib/jenkins/secrets/initialAdminPassword ]
do
    sleep 2
done
sudo runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub'

echo "##### Secret here"
cat /var/lib/jenkins/secrets/initialAdminPassword
