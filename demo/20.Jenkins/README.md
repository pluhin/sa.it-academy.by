
Github -> smee.io -> smee-agent -> jenkins

## History
```
  838  kubectl get ns
  839  vim smee.yaml
  840  kubectl apply -f smee.yaml -n ci-cd
  841  sudo vim /etc/hosts
  842  curl http://jenkins.k8s-19.sa/
  843  clear
  844  export API_TOKEN=admin:XXXXXXX
  845  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-19.sa/job/01.Demo/build
  846  echo $?
  847  vim config.xml
  848  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN} 'http://jenkins.k8s-19.sa/createItem?name=99.task' --data-binary "@config.xml"
  849  history
```

## Smee

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

```
from .... as base

...
...
...

from base as dev


....

from dev as prod

....
```