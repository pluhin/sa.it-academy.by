# 02. Git.Local.
***
* Commands history
```bash
git --version
ls -la
mkdir m-sa2-10-19
ls -la
cd m-sa2-10-19/
ls -la
git init
git config
git config -l
git status
git config --global
git config --global user.name "Evgheni Solonin"
git config --global user.email "soloninevgheni@gmail.com"
git status
git config -l
touch main.txt
date > main.txt
cat main.txt
git add --all
git status
git commit -m "First_commit_in_master"
touch index.txt
vim index.txt
git add --all
git status
git commit -m "Second_commit_in_master"
git status
git checkout -b "dev"
git branch
git log --oneline
vim main.txt
git add --all
git commit -m "First commit in dev"
git log --oneline
vim main.txt
git add -all
git add --all
git commit -m "Second commit in dev"
git branch
git log --oneline
git checkout -b "features/do_one"
git branch
git log --oneline
touch feature.py
vim feature.py
git add --all
git commit -m "First commit in features/do_one"
git log --oneline
git checkout master
git log --oneline
git checkout -b "hotfix/we_gonna_die"
git status
git log --oneline
ls -la
cat main.txt
vim index.txt
git add --all
git commit -m "first commit in hotfix"
git log -oneline
git checkout dev
git branch
git log -oneline
git log --oneline
git merge features/do_one
git log --oneline
git checkout master
git log --oneline
git merge dev
git log --oneline
ls -la
git branch -a
git cherry-pick ?
git checkout hotfix/we_gonna_die
git log --oneline
git checkout master
git log --oneline
git cherry-pick 89a34f0
git log --oneline
git checkout dev
git log --oneline
git rebase master
git branch -a
git log --oneline
git checkout features/do_one
git rebase dev
git log --oneline
history
```
***
* Outputs
1. Master.

