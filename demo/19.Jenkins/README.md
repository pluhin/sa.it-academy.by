# Jenkins Jobs

## Webhook

```bash
    6  su - jenkins
    7  cat /var/lib/jenkins/.ssh/id_rsa.pub
    8  vim /etc/ssh/ssh_config
    9  su - jenkins
   10  cat /var/lib/jenkins/.ssh/id_rsa
   11  su - jenkins
   12  service jenkins restart
   13  top
   14  vim /etc/ssh/ssh_config
   15  su - jenkins
   16  curl -sL https://deb.nodesource.com/setup_14.x | bash -
   17  apt-get install gcc g++ make
   18  npm --version
   19  npm install -g smee-client
   20  smee
   21  smee -h
   22  smee -u https://smee.io/XXXX --path /github-webhook/ --port 8080
```

- enable new channel on https://smee.io/
- Setup github
  - add smee.io url as webhook in repo settings
- setup Jenkins
  - add task with github url of repo
  - enable "GitHub hook trigger for GITScm polling"

Github -> smee.io -> local_app -> Jenkins: http://127.0.0.1/github-webhook/

## Github API

```bash
 4445  export API_TOKEN="admin:XXXX"
 4446  curl -X POST -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/build
 4447  curl -X GET -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml -o config.xml
 4448  vim config.xml
 4449  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml --data-binary "@config.xml"
 4451  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} "http://192.168.1.200:8080/createItem?name=10.1.env" --data-binary "@config.xml"
```