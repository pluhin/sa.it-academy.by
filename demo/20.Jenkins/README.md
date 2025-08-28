Github webhook -> smee.io -> smee-k8s-agent -> jenkins-service

Github webhook  -> jenkins-service

```bash
 1669  export API_TOKEN="admin:XXXXX"
 1670  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-11.sa/job/01.Job/build
 1671  curl -X GET -u ${API_TOKEN}  http://jenkins.k8s-11.sa/job/01.Job/config.xml -o config.xml
 1672  clear
 1673  vim config.xml
 1674  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-11.sa/job/01.Job/config.xml --data-binary "@config.xml"
 1675  echo $?
 1676  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://jenkins.k8s-11.sa/createItem?name=99.task' --data-binary "@config.xml"
 1677  echo $?
```