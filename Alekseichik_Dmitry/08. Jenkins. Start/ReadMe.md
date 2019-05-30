# Hometask 08. Jenkins. Start

### Hometask was made by TWO ways:
### - 1) Deploy of Jenkins(X) was made to 'Jenkins' host (192.168.100.40) using Bash Script
### - 2) Deploy of Jenkins(Y) was made to 'UB18' by Ansible playbook
### - Proxy pass to Jenkins(X) was made using another host (192.168.100.33)
### - U can see screenshots in this commit to

#### Some bash output from Ansible playbook results

``` bash

sam@ubu18:/etc/ansible$ ansible-playbook jenkins_main.yaml

PLAY [localhost] ***************************************************************

TASK [Gathering Facts] *********************************************************
ok: [localhost]

TASK [jenkins : Setup. APT UPDATES] ********************************************
changed: [localhost]

TASK [jenkins : Jenkins. Add Repo key] *****************************************
ok: [localhost]

TASK [jenkins : Jenkins. Add Repo url] *****************************************
ok: [localhost]

TASK [jenkins : Jenkins. Add Repo key FORCED] **********************************
 [WARNING]: Consider using the get_url or uri module rather than running wget.
If you need to use command because get_url or uri is insufficient you can add
warn=False to this command task or set command_warnings=False in ansible.cfg to
get rid of this message.

changed: [localhost]

TASK [jenkins : Jenkins. Add Repo FORCED] **************************************
changed: [localhost]

TASK [jenkins : Jenkins_Depend_Install_for_Debian] *****************************
ok: [localhost]

TASK [jenkins : Wait for Start Jenkins..Please stand by..] *********************
Pausing for 10 seconds
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [localhost]

TASK [jenkins : Check Connect] *************************************************
ok: [localhost]

TASK [jenkins : debug] *********************************************************
ok: [localhost] => {
    "msg": [
        "http://localhost:8080/login?from=",
        "200"
    ]
}

TASK [jenkins : Show Jenkins initialAdminPassword] *****************************
changed: [localhost]

TASK [jenkins : show passwd] ***************************************************
ok: [localhost] => {
    "passwd.stdout_lines": [
        "038721b1558240d7adc44000009427bf"
    ]
}

TASK [jenkins : Jenkins. SSH Key Generate] *************************************
changed: [localhost]

TASK [jenkins : Show Jenkins SSH RSA PRIVATE key] ******************************
changed: [localhost]

TASK [jenkins : show sshrsa] ***************************************************
ok: [localhost] => {
    "sshrsa.stdout_lines": [
        "-----BEGIN RSA PRIVATE KEY-----",
#
# CUTED TEXT OF KEY !!!!!!!!!!!!!!
#
        "-----END RSA PRIVATE KEY-----"
    ]
}

TASK [jenkins : Show Jenkins SSH RSA PUBLIC key] *******************************
changed: [localhost]

TASK [jenkins : show sshrsa] ***************************************************
ok: [localhost] => {
    "sshrsa.stdout_lines": [
        "ssh-rsa AAAAB3NzaC1y....."
#
# CUTED TEXT OF KEY !!!!!!!!!!!!!!
# 
    ]
}

PLAY RECAP *********************************************************************
localhost                  : ok=17   changed=7    unreachable=0    failed=0

```

#### NGINX Reverse Proxy was configurated manualy on other host

``` bash

#
server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /var/www/html;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	server_name _;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
        # try_files $uri $uri/ =404;

      proxy_set_header        Host $host:$server_port;
      proxy_set_header        X-Real-IP $remote_addr;
      proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header        X-Forwarded-Proto $scheme;
 
      # Fix the "It appears that your reverse proxy set up is broken" error. NGINX manual
      proxy_pass          http://192.168.100.40:8080;
      proxy_read_timeout  90;
      proxy_redirect      http://192.168.100.40:8080 http://jenkins;

	}

```