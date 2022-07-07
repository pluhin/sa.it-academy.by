# Project report
---
### Project's reporter: Ilya Bombel
### Group number: md-sa2-20-22
---

## Description of application for deployment:
- Application: Wordpress
- Programming language: PHP, bash
- Database: MySQL
- Link to: [Docker Official Images](https://github.com/docker-library/wordpress)
---

## Technologies which were used in project:

### Orchestration: 
Kubernetes

### Automation tools:
GitHub Actions, Argo CD

### Repos:
GitHub, JFrog Artifactory, DockerHub

### Notifications:
Slack

### Other tools:
Docker, Helm

---
## Pipeline high level design:
![diagr.png](./diagr.png)

## CI/CD pipeline description:
As soon as push received in branch "main" to project Git repo, Github Actions runs CI/CD pipeline: repo checkout > automatically bump realise version and push tag > build docker image and pushe it to DockerHub > install helm and check out a helm chart by kubeval >  Helm creates a new artifact and push it to JFrog Artifactory > send a success Slack notification, along with pipeline will fail, we will receive an alert notification in Slack. As per changes on GitHub repo, Argo CD detects it and starts deploying required Helm chart in the Kubernetes cluster.

### Rollback flow description and implementation:
Rollback can be done to any code or application version in Git repository history by Argo CD

---

## Links:
[Project repo](https://github.com/NEM1GA/wordpress)
