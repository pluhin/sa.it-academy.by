## Homework Assignment 1: Introduce the pipeline

Add credentials of docker hub to the Jenkins->Credentials. Make all necessary installations to the node (docker, kubectl, curl).
Add [Jenkins pipeline](https://github.com/Julie717/simple-app/blob/master/pipelines/Jenkinsfile) to the simple app (Java)

Pipeline run

![pipeline run](../21.Jenkins.Docker_and_Pod/pictures/1.jpg)

Deployment confirmation

![confirmation](../21.Jenkins.Docker_and_Pod/pictures/2.jpg)

Dockerfile validation

![validate Dockerfile](../21.Jenkins.Docker_and_Pod/pictures/3.jpg)

Build and test image

![build and test](../21.Jenkins.Docker_and_Pod/pictures/4.jpg)

Push to the docker hub

![push to the docker hub](../21.Jenkins.Docker_and_Pod/pictures/5.jpg)

Deployment to the pre-prod

![pre-prod deployment](../21.Jenkins.Docker_and_Pod/pictures/6.jpg)

Deployment to the prod

![prod deployment](../21.Jenkins.Docker_and_Pod/pictures/7.jpg)

Cleaning pre-prod

![cleaning pre-prod](../21.Jenkins.Docker_and_Pod/pictures/8.jpg)

Slack notification

![slack notification](../21.Jenkins.Docker_and_Pod/pictures/9.jpg)
