### Project's reporter: Boris Kydrevich

### Group number: m-sa2-16-21

## Description of application for deployment

#### Name: WordPress

#### Programming language: PHP

#### DB: MySQL

## Pipeline. High Level Design

````
GitHub
   |
   |
  User   
   |
   |
Ansible ======> slack
   |
   |
WordPress LAMP

`````

## Technologies which were used in project

#### Automation tools: Ansible
#### SMC: Github
#### CI description: manual test

#### How does new/upgrade deployment work
User cloning git. Manualy started ansible playbook, which will install wordpress. Manualy started ansible playbook, which will upgrade wordpress. When install/upgrade done, ansible send notification to slack channel.

[Github](https://github.com/SunBrooo/BorisK.git)
