# 03 GIT

.gitlab-ci.yml

```yaml
image: ubuntu

stages:
  - build

job:Apache2_deploy:
  stage: build
  script:
    - apt-get update -yqq
    - apt-get install apache2 curl -yqq
    - apache2ctl configtest
    - curl http://localhost
```
---

.github/workflows/main.yaml

```yaml
name: CI

on: [push]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Run a one-line script
      run: ls -l
    - name: Run a multi-line script
      run: |
        env
        date
```


```bash

 9534  git remote add origin git@github.com:pluhin/git_sa_2.git
 9535  git push -u origin --all
 9536  vim file.txt
 9537  git add --all
 9538  git commit -m "push"
 9539  git push
 9540  git commit --amend -a
 9541  git push origin -f
 9542* cd ~/Documents/git_repos/home/sa.it-academy.by
 9543* mkdir demo/03.GIT
 9544* vim demo/03.GIT/README.md
 9545* git add --all
 9546* git commit -m "03.Git demo"
 9547* git push
 9548* cd /tmp
 9549* git clone git@github.com:VitalyShirgazin/sa.it-academy.by.git
 9550* cd sa.it-academy.by
 9551* git checkout m-sa2-14-20
 9552* git pull
 9553* git remote add up git@github.com:pluhin/sa.it-academy.by.git
 9554* git fetch up
 9555* git rebase up/m-sa2-14-20
 9556* git push origin -f
 9557* mkdir .github/workflows -p
 9558* rm .github -rf
 9559  mkdir .github/workflows -p
 9560  vim .github/workflows/main.yaml
 9561  git add --all
 9562  git commit -m "Add CI"
 9563  git push
 9564  vim .github/workflows/main.yaml
 9565  git commit --amend -a
 9566  git push origin -f
 9567  top
 9568  clear
 9569  git remote rename origin origin_github
 9570  git remote add origin git@bitbucket.org:pluhin/git_sa_2.git
 9571  git push -u origin --al
 9572  git push -u origin --all
 9573  git remote rename origin origin_bitbucket
 9574  git remote add origin git@gitlab.com:pluhin/sa_git_2.git
 9575  git push -u origin --all
 9576  vim .gitlab-ci.yml
 9577  git add --all
 9578  git commit -m "add gitlab ci"
 9579  git push
```