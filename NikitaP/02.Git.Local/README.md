## 1 Initializing a Local Repository
```bash
git clone git@github.com:pascal-gitos/sa.it-academy.by.git

git checkout -b md-sa2-28-24
mkdir NikitaP
cd NikitaP
mkdir 02.Git.Local
cd 02.git.Local
touch README.md
git add .
git commit -m "Create NikitaP path & README.md"
```

## 2 Basic Version Control
```bash
git checkout -b `feature-branch`
```
edited on feature-branch
```bash
git add .
git commit -m "commit on feature-breanch"
```

```bash
git checkout md-sa2-28-24
```

## 3 Exploring Git History
git log
```bash
 git log --oneline
 git log --pretty=oneline
 git log --pretty=short
 git log --pretty=full
 git log --pretty=oneline --graph
 git log --pretty=oneline --stat
```
```bash
git show 0bb31887046b6f46367ff8a70d32cfd6f0dbfe4d
```

```bash
git tag -a v1.0 0bb31887046b6f46367ff8a70d32cfd6f0dbfe4d -m "Version 1.0"
```

