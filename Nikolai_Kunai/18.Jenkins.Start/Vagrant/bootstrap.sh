#!/bin/sh
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y
yum install java-11-openjdk-devel wget git nginx -y --nogpgcheck -q
systemctl enable nginx
systemctl start nginx
cat << EOF > /etc/nginx/conf.d/jenkins.conf
  server {
    listen 80;

    server_name jenkins.test;

    location / {
      proxy_set_header   Host              $host;
      proxy_set_header   X-Real-IP         $remote_addr;
      proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Proto $scheme;

      proxy_pass          http://127.0.0.1:8080;
                  }
}
EOF
systemctl reload nginx
setsebool -P httpd_can_network_connect 1

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