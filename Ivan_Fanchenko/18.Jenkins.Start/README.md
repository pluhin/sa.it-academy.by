## 18. Jenkins. Start

### Jenkins

#### Jenkins and nodes
![alt text](node.png)

#### Plugins screenshot
![alt text](ansible.png)

![alt text](slack.png)

#### Roles matrix screenshot
![alt text](matrix.png)

### Nginx

#### Commands
```bash
yum install epel-release
sudo yum install nginx
setsebool -P httpd_can_network_connect 1
systemctl start nginx
systemctl enable nginx
```

#### /etc/nginx/conf.d/jenkins.conf
```bash
upstream jenkins {
  server 127.0.0.1:8080 fail_timeout=0;
}

server {
  listen 80;
  server_name jenkins.my;

  location / {
    proxy_set_header        Host $host:$server_port;
    proxy_set_header        X-Real-IP $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Forwarded-Proto $scheme;
    proxy_redirect          http://127.0.0.1:8080 http://jenkins.my;
    proxy_pass              http://127.0.0.1:8080;
  }
}
```

### Test configuration and restart nginx
```bash
[root@localhost conf.d]# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

[root@localhost conf.d]# nginx -s
```

![alt text](nginx_agent.png)

