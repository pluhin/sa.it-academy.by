500  export API_AUTH_HEADER='admin:token_here'
  501  env
  502  clear
  503  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/job/50.Jenkinsfile/build
  504  curl -X GET -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/job/50.Jenkinsfile/config.xml -o local_config.xml
  505  vim local_config.xml
  506  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/job/50.Jenkinsfile/config.xml --data-binary "@local_config.xml"
  507  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/job/50.Jenkinsfile/build
  508  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/job/createItem?name=55.Jenkisfile --data-binary "@local_config.xml"
  509  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/createItem?name=55.Jenkisfile --data-binary "@local_config.xml"
  510  curl -X POST -u ${API_AUTH_HEADER} http://192.168.1.100:8080/job/SA_01/createItem?name=55.Jenkisfile --data-binary "@local_config.xml" -H "Content-Type:text/xml"
  511  history

