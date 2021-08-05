```bash
export API_AUTH_HEADER='admin:XXXXXXX'
10729  curl -X POST -u ${API_AUTH_HEADER}  https://jenkins-sa.it-academy.by/job/md-sa2-17-21/job/10.print.evn/build
10730  curl -X GET -u ${API_AUTH_HEADER}  https://jenkins-sa.it-academy.by/job/md-sa2-17-21/job/10.print.evn/config.xml -o config.xml
10731  vim config.xml
10732  curl -X POST -u ${API_AUTH_HEADER}  https://jenkins-sa.it-academy.by/job/md-sa2-17-21/job/10.print.evn/config.xml --data-binary  "@config.xml" -H "Content-Type:text/xml"
10733  curl -X POST -u ${API_AUTH_HEADER}  https://jenkins-sa.it-academy.by/job/md-sa2-17-21/createItem?name=11.print.evn --data-binary  "@config.xml" -H "Content-Type:text/xml"
10734  curl -X POST -u ${API_AUTH_HEADER}  "https://jenkins-sa.it-academy.by/job/md-sa2-17-21/createItem?name=11.print.evn" --data-binary  "@config.xml" -H "Content-Type:text/xml"
```