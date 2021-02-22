## GIT


### .gitlab-ci.yml

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

```

### Github action 


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


```
10143* vpn_lab
10144* git pull
10145  clear
10146* ls -l ~/.ssh
10147  docker images
10148  docker run -it ubuntu:20.04 bash
10149  ls
10150  history| grep  "git init"
10151  history| grep  "git init" -A 3
10152  history| grep  "git init" -B 2 
10153  history| grep  "git init" -B 4
10154  mkdir git_test
10155  cd git_test
10156  git ini
10157  git init
10158  vim README.md
10159  git add --all
10160  git commit -m "First commit. Add Readme file"
10161  git remote add origin git@github.com:pluhin/first_sa.git
10162  vim .git/config
10163  git branch -M main
10164  git push -u origin main
10165  vim README.md
10166  git add --all
10167  git commit -m "Second commit"
10168  git push
10169  git remote show
10170  cd ../
10171  git clone git@github.com:Korolev731/sa.it-academy.by.git
10172  cd s
10173  cd sa.it-academy.by
10174  git checkout md-sa2-16-21
10175  git pull
10176  git remote add up git@github.com:pluhin/sa.it-academy.by.git
10177  git remote list
10178  git remote
10179  git branch -a
10180  git fetch --all
10181  git branch -a
10182  git checkout up/md-sa2-16-21
10183  ls -l
10184  git rebase up/md-sa2-16-21
10185  git checkout md-sa2-16-21
10186  git rebase up/md-sa2-16-21
10187  ls -l
10188  git push
10189  git push origin -f
10190  cd ..
10191  ls -l 
10192  git clone git@github.com:pluhin/first_sa.git
10193  cd first_sa
10194  ls -l
10195  mkdir .github/workflows -p
10196  vim .github/workflows/main.yaml
10197  git add --all
10198  git commit -m "Add workflow"
10199  git push
10200  git remote rename origin origin_github
10201  git remote add origin git@bitbucket.org:pluhin/second_sa.git
10202  git remote
10203  git push origin --all
10204  git remote rename origin origin_bit
10205  git remote add origin git@gitlab.com:pluhin/thrid_sa.git
10206  git push origin --all
10207  vim .gitlab-ci.yml
10208  git add --all
10209  git commit -m "Add runner to gitlab"
10210  git push
10211  git remote add origin git@gitlab.com:pluhin/thrid_sa.git
10212  git push -u origin main
```