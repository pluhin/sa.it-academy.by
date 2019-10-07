# Project description  
## 02.GIT.Local  
Local repository was initialized. Branches and innitional commits for the branches are listed below:  
- master (init)
  - 2 commits
- dev (from master)
  - 2 commits from master + 2 additional
- features/do_one (from dev)
  - 2 commits from master + 2 additional  form dev + 1 additional
- hotfix/we_gonna_die (from master)
  - 2 commits from master + 1 additional  

Then all the commits from features/do_one and dev branches were merged into master branch. Finally, hotfix/we_gonna_die branch fix commit was delivered to master, dev and features/do_one branches using the git cherry-pick feature.  

## 03.GIT.Hosting 
Three remote repositories were created on BitBucket, GitLab and GitHub. Public SSH key was added to all the hostings to push code without manual password input. Also, Slack notifications for GitHub changes were configured.  
Script push.sh was created to automate push operations to all the mentioned hostings.  
Additionally GitLab CE was deployed on the local machine.  

## 04.Infrastructure.Vagrant.LXC  
Two virtual machines with CenOS and Alpine OSs were created using Vagrant. I created a script that automatically detects system type and installs vim, git, wget, curl, lxc and lxc-templates packages. This script was used in Vagrantfile (it can be found inside of the 04.Infrastructure.Vagrant.LXC folder). Additionally vagrant user was granted NOPASSWD privelegies in the sudoers file.  
On the vagrant-created CentOS I tested Linux container. I created Debian and Centos containers from provided templates and limited RAM usage to 512Mb on each of them by modifying a configuration file.


## 05.Ansible.Start
For a first task Ansible was deployed on the local machine. Information about local machine was added to the /etc/ansible/hosts to perform an upgrade of packages locally with an ansible ad-hoc command.  
A second task required a connection to remote hosts using bastion machine. I used machines that were deployed in ED of HTP to complete this task. A public key of my local machine was transferred to the bastion host first, then a new user was created and granted a NOPASSWD rights on the remote Ubuntu and CentOS machines. Finally, the  public key of my local machine was transferred to the remote hosts, which allowed passwordless authentication with the Ansible. Then I got info about hostname and IP addresses of the remote hosts. Additionally packages were updated and upgraded on them.


## 06.Ansible.Run  
In this task I practiced with the YAML syntaxis. First, I created an ansible inventory file in yaml format. Then I created 2 playbooks. The first one was created to query system paremeters:  
- OS/version
- Mount point/capacity/used
- RAM/capacity/free  
The second playbook was created with these features:  
- Create new user (use module)
- New user authorisation only by key
- Add to the sudo:nopasswd for upgrade command


## 07.Ansible.Cruise
In this task I practiced with the roles in Ansible. I deployed two virtual machines with Alpine and Ubuntu OSs using Vagrant. Then nginx server with two virtual hosts was deployed on the created machines. My playbook has met the following requirements:

- Depends from OS
- Setup ngnix for two virtualhosts using templates 
- Create and add index.html files
- Check deployment


## 08.Ansible.Spinup
In this task I created a testing role to check the following:

- Check if we have SUDO with NOPASSWD
- Checks to public repository (debian/centos and pip)
- Check if we have connection to docker hub registry (return content check)
- Check if we have enough RAM/HDD (you can create thresholds by yourself)  
All related tasks was tested using molecule.

## 09.Ansible.Workshop  
During the webinar Redmine was deployed on a remote host. My hometask was to do the following:  
- Create a project with your initals in application
- Create printscreen of your project in application
- Add this printscreen to your repostitory in to folder 09.Ansible Workshop  
Screens that prrove successful connection can be found in 09.Ansible.Workshop folder.

## 10.Jenkins.Start  
This task required to deploy Jenkins that is hidden behind Nginx using Vagrant and Ansible as a provisioner option.  
Jenkins and Nginx were installed using Ansible roles and then Jenkins was accessed and configured for use. 

## 11.Jenkins.Routine  
This task had the following requirements:  
- Parameters: host IP and credentials  
- Check connection to the host
- Install/upgrade nmap
- Checks all online hosts
- Remove nmap
- Print list of collected/online hosts  
I decided to use ansible ad-hoc commands to complete it, so I changed parameter to HOST that ansible commande will use. Results can be found in 11.Jenkins.Routine folder.

## 12.Jenkins.AsCode
This task required to create pipeline using Jenkinsfile that will contain:  
- Work with repo
- Work with files
- Publish artifacts
- Tests
- Notification

My pipeline did the following task: download a specified branch, create a new branch based on the downloaded one, add a disk usage of the branch's folders, then push the new branch to the repo and finally check if new branch is successfully added. Also Slack notifications was implemented for this pipeline.

## 13.Docker.Lading  
This task required me to work with Docker and do the following:  
- Create a Docker file of any Python application
- As example: any API listener 
- Add automated build for that image Docker hub
- Test it
- Send/receive API request  
I created a simple web-page using pythin flask module. My web-site listened on port 5000, and was deployed on a container that was deployed on a VM, so to access it from my local machine I used a 3-way port translation.  
Also, Dockerhub was linked with my GitHub profile to automatically biuld docker images from Dockerfiles in my repo.
