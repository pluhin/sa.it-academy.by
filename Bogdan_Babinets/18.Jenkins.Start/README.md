# 18. Jenkins. Start

## Installation commands

```bash
yum install java-11-openjdk-devel epel-release nginx wget git -y --nogpgcheck -q
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install jenkins -y --nogpgcheck -q
curl -fsSL https://get.docker.com/ | sh
systemctl enable docker
systemctl start docker
/usr/sbin/setsebool httpd_can_network_connect 1

cat << EOF > /etc/nginx/conf.d/jenkins.conf
upstream jenkins_house {
    # Jenkins is listening on default 8080 port
    server 127.0.0.1:8080 fail_timeout=0;
}

server {
    listen       80;
    server_name  jenkins.house;

    location / {
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$http_host;
        proxy_set_header X-Forwarded-Proto http;
        proxy_redirect 127.0.0.1:8080 http://jenkins.house;
        proxy_connect_timeout      240;
        proxy_send_timeout         240;
        proxy_read_timeout         240;
        # note, there is not SSL here! plain HTTP is used
        proxy_pass http://jenkins_house;

    }
}
EOF

systemctl enable nginx
systemctl start nginx
usermod -s /bin/bash jenkins
usermod -a -G docker jenkins
systemctl enable jenkins
systemctl start jenkins
runuser -l jenkins -c 'echo -e "\n\n\n" | ssh-keygen -t rsa'
runuser -l jenkins -c 'cat ~/.ssh/id_rsa' > /root/id.txt
runuser -l jenkins -c 'cat ~/.ssh/id_rsa.pub' > /root/idpub.txt
cat /var/lib/jenkins/secrets/initialAdminPassword > /root/pas.txt
```
