# Jenkins

## Master (centos)

```bash
#!/bin/sh
yum install java wget git epel-release -y --nogpgcheck -q
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
```

## Slave/Node (Ubuntu)

```bash
#!/bin/sh
PUBLIC_MATER_KEY="XXX"
apt -yyq install openjdk-8-jdk git -q
useradd -s /bin/bash -d /home/jenkins/ -m jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
echo $PUBLIC_MATER_KEY  > /home/jenkins/.ssh/authorized_keys
chown jenkins:jenkins /home/jenkins/.ssh/authorized_keys
chmod 600 /home/jenkins/.ssh/authorized_keys
echo "Client done!
```