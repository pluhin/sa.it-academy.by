# Project report

**Project's reporter:** Uladzimir Panasiuk

**Group number:** m-sa2-13-20

## Description of application for deployment

- **Wordpress**

- Written in **PHP**

- Uses **MYSQL**

- [github.com/WordPress](https://github.com/WordPress/WordPress)

- [wordpress.org](https://wordpress.org)

---

## Pipeline. High Level Design

```

##################################### Internet ########################################
#                                                                                     #
#   ------Github------               ------ Docker Hub ------      ----------------   #
#  | Repo with        |   webhook   |                        |    |  Users         |  #
#  | Dockerfiles and  | <=========> |       Build image      |    |  Search bots   |  #
#  | Pipeline sources |             |                        |    |  Hackers       |  #
#   ------------------               ------------------------      ----------------   #
#              ||                              ||                         ||          #
########################################################################################
               ||                             //                         //
               ||               ==============                          //
               ||             //                                       //
##################################### Machine #########################################
#              ||           //                                        ||              #
#              ||          //                                         ||              #
#              ||         //                                          ||              #
#  ----------- Jenkins ------------          Provisioning      ---- Nginx ----        #
# |                                |    ===================>  | Reverse proxy |       #
# | Pull image from Docker Hub     |  //                       ---------------        #
# | Pull pipeline scripts from git | //                               ||              #
# | Start pipeline                 |=                                 ||              #
# | Send notification to Slack     | \\                        ---- Docker ----       #
# |                                |  \\     Provisioning     |  --- Pod ---  |       #
# | -------------------------------      ==================>  | |           | |       #
#                                                             | | Wordpress | |       #
#                                                             | |   MYSQL   | |       #
#                                                             | |           | |       #
#                                                             |  -----------  |       #
#                                                             -----------------       #
#                                                                                     #
#######################################################################################

```

---

## Technologies which were used in project

**Orchestration:** Jenkins, Docker

**Automation tools:** Ansible, bash

**CI description:**

by hook:

- build docker image

scheduled:

- backup runned application once a day

checks:

- deployment after installation/update
- check if application is accessible every 15 minutes

---

## Deployment flows short description

After `Dockerfile` is pushed to pipeline repo in `image/<version>` branch, Docker Hub builds this docker image.

In Jenkins parametrized pipeline we select the version to deploy. It polling image and running it as pod via docker-compose.

Ansible implements Nginx's reverse proxy for the application.

The pipeline is same for new and upgrade deployments, but for new deployment we should check the "`InitialDeployment`" boolean parameter which is skipping backup proccess before the deployment starts.

## Rollback flow description and implementation

Before the deployment proccess is started (the only exception is "`InitialDeployment`" boolean is checked) we start job "`Backup`" which backups database and application content (directory `wp-content`) and stores it as Jenkins' artifacts.

The last step of deployment pipeline is to check every one second until timeout if the application is accessible after the deployment proccess is done. If it fails we suppose that entire deployment proccess is failed. In this case previous version of application is deployed and the database and the application content is restored (just for case).

Backup and restore processes also can be runned manually.
