
```bash
   4  apt update
    5  apt install openjdk-21-jre
    6  useradd -m -d /var/lib/jenkins jenkins
    7  runuser -l jenkins -c 'mkdir /var/lib/jenkins/.ssh/'
    8  ssh-keygen -t ed25519 -f /tmp/jenkins
    9  runuser -l jenkins -c 'cat /tmp/jenkins.pub >> /var/lib/jenkins/.ssh/authorized_keys'
   10  chmod 600 /var/lib/jenkins/.ssh/authorized_keys
   11  cat /tmp/jenkins
   12  ip addr | grep inet
```

---
```bash
1052  sudo -i
 1053  vim web-hook-proxy.yaml
 1054  kubect apply -f web-hook-proxy.yaml
 1055  kubectl apply -f web-hook-proxy.yaml
 1056  k9s --headless
 1057  sudo -i
 1058  sudo vim /etc/host
 1059  sudo vim /etc/hosts
 1060  curl http://jenkins.k8s-9.sa/ -S
 1061  export API_TOKEN="admin:XXXXXXXXXX"
 1062  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-9.sa/01.Jenkins/build
 1063  export API_TOKEN="admin:11f42d2959f3dc4dc7f488ba947ca1cc8a"
 1064  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Jenkins/build
 1065  echo $/
 1066  echo $?
 1067  curl -X POST -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Jenkins/build
 1068  echo $?
 1069  curl -X GET -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Jenkins/config.xml -o config.xml
 1070  cat config.xml
 1071  cat confiviml
 1072  cat config.xml
 1073  vim config.xml
 1074  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  http://jenkins.k8s-9.sa/job/01.Jenkins/config.xml --data-binary  "@config.xml"
 1075  echo $?
 1076  curl -X POST -H "Content-Type:text/xml" -u ${API_TOKEN}  "http://jenkins.k8s-9.sa/createItem?name=00.Task" --data-binary  "@config.xml"
 1077  echo $?
 1078  history
```



```yaml
user@sa2-demo:~$ cat web-hook-proxy.yaml
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
             value: "https://smee.io/cRkXAPrXOhNDDI1"
           - name: JENKINS_WEBHOOK
             value: "http://jenkins.ci-cd.svc.cluster.local:8080/github-webhook/"
user@sa2-demo:~$
```