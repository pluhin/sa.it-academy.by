# Jenkins start
### Log on master node
```bash
    1  sudo apt update
    2  sudo apt install nginx
    3  cd /etc/nginx
    4  ls -ll
    5  cd sites-available/
    6  ls -ll
    7  nano jenkins
    8  sudo nano jenkins
    9  cd ../sites-enabled/
   10  ln -s ../sites-available/jenkins jenkins
   11  sudo ln -s ../sites-available/jenkins jenkins
   12  ls -ll
   13  sudo ln -s /etc/nginx/sites-available/jenkins jenkins
   14  rm jenkins
   15  sudo rm jenkins
   16  sudo ln -s /etc/nginx/sites-available/jenkins jenkins
   17  ls -ll
   18  nginx -t
   19  sudo nginx -t
   20  usermod -aG jenkins nginx
   21  usermod -aG jenkins www-data
   22  sudo usermod -aG jenkins www-data
   23  sudo systemctl restart nginx
```
### Revers proxy config for NGINX

```
upstream jenkins {
  keepalive 32; # keepalive connections
  server 127.0.0.1:8080; # jenkins ip and port
}

# Required for Jenkins websocket agents
map $http_upgrade $connection_upgrade {
  default upgrade;
  '' close;
}

server {
  listen          80;       # Listen on port 80 for IPv4 requests

  server_name     jenkins.home;

  # this is the jenkins web root directory
  # (mentioned in the output of "systemctl cat jenkins")
  root            /var/run/jenkins/war/;

  access_log      /var/log/nginx/jenkins.access.log;
  error_log       /var/log/nginx/jenkins.error.log;

  # pass through headers from Jenkins that Nginx considers invalid
  ignore_invalid_headers off;

  location ~ "^/static/[0-9a-fA-F]{8}\/(.*)$" {
    # rewrite all static files into requests to the root
    # E.g /static/12345678/css/something.css will become /css/something.css
    rewrite "^/static/[0-9a-fA-F]{8}\/(.*)" /$1 last;
  }

  location /userContent {
    # have nginx handle all the static requests to userContent folder
    # note : This is the $JENKINS_HOME dir
    root /var/lib/jenkins/;
    if (!-f $request_filename){
      # this file does not exist, might be a directory or a /**view** url
      rewrite (.*) /$1 last;
      break;
    }
    sendfile on;
  }

  location / {
      sendfile off;
      proxy_pass         http://jenkins;
      proxy_redirect     default;
      proxy_http_version 1.1;

      # Required for Jenkins websocket agents
      proxy_set_header   Connection        $connection_upgrade;
      proxy_set_header   Upgrade           $http_upgrade;

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

>Added an entry to the host file for access:
>**192.168.31.201   jenkins.home**
## UI Admin
<br>
<img src="https://dub01pap001files.storage.live.com/y4mxBuoLBHzFqq_cIBFAFopLrtNitN_wsQrgiOwcsRjsXzgwVDuyCM8aw3_GFvbDSs9vAnD0g5-AlnwEgfTeg5FZZbIm9WT5hnhdl-Tv2mdGBWP3X8kD1R0JVNL-z44EEOS7kWb7rv9rq9W8tVF0ZpRcCJTn4Lisztuc4D1Yu38pHgF80OksnYMTOgQZsGii50g?width=2371&height=1447&cropmode=none" width="auto" height="auto" />
</br>

## Matrix-based security
<br>
<img src="https://dub01pap001files.storage.live.com/y4mL5XCZp5iZ3TO83FO9uPOzMsTIgaYRwZDQ1Rc9PSiY-2aJbhtW2y1wbHPcLPd5qcEnR6tlKE0MGYpk_PIAXnPRd-Y0IPjAmyWllFsWEWCS1mSLIUtzg52cci8IYlEzgVquOdHd6DA3Iqll5Rrqxl37-oQAwXLznlJX4N1r4-2hHey04fEJm-4kUGd3gxa-K7r?width=1552&height=660&cropmode=none" width="auto" height="auto" />
</br>

## UI User 
<br>
<img src="https://dub01pap001files.storage.live.com/y4mccJrscSjVsrZWC7v1aK3pHgWnttHkezmY7za400w3u2vLF7WPHQOX9wsTiXexHwtmQNlXsJj_3NpF67gVm6Nx9bgUlMccjAA5qOHUhyZAXIQ0L5-guLcDIpxjhGrsUyyWTKp6OV6yu9V4P9My2tIYZb2Cu8V-iB4J_4ZCpnagKXJA3NNvCKiPXrDlW7Yi6En?width=2380&height=1320&cropmode=none" width="auto" height="auto" />
</br>

## Slack notifications
<br>
<img src="https://dub01pap001files.storage.live.com/y4msb6Os4ZCV0Fc0NCeF87PA7pch1nNAsHpo2ydCJf3HkgiWK3-xEuZEV5pONq_qS9x1sNlvPLeL5z_FNNAFeJ2DcgMQgSrK5xC0BHYgYcPmDOuwS2vDSMJqehi7mJy3E5bgb6XXgYtnnM9OmP9wdoLUNavkoBLojAee8YqF5trzVRDLYQ8ZmRpLR0dpKpYJPam?width=2296&height=1479&cropmode=none" width="auto" height="auto" />
</br>
