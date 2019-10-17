# Home work

## How to send Home work

1. Create fork from the main repository https://github.com/pluhin/sa.it-academy.by
2. Clone forked repository to your workstation
3. Checkout to branch <YOR_GROUP_BRANCH>
4. Create folder with your Name_LastName (As example: In my case name will be `Siarhei_Pishchyk`). This folder will be your report folder.
5. Create folder with name of your homework (Example: `02.Git.Local`)
6. Put your files into it
7. Do not forget about rebase your fork/branch with main fork/branch (how-to demo [here](https://stackoverflow.com/questions/7244321/how-do-i-update-a-github-forked-repository) and [here](https://help.github.com/en/articles/syncing-a-fork))
8. Make commit and push
9. On WebUI (github) make PR (Pull Request) into main fork and branch <YOR_GROUP_BRANCH> from your fork and your <YOR_GROUP_BRANCH>
10. Wait for review

> - Usefull link: https://sites.google.com/site/feexpr/Downhome/git
> - *(Additional task)* - are optional tasks, you can ignotre them

## 01. CI/CD

Registration on slack and join to the chanel

- https://sa-itacademy-by.slack.com

Please create account on the following git hosting systems

- https://github.com/
- https://gitlab.com/users/sign_in
- https://bitbucket.org

Install the following applications:

- GIT: https://git-scm.com/downloads
- VirtualBox: https://www.virtualbox.org/wiki/Downloads
- Vagrant: https://www.vagrantup.com/downloads.html
- Visual Studio Code: https://code.visualstudio.com/download

## 02. GIT. Local

Initialize local repository on your laptop. Create the following branches:

- master (init)
  - 2 commits
- dev (from master)
  - 2 commits from master + 2 additional
- features/do_one (from dev)
  - 2 commits from master + 2 additional  form dev + 1 additional
- hotfix/we_gonna_die (from master)
  - 2 commits from master + 1 additional

Play the following situations:

- Release phase - all commits should be inside master (except hotfix)
- Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too

In the end of this "play" you should provide list of your commits in above mentioned branches. You can add this output to your report, in the tail.

All your commands put into files 02.GIT.Local.md and add to your repository, then prepare PR (Pull Request)
> Use git markup to organize your text/output. See [link](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

**Additional:** Create README.md with project description in your folder. You will be maintaing its during our cource till the final demo

## 03. GIT hosting

Github/Gitlab/Bitbucket

- Create remote empty repositories
- Add ssh key(s)
- Synchronise with with your local repository from previous task
- Add project into remote repositories each all, one by one
- Create slack/email integration push/commit events
- Automate pushing your commits to all git hostings (bash/python/go.. scripts)

Create folder `03.GIT.Hosting`, all your repository urls put into files `03.GIT.Hosting/03.GIT.Hosting.md` and add to your repository, then prepare PR (Pull Request)

Gitlab CE deployment *(Additional task)*

- Deploy Gitlab
- Setup access and email notification
- Create project
- Check difference between EE and CE
- Send me invitation by Gitlab notificator

## 04. Infrastructure. Vagrant. LXC

### Vagrant

- Install Vagrant
- Create VB guests:
  - Alpine. Latest
  - CentOS7. Latest
- Create user: vagrant, pass: vagrant with NOPASSWD
- Install: vim, git, wget, curl
- Push boxes to Vagrant cloud

### LXC

- Install LXC
- Create privileged containers
  - Cent0S.Latest
  - Debian.Latest
- Set RAM limit to 512MB
- Set HDD limit to 10GB
- Create user insider with NOPASSWD

Create folder `04.Infrastructure.Vagrant.LXC`, all your urls to vagrant boxes in vagrant cloud, Vagrantfiles itself and config files for LXC with commands how-to run, put into file `04.Infrastructure.Vagrant.LXC.md`, then prepare PR (Pull Request)

## 05. Ansible start

Deploy Ansible on any your localhost (Ubuntu/CentOS)

- Setup existing local user to run commands without password
  - apt/yum upgrade
- Run command for upgrade locally using ansible add-hoc commands

Connect to the remote host

- Using Vagrant deploy two host
  - Ubuntu 18.04
  - CentOS 7.5
- Setup hosts for connection without password
- Allow ansible user upgrade system
  - Create new user
  - Apply sudo rules for its
- Using ansible need to do
  - Connect to the hosts
  - Print out host names and IP
  - Upgrade packages
- Create own inventory with all variables and hierarchie

Output all your ansible commands (and commands also) put into `05.Ansible.start.md` and add to your repository, then prepare PR (Pull Request)

## 06. Ansible run

- Create playbook to print out remote host parameters
  - OS/version
  - Mount point/capacity/used
  - RAM/capacity/free
- Playbook for the ansible user
  - Create new user (use module)
  - New user authorisation only by key
  - Add to the sudo:nopasswd for upgrade command
  - Implement test of that

All your playbooks put into folder `06.Ansible run` and create file `06.Ansible run.md` with description of your ansible code (What it does, examples of command/parametrs) and add to your repository, then prepare PR (Pull Request)

## 07. Ansible cruise

Create Ansible Playbook with role(s) to install nginx server and two virtual hosts for its. Playbook should meet the following requirements:

- Depends from OS
- Setup ngnix for two virtualhosts using templates
- Create and add index.html files
- Check deployment

Your playbook put into folder `07.Ansible cruise` and create file `07.Ansible cruise.md` with description of your ansible roles (What it does, examples of command/parametrs) and add to your repository, then prepare PR (Pull Request)

## 08. Ansible. Spinup

Implement testing role:

- Check if we have SUDO with NOPASSWD
- Checks to public repository (debian/centos and pip)
- Check if we have connection to docker hub registry (return content check)
- Check if we have enough RAM/HDD (you can create thresholds by yourself)

Add molecule test for that

Your playbook/role put into folder `08.Ansible.Spinup` and create file `08.Ansible.Spinup.md` with description) and add to your repository, then prepare PR (Pull Request)

## 09. Ansible Workshop

- Finsh deployment of application
- Create a project with your initals in application
- Create printscreen of your project in application
- Add this printscreen to your repostitory in to folder 07.Ansible Workshop
- Create PR

## 10. Jenkins. Start

Deploy Jenkins use home environment

- Setup Vagrant file
- Install Jenkins
- Default settings setup (like access/plugins)
- Hide Jenkins behind the web server (Apapche, Ngnix)
- (*Additional*)Implement Ansible role for that

Your Vagrant file and settings steps with configuration files for Web server put into folder `10. Jenkins. Start` add to your repository, then prepare PR (Pull Request)

## 11. Jenkins. Routine

Implement the following Pipeline:

- Parameters: host IP and credentials
- Check connection to the host
- Install/upgrade nmap
- Checks all online hosts
- Remove nmap
- Print list of collected/online hosts

Output of your Jenkins task put into folder `11. Jenkins. Routine` add to your repository, then prepare PR (Pull Request)

## 12. Jenkins. As code

Create Pipeline using Jenkinsfile. Should be inside:

- Work with repo
- Work with files
- Publish artifacts
- Tests
- Notification

Your Jenkins file put into folder `12. Jenkins. As code` add to your repository, then prepare PR (Pull Request)

## 13. Docker. Lading

- Create a Docker file of any Python application
  - As example: any API listener
- Add automated build for that image Docker hub
- Test it
  - Send/receive API request

Your Dockerfile and links to your Dockerhub put into folder `13. Docker. Lading` add to your repository, then prepare PR (Pull Request)

## 14. Docker. Logistics

- Automate task **11. Docker. Lading** by Jenkins
  - Use remote repo as source for build image
  - Make image locally (on Jenkins master/Slave)
  - Push image on Docker Hub

- Create docker compose file which contains the following applications:
  - Web server (with links to the another Web apps)
  - [sonarr](https://sonarr.tv/)
  - [radarr](https://radarr.video/)
  - All settings of this applications should be added during docker-compose start from folder of project

Your Dockerfile, docker-compose files, Jenkinsfile and Jenkins output put into folder `14. Docker. Logistics` add to your repository, then prepare PR (Pull Request)

## 15. K8s. Structure

- Install minikube on your bare/virtual host
- Provide access to the dashboard from your workstation
- Automate it (bash/ansible/Jenkinsfile)
Your code and printscreen of dachboard put into folder `15. K8s. Structure` add to your repository, then prepare PR (Pull Request)

## 16. K8s. Deployment

- Deploy Jenkins server with 2 replicas
- Add service and Ingress for Jenkins
- Expose jenkins web UI to external network

---

## Project plan

### Common

Project demo should contain:

- scheme of flow/pipelines
- repository of your code (pipeline)
- working pipeline
- demo shouldn't be not longer than 10 mins

Application requirements:

- Versioning
- DB inside
- User data

> As example can be any from this list od [CMS](https://en.wikipedia.org/wiki/List_of_content_management_systems)

### CI

Organize CI:

- Git repository for application
  - branches, README.md
- Git repository for pipeline code
  - branches, README.md
- Push/merge/commit reaction
  - Code validation
  - Container deployment/image build
  - Any kind of tests

### CD

Develop and delivery CD solution for your application:

Piplines:

- Green deployment
- Upgrade (keep user data)
- Rollback if deployment failed
- Notification
- Performance testing for your Pipeline

