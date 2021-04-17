home VBox Cetos7 1
home VBox Centos7 2

### Centos 1
```sh
firewall Disabled
SElinux Disabled

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
#sudo firewall-cmd --permanent --service=jenkins --add-port=8080/tcp
#sudo firewall-cmd --reload
usermod -a -G docker jenkins
systemctl enable jenkins
systemctl start jenkins
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

mkdir /var/log/nginx/jenkins
nano /etc/nginx/conf.d/reverse-proxy.conf
service nginx restart
```


### Centos 2
```sh
firewall Disabled

nano /tmp/authorized_keys

#!/bin/sh
yum -y install java-1.8.0-openjdk git -q
useradd -d /var/lib/jenkins jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat /tmp/authorized_keys >> /var/lib/jenkins/.ssh/authorized_keys'
chown jenkins:jenkins /var/lib/jenkins/.ssh/authorized_keys 
chmod 600 /var/lib/jenkins/.ssh/authorized_keys
rm -f /tmp/authorized_keys
echo "Client done!"
```
