```bash

 1454  export API_AUTH_TOKEN='admin:XXXXXXXXXXXXXXXXXX'
 1455  curl -X POST -u ${API_AUTH_TOKEN} https://jenkins-sa.it-academy.by/job/md-sa2-16-21/job/10.print.evn/build
 1458  curl -X GET -u ${API_AUTH_TOKEN} https://jenkins-sa.it-academy.by/job/md-sa2-16-21/job/10.print.evn/config.xml -o config.xml
 1459  vim config.xml
 1462  curl -X POST -u ${API_AUTH_TOKEN} "https://jenkins-sa.it-academy.by/job/md-sa2-16-21/createItem?name=99_test" --data-binary "@config.xml" -H "Content-Type:text/xml"
 1463  curl -X POST -u ${API_AUTH_TOKEN} https://jenkins-sa.it-academy.by/job/md-sa2-16-21/job/10.print.evn/config.xml --data-binary "@config.xml" -H "Content-Type:text/xml"
```
