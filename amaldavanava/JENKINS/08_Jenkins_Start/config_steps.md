# Is it ok, that i used AWS instance without using vagrant ?
```bash
    1  sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
    2  sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
    3  sudo yum install jenkins
    4  sudo yum install java
    5  sudo service jenkins status
    6  sudo service jenkins start
    8  sudo chkconfig jenkins on
   10  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   15  amazon-linux-extras list
   16  sudo amazon-linux-extras install nginx1.12
   20  sudo service nginx status
   22  sudo service nginx start
   25  sudo chkconfig nginx on
   27  ls -l /etc/nginx/conf.d/
   32  sudo vi /etc/nginx/conf.d/jenkins.conf
   34  sudo service nginx restart
```
