# Homework on 02.Git.Local
---
## Initialisation
```bash
svv@ubuntu:~$ git --version
git version 2.25.1
svv@ubuntu:~$ mkdir devops
svv@ubuntu:~$ cd devops/
svv@ubuntu:~/devops$ mkdir 02.GIT
svv@ubuntu:~/devops$ cd 02.GIT/
svv@ubuntu:~/devops/02.GIT$ git init
Initialized empty Git repository in /home/svv/devops/02.GIT/.git/
svv@ubuntu:~/devops/02.GIT$ ls -la
total 12
drwxrwxr-x 3 svv svv 4096 Feb 17 14:27 .
drwxrwxr-x 3 svv svv 4096 Feb 17 14:22 ..
drwxrwxr-x 7 svv svv 4096 Feb 17 14:27 .git
svv@ubuntu:~/devops/02.GIT$ git config user.name "Vitali Snisar"
svv@ubuntu:~/devops/02.GIT$ git config user.email "svv_c@mail.ru"
```
## Work in master branch
```bash
svv@ubuntu:~/devops/02.GIT$ cat > myfirstfile.txt
HI
svv@ubuntu:~/devops/02.GIT$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        myfirstfile.txt

nothing added to commit but untracked files present (use "git add" to track)

svv@ubuntu:~/devops/02.GIT$ cat > .gitignore
*.log
env/
svv@ubuntu:~/devops/02.GIT$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .gitignore
        myfirstfile.txt

nothing added to commit but untracked files present (use "git add" to track)

svv@ubuntu:~/devops/02.GIT$ cat > ignore.log
ignore
svv@ubuntu:~/devops/02.GIT$ ls -la
total 24
drwxrwxr-x 3 svv svv 4096 Feb 18 03:28 .
drwxrwxr-x 3 svv svv 4096 Feb 17 14:22 ..
drwxrwxr-x 7 svv svv 4096 Feb 18 03:28 .git
-rw-rw-r-- 1 svv svv   11 Feb 18 03:27 .gitignore
-rw-rw-r-- 1 svv svv    7 Feb 18 03:28 ignore.log
-rw-rw-r-- 1 svv svv    3 Feb 18 03:20 myfirstfile.txt
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   .gitignore
        new file:   myfirstfile.txt
svv@ubuntu:~/devops/02.GIT$ git commit -m "First commit in master branch"
[master (root-commit) a445a47] First commit in master branch
 2 files changed, 3 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 myfirstfile.txt
svv@ubuntu:~/devops/02.GIT$ git log --oneline
a445a47 (HEAD -> master) First commit in master branch
svv@ubuntu:~/devops/02.GIT$ cat > myfirstfile.txt
HI
BYE
svv@ubuntu:~/devops/02.GIT$ git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   myfirstfile.txt

no changes added to commit (use "git add" and/or "git commit -a")
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   myfirstfile.txt

svv@ubuntu:~/devops/02.GIT$ git commit -m "Second commit in master branch"
[master dddaa36] Second commit in master branch
 1 file changed, 1 insertion(+)
svv@ubuntu:~/devops/02.GIT$ git log --oneline
dddaa36 (HEAD -> master) Second commit in master branch
a445a47 First commit in master branch
```
## Work in  dev branch
```bash
svv@ubuntu:~/devops/02.GIT$ git branch dev
svv@ubuntu:~/devops/02.GIT$ git branch
  dev
* master
svv@ubuntu:~/devops/02.GIT$ git switch dev
Switched to branch 'dev'
svv@ubuntu:~/devops/02.GIT$ git log --oneline
dddaa36 (HEAD -> dev, master) Second commit in master branch
a445a47 First commit in master branch
svv@ubuntu:~/devops/02.GIT$ cat > mysecondfile.txt
HI
svv@ubuntu:~/devops/02.GIT$ git status
On branch dev
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        mysecondfile.txt

nothing added to commit but untracked files present (use "git add" to track)
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch dev
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   mysecondfile.txt

svv@ubuntu:~/devops/02.GIT$ git commit -m "First commit in dev branch"
[dev 9a18d40] First commit in dev branch
 1 file changed, 1 insertion(+)
 create mode 100644 mysecondfile.txt
svv@ubuntu:~/devops/02.GIT$ git log --oneline
9a18d40 (HEAD -> dev) First commit in dev branch
dddaa36 (master) Second commit in master branch
a445a47 First commit in master branch
svv@ubuntu:~/devops/02.GIT$ cat > mysecondfile.txt
HI
BYE
svv@ubuntu:~/devops/02.GIT$ git status
On branch dev
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   mysecondfile.txt

no changes added to commit (use "git add" and/or "git commit -a")
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch dev
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   mysecondfile.txt

svv@ubuntu:~/devops/02.GIT$ git commit -m "Second commit in dev branch"
[dev 6615154] Second commit in dev branch
 1 file changed, 1 insertion(+)
svv@ubuntu:~/devops/02.GIT$ git log --oneline
6615154 (HEAD -> dev) Second commit in dev branch
9a18d40 First commit in dev branch
dddaa36 (master) Second commit in master branch
a445a47 First commit in master branch
```
## Work in  features/do_one branch
```bash
svv@ubuntu:~/devops/02.GIT$ git branch
* dev
  master
svv@ubuntu:~/devops/02.GIT$ git branch features/do_one
svv@ubuntu:~/devops/02.GIT$ git switch features/do_one
Switched to branch 'features/do_one'
svv@ubuntu:~/devops/02.GIT$ git log --oneline
6615154 (HEAD -> features/do_one, dev) Second commit in dev branch
9a18d40 First commit in dev branch
dddaa36 (master) Second commit in master branch
a445a47 First commit in master branch
svv@ubuntu:~/devops/02.GIT$ cat > mythirdfile.txt
HI
svv@ubuntu:~/devops/02.GIT$ git status
On branch features/do_one
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        mythirdfile.txt

nothing added to commit but untracked files present (use "git add" to track)
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch features/do_one
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   mythirdfile.txt

svv@ubuntu:~/devops/02.GIT$ git commit -m "First commit in features/do_one branch"
[features/do_one 6a5f538] First commit in features/do_one branch
 1 file changed, 1 insertion(+)
 create mode 100644 mythirdfile.txt
svv@ubuntu:~/devops/02.GIT$ git log --oneline
6a5f538 (HEAD -> features/do_one) First commit in features/do_one branch
6615154 (dev) Second commit in dev branch
9a18d40 First commit in dev branch
dddaa36 (master) Second commit in master branch
a445a47 First commit in master branch
```
## Work in  hotfix/we_gonna_die branch
```bash
svv@ubuntu:~/devops/02.GIT$ git switch master
Switched to branch 'master'
svv@ubuntu:~/devops/02.GIT$ git branch hotfix/we_gonna_die
svv@ubuntu:~/devops/02.GIT$ git switch hotfix/we_gonna_die
Switched to branch 'hotfix/we_gonna_die'
svv@ubuntu:~/devops/02.GIT$  cat > myfourthfile.txt
HI
svv@ubuntu:~/devops/02.GIT$ git status
On branch hotfix/we_gonna_die
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        myfourthfile.txt

nothing added to commit but untracked files present (use "git add" to track)
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git status
On branch hotfix/we_gonna_die
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   myfourthfile.txt

svv@ubuntu:~/devops/02.GIT$ git commit -m "First commit in hotfix/we_gonna_die branch"
[hotfix/we_gonna_die 0efcee9] First commit in hotfix/we_gonna_die branch
 1 file changed, 1 insertion(+)
 create mode 100644 myfourthfile.txt
svv@ubuntu:~/devops/02.GIT$ git log --oneline
0efcee9 (HEAD -> hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
dddaa36 (master) Second commit in master branch
a445a47 First commit in master branch
```
## Merge to master from features/do_one
```bash
svv@ubuntu:~/devops/02.GIT$ git checkout master
Switched to branch 'master'
svv@ubuntu:~/devops/02.GIT$ git rebase features/do_one
First, rewinding head to replay your work on top of it...
Fast-forwarded master to features/do_one.
svv@ubuntu:~/devops/02.GIT$ git log --oneline
6a5f538 (HEAD -> master, features/do_one) First commit in features/do_one branch
6615154 (dev) Second commit in dev branch
9a18d40 First commit in dev branch
dddaa36 Second commit in master branch
a445a47 First commit in master branch
```
## Merge to master from hotfix/we_gonna_die
```bash
svv@ubuntu:~/devops/02.GIT$ git checkout master
Switched to branch 'master'
svv@ubuntu:~/devops/02.GIT$ git rebase hotfix/we_gonna_die
First, rewinding head to replay your work on top of it...
Applying: First commit in dev branch
Applying: Second commit in dev branch
Applying: First commit in features/do_one branch
svv@ubuntu:~/devops/02.GIT$ git log --oneline
2ca8fb2 (HEAD -> master) First commit in features/do_one branch
10b0801 Second commit in dev branch
ad5acf1 First commit in dev branch
0efcee9 (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
dddaa36 Second commit in master branch
a445a47 First commit im master branch
```
## Merge to dev from hotfix/we_gonna_die
```bash
svv@ubuntu:~/devops/02.GIT$ git checkout dev
Switched to branch 'dev'
svv@ubuntu:~/devops/02.GIT$ git rebase hotfix/we_gonna_die
First, rewinding head to replay your work on top of it...
Applying: First commit in dev branch
Applying: Second commit in dev branch
svv@ubuntu:~/devops/02.GIT$ git log --oneline
50a8cf0 (HEAD -> dev) Second commit in dev branch
3e62c07 First commit in dev branch
0efcee9 (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
dddaa36 Second commit in master branch
a445a47 First commit im master branch
```
## Merge to features/do_one from hotfix/we_gonna_die
```bash
svv@ubuntu:~/devops/02.GIT$ git checkout features/do_one
Switched to branch 'features/do_one'
svv@ubuntu:~/devops/02.GIT$ git rebase hotfix/we_gonna_die
First, rewinding head to replay your work on top of it...
Applying: First commit in dev branch
Applying: Second commit in dev branch
Applying: First commit in features/do_one branch
svv@ubuntu:~/devops/02.GIT$ git log --oneline
f22ebdd (HEAD -> features/do_one) First commit in features/do_one branch
74780e7 Second commit in dev branch
080e529 First commit in dev branch
0efcee9 (hotfix/we_gonna_die) First commit in hotfix/we_gonna_die branch
dddaa36 Second commit in master branch
a445a47 First commit im master branch
```
## Create clone from fork
```bash
svv@ubuntu:~$ cd devops/
svv@ubuntu:~/devops$ git clone https://github.com/svvsvv/sa.it-academy.by  Cloning into 'sa.it-academy.by'...
remote: Enumerating objects: 35968, done.
remote: Counting objects: 100% (622/622), done.
remote: Compressing objects: 100% (423/423), done.
remote: Total 35968 (delta 207), reused 552 (delta 172), pack-reused 35346
Receiving objects: 100% (35968/35968), 328.12 MiB | 10.56 MiB/s, done.
Resolving deltas: 100% (10659/10659), done.
```
## Go to branch 'md-sa2-23-23'
```bash
svv@ubuntu:~/devops$ cd sa.it-academy.by/
svv@ubuntu:~/devops/sa.it-academy.by$ git checkout md-sa2-23-23
Branch 'md-sa2-23-23' set up to track remote branch 'md-sa2-23-23' from 'origin'.
Switched to a new branch 'md-sa2-23-23'
```
## Create my folder
```bash
svv@ubuntu:~/devops/sa.it-academy.by$ mkdir Vitali_Snisar
svv@ubuntu:~/devops/sa.it-academy.by$ cd Vitali_Snisar/
svv@ubuntu:~/devops/sa.it-academy.by/Vitali_Snisar$ mkdir 02.Git.Local
svv@ubuntu:~/devops/sa.it-academy.by/Vitali_Snisar$ cd 02.Git.Local/
svv@ubuntu:~/devops/sa.it-academy.by/Vitali_Snisar/02.Git.Local$
```