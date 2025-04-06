
## История выполнения
```bash
1  mkdir sa.it-academy.by
2  cd sa.it-academy.by
3  git checkout ma-sa2-31-25
4  git clone https://github.com/pluhin/sa.it-academy.by.git
5  git status
6  cd sa.it-academy.by
7  git checkout md-sa2-31-25
8  mkdir 02.Git.local
9  cd 02.Git.local
10 git init
11 echo "# My Project" > README.md
12 git add README.md
13 git commit -m "Initial commit with README"
14 history
15 git checkout -b feature-branch
16 echo "## Project Description" >> README.md
17 git commit -am "Added project description"
18 git checkout main
19 git status
20 git log --oneline
21 git checkout master
22 git merge feature-branch
23 hit branch -a
24 git branch -m master main
25 git config --global core.autocrlf true
26 git checkout master
27 git checkout main
28 git checkout -b feature-branch
29 git merge feature-branch
30 git log --oneline
31 git log
32 git log --graph --decorate
33 git show HEAD
34 git tag R1.0 HEAD-1
35 git tag v1.0 HEAD-1
36 git tag v1.0 HEAD
37 git tag -a v2.0 -m "Version 2.0"
38 git tag
39 git checkout -b bug-fix
40 git reset HEAD
41 git checkout -b experimental-feature
42 git stash
43 git checkout main
44 git stash apply
45 git config --global alias.st status
46 history
```


*by ArtyomPochebyt*