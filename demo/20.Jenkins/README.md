```bash
 1119  export API_TOKEN="admin:XXXXXXXXXXXXXXXXXXX"
 1120  curl -X POST -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Test/build
 1121  echo $?
 1122  curl -X GET -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Test/config.xml -o config.xml
 1123  vim config.xml
 1124  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://127.0.0.1:8080/job/01.Test/config.xml --data-binary "@config.xml"
 1125  echo $?
 1126  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://127.0.0.1:8080/createItem?name=99.task' --data-binary "@config.xml"
 1127  echo $?
 1128  vim config.xml
 1129  ls -l /var/lib/jenkins/workspace/01.Test/
 1130  history
```

## Webhook

- enable new channel on https://smee.io/
- Setup github
  - add smee.io url as webhook in repo settings
  - generate token for jenkins in your github personal settings
- Setup Jenkins (https://plugins.jenkins.io/github/)
  - add github token to System settings (GitHub Servers section)
  - add task with github url of repo
  - enable "GitHub hook trigger for GITScm polling" in jobs settings

Github (push) -> https://smee.io/XXXXXXXXXX -> | local_app (proxy) -> Jenkins: http://127.0.0.1/github-webhook/ |


```bash
 1105  curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
 1106  sudo bash /tmp/nodesource_setup.sh

 1116  sudo npm install --global smee-client
 1117  smee --help
 1118  smee -u https://smee.io/XXXXXXX -P /github-webhook/ -p 8080
```