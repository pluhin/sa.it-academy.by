# 03. GIT. Hosting - Ivan Ustinovich

## Repositories
1. github https://github.com/Gusiner/03.-GIT.-Hosting
2. gitlab https://gitlab.com/iv.ustinovich/03.-git.-hosting
3. bitbucket https://bitbucket.org/ivan_ustinovich/git03/src

## Command
``` bash
  719  git init
  720  git remote add github git@github.com:Gusiner/03.-GIT.-Hosting.git
  721  git remote add gitlab git@gitlab.com:iv.ustinovich/03.-git.-hosting.git
  722  git remote add bitbucket git@bitbucket.org:ivan_ustinovich/git03.git
  723  git add .
  724  git commit -m "Add repos"
  725  git config user.email "iv.ustinovich@gmail.com"
  726  git config user.name "Ivan_Ustinovich"
  727  git commit -m "Add repos"
  728  git push
  729  git push github
  730  git push -f github
  731  git push github master
  732  git push gitlab main
  733  git push gitlab
  734  git push --set-upstream gitlab master
  735  git push -u bitbucket master
  736  git push
  737  touch open.sh
  738  git add open.sh
  739  git commit -m "add script open.sh"
  740  git push
  741  git push github
  742  git push gitlab
  743  git push bitbucket
  744  vim .gitignore
  745  vim push_git.sh
  746  chmod +x push_git.sh
  747  ./push_git.sh
  748  vim push_git.sh
  749  ./push_git.sh
  750  git status
  751  git add .
  752  git commit -m "add .gitignore"
  753  ./push_git.sh
  754  touch playbook.txt
  755  git add .
  756  git commit -m "add playbook"
  757  ./push_git.sh
```
## Create Slack channel #ustinovich_git
Screenshot from Slack in the current directory (Slack.png)

## Push script
``` bash
#!/bin/bash

git push github
git push gitlab
git push bitbucket
```

