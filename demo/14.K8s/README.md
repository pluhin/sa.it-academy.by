
https://github.com/pluhin/flux-demo.git



```
export KUBECONFIG=$HOME/.kube/config_01
```

```Dockerfile
FROM jenkins/jenkins:latest

LABEL maintainer="pluhin@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
# ENV JENKINS_UC_DOWNLOAD="https://mirror.yandex.ru/mirrors/jenkins"
## install plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves \
	ansible \
    docker-plugin \
	email-ext \
	mailer \
	greenballs \
	simple-theme-plugin \
	parameterized-trigger \
	rebuild \
	github \
	kubernetes \
	ansicolor \
	blueocean \
	stashNotifier \
	show-build-parameters \
	credentials \
	configuration-as-code \
	command-launcher \
	external-monitor-job \
	ssh-agent \
	pipeline-stage-view \
    slack
USER root

RUN apt-get update && apt-get install -yqq apt-transport-https \
		python-pip \
		sshpass \
		ca-certificates \
		curl \
		gnupg2 \
        wget \
		software-properties-common \
	&& pip install ansible==2.9.9 -qq \
		awscli \
		cryptography \
	&& curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
	&& apt-get update \
	&& git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' \
	&& apt-get -y install docker-ce -qq \
    && apt-get install rsync -y \
	&& gpasswd -a jenkins docker \
	&& usermod -a -G docker jenkins \
    && newgrp docker \
	&& echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
	&& echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config \
    && apt-get purge --auto-remove -yqq \
	&& apt-get clean \
	&& rm -rf \
	    /var/lib/apt/lists/* \
	    /tmp/* \
	    /var/tmp/* \
	    /usr/share/man \
	    /usr/share/doc \
	    /usr/share/doc-base

USER jenkins

```


```groovy
pipeline {
  agent {
    kubernetes {
      label 'sample-app'
      idleMinutes 5
      yaml """
apiVersion: v1
kind: Pod
metadata:
  name: curltest
  namespace: ci-cd
spec:
  containers:
  - name: curltest
    image: jfrog.it-academy.by/public/curl:spishchyk
    imagePullPolicy: IfNotPresent
    command:
    - cat
    tty: true
  restartPolicy: Always
"""
}
  }
  stages {
    stage('Test') {
      steps {
        container('curltest') {
          sh 'curl -S https://onliner.by'
        }
      }
    }
  }
}
```

## Flux
```bash
export GITHUB_TOKEN=ghp_ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ
export GITHUB_USER=pluhin
export GITHUB_REPO=flux-demo

flux bootstrap github   --owner=$GITHUB_USER   --repository=$GITHUB_REPO   --branch=main   --path=./clusters   --personal

git pull

flux create source git jenkins \
  --url=https://github.com/pluhin/flux-demo.git \
  --branch=main \
  --interval=1m \
  --export > ./clusters/jenkins-source.yaml

flux create kustomization jenkins \
  --source=jenkins \
  --path="./" \
  --prune=true \
  --validation=client \
  --interval=5m \
  --export > ./clusters/jenkins-kustomization.yaml

git add -A && git commit -m "Add jenkins Kustomization"
git push
watch flux get kustomizations
  
vim jenkins.yaml 
git add --all
git commit -m "Test"
git push

```

### Notification

```
kubectl -n flux-system create secret generic slack-url \
--from-literal=address=https://hooks.slack.com/services/XXXXXXXXXXXXXX

```

./clusters/flux-system/notification.yaml
```yaml
---
apiVersion: notification.toolkit.fluxcd.io/v1beta1
kind: Provider
metadata:
  name: slack
  namespace: flux-system
spec:
  type: slack
  channel: general
  secretRef:
    name: slack-url
---
apiVersion: notification.toolkit.fluxcd.io/v1beta1
kind: Alert
metadata:
  name: on-call-webapp
  namespace: flux-system
spec:
  providerRef:
    name: slack
  eventSeverity: info
  eventSources:
    - kind: GitRepository
      name: '*'
    - kind: Kustomization
      name: '*'
```

```bash
git add --all
git commit -m "Add notification"
git push

kubectl -n flux-system get alerts
```

#### Uninstall

```bash
flux uninstall --namespace=flux-system
```