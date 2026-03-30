Github -> https://smee.io/ -> agent smee -> internal jenkins

```bash
1669  export API_TOKEN="admin:XXXXX"
 1670  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Job/build
 1671  curl -X GET -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Job/config.xml -o config.xml
 1672  clear
 1673  vim config.xml
 1674  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Job/config.xml --data-binary "@config.xml"
 1675  echo $?
 1676  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://jenkins.k8s-9.sa/createItem?name=99.task' --data-binary "@config.xml"
 1677  echo $?
 ```

 SMEE

 ```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: smee-client
spec:
  replicas: 1
  selector:
    matchLabels:
      app: smee-client
  template:
    metadata:
      labels:
        app: smee-client
    spec:
      containers:
        - name: smee-client
          image: node:18-alpine
          command: ["/bin/sh", "-c"]
          args:
            - |
              npm install -g smee-client;
              echo "Starting ${SMEE_URL} for ${JENKINS_WEBHOOK}";
              smee --url ${SMEE_URL} --target ${JENKINS_WEBHOOK}
          env:
            - name: SMEE_URL
              value: "https://smee.io/XXXXXXXX"
            - name: JENKINS_WEBHOOK
              value: "http://jenkins.ci-cd.svc.cluster.local:8080/github-webhook/"
 ```