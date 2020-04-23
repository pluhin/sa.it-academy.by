## Project report

### Project's reporter: Yas Kazeko
### Group number: m-sa2-12-20

## Description of application for deployment
- Name: Wordpress
- Application is written in PHP
- Used database: MariaDB
- Proxy: Apache
- [GitHUB CI-CD repository](https://github.com/yaskazeko/wordpress)

### High Level Design
![block](./block_diagram.jpg)

### Technologies which were used in project
- **Orchestration:** Jenkins
- **Automation tools:** Ansible
- **Container:** Docker
- **CVS:** GitHub
- **CI description:** by schedule
- **Notification:** Slack
- **Deployment flows short description:**

### Description of the operation of the CMS installation:

  * Deployment starts with Jenkins.
  * Jenkins then downloads .yaml files for Ansible from the repository.
  * Next, Ansible playbook - install.yaml is launched, used inventory file
(inventory.yaml).
  * Installing and Configuring Docker.
  * Running Docker containers with CMS images.
  * Мessage to Slack about the result of the installation.

### CMS Update Description:

  * Download a new CMS image (docker pull).
  * Stop old conteiner.
  * backup (rsync) docker volumes with user data.
  * Delete the old container.
  * Start the new container.
  * Test working CMS.
  * Message to Slack about the result of the update.