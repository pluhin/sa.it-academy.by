## Jenkins API

```bash
2181  export API_TOKEN="admin:XXX"
 2182  curl -X POST -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/build
 2183  curl -X GET -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml -o config.xml
 2184  vim config.xml
 2185  curl -X POST -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml --data-binary "@config.xml"
 2186  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml --data-binary "@config.xml"
 2187  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} "http://192.168.1.200:8080/createItem?name=10.print.env.by.API" --data-binary "@config.xml"
```

## Webhook

- enable new channel on https://smee.io/
- Setup github
  - add smee.io url as webhook in repo settings
  - setup Jenkins
- add task with github url of repo
  - enable "GitHub hook trigger for GITScm polling"

Github -> smee.io -> local_app -> Jenkins: http://127.0.0.1/github-webhook/

```bash
root@vagrant:~# history
    1  curl -sL https://deb.nodesource.com/setup_14.x | bash -
    2  apt-get install gcc g++ make
    3  sudo apt-get install -y nodejs
    4  npm --version
    5  npm install -g smee-client
    6  smee -u https://smee.io/XXXX --path /github-webhook/ --port 8080
    7  history
```