# 02. GIT. Local
 ```bash
17  пше
18  ssh-keygen -t rsa 4098 -C "a.dolgopolov@a1.by"
19  ssh-keygen -t rsa -b 4098 -C "a.dolgopolov@a1.by"
20  eval "$(ssh-agent -s)"
21  ssh-add ~/.ssh/id_rsa
22  eval "$(ssh-agent -s)"
23  ssh-add ~/.ssh/id_rsa
24  cat ~/.ssh/id_rsa.pub | clip
25  history
26  git add
27  git add README.md
28  git commit -m "Add README.md file"
29  git log
30  git commit -m "Add README.md"
31  git add README.md
32  git commit -m "Add README.md"
33  git add aleksey_do/README.md
34*
35  history
36  git checkout -b feature-branch
37  git commit -m "Add README.md"
38  git add aleksey_do/README.md
39  git commit -m "Update README.md with descr"
40  git checkout master
41  git merge feature-branch
42  git log
43  git show b95a4fc08c7567fde154b17ec907cebe4dd0f77a
44  git tag v1.0 commit-hash
45  git log
46  git show
47  git tag v1.0 ce9db246fa788d3fdf236045c0cce90974f7b107
48  git commit aleksey_do/README.md
49  git commit -m "Update to tag V2.0
git log
50  git commit -m "Update to tag V2.0"
51  git add aleksey_do/README.md
52  git commit -m "Update to tag V2.0"
53  git log
54  git tag v2.0 0b6279e10c963592d3eea71bf9470e69e630383c
55  git checkout bug-fix
56  git checkout -b bug-fix
57  git add aleksey_do/README.md
59  git add aleksey_do/README.md
60  git commit -m "Update README.md for bug fix branch1"
61  git reset
62  git reset --soft HEAD~1
63  git checkout -b experimental-feature
64  git stash
65  git checkout bug-fix
66  git stash apply
67  git add aleksey_do/README.md
68  git commit -m "Update README for stash"
69  git stash apply
70  git add aleksey_do/README.md
71  git commit -m "Resolve merge conflict in README.md"
72  git checkout
73  git checkout master
74  git merge bug-fix
75  history
```