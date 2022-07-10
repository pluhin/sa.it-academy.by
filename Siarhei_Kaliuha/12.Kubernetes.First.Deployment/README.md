# Homework report for 12.Kubernetes.First.Deployment by Siarhei Kaliuha

---
Cluster `cluster.remote.k8s` deployed inside IT-ACADEMY environment.  
Files used for deployment process located inside `deployment` directory.  
Files used for creation docker image located in `docker_image` directory.  


## Main task. Described in `app.yaml`. Create deployment of nginx service:
Docker official image with official build of Nginx is used.
* replicas: 3

![nginx_pods](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/12.Kubernetes.First.Deployment/nginx_pods.jpg)

* custom index file is mounted inside as configmap
* ingress rule configured for host names (`app.k8s-21.sa` and `app.k8s-22.sa`)  
Test page with custom index file available from remote host:

![app.k8s-21.sa](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/12.Kubernetes.First.Deployment/app.k8s-21.sa.jpg)

![app.k8s-22.sa](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/12.Kubernetes.First.Deployment/app.k8s-22.sa.jpg)


## Additional task. Deploy pod inside k8s which should be connected to github as self-hosted runner:
Used docker image `skalyuga/docker_github_runner:latest`, created using github actions:

* Dockerfile

```
FROM ubuntu:latest

ENV RUN_VERSION "2.294.0"
ENV RUN_TOKEN ""
ENV RUN_REPO ""

RUN apt-get update && apt upgrade -y \
    && apt install curl sudo jq -y \
    && useradd -m runner \
    && usermod -aG sudo runner \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER runner

WORKDIR /home/runner

RUN mkdir actions-runner && cd actions-runner

RUN curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v${RUN_VERSION}/actions-runner-linux-x64-${RUN_VERSION}.tar.gz

RUN tar xzf ./actions-runner-linux.tar.gz && sudo ./bin/installdependencies.sh

COPY --chown=runner:runner startup.sh ./startup.sh
RUN sudo chmod u+x ./startup.sh

CMD ["./startup.sh"]

```

* Configuration script `startup.sh`

```bash
#!/bin/bash

# Create the runner and configure it
./config.sh --url https://github.com/$RUN_REPO --token $RUN_TOKEN --unattended --replace

# Run it
./run.sh "$*" &

wait $!

```

Deployment of self-hosted runner on k8s described in `runner.yaml`, using variables to provide repository name and secret token in `secret.yaml`:

* runner.yaml
```yaml
---
apiVersion: v1
kind: Namespace
metadata:
  name: self-runner
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: runner
  namespace: self-runner
  labels:
    app: runner
spec:
  replicas: 1
  selector:
    matchLabels:
      app: runner
  template:
    metadata:
      labels:
        app: runner
    spec:
      containers:
      - name: runner
        image: skalyuga/docker_github_runner:latest
        env:
        - name: RUN_REPO
          value: s-kalyuga/12.k8s-runner
        - name: RUN_TOKEN
          valueFrom:
            secretKeyRef:
              name: git-token
              key: RUN_TOKEN

```

Deployment of self-hosted runner results:

```bash
vagrant@vagrant-ubuntu-20:~/12.Kubernetes.First.Deployment$ kubectl apply -f secret.yaml
secret/git-token created

vagrant@vagrant-ubuntu-20:~/12.Kubernetes.First.Deployment$ kubectl apply -f runner.yaml
namespace/self-runner created
deployment.apps/runner created

```

![k8s-self-runner](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/12.Kubernetes.First.Deployment/k8s-self-runner.jpg)

![github-runners](https://github.com/s-kalyuga/sa.it-academy.by/blob/md-sa2-20-22/Siarhei_Kaliuha/12.Kubernetes.First.Deployment/github-runners.jpg)