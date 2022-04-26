##03.GIT.hosting

## Links to repositoies:
[GitHub](https://github.com/voyager1122/sa.it-academy.by/tree/md-sa2-20-22 "GitHub")

[GitLab](https://gitlab.com/voyager1122/03.git.hosting/-/commits/main "GitLab")

[BitBucket](https://bitbucket.org/voyager1122/03.git.hosting/src/main/ "BitBucket")


#Commands

  523  mkdir 03.GIT.hosting
  524  cd 03.GIT.hosting/
  525  vi git_bulk_push.sh
  526  git init
  527  git status
  528  git add .
  529  git commit -m "03.Git.Hosting initial"
  530  git branch -m master main
  531  git remote add origin git@github.com:voyager1122/03.GIT.hosting.git
  532  git push -u origin --all
  533  git remote add gitlab git@gitlab.com:voyager1122/03.git.hosting.git
  534  git remote add bitbucket git@bitbucket.org:voyager1122/03.git.hosting.git
  535  git push gitlab -f
  536  git push bitbucket -f
  
  
#Automate pushing script

#!/bin/bash 
git push -u origin;
git push -u gitlab;
git push -u bitbucket;