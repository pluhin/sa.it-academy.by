```bash
 8043  export API_AUTH_HEADER='admin:XXX'
 8044  curl -X POST -u ${API_AUTH_HEADER} https://pluhin.ddns.net/job/SA/job/SA_07/job/10.print.evn/build
 8045  curl -X GET -u ${API_AUTH_HEADER} https://pluhin.ddns.net/job/SA/job/SA_07/job/10.print.evn/config.xml -o conf.xml
 8046  vim conf.xml
 8047  curl -X POST -u ${API_AUTH_HEADER} https://pluhin.ddns.net/job/SA/job/SA_07/job/10.print.evn/config.xml --data-binary "@conf.xml"
 8048  curl -X POST -u ${API_AUTH_HEADER} https://pluhin.ddns.net/job/SA/job/SA_07/job/10.print.evn_01/config.xml --data-binary "@conf.xml"
 8049  curl -X POST -u ${API_AUTH_HEADER} "https://pluhin.ddns.net/job/SA/job/SA_07/createItem?name=10.print.evn_01" --data-binary "@conf.xml"
 8050  curl -X POST -u ${API_AUTH_HEADER} "https://pluhin.ddns.net/job/SA/job/SA_07/createItem?name=10.print.evn_01" --data-binary "@conf.xml" -H "Content-Type:text/xml"

```