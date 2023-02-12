# Project

## Project's reporter: Aliaksandr Dubovik Group number: md-sa2-22-22

### Name of application: Wordpress
### Programming language: PHP
### DB: MariaDB

![](/algorithm.jpg)

#  Pipeline

To start we send commit from our working catalog to GitHub repository. GitHub Action builds and pushes the image to Docker HUB, and then creates the HELM chart. After that ArgoCD deploys an application to a k8s cluster. 

# Technologies used in the project
### Orchestration: K8s
### Automation: Ansible, Github Action, ArgoCD
### CI description: Github Action
### Containerization: Docker
### Package manager: HELM
### Notification: Slack
### Rollback flow description and implementation: Versioning is used in ArgoCD

[GitHub Actions](https://github.com/AliaksandrDub/wordpress/actions)

[Project](https://github.com/AliaksandrDub/wordpress)

[Docker Hub](https://hub.docker.com/repositories/aliaksandrdub)