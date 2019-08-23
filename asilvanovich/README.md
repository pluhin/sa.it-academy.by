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
