# Home task 03. GIT. Hosting
-----------------------------------------------------------------------------
Homework Assignment 1: Initializing a Remote Repository
1. Create remote empty repositories (GitHub and GitLab)
2. Add ssh key(s) to use ssh authentication
3. Push your local repository into remote repositories each all, one by one
4. Create email integration push/commit events
5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
   * create alias for script in your shell
6. list of upstream repositories should be extracted automatically for loop
Create folder 03.GIT.Hosting, put all your repositories's urls to the file 03.GIT.Hosting/README.md + script and prepare PR (Pull Request)

| Please do not use Cyrillic symbols and whitespaces in path/file names
-----------------------------------------------------------------------------

### 1. Create remote empty repositories (GitHub and GitLab)
- https://github.com/AlexKWGit/ExternalCopy.git
- git@GitHub.com:AlexKWGit/ExternalCopy.git
- git@gitlab.com:AlexKWGit1/ExternalCopy.git // git@gitlab.com:alexkwgit1/ExternalCopy.git // - git@GitLab.com:AlexKWGit/ExternalCopy.git

```bash
  ssh-keygen
  ...
  
  // GitHub
  git remote -v
  git remote set-url origin git@github.com:AlexKWGit/ExternalCopy.git
  git remote add origin git@github.com:AlexKWGit/ExternalCopy.git
  git branch
  git push -u origin master
  git push -u origin --all
  git push --all origin
  git push --tags origin

  // GitLab
  git push --set-upstream origin-gitlab --tags
  git remote add origin-gitlab git@gitlab.com:alexkwgit1/ExternalCopy.git
  git remote
  git push --set-upstream origin-gitlab --all
  git push --set-upstream origin-gitlab --tags
```

###  I'm trying to understand
```bash
  537  git branch
  538  git branch Kuz_Task53
  539  git checkout Kuz_Task53
  540  git branch
  541  ll
  edit files...
  542  git add .
  543  git status
  544  git commit -m "Changed by task 53"
  err  git push origin
  546  git push --set-upstream origin Kuz_Task53
  547  git branch
  550  git checkout
  551  git checkout master
  552  git branch
  553  git branch -d kuz_Task53
  554  git pull origin
  555  git branch -d kuz_Task53
  556  git pull origin
  557  git push origin --delete Kuz_Task53
  558  history
```

### 4. Create email integration push/commit events
     Settings \ Integrations \ Email notifications \ Address: ...

### 5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
--------------------------------------
PushToAll.sh
--------------------------------------
```bash
#!/bin/bash

echo "Start push in all repositories"

# Get repo list  
remote_repositories=$(git remote)

# Push in all repo
for This_repo in $remote_repositories
do
    git push -u $This_repo --all
done

echo "End push in all repositories"
```
--------------------------------------

```bash
git pull origin
```