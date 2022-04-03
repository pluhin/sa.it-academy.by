# My project

### Project's reporter: Buharevich Uladzislau
### Group number: md-sa2-19-22

## Description of application for deployment
#### Name of application: Joomla
#### Which programming language is this application written in: PHP
#### What kind of DB: MariaDB
#### Link on git repository: 
https://github.com/Buharevich/project_vb

## Pipeline. High Level Design
![Pipeline](https://user-images.githubusercontent.com/8207008/161448573-615fa267-6d42-4d17-96bb-67c00369383a.png)
## Technologies which were used in project
#### Orchestration: Jenkins
#### Automation tools: Ansible
#### SCM: Github
#### Notification: Slack
#### CI description: tests of network ports, checks of running services
## Deployment flows short description:
#### Localhost - Jenkins - Ansible - New VM  - (Apache-Joomla-MariaDB) - Slack