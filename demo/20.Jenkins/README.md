

## API

```bash
export API_TOKEN="admin:XXXXXXXXXX"
curl -X POST -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Task/build
curl -X GET -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Task/config.xml -o config.xml
vim config.xml
curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Task/config.xml --data-binary "@config.xml"
curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://127.0.0.1:8080/createItem?name=99.task' --data-binary "@config.xml"
```


## Webhook

- enable new channel on https://smee.io/
- Setup github
  - add smee.io url as webhook in repo settings
  - generate token for jenkins in your github personal settings
- Setup Jenkins (https://plugins.jenkins.io/github/)
  - add github token to System settings (GitHub Servers section)
  - add task with github url of repo
  - enable "GitHub hook trigger for GITScm polling"

Github (push) -> https://smee.io/XXXXXXXXXX -> | local_app (proxy) -> Jenkins: http://127.0.0.1/github-webhook/ |


```bash
   apt-get update && sudo apt-get install -y ca-certificates curl gnupg
   mkdir -p /etc/apt/keyrings
   sudo curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
   NODE_MAJOR=20
   echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
   apt-get update && apt-get install nodejs -y
   npm --version
   npm install --global smee-client
   smee --help
   smee -u https://smee.io/XXXXXXXXXX -P /github-webhook/ -p 8080
```