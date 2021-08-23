# Project report

### Project's reporter: Andrei Ohrimenko

### Group number: md-sa2-17-21

---

## Description of application for deployment

### Name: Wordpress

### Programming language: PHP

### BD: MySQL

### Website: wordpress.com

---

## Pipeline. High Level Design

![Image](Project_schema.png)

---

## Technologies used in project

### Orchestration: Jenkins

### Automation tools: Ansible

### SCM: GitHub

### CI description: poll SCM (every night: 3:00 am)

### Notification: Slack

### Other: Docker, Mysql

---

## Deployment flows short description:

### Deployment is started by user manually in Jenkins. For upgrade user push code to Git and jenkins poll SCM every night at 3.00 am. If changes detected, start upgrade.

---

## Rollback flow description and implementation:

### In case of no start page after upgrade, ansible delete current container, restore files from backup and starts previous container. 

---

## Links

### [GitHub](https://github.com/AndreiAkhrymenko/MyProject.git)
