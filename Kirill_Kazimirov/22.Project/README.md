# Final Project

### Project's reporter: Kirill Kazimirov
### Group number: md-sa2-28-24

## Description of application for deployment
### Name of application: Pet application 
### Programming language: Java
### Data base: MariaDb
### Links
[https://github.com/Kirilllka1993/finalproject] - project
[https://github.com/Kirilllka1993/finalproject/tree/helm-branch] - helm repo

## Pipeline. High Level Design

![image](https://github.com/user-attachments/assets/fb7ffa97-3a44-4c55-8957-72c386779107)


## Technologies which were used in project
Orchestration: Kubernetes Automation tools: Ansible, Github Actions, ArgoCD. SCM: GitHub Other tools: Docker, Helm, Prometheus, Grafana



## CI description

When a push is executed, the build of a project written in Java is launched using githab actions. The project is built by Apache Maven. Maven packs the compiled project into a jar archive. Next, docker 
builds an image based on the previously obtained build. The resulting image is pushed to the jfrog registry. Then githab actions creates a new version of the helm chart. The index.yaml file, which is 
responsible for the created versions of the charts, is updated automatically. The repository with the charts is located in another branch of the project. After this, the application.yaml file is updated, 
which is needed to interact with argocd. Argocd takes the latest version of the chart from this file and installs it in our cluster by giving a command to helm, and then it in turn communicates with 
kubernetes.
Our application has been deployed. The application itself, during the first deployment, created the necessary tables for itself to work with the liquibase tool. Since my application is a back-end one, the functionality check should be carried out through postman.
Applications are monitored using Prometheus. Prometheus communicates with the application using the URL: /actuator/promitheus. Using this URL, my application provides metrics in Prometheus. Related to Prometheus is Grafana. It has a corresponding JVM dashboard that displays the monitoring of the java application.
