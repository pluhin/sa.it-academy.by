# Project report #

### Project's reporter: Shahov Igor ###

### Group number: md-sa2-21-22 ###

# Description of application for deployment: #

### Application: Wordpress ###

### Programming language: PHP ###

### DB: MariaDB ###

### Link app repository: https://wordpress.org/download/releases/ ###

### My Docker repository: https://hub.docker.com/repository/docker/migelalfa/wordpress ###



# Pipeline on picture: #

![Image text](https://github.com/MigelAlfa/my-projeckt/blob/main/pipeline.png)

# Technologies which were used in project #

Orchestration: K8s

Version control system: Git

Automation: Github actions, Argo CD

Notification: Slack, Gmail

Other tools: Helm, Docker, PHPmyadmin, Ansible


# CI/CD description: #

The developer push commit into  git repository, github actions doing tests, packs the project and assigns a version, packaging in docker and send notification in slack if the whole process was successful. Argo CD takes and deploys our application in K8s.

Updates follow the same principle.

Argo CD Provides us with the ability to rollback and select a different version.

# My Project repository #

https://github.com/MigelAlfa/Project