- initial
```bash
esolonin@srv-home:/m-sa2-10-19$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

        new file:   main.txt

esolonin@srv-home:/m-sa2-10-19$ git commit -m "First_commit_in_master"
[master (root-commit) a64be17] First_commit_in_master
 1 file changed, 1 insertion(+)
 create mode 100644 main.txt

 esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   index.txt

esolonin@srv-home:/m-sa2-10-19$ git commit -m "Second_commit_in_master"
[master 68bb111] Second_commit_in_master
 1 file changed, 4 insertions(+)
 create mode 100644 index.txt
esolonin@srv-home:/m-sa2-10-19$ git status
On branch master
nothing to commit, working tree clean
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
68bb111 (HEAD -> master) Second_commit_in_master
a64be17 First_commit_in_master
```
- With dev\features commits
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout master
Switched to branch 'master'
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
68bb111 (HEAD -> master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ git merge dev
Updating 68bb111..323af96
Fast-forward
 feature.py | 4 ++++
 main.txt   | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 feature.py
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
323af96 (HEAD -> master, features/do_one, dev) First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 Second_commit_in_master
a64be17 First_commit_in_master
```
- With hotfix commit
```bash
esolonin@srv-home:/m-sa2-10-19$ git cherry-pick 89a34f0
[master 00767fe] first commit in hotfix
 Date: Mon Oct 28 20:10:42 2019 +0000
 1 file changed, 2 insertions(+)
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
00767fe (HEAD -> master) first commit in hotfix
323af96 (features/do_one, dev) First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 Second_commit_in_master
a64be17 First_commit_in_master
```
***
2. Dev

- initial
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout -b "dev"
Switched to a new branch 'dev'
esolonin@srv-home:/m-sa2-10-19$ git branch
* dev
  master
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
68bb111 (HEAD -> dev, master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ vim main.txt
esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git commit -m "First commit in dev"
[dev e62395a] First commit in dev
 1 file changed, 2 insertions(+)
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
e62395a (HEAD -> dev) First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ vim main.txt
esolonin@srv-home:/m-sa2-10-19$ git add -all
error: did you mean `--all` (with two dashes ?)
esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git commit -m "Second commit in dev"
[dev 0f25919] Second commit in dev
 1 file changed, 2 insertions(+)
esolonin@srv-home:/m-sa2-10-19$ git branch
* dev
  master
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
0f25919 (HEAD -> dev) Second commit in dev
e62395a First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
```
- With features branch commits
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout dev
Switched to branch 'dev'
esolonin@srv-home:/m-sa2-10-19$ git branch
* dev
  features/do_one
  hotfix/we_gonna_die
  master
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
0f25919 (HEAD -> dev) Second commit in dev
e62395a First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ git merge features/do_one
Updating 0f25919..323af96
Fast-forward
 feature.py | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 feature.py
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
323af96 (HEAD -> dev, features/do_one) First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
```
- Rebased with hotfix
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout dev
Switched to branch 'dev'
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
323af96 (HEAD -> dev, features/do_one) First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ git rebase master
First, rewinding head to replay your work on top of it...
Fast-forwarded dev to master.
esolonin@srv-home:/m-sa2-10-19$ git branch -a
* dev
  features/do_one
  hotfix/we_gonna_die
  master
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
00767fe (HEAD -> dev, master) first commit in hotfix
323af96 (features/do_one) First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 Second_commit_in_master
a64be17 First_commit_in_master
```
***
3. Features/do_one

- initial
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout -b "features/do_one"
Switched to a new branch 'features/do_one'
esolonin@srv-home:/m-sa2-10-19$ git branch
  dev
* features/do_one
  master
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
0f25919 (HEAD -> features/do_one, dev) Second commit in dev
e62395a First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ touch feature.py
esolonin@srv-home:/m-sa2-10-19$ vim feature.py
esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git commit -m "First commit in features/do_one"
[features/do_one 323af96] First commit in features/do_one
 1 file changed, 4 insertions(+)
 create mode 100644 feature.py
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
323af96 (HEAD -> features/do_one) First commit in features/do_one
0f25919 (dev) Second commit in dev
e62395a First commit in dev
68bb111 (master) Second_commit_in_master
a64be17 First_commit_in_master
```
- Rebased with hotfix
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout features/do_one
Switched to branch 'features/do_one'
esolonin@srv-home:/m-sa2-10-19$ git rebase dev
First, rewinding head to replay your work on top of it...
Fast-forwarded features/do_one to dev.
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
00767fe (HEAD -> features/do_one, master, dev) first commit in hotfix
323af96 First commit in features/do_one
0f25919 Second commit in dev
e62395a First commit in dev
68bb111 Second_commit_in_master
a64be17 First_commit_in_master
```
***
4. Hotfix/we_gonna_die

- initial
```bash
esolonin@srv-home:/m-sa2-10-19$ git checkout -b "hotfix/we_gonna_die"
Switched to a new branch 'hotfix/we_gonna_die'
esolonin@srv-home:/m-sa2-10-19$ git status
On branch hotfix/we_gonna_die
nothing to commit, working tree clean
esolonin@srv-home:/m-sa2-10-19$ git log --oneline
68bb111 (HEAD -> hotfix/we_gonna_die, master) Second_commit_in_master
a64be17 First_commit_in_master
esolonin@srv-home:/m-sa2-10-19$ ls -la
total 20
drwxrwxr-x 3 esolonin esolonin 4096 Oct 28 20:07 .
drwxr-xr-x 5 esolonin esolonin 4096 Oct 28 20:00 ..
drwxrwxr-x 8 esolonin esolonin 4096 Oct 28 20:08 .git
-rw-rw-r-- 1 esolonin esolonin   29 Oct 28 04:12 index.txt
-rw-rw-r-- 1 esolonin esolonin   29 Oct 28 20:07 main.txt
esolonin@srv-home:/m-sa2-10-19$ cat main.txt
Mon Oct 28 04:04:59 UTC 2019
esolonin@srv-home:/m-sa2-10-19$ vim index.txt
esolonin@srv-home:/m-sa2-10-19$ git add --all
esolonin@srv-home:/m-sa2-10-19$ git commit -m "first commit in hotfix"
[hotfix/we_gonna_die 89a34f0] first commit in hotfix
 1 file changed, 2 insertions(+)
```
 