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
https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/03.Git.Hosting/img/2.jpg

#### GitLab email:  
https://github.com/Pro100chok91/sa.it-academy.by/blob/md-sa2-29-24/Kirill_Fadeev/03.Git.Hosting/img/3.jpg

