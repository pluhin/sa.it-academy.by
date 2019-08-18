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
