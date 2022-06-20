#!/bin/sh
yum -y install epel-release --nogpgcheck
yum -y install nginx --nogpgcheck

cat << EOF > /etc/nginx/conf.d/jenkins.conf
server {
    listen       80;
    server_name  jenkins.igoz.test;

    location / {
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$http_host;
        proxy_set_header X-Forwarded-Proto http;
        proxy_redirect localhost:8080 http://jenkins.igoz.test;
        proxy_connect_timeout      240;
        proxy_send_timeout         240;
        proxy_read_timeout         240;
        proxy_pass 'http://localhost:8080/';
    }
}
EOF

sudo systemctl enable nginx
sudo systemctl start nginx
sudo setsebool httpd_can_network_connect on -P

