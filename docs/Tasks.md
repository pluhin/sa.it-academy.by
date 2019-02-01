## How to send Home work
1. Create fork from the main repository https://github.com/pluhin/sa.it-academy.by
2. Clone forked repository to your workstation
3. Checkout to branch <YOR_GROUP_BRANCH>
4. Create folder with your Name_LastName (As example: In my case name will be `Siarhei_Pishchyk`). This folder will be your report folder.
5. Create folder with name of your homework (Example: `02.Git.Local`)
6. Put your files into it.
7. Make commit and push
8. On WebUI (github) make PR (Pull Request) into main fork and branch <YOR_GROUP_BRANCH> from your fork and your <YOR_GROUP_BRANCH>
9. Wait for review

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

Pay the following situations:
- Release phase - all commits should be inside master (except hotfix)
- Hotfix deploy - commit from hotfix/we_gonna_die branch should be in master first, then in another branches too

All your commands put into files 02.GIT.Local.md and add to your repository, then prepare PR (Pull Request)
> Use git markup to organize your text/output

**Additional:** Create README.md with project description in your folder on your github repository

## 03. GIT hosting
Github/Gitlab/Bitbucket
- Create remote empty repositories
- Add ssh key(s)
- Synchronise with with your local repository from previous task
- Add project into remote repositories each all, one by one
- Create slack/email integration push/commit events

All your repository urls put into files `03.GIT.Hosting.md` and add to your repository, then prepare PR (Pull Request)

Gitlab CE deployment
- Deploy Gitlab
- Setup access and email notification
- Create project
- Check difference between EE and CE
- Send me invitation by Gitlab notificator 

## 04. Ansible start
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

Output all your ansible commands (and commands also) put into `04.Ansible.start.md` and add to your repository, then prepare PR (Pull Request)

## 05. Ansible run 
- Create playbook to print out remote host parameters
    - OS/version
    - Mount point/capacity/used
    - RAM/capacity/free
- Playbook for the ansible user
    - Create new user (use module)
    - New user authorisation only by key
    - Add to the sudo:nopasswd for upgrade command
    - Implement test of that

All your playbooks put into folder `05.Ansible run` and create file `05.Ansible run.md` with description of your ansible code (What it does, examples of command/parametrs) and add to your repository, then prepare PR (Pull Request)

## 06. Ansible cruise
Create Ansible Playbook wit role(s) to install nginx server and two virtual hosts for its. Playbook should meet the following requirements:
- Depends from OS
- Setup ngnix for two virtualhosts using templates 
- Create and add index.html files
- Check deployment

Your playbook put into folder `06.Ansible cruise` and create file `06.Ansible cruise.md` with description of your ansible roles (What it does, examples of command/parametrs) and add to your repository, then prepare PR (Pull Request)

## 07. Ansible Workshop

- Finsh deployment of application
- Create a project with your initals in application
- Create printscreen of your project in application
- Add this printscreen to your repostitory in to folder 07.Ansible Workshop
- Create PR

## 08. Jenkins. Start

Deploy Jenkins use home environment
- Setup Vagrant file
- Install Jenkins
- Default settings setup (like access/plugins)
- Hide Jenkins behind the web server (Apapche, Ngnix)
- (*Additional*)Implement Ansible role for that 

Your Vagrant file and settings steps with configuration files for Web server put into folder `08. Jenkins. Start` add to your repository, then prepare PR (Pull Request)

## 09. Jenkins. Routine 

Implement the following Pipeline:
- Parameters: host IP and credentials  
- Check connection to the host
- Install/upgrade nmap
- Checks all online hosts
- Remove nmap
- Print list of collected/online hosts

Output of your Jenkins task put into folder `09. Jenkins. Routine` add to your repository, then prepare PR (Pull Request)

## 10. Jenkins. As code

Create Pipeline using Jenkinsfile. Should be inside:
- Work with repo
- Work with files
- Publish artifacts
- Tests
- Notification

Your Jenkins file put into folder `10. Jenkins. As code` add to your repository, then prepare PR (Pull Request)

## 11. Docker. Lading

- Create a Docker file of any Python application
    - As example: any API listener 
- Add automated build for that image Docker hub
- Test it
    - Send/receive API request

Your Dockerfile and links to your Dockerhub put into folder `11. Docker. Lading` add to your repository, then prepare PR (Pull Request)

## 12. Docker. Logistics

- Automate task **11. Docker. Lading** by Jenkins
    - Use remote repo as source for build image
    - Make image locally (on Jenkins master/Slave)
    - Push image on Docker Hub

Your Dockerfile, Jenkinsfile and Jenkins output put into folder `12. Docker. Logistics` add to your repository, then prepare PR (Pull Request)

