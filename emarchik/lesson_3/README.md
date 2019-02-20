#Lesson 3: Git-Hosting

##Home task:

---
**Path_1**
* Create public repo on: 
1. GitHub
2. GitLab
3. BitBucket
* Add SSH-Key and connect bu him.
* Synchronise local repo with all SCV.
* Create README.md file with description home_task(project) and add links on SCV repo.
* Create "Slack" notification with SCV. 
---
**Path_2**
* Deploy GitLab CE
* Create project
* Send invitation on repo GitLab through email.
---

### Links on SCV repository:
* <https://gitlab.com/ZikFred/lesson_3/tree/m-sa2-06-19> - GITLAB REPO
* <https://bitbucket.org/agarim/lesson_3/src/m-sa2-06-19/> - BITBUCKET REPO
* <https://github.com/ZikFred/sa.it-academy.by/tree/m-sa2-06-19/emarchik> - GITHUB REPO

### History command into Code:
```$bash
  469  ls /c/Users/***/.ssh/
  470  vim /c/Users/***/.ssh/id_rsa.pub
  471  git status
  472  git remote rename origin github-origin
  473  vim .git/config
  474  git remote add origin git@gitlab.com:ZikFred/lesson_3.git
  475  vim .git/config
  476  git push -u origin --all
  477  git remote rename origin gitlab-origin
  478  git remote add origin git@bitbucket.org:agarim/lesson_3.git
  479  vim .git/config
  480  git remote rename origin bitbucket-origin
  481  git push -u bitbucket-origin --all
  482  git status
  483  vim .git/config
  484  git pull github-origin
  485  git status
  486  cd emarchik/
  487  mkdir lesson_3
  488  vim .gitignore
  489  vim lesson_3/README.md
  490  git add .
  491  git commit -m "Lesson 3: Git-Hosting(Create README file with links in SVC repo)" 
  492  git push github-origin
  493  history
```