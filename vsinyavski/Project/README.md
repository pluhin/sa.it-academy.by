
## Project report

**Project's reporter:** Vitali Siniauski

**Group number:** md-sa2-17-21

### Description of application for deployment

- Name: Wordpress on Apache web server
- Application written in PHP
- Kind of DB: MySQL
- [Link on git repository](https://github.com/astarosh87/Project)

### Pipeline. High Level Design

![image](https://raw.githubusercontent.com/astarosh87/sa.it-academy.by/md-sa2-17-21/vsinyavski/Project/Pipeline.png)

### Technologies which were used in project

**Orchestration:** Jenkins

**Automation tools:** Ansible

**Infrastructure:** virtual hosts in EC HTP with multicontainer Docker Compose

**CI description:** run pipeline (manually, by GitHub Hook, sheduler GitSCM), test && check (ansible lint, ansible build-in modules for test connections and site availability)



**Deployment flows short description:** 

First install:
 * Deployment starts with Jenkins pipeline script from Git SCM
  * Initially downloads GitHub repository then test ansible lint and run ansible playbook
  * Playbook with 3 roles install, configure and run docker container with CMS, DB and PMA by docker compose
  * Finishlly ansible and jenkins notify to slack about results of execute tasks and pipeline

Update CMS:

 * Deployment starts when code push to git repository by  github hook trigger for GIT SCM polling (alternative Git SCM request changes om git repository by sheduler).
* Additional downloads docker_compose file from GitHub repository then test ansible lint and run ansible playbook for update docker container
  * Playbook first stop running containers, backup DB & CMS data and remove old container. Then playbook run new container with latest CMS version/
  * Finishlly ansible and jenkins notify to slack about results of execute tasks and pipeline.


**Rollback flow description and implementation:** 

Rollback built in ansible playbook. When update finish with errors (tests for conection and site availability CMS crashed) docker containers stop and remove, then  rollback to older version of container and run them.

### Links

[The link your repository of Pipeline code](https://github.com/astarosh87/Project)