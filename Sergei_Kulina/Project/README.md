# Project's reporter: Siargei, Kulina

## Group number: md-sa2-18-21

## Description of application for deployment

   Name of application: Django-Todolist
   Build application with Kubernetes
   The programming language is the application written in - Python with Framework Django
   Database for used: SQLite
   [Django-Todolist](https://github.com/rtzll/django-todolist)
    
## Pipeline. High Level Design

![plot](./schema.png)

### Technologies which were used in project:

Orchestration: Jenkins, Kubernetes

Automation tools: Docker, Kubernetes, Github, Helm

CI : Jenkins by hook/schedule/poll SCM, 

### Deployment flows short description:

Fist deployment application Whith Jenkins pipeline SCM. Start upgrade application by GitHub-hook push and cron.
Jenkins pipeline runing clone apllication, build Docker image with our application, after run unit test if unit test complited pushing on DockerHub
and wrapping Helm. Helm deployment application, testing application. If all test complited Slack send notification successfull.       

### Rollback flow description and implementation:

If unit test fail runing application don't upgrade. If Helm test failed Helm runing rollback application of previos release.
All fails Jenkins send of Slack failed. 


## Links

[Links repository of Pipeline](https://github.com/Kulinych/Project)  [Django-Todolist](https://github.com/rtzll/django-todolist)

The link your repository of Pipeline code Another links Another links


