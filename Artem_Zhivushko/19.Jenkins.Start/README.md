# Jenkins

## Install Jenkins

```bash
sudo zypper addrepo -f https://pkg.jenkins.io/opensuse/ jenkins
sudo zypper ref
sudo zypper install dejavu-fonts fontconfig java-21-openjdk java-21-openjdk-headless
sudo zypper install jenkins nginx
```

## Hide Jenkins behind the web server Nginx

```bash
sudo vim /etc/nginx/conf.d/jenkins.conf
sudo nginx -t
sudo systemctl edit jenkins
```

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

  server_name     jenkins.zhivushko.com;

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

      proxy_set_header   Host              $http_host;
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
      proxy_request_buffering    off; # Required for HTTP CLI commands
  }

}
```

```bash
sudo systemctl restart jenkins
sudo systemctl restart nginx
```

## Create Job

### Check if today holiday in Belarus: [https://holidayapi.com/countries/by/2023](https://holidayapi.com/countries/by/2023)

```bash
#!/bin/bash
date
pwd
touch ${JOB_NAME}.json
ls
curl -G -d country="BY" -d language="ru" -d year=$(date --date="1 year ago" +%Y) -d month=$(date +%m) -d day=$(date +%e) -d pretty -d key="c76cff57-1ae9-4354-8374-7dea7eb98797" "https://holidayapi.com/v1/holidays" | tee ${JOB_NAME}.json
```

### Inform about exchange rates for current day

```bash
#!/bin/bash
# 431 usd
# 451 eur
# 452 pln
# 456 rub
date

for currency in {431,451,452,456}
do
  curl "https://api.nbrb.by/exrates/rates/$currency" | json_pp | tee $currency.json
done
```

### Can be included in one file-artefacts or simple message in slack

***I couldn't add the artifact files to the message, so I added a link to the task log: `http://jenkins.zhivushko.com/blue/rest/organizations/jenkins/pipelines/$JOB_NAME/runs/$BUILD_NUMBER/log/?start=0`***

**Error in the console when forwarding a file: `Slack upload may have failed. Response: {"ok":false,"error":"invalid_auth"}`**
