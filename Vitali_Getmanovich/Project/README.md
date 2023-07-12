#  Project report

### **Project's reporter:** Vitali Getmanovich

### **Group number:** m-sa2-23-23

## Description of application for deployment
### **Name of application:** Wordpress 
### **Which programming language is this application written in:** PHP
### **What kind of DB:** MariaDB

---

## Pipeline. High Level Design
![Scheme](https://github.com/VitaliGet/sa.it-academy.by/raw/md-sa2-23-23/Vitali_Getmanovich/Project/Project.drawio.png)

---

## Technologies which were used in project
### **Orchestration:** Kubernetes

### **Automation tools:** Ansible, Github Actions, ArgoCD, bash

### **Database:** MariaDB on the remote host

### **SCM:** Github

### **Other tools:** Helm, Docker

### **Notifications:** Slack

---

## CI description: 
### By pushing to the git repository, github actions are launched. Then the Dockerfile is tested. A new tag is generated. A new image is created from the docker folder with a new tag and published to dockerhub. Сheck helm manifests. A Helm package is created with a new tag and sends notification in Slack. AgroCD syncs with Helm repository, deploys application and docker image to kubernetes cluster.


---

## Links

### [Project repository](https://github.com/VitaliGet/myproject)

### [DockerHub registry](https://hub.docker.com/repository/docker/getmanovich7/wordpress/general)
