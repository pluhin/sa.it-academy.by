# Project report

### Project's reporter: Maxim Radaman

### Group number: md-sa2-19-22

---

## Description of application for deployment:

- Application: Mediawiki

- Programming language: PHP

- DB: MySQL 5.7

- WebServer: Apache/2.4.53

- Link on git repository: https://github.com/redman27/wiki.git

---

## Pipeline. High Level Design:

![](pipeline.png)

---

## Technologies which were used in project:

### Orchestration: 
Kubernetes

### Automation tools:
Jenkins

### SCM:
Github

### Notification:
Slack

### Infrastructure:
Own cloud for Jenkins and k8s administration; node1 (192.168.203.13), node2 (192.168.203.14) educational portal server

## CI description:

Jobs are running after pushing to git.

## Deployment flows short description:

### Job Deploy Mysql
- Stage "**Cloning Git**": cloning git branch to localhost.
- Stage "**Building image**": build image from ./mysql/Dockerfile
- Stage "**Push Image to DockerHub**": push image to dockerhub with image name and build id.
- Stage "**Remove Unused docker image**": remove image from VM to avoid problems with disk space.
- Stage "**Testing YAML syntax**": Testing manifests by kubeval.
- Stage "**Deploy in cluster**": Deploy in k8s cluster if testing yaml success.

Finish stage - send notification to Slack channel.

### Job Deploy App
- Stage "**Cloning Git**": cloning git branch to localhost.
- Stage "**Building image**": build image from ./Dockerfile
- Stage "**Push Image to DockerHub**": push image to dockerhub with image name and build id.
- Stage "**Remove Unused docker image**": remove image from VM to avoid problems with disk space.
- Stage "**Testing YAML syntax**": Testing manifests by kubeval.
- Stage "**Deploy in cluster**": Deploy in k8s cluster if testing yaml success.

Finish stage - send notification to Slack channel.

## Rollback flow description and implementation:

If **Deploy in cluster** receives a failure status, then a **Rollback if deployment failed** is started and the deployment is rolled back to the previous state

## Links:

Project repository: https://github.com/redman27/wiki.git
