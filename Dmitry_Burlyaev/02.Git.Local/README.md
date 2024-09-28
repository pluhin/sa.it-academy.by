
## Homework Assigment 1: Initializing a local Repossitory

```bash
cd e://Programming/DevOps_Training/
mk dir MyRepo
cd MyRepo
git init
touch README.md
nano README.md
## added file README.MD
git status
git add --all
git commit -m "Init commit"
```

## Homework Assignment 2: Basic Version Control

```bash
git checkout -b feature-branch
nano README.md #Maked changes
git add --all
git commit
git checkout master
git merge feature-branch
```

## Homework Assignment 3: Exploring Git History
```bash
 git log
```
commit b9def8424354adcda0ecafa3517688b003fd5005 (HEAD -> master)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:51:49 2024 +0300

    Homework Assignment 2: Basic Version Control

commit ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba (feature-branch)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:37:01 2024 +0300

    Init commit

+# b9def8424354adcda0ecafa3517688b003fd5005
```bash
 git show b9def8424354adcda0ecafa3517688b003fd5005
```
commit b9def8424354adcda0ecafa3517688b003fd5005 (HEAD -> master)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:51:49 2024 +0300

    Homework Assignment 2: Basic Version Control

diff --git a/README.md b/README.md
index 427f100..c948e69 100644
--- a/README.md
+++ b/README.md
@@ -11,3 +11,13 @@ git status
+```bash
+git add --all
+ git commit -m "Init commit"
+```
+## Homework Assignment 2: Basic Version Control
+```bash
+git checkout -b feature-branch
+nano README.md #Maked changes
+git add --all
+git commit
+git checkout master
+git merge feature-branch
+```
:
+# ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba
```bash
 git show ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba
```
commit ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba (feature-branch)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:37:01 2024 +0300

    Init commit

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..427f100
--- /dev/null
+++ b/README.md
@@ -0,0 +1,13 @@

+# Homework Assigment 1: Initializing a local Repossitory0
+```bash
+cd e://Programming/DevOps_Training/
+mk dir MyRepo
+cd MyRepo
+git init
+touch README.md
+nano README.md
+# added file README.MD
+git status
+git add --all
:

+# 
diff --git a/sa.it-academy.by b/sa.it-academy.by
new file mode 160000
index 0000000..4c44452
--- /dev/null
+++ b/sa.it-academy.by
@@ -0,0 +1 @@
+Subproject commit 4c44452bbad18330428b7344edb2b83fac5d110f
(END)

 git commit -m "Homework Assignment 3 Exploring Git History"


## Homework Assignment 4: Creating and Applying Tags
```bash
git log --oneline
```
e8bc005 (HEAD -> master) Working with branches
1b49005 Homework Assignment 3 Exploring Git History
b9def84 Homework Assignment 2: Basic Version Control
ddb514b (feature-branch) Init commit


``` bash
 git log ddb514b
```
commit ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba (tag: v1.0, feature-branch)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:37:01 2024 +0300

    Init commit
```bash
git log --oneline
```
e8bc005 (HEAD -> master, tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit
```bash
git log e8bc005
```
commit e8bc0059eae754b3fe9868a7b588dda3459b47af (HEAD -> master, tag: v1.3)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 23:19:59 2024 +0300

    +## Working with branches

commit 1b490051079a3b409810a51988bc088aa50eb251 (tag: v1.2)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 23:12:29 2024 +0300

    +## Homework Assignment 3 Exploring Git History

commit b9def8424354adcda0ecafa3517688b003fd5005 (tag: v1.1)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:51:49 2024 +0300

   +## Homework Assignment 2: Basic Version Control

commit ddb514bb02b04b0e58d4eef19a52d9e57a5c3eba (tag: v1.0, feature-branch)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 22:37:01 2024 +0300

    Init commit
``` bash
nano README.md
git add --all
git commit
git tag -a v2.0 -m "Version 2.0
```
```bash
git log --oneline
```
686ee0f (HEAD -> master, tag: v2.0) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit

+# lightweight tags

```bash
git tag v1.5-lw b9def84
```
Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (master)
```bash
git tag
```
v1.0
v1.1
v1.2
v1.3
v1.5-lw
v2.0

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (master)
```bash
git log --oneline
```
686ee0f (HEAD -> master, tag: v2.0) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.5-lw, tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit

+# Force tag changed
```bash
git log --oneline
```
e066565 (HEAD -> master, tag: v2.0) Applying Lightweight Tags
686ee0f (tag: v1.9-lw) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.5-lw, tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit
```bash
git tag
```
v1.0
v1.1
v1.2
v1.3
v1.5-lw
v1.9-lw
v2.0

```bash
git show v1.9-lw
```
commit 686ee0fe1e6fb20626338289ef5be8ae58c7ddd3 (tag: v1.9-lw)
commit 686ee0fe1e6fb20626338289ef5be8ae58c7ddd3 (tag: v1.9-lw)
Author: Dmitry Burlyaev <dm.burlyaev@gmail.com>
Date:   Tue Sep 24 23:53:53 2024 +0300

 +##  Homework Assignment 4: Creating and Applying Tags

diff --git a/README.md b/README.md
index bee8184..5c83d42 100644
--- a/README.md
+++ b/README.md
@@ -1,4 +1,6 @@


 +## Homework Assigment 1: Initializing a local Repossitory

 +```bash
 +cd e://Programming/DevOps_Training/
 +mk dir MyRepo
+@@ -11,8 +13,10 @@ git status
 +git add --all
 +git commit -m "Init commit"
 +```
-

 +## Homework Assignment 2: Basic Version Control

+
+ ```bash
+ git checkout -b feature-branch
+ nano README.md #Maked changes
+ @@ -21,8 +25,10 @@ git commit
+ git checkout master
+ git merge feature-branch
+ ```
-

 +## Homework Assignment 3: Exploring Git History

+```bash
+ git log --binary
+```

## Homework Assignment 5: Undoing Changes

Sat Sep 28 13:54:24 BST 2024
e066565 Applying Lightweight Tags
686ee0f Homework Assignment 4: Creating and Applying Tags
e8bc005 Working with branches
1b49005 Homework Assignment 3 Exploring Git History
b9def84 Homework Assignment 2: Basic Version Control
ddb514b Init commit
```bash
git status >> README.md
```
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   README.md
	modified:   sa.it-academy.by (new commits)

no changes added to commit (use "git add" and/or "git commit -a")
bug-fix
3.Make another change and commit it.

bug-fix-some-second-changes
Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ echo 'bug-fix-some-second-changes' >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git add --all
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git commit -m "Bug-fix-some-second-changes"
[bug-fix 1e5d654] Bug-fix-some-second-changes
 1 file changed, 3 insertions(+)

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git log --oneline
1e5d654 (HEAD -> bug-fix) Bug-fix-some-second-changes
33f434b Bug-fix branch
f2267d3 (master) Homework Assignment 5 commit 1
e066565 (tag: v2.0) Applying Lightweight Tags
686ee0f (tag: v1.9-lw) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.5-lw, tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit

4.Use git reset to undo the most recent commit while keeping the changes.
 ```bush      
 git reset
```
5.Explore the effects of git reset with different options (soft, mixed, hard).

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ echo 'bug-fix-third' >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   README.md
        modified:   sa.it-academy.by (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file1.txt

no changes added to commit (use "git add" and/or "git commit -a")

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   sa.it-academy.by (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file1.txt


Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git add README.md
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   sa.it-academy.by (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        file1.txt


Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 a8c44c282cef078f34249db219771df7931f0743 0       README.md
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git add file1.txt
warning: in the working copy of 'file1.txt', LF will be replaced by CRLF the next time Git touches it

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 a8c44c282cef078f34249db219771df7931f0743 0       README.md
100644 8e66654a5477b1bf4765946147c49509a431f963 0       file1.txt
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git reset --hard
HEAD is now at e8c936e Bug-fix-some-second-changes02

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ cat >> README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$  git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 0c5a9d0713a5ed99310f8606ca9053efdb9398c3 0       README.md
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$

HEAD is now at e8c936e Bug-fix-some-second-changes02



	Here we have performed a "hard reset" using the --hard option.
        Git displays output indicating that HEAD points to
        last commit. 
	Next checked the status of the repo using
        git status. 
	Git indicates that there are no pending changes. 
        Also checked the status of the Staging Index and see that
        it was reset to the point before new_file was added. 
        Changes to README.md and addition of file1.txt
        were destroyed.

*GIT RESET MIXED


bug-fix-third

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git add --all
warning: in the working copy of 'README.md', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'new_file_01', LF will be replaced by CRLF the next time Git touches it

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md
        new file:   new_file_01

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   sa.it-academy.by (modified content)


Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 6b545730af1234762983e7f1b5e8232b25b1b85c 0       README.md
100644 8e66654a5477b1bf4765946147c49509a431f963 0       new_file_01
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$  git reset --mixed
Unstaged changes after reset:
M       README.md

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   README.md
        modified:   sa.it-academy.by (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        new_file_01

no changes added to commit (use "git add" and/or "git commit -a")

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 0c5a9d0713a5ed99310f8606ca9053efdb9398c3 0       README.md
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ ls -la
total 34
drwxr-xr-x 1 Fuzzy 197609     0 Sep 28 14:56 ./
drwxr-xr-x 1 Fuzzy 197609     0 Sep 28 13:56 ../
drwxr-xr-x 1 Fuzzy 197609     0 Sep 28 14:59 .git/
-rw-r--r-- 1 Fuzzy 197609    38 Sep 28 14:13 .gitignore
-rw-r--r-- 1 Fuzzy 197609 13693 Sep 28 14:56 README.md
-rw-r--r-- 1 Fuzzy 197609    17 Sep 28 14:56 new_file_01
drwxr-xr-x 1 Fuzzy 197609     0 Sep 28 13:24 sa.it-academy.by/

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git status
On branch bug-fix
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   README.md
        modified:   sa.it-academy.by (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        new_file_01

no changes added to commit (use "git add" and/or "git commit -a")

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)
$ git ls-files -s
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 0c5a9d0713a5ed99310f8606ca9053efdb9398c3 0       README.md
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by

Fuzzy@Kitsune-PC MINGW64 /e/Programming/DevOps_Training/MyRepo (bug-fix)


	In this case, we performed a “mixed reset”. Analysis of "git status" and "git ls-files" shows that the stagging index has 	returned to a point where "new_file_01" has not been added to the index. The SHA object for the README.md file has been 	reset to the previous version. Also, "git status" shows that there are changes in the README.md file, and "new_file_01" 	is not tracked at all, even though it is in .
	This is clearly --mixed behavior. The stagging index has been reset, and the expected changes have been transferred to 	the working directory. Compare this with the --hard Reset case.
	where the staging index was reset, the working directory was also reset and those updates were lost.

* GIT SOFT RESET
```bush
$ git add README.md
$ rm new_file_01
$ git status
```

On branch bug-fix
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   sa.it-academy.by (modified content)
```bush
$  git ls-files -s
```
100644 cd5b0e337c3de1d61ced476481dd2e4f003c26aa 0       .gitignore
100644 88f6c11fa6bf37ac5045d3589f6cba501f7f78fb 0       README.md
160000 2f8a47ce785b01cfba50c99f006421ce5f867cff 0       sa.it-academy.by
```bussh
$  git commit -m "Prepering for bug-fix-third to soft reset"
```
[bug-fix 60d2994] Prepering for bug-fix-third to soft reset
 1 file changed, 250 insertions(+)
```bush
$ git log --oneline
```
60d2994 (HEAD -> bug-fix) Prepering for bug-fix-third to soft reset
e8c936e Bug-fix-some-second-changes02
1e5d654 Bug-fix-some-second-changes
33f434b Bug-fix branch
f2267d3 (master) Homework Assignment 5 commit 1
e066565 (tag: v2.0) Applying Lightweight Tags
686ee0f (tag: v1.9-lw) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.5-lw, tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit

```bush
$ git reset --soft 33f434b
$ git log --oneline
```
33f434b (HEAD -> bug-fix) Bug-fix branch
f2267d3 (master) Homework Assignment 5 commit 1
e066565 (tag: v2.0) Applying Lightweight Tags
686ee0f (tag: v1.9-lw) Homework Assignment 4: Creating and Applying Tags
e8bc005 (tag: v1.3) Working with branches
1b49005 (tag: v1.2) Homework Assignment 3 Exploring Git History
b9def84 (tag: v1.5-lw, tag: v1.1) Homework Assignment 2: Basic Version Control
ddb514b (tag: v1.0, feature-branch) Init commit

	This type of reset (Soft reset) moves the current branch's HEAD to a specified commit but does not alter the index 	(staging area) or the working directory. It only changes where the current branch is currently pointing. This is useful 	when you want to undo commits but keep all your files and changes exactly as they are for recommitting.

experimental-content
 Content
          Description of project
          tag v2.0
          experimantal content

## Homework Assignment 6: Stashing Changes

1. Create a new branch named experimental-feature.
```bush       
 git checkout -b experimental-feature
```
2. Make some changes to the README.md file but do not commit them.
```bush
 echo 'experimental-content' >> README.md
```
3. Use git stash to temporarily store your changes.
 ```
git stash
```
Saved working directory and index state WIP on experimental-feature: 17b1142 Homework Assignment 5: Undoing Changes finished
```
git status
```
On branch experimental-feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
   modified:   sa.it-academy.by (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

```bush
$ git stash list
```
stash@{0}: WIP on experimental-feature: 17b1142 Homework Assignment 5: Undoing Changes finished
stash@{1}: WIP on experimental-feature: 17b1142 Homework Assignment 5: Undoing Changes finished
stash@{2}: WIP on experimental-feature: 17b1142 Homework Assignment 5: Undoing Changes finished




4. Switch to another branch and make a different set of changes.
```
$ git checkout feature-branch
```
Switched to branch 'feature-branch'
```
$  git log --oneline
```
8fbe01c (HEAD -> feature-branch) Experimental content for feature branch
ddb514b (tag: v1.0) Init commit



5. Apply the changes from the stash to the experimental-feature branch.
```
$ git checkout experimental-feature
$  git stash apply
```
On branch experimental-feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   README.md
        modified:   sa.it-academy.by (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

## Homework Assignment 7: Git Aliases and Configuration

1. Configure your Git username and email globally.

        git config --global user.name "Dmitry Burlyaev"

        git config --global user.email "dm.burlyaev@gmail.com"

2. Set up a custom alias for a frequently used Git command.
```
	git config --global alias.chout checkout
 	git config --global alias.stat status
```
```
$ cat ~/.gitconfig
```
[user]
        email = dm.burlyaev@gmail.com
        name = Dmitry Burlyaev
[alias]
        chout = checkout
        stat = status

3. Use the git config command to verify your configuration changes.
```
$ git stat
```
On branch experimental-feature
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
        modified:   README.md
        modified:   sa.it-academy.by (modified content)

no changes added to commit (use "git add" and/or "git commit -a")


