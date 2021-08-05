# Homework.16.Jenkins.Start

## /etc/nginx/conf.d/jenkins.conf

```bash

upstream jenkins {
  keepalive 32;
  server 127.0.0.1:8080;
}

server {
  listen          80;

  server_name     jenkins.lab;

  # this is the jenkins web root directory
  # (mentioned in the /etc/default/jenkins file)
  root            /var/lib/jenkins/;

  access_log      /var/log/nginx/jenkins/access.log;
  error_log       /var/log/nginx/jenkins/error.log;

  location / {
      sendfile off;
      proxy_pass         http://localhost:8080;
      proxy_redirect     default;
      proxy_http_version 1.1;

      proxy_set_header   Host              $host;
      proxy_set_header   X-Real-IP         $remote_addr;
      proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
      proxy_set_header   X-Forwarded-Proto $scheme;
      proxy_max_temp_file_size 0;

      #this is the maximum upload size
      client_max_body_size       10m;
      client_body_buffer_size    128k;

      proxy_connect_timeout      90;
      proxy_send_timeout         90;
      proxy_read_timeout         90;
      proxy_buffering            off;
      proxy_request_buffering    off; # Required for HTTP CLI commands
      proxy_set_header Connection ""; # Clear for keepalive
  }

}


```
