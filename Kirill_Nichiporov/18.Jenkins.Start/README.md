## NGINX for Jenkins

```bash

upstream jenkins {
  server 127.0.0.1:8080 fail_timeout=0;
}

server {
  listen 80;
  server_name jenkins.nichiporov;

  location / {
    proxy_set_header        Host $host:$server_port;
    proxy_set_header        X-Real-IP $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Forwarded-Proto $scheme;
    proxy_redirect          http://127.0.0.1:8080 http://jenkins.nichiporov;
    proxy_pass              http://127.0.0.1:8080;
  }
}


```

## Jenkins

![image](https://user-images.githubusercontent.com/110092772/191452744-6c45a717-8e40-4aee-a45e-81481270d1f9.png)

## Access rights

![image](https://user-images.githubusercontent.com/110092772/191453661-2d37629b-4e7c-4ac4-ae26-03c8cb5e8415.png)

## Installed plugins

![image](https://user-images.githubusercontent.com/110092772/191454250-ec9c708c-4d11-4cb7-b43a-f83a2fb9e9e3.png)

## Slack Notification

![image](https://user-images.githubusercontent.com/110092772/191454370-afad7faf-4b9b-4954-8146-8bc50d7268db.png)

