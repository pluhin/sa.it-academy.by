```bash
 2411  export API_AUTH_HEADER='admin:XXX'
 2412  curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-23.sa/job/10.Print.env/build
 2413  curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-23.sa/job/10.env/build
 2414  curl -X GET -u ${API_AUTH_HEADER}  http://jenkins.k8s-23.sa/job/10.env/config.xml -o config.xml
 2415  ls
 2416  vim config.xml
 2417  curl -X POST -H "Content-Type:text/xml" -u ${API_AUTH_HEADER} http://jenkins.k8s-23.sa/job/10.env/config.xml --data-binary "@config.xml"
 2418  curl -X POST -H "Content-Type:text/xml" -u ${API_AUTH_HEADER} "http://jenkins.k8s-23.sa/createItem?name=11.env" --data-binary "@config.xml"
 2419  curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-23.sa/job/11.env/build
```