# 15.Jenkis.Start

# Vagrantfile

``` 
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.define "Jenkins"
  config.vm.network  "forwarded_port", guest: 8080, host: 9898  
  config.vm.provision :shell, :path => "bootstrap.sh"
end

``` 

# bootstrap.sh
```
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

```
![Add user ](https://github.com/mrvaart23/screenshots/blob/main/Screenshot%20from%202021-04-30%2000-27-30.png)
![Slack_module](https://github.com/mrvaart23/screenshots/blob/main/Screenshot%20from%202021-04-30%2000-22-03.png)
![Ansible_module](https://github.com/mrvaart23/screenshots/blob/main/Screenshot%20from%202021-04-30%2000-22-42.png)
