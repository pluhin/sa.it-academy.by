```bash

export API_AUTH_HEADER='admin:110b68bae5aa1d9a614076a3f888381dab'
curl -X POST -u ${API_AUTH_HEADER}  http://jenkins.k8s-21.sa/job/10.Print.env/build
curl -X GET -u ${API_AUTH_HEADER}  http://jenkins.k8s-21.sa/job/10.Print.env/config.xml -o config.xml
vim config.xml
curl -X POST -H "Content-Type:text/xml" -u ${API_AUTH_HEADER} http://jenkins.k8s-21.sa/job/10.Print.env/config.xml --data-binary "@config.xml"
curl -X POST -H "Content-Type:text/xml" -u ${API_AUTH_HEADER} "http://jenkins.k8s-21.sa/createItem?name=11.Print.env" --data-binary "@config.xml"
```