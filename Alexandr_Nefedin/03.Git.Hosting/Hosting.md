## GIT hosting

### Create Github/Gitlab/bitbucket repositories

[-- GITHUB](https://github.com/Demo2886)  
[-- GITLab](https://gitlab.com/Demo2886)  
[-- Bitbucket](https://bitbucket.org/joker_cat/)


```bash
demo@ubuntu:~/Desktop/test.it-academy/Alexandr_Nefedin/03.Git.Hosting$ git remote -v
bitbucket       git@bitbucket.org:joker_cat/test.it-academy.git (fetch)
bitbucket       git@bitbucket.org:joker_cat/test.it-academy.git (push)
gitlab  git@gitlab.com:Demo2886/test.it-academy.git (fetch)
gitlab  git@gitlab.com:Demo2886/test.it-academy.git (push)
origin  git@github.com:Demo2886/test.it-academy.git (fetch)
origin  git@github.com:Demo2886/test.it-academy.git (push)
```

### Script automate pushing all remote repositories
```bash
nano shell_push.sh
chmod +x shell_push.sh
./shell_push.sh
   ```
   
```bash
#!/bin/bash

echo "*  Push to GitHub *"
git push origin --all

echo "*  Push to Bitbucket  *"
git push bitbucket --all

echo "*  Push to GitLab  *"
git push gitlab --all
   ```
