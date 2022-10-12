## Project report

### Project's reporter: Sergey Stepanenko

### Group number: md-sa2-21-22

## Description of application for deployment:

- Application: WordPress

- Programming language: PHP

- DB: MySQL 

- Link on git repository: https://github.com/docker-library/wordpress

## Pipeline

## Technologies which were used in project:

- Orchestration: 
Kubernetes

- Automation tools:
GitHub's action, Argo CD 

- SCM:
GitHub

- Notification:
Slack

- Other tools:
 Docker, Helm

## CI/CD description:
After pushing to the master branch, Git Action builds and pushes the image to Docker HUB, creates a HELM diagram package. Argo CD deploys application in k8s cluster.

## Rollback flow description and implementation:

Version selection in Argo CD


## Links:

Project repository: https://github.com/S-Stepanenko/project

![A4 - 2](https://user-images.githubusercontent.com/49452234/194337279-ecaea975-3506-4413-b381-9807821ef965.jpg)
