# 02.Git.local 
 
## Homework Assignment 1

```shell
 1080  mkdir hw-02
 1081  cd hw-02
 1082  git init
 1083  touch README.md | date > README.md
 1084  git add --all 
 1085  git commit -m "init commit (add README.md)"
```
## Homework Assignment 2

```shell
 1088  git checkout -b feature-branch
 1089  git branch
 1090  git add --all
 1091  git commit -m "firrst commit in feature-branch"
 1092  git log --oneline
 1093  git checkout main
 1094  git merge feature-branch
```

## Homework Assignment 3

```shell
 1096  git log
 1097  git log --oneline
 1098  git show 1873b9f
```

## Homework Assignment 4

```shell
 1102  git tag -a v1.0 1873b9f
 1103  git log
 1104  git add --all
 1105  git commit -m "README.md has been changed"
 1106  git log --oneline
 1107  git tag -a v2.0 a76bc66
```

## Homework Assignment 5

```shell
 1110  git checkout -b bug-fix
 1111  git add --all
 1112  git commit -m "README.md - ch-reset-1"
 1113  git add --all
 1114  git commit -m "README.md - ch-reset-2"
 1115  git log --oneline
 1116  git reset c014f5
 1117  git log --oneline
 1118  git log
 1119  git add --all 
 1120  git commit -m "README.md - ch-reset-2"
 1121  git log --oneline
 1122  git reset --hard c014f55
 1123  git add --all 
 1124  git commit -m "README.md - ch-reset-2"
 1125  git reset --mixed c014f55
```

## Homework Assignment 6


```shell
 1175  git checkout -b experimental-feature
 1176  git checkout experimental-feature
 1177  git stash
 1178  git checkout bug-fix
 1179  git stash pop
 ```

## Homework Assignment 7

```shell
 1181  git config --global user.name "D_Konon"
 1182  git config --global user.email "D_Konon@gmail.com"
 1183  git config --global alias.cm commit 
 1184  git config --list
 ```