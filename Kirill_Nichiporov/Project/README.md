# Project report
---
### Project's reporter: Nichiporov Kirill
### Group number: md-sa2-21-22
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
Jenkins

### Repos:
GitHub, DockerHub

### Notifications:
Slack

### Other tools:
Docker, Helm

---
## Pipeline high level design:
![image](https://user-images.githubusercontent.com/110092772/197150398-db19ba63-ad29-4159-9f54-f887fa3c2f81.png)



## CI/CD pipeline description:
Every business day, Jenkins checks the repository for changes. If there are changes, the assembly starts and the image is sent to DockerHub. Then the application is installed in the cluster, if the installation fails, then the rollback stage occurs. Slack receives a notification of the result.


## Links:
[Project repository](https://github.com/KirillNichiporov/Project)

