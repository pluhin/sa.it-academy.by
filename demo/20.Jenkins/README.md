## Changes in jenkins service

```yaml
  name: jenkins
  namespace: ci-cd
spec:
+ type: NodePort
  ports:
    - name: master
      port: 8080
      targetPort: 8080
+     nodePort: 30010
    - name: slave
      port: 50000
      targetPort: 50000
```

## Connect jenkins node (see node description in jenkins UI)
```bash
   wget http://192.168.208.25:30010/jnlpJars/agent.jar
   java -jar agent.jar -url http://192.168.208.25:30010 -secret XXXXXXXXXXXX -name "Test_01" -webSocket  -workDir "/var/lib/jenkins/"
```

Github webhook -> smee -> smee-k8s-agent -> jenkins-service

```bash
 1204  export API_TOKEN="admin:XXXXXXXXXXX"
 1205  curl http://jenkins.k8s-25.sa
 1206  curl -X POST -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/build
 1207  echo $?
 1208  curl -X GET -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/config.xml -o config.xml
 1209  vim config.xml
 1210  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} http://jenkins.k8s-25.sa/job/01.Job/config.xml --data-binary "@config.xml"
 1211  echo $?
 1212  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://jenkins.k8s-25.sa/createItem?name=99.task' --data-binary "@config.xml"
 1213  echo $?
```