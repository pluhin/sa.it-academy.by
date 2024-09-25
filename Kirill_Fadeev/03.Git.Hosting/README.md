# 03.Git.Hosting

## 1. Create remote empty repositories (GitHub and GitLab)

1. Github repository https://github.com/Pro100chok91/md-sa2-29-24
2. Gitlab project https://gitlab.com/Pro100chok91/md-sa2-29-24

## 2. Add ssh key(s) to use ssh authentication

```bash
 ssh-keygen
 cat Users/user/.ssh/id_ed25519.pub
## Добавил публичный ключ в настройках профиля на обоих платформах
```

## 3. Push your local repository into remote repositories each all, one by one

```bash
## Добавляем пути к удалённым репозиториям
git remote add GHrep git@github.com:Pro100chok91/md-sa2-29-24.git
git remote add GLrep git@gitlab.com:Pro100chok91/md-sa2-29-24.git

git remote
GHrep
GLrep

git branch -m md-sa2-29-24

git push GHrep md-sa2-29-24
***
To github.com:Pro100chok91/md-sa2-29-24.git
* [new branch]      md-sa2-29-24 -> md-sa2-29-24

git push GLrep md-sa2-29-24
***
To gitlab.com:Pro100chok91/md-sa2-29-24.git
 * [new branch]      md-sa2-29-24 -> md-sa2-29-24


```

## 4. Create email integration push/commit events

```bash
## В настройках репозиториев добавлена почта.
## Произведены изменения файлов, коммиты и пуши.
```
#### GitHub email:  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/03.Git.Hosting/img/2.jpg "GitHub email")

#### GitLab email:  
![alt text](https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/03.Git.Hosting/img/3.jpg "GitLab email")

## 5. Automate pushing your changes to all remote repositories (bash/python/go.. scripts)
    ..* create alias for script in your shell
## 6. List of upstream repositories should be extracted automatically for loop

```bash
## Скрипт
nano AutoPush.sh

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

```bash
## Алиас и работа скрипта

alias Autopush='./AutoPush.sh'

Autopush
Start push in all repositories
Everything up-to-date
branch 'bug-fix' set up to track 'GHrep/bug-fix'.
branch 'experimental-feature' set up to track 'GHrep/experimental-feature'.
branch 'feature-branch' set up to track 'GHrep/feature-branch'.
branch 'md-sa2-29-24' set up to track 'GHrep/md-sa2-29-24'.
Everything up-to-date
branch 'bug-fix' set up to track 'GLrep/bug-fix'.
branch 'experimental-feature' set up to track 'GLrep/experimental-feature'.
branch 'feature-branch' set up to track 'GLrep/feature-branch'.
branch 'md-sa2-29-24' set up to track 'GLrep/md-sa2-29-24'.
All repositories are pushed

```