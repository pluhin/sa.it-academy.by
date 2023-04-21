# 19.Jenkins Start

## Install Jenkins

[install](install/script.sh)

![install.png](install.png)

### Add restricted user to view Jobs, without any changes inside Jobs and Jenkins settings

![user.png](user.png)

### Nginx conf

```conf
server {
    listen 80;
    server_name jenkins.devops.esc.sh;

	location / {
		include /etc/nginx/proxy_params;
		proxy_pass          http://localhost:8080;
		proxy_read_timeout  60s;
        # Fix the "It appears that your reverse proxy set up is broken" error.
        # Make sure the domain name is correct
		proxy_redirect      http://localhost:8080 https://jenkins.devops.esc.sh;
	}
}
```

![conf.png](conf.png)

## Create job to run each day and collect data and send as artefacts to the slack

[config.xml](config.xml)

![job.png](job.png)
![slack.png](slack.png)

Artefact file not upload in slack, invalid_auth:
```log
Adding file /var/lib/jenkins/workspace/test_job/result.txt
Slack upload may have failed. Response: {"ok":false,"error":"invalid_auth"}
```