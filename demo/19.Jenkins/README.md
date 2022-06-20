## History

```
   38  clear
   39  date
   40  ntpdate
   41  yum install ntp ntpdate
   42  sudo yum install ntp ntpdate
   43  systemctl start ntpd
   44  sudo systemctl start ntpd
   45  sudo systemctl status ntpd
   46  date
   47  clear
   48  curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
   49  curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
   50  sudo yum install gcc-c++ make
   51  sudo yum install nodejs
   52  npm --version
   53  smee
   54  smee -u https://smee.io/XXX --path /github-webhook/ --port 8080
   55  top
   56  cat /proc/cpuinfo
   57  free -h
   58  shutdown -h now
   59  smee -u https://smee.io/XXXX --path /github-webhook/ --port 8080
   60  clear
   61  export API_TOKEN="admin:XXXX"
   62  curl -X POST -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/build
   63  curl -X GET -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml -o config.xml
   64  vim config.xml
   65  sudo yum install vim
   66  vim config.xml
   67  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://192.168.1.200:8080/job/10.print.env/config.xml --data-binary "@config.xml"
   68  echo $?
   69  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://192.168.1.200:8080/createItem?name=10.1.env --data-binary "@config.xml"
   70  echo $?
   71  history
```

## Webhook

GITHUB -> Jenkins url

- Setup github
  - add jenkins url as webhook
  - generate token
- setup Jenkins
  - add task with git url of repo
  - add tocken

Github -> smee.io -> local_app -> Jenkins: http://127.0.0.1/github-webhook/