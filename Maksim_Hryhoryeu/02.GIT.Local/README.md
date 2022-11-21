### Create local repository
```bash  
1  mkdir git-local 
2  cd git-local/ 
3  git init
```
### 2 commits in master
```bash 
4  touch Main.java
5  nano Main.java
6  git add .
7  git commit -m "init commit"
8  nano Main.java
9  git add .
10  git commit -m "add operation has been added"
11  git log
```
### 2 commits in dev
```bash 
12  git checkout -b dev
13  nano Main.java
14  git add .
15  git commit -m "multiply operation has been added"
16  nano Main.java
17  git commit -m "divide operation has been added"
18  git add .
19  git commit -m "divide operation has been added"
20  git log
```
### Commits in features/do_one
```bash 
21  git checkout -b features/do_one
22  nano Main.java
23  git add .
24  git commit -m "subtract operation has been added"
25  git checkout master
```
### Commit in hotfix/we_gonna_die
```bash 
26  git checkout -b hotfix/we_gonna_die
27  nano Main.java
28  git add .
29  git commit -m "add operation has been fixed"
```
### Merge commits into master
```bash 
30  git checkout master
31  git log
32  git merge features/do_one
33  git merge hotfix/we_gonna_die
34  nano Main.java
35  git log
36  git checkout hotfix/we_gonna_die
37  git log
```
### Merge hotfix into dev
```bash 
38  git checkout dev
39  git cherry-pick 6e161ef30caccd53d14fb16f358a3d8ef9bff8b1
40  nano Main.java
```
### Merge hotfix into features/do_one
```bash 
41  git checkout features/do_one
42  git cherry-pick 6e161ef30caccd53d14fb16f358a3d8ef9bff8b1
43  nano Main.java
44  git log
45  history
```
### master log
```bash
d3fffb0 (HEAD -> master) Merge branch 'hotfix/we_gonna_die'
6e161ef (hotfix/we_gonna_die) add operation has been fixed
ac5d724 subtract operation has been added
636fdf3 divide operation has been added
a05e16e multiply operation has been added
6fc0d95 add operation has been added
56daa1f init commit
```
### dev log
```bash
51504b1 (HEAD -> dev) add operation has been fixed
636fdf3 divide operation has been added
a05e16e multiply operation has been added
6fc0d95 add operation has been added
56daa1f init commit
```
### features/do_one log
```bash
4ec5051 (HEAD -> features/do_one) add operation has been fixed
ac5d724 subtract operation has been added
636fdf3 divide operation has been added
a05e16e multiply operation has been added
6fc0d95 add operation has been added
56daa1f init commit
```
### hotfix/we_gonna_die log
```bash
6e161ef (HEAD -> hotfix/we_gonna_die) add operation has been fixed
6fc0d95 add operation has been added
56daa1f init commit
```
