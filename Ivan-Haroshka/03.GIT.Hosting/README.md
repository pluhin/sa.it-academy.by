### 03.GIT.Hosting
```bash
    1  history 
    2  clear
    3  ssh-keygen
    5  cat /c/Users/адмін/.ssh/id_rsa.pub
    6  clear
    8  git remote add origin git@github.com:Haroshka/sa.it-academy.by.git
    9  git branch
   10  git init
   12  git add .
   13  git commit -m "add git.hub"
   14  history
   15  git remote add origin git@github.com:Haroshka/sa.it-academy.by.git
   16  ls -la
   33  git remote add origin-gitlab git@gitlab.com:Haroshka/03.git.hosting.git
   34   cat .git/config
   36  git add .
   37  git commit -m "add git.lab"
   17  history
```

## GITHIB, GITLUB
Github (https://github.com/Haroshka/sa.it-academy.by.git)
Gitlab (https://gitlab.com/Haroshka/03.git.hosting.git)

## Script
```bash
#!/bin/bash
git add --all
git commit -m "push to remote repository"
for push in $(git remote); do
        git push -u $push
done
```

## Slack
|screenshot|
| :------------ |
|[git remote -v](https://ibb.co/s5sBWTF)|
