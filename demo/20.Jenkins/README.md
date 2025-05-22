# 20.Jenkins

Github webhook -> smee.io -> smee-k8s-agent -> jenkins-service

Github webhook -> jenkins-service

GitHub API

```bash
 1500  curl -S http://jenkins.k8s-25.sa/
 1501  export API_TOKEN="admin:XXXXXXXX"
 1502  curl -X POST -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/build
 1503  echo $?
 1504  curl -X GET -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/config.xml -o config.xml
 1505  vim config.xml
 1506  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/config.xml --data-binary "@config.xml"
 1507  echo $?
 1508  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://jenkins.k8s-25.sa/createItem?name=99.task' --data-binary "@config.xml"
```