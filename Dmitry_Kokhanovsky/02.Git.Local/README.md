# 02.Git.Local

## Homework Assignment 1: Initializing a Local Repository
```bash
mkdir GitRep
cd GitRep
git init
touch README.md
nano README.md  # Добавили содержимое в файл
git status
git add --all
git config --global user.name "Dmitry Kokhanousky"
git config --global user.email "zzaffkiell@gmail.com"
git commit -m "Init Commit"
```

## Homework Assignment 2: Basic Version Control
```bash
git checkout -b feature-branch
nano README.md # Добавил изменения 
git add --all
git commit -m "add commit to feature-branch"
git checkout master
git merge feature-branch
```

## Homework Assignment 3: Exploring Git History
```bash
git log
commit b60b029490027aa761fce7e41bed7e5ed7951bcb (HEAD -> master)
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 15:56:10 2024 +0300

    Init Commit
```

```bash
git log --oneline
a03f081 (HEAD -> master, feature-branch) add commit to feature-branch
b60b029 Init Commit
```

```bash
$ git log --binary
commit a03f0812ed44ccbd9b375f91bbf18785068db65f (HEAD -> master, feature-branch)
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 16:28:13 2024 +0300

    add commit to feature-branch

diff --git a/README.md b/README.md
index bb225e1..b7031e4 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,2 @@
-My First HomeWork GIT
+My First HomeWork GIT
+V2.0

commit b60b029490027aa761fce7e41bed7e5ed7951bcb
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 15:56:10 2024 +0300

    Init Commit

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..bb225e1
--- /dev/null
+++ b/README.md
@@ -0,0 +1 @@
+My First HomeWork GIT
```

## Homework Assignment 4: Creating and Applying Tags
```bash

$ git log --oneline
a03f081 (HEAD -> master, feature-branch) add commit to feature-branch
b60b029 Init Commit # Добавим тэг на этот коммит

$ git tag -a v1.0 b60b029 -m "V.1.0"

$ git log b60b029
commit b60b029490027aa761fce7e41bed7e5ed7951bcb (tag: v1.0)

$ git show V1.0
tag v1.0
Tagger: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 16:50:00 2024 +0300

V.1.0

commit b60b029490027aa761fce7e41bed7e5ed7951bcb (tag: v1.0)
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 15:56:10 2024 +0300
```

```bash
$ nano README.md
$ git add --all
$ git commit -m "TAGS"
$ git tag -a V2.0 -m "V.2.0"

$ git log --oneline
69d05b4 (HEAD -> master, tag: V2.0) TAGS
a03f081 (feature-branch) add commit to feature-branch
b60b029 (tag: v1.0) Init Commit

$ git show V2.0
tag V2.0
Tagger: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 16:58:11 2024 +0300

V.2.0

commit 69d05b44ca341a160677e5db9d3519f9d24bb7ab (HEAD -> master, tag: V2.0)
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 16:56:45 2024 +0300
```

```bash
$ git tag
V2.0
v1.0

$ git tag v1.1-lw # Легковесный тэг

$ git tag
V2.0
v1.0
v1.1-lw

$ git show v1.1-lw
commit 69d05b44ca341a160677e5db9d3519f9d24bb7ab (HEAD -> master, tag: v1.1-lw, tag: V2.0)
Author: Dmitry Kokhanousky <zzaffkiell@gmail.com>
Date:   Wed Sep 25 16:56:45 2024 +0300

    TAGS

diff --git a/README.md b/README.md
index b7031e4..522e134 100644
--- a/README.md
+++ b/README.md
@@ -1,2 +1,3 @@
 My First HomeWork GIT
 V2.0
+ADD TAGS
```

## Homework Assignment 5: Undoing Changes
```bash

$ git checkout -b bug-fix
$ nano README.md # Добавим баг №1
$ git add --all
$ git commit -m "FIRST BAG"
$ nano README.md # Добавим баг №2
$ git add --all
$ git commit -m "SECOND BAG"

$ git log --oneline
adb5f4c (HEAD -> bug-fix) SECOND BAG
8c7f0f0 FIRST BAG
69d05b4 (tag: v1.1-lw, tag: V2.0, master) TAGS
a03f081 (feature-branch) add commit to feature-branch
b60b029 (tag: v1.0) Init Commit

# Сделать reset оставив файлы без изменений

$ cat README.md
My First HomeWork GIT
V2.0
ADD TAGS
BUG NUMBER_1
BUG NUMBER_2

## 1 способ

$ git reset --soft HEAD~

$ git log --oneline
8c7f0f0 (HEAD -> bug-fix) FIRST BAG
69d05b4 (tag: v1.1-lw, tag: V2.0, master) TAGS
a03f081 (feature-branch) add commit to feature-branch
b60b029 (tag: v1.0) Init Commit

## Коммит отменён, файлы остались без изменений, стейджинг пройден.

$ git status
On branch bug-fix
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md

$ cat README.md
My First HomeWork GIT
V2.0
ADD TAGS
BUG NUMBER_1
BUG NUMBER_2

## 2 способ

$ ls -l README.md
-rw-r--r-- 1 Zaffkiell 197121 68 Sep 25 17:20 README.md

$ git reset HEAD~
Unstaged changes after reset:
M       README.md

## Коммит отменён, файлы остались без изменений, стейджинг не пройден.

$ git log --oneline
69d05b4 (HEAD -> bug-fix, tag: v1.1-lw, tag: V2.0, master) TAGS
a03f081 (feature-branch) add commit to feature-branch
b60b029 (tag: v1.0) Init Commit

$ git status
On branch bug-fix
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")

$ ls -l README.md
-rw-r--r-- 1 Zaffkiell 197121 68 Sep 25 17:20 README.md
```

## Homework Assignment 6: Stashing Changes
``` bash

$ git checkout -b experemental-feature

$ nano README.md # Добавил изменения
$ ls -l README.md
-rw-r--r-- 1 Zaffkiell 197121 80 Sep 25 17:37 README.md

$ git stash
$ ls -l README.md # изменения спрятаны
-rw-r--r-- 1 Zaffkiell 197121 40 Sep 25 17:38 README.md 

$ git stash list
stash@{0}: WIP on experemental-feature: 69d05b4 TAGS

$ git checkout feature-branch

$ nano README.md # Добавил изменения
$ ls -l README.md
-rw-r--r-- 1 Zaffkiell 197121 44 Sep 25 17:41 README.md

$ git add --all
$ git commit -m "Changes"

$ git checkout experemental-feature
$ ls -l README.md
-rw-r--r-- 1 Zaffkiell 197121 40 Sep 25 17:44 README.md
$ git stash apply
On branch experemental-feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")

$ ls -l README.md # Изменения восстоновлены
-rw-r--r-- 1 Zaffkiell 197121 80 Sep 25 17:45 README.md
```

## Homework Assignment 7: Git Aliases and Configuration
```bash
git config --global user.name "Dmitry Kokhanousky"
git config --global user.email "zzaffkiell@gmail.com"

$ git config --global alias.stat status
$ git config --global alias.chko checkout

$ git stat
On branch experemental-feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")

$ git chko master
Switched to branch 'master'
M       README.md
```

```bash
$ git config list
diff.astextplain.textconv=astextplain
filter.lfs.clean=git-lfs clean -- %f
filter.lfs.smudge=git-lfs smudge -- %f
filter.lfs.process=git-lfs filter-process
filter.lfs.required=true
http.sslbackend=openssl
http.sslcainfo=C:/Program Files/Git/mingw64/etc/ssl/certs/ca-bundle.crt
core.autocrlf=true
core.fscache=true
core.symlinks=false
pull.rebase=false
credential.helper=manager
credential.https://dev.azure.com.usehttppath=true
init.defaultbranch=master
user.name=Dmitry Kokhanousky
user.email=zzaffkiell@gmail.com
alias.stat=status
alias.chko=checkout
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
```