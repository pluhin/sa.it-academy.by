Github -> https://smee.io/ -> agent smee -> internal jenkins


```bash
2381  export API_TOKEN="admin:XXXXXXXXXX"
 2382  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-15.sa/job/01.Job/build
 2383  echo $/
 2384  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-15.sa/job/01.Job/build
 2385  echo $?
 2386  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-15.sa/job/01.Job/build
 2387  curl -X GET -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-15.sa/job/01.Job/config.xml  -o config.xml
 2388  cat config.xml
 2389  vim  config.xml
 2390  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-15.sa/job/01.Job/config.xml --data-binary "@config.xml"
 2391  echo $?
 2392  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  "http://jenkins.k8s-15.sa/createItem?name=99.Task" --data-binary "@config.xml"
```
---
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