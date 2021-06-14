## 03 Git

`vim .github/workflows/main.yaml`

```yaml
name: CI

on: [push]

jobs:
  build:

    runs-on: [self-hosted]
    steps:
    - run: echo "💡 The ${{ github.repository }} repository will be cloned to the runner."
    - uses: actions/checkout@v1
    - name: Run a one-line script
      run: ls -l
    - name: Run a multi-line script
      run: |
        env
        date

```

`vim  .gitlab-ci.yml`

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

```bash
10274  cd Documents/git_repos/home/sa.it-academy.by/
10275  git pull
10276  cd /tmp
10277  mkdir test
10278  cd test
10279  git init
10280  git config user.email "pluhin@gmail.com"
10281  git config user.name "Siarhei Pishchyk"
10282  vim file.txt
10283  git add file.txt
10284  git commit -m "Init"
10285  git checkout -b second
10286  git checkout master
10287  git branch
10288  ls -l ~/.ssh
10289  pwd
10290  git remote add origin git@github.com:pluhin/git_3.git
10291  vim .git/config
10292  git branch -M main
10293  git push origin --all
10294* clear
10295* cd ../
10296* ls
10297  history 
10298* cd demo
10299* mkdir 03.GIT
10300* vim 03.GIT/README.md
10301* git add 03.GIT/README.md
10302* git commit -m "03.Git.01"
10303* git push
10304* git clone git@github.com:Zhenyakuch/sa.it-academy.by.git
10305* cd sa.it-academy.by
10306* ls
10307* git checkout md-sa2-17-21
10308* ls -l
10309* ls -l demo
10310* ls -l ../
10311* cat .git/config
10312* git remote add up git@github.com:pluhin/sa.it-academy.by.git
10313* git remote --list
10314* git remote list
10315* git remote show
10316* git fetch --all
10317* git rebase up/md-sa2-17-21
10318* ls -l
10319* ls -l demo
10320* git push origin -f 
10321* history 
10322  ls
10323  ls -a
10324  mkdir -p .github/workflows
10325  vim .github/workflows/main.yaml
10326  git add .github/workflows/main.yaml
10327  git commit -m "Add workflow"
10328  git push
10329  git push --set-upstream origin main
10330* cd 03.GIT
10331* ls -l
10332* vim Vagrantfile
10333* vagrant up
10334  vim .github/workflows/main.yaml
10335  git add .github/workflows/main.yaml
10336  git commit -m "Add workflow 2"
10337  git push
10338  vim .github/workflows/main.yaml
10339* vagrant halt && vagrant destroy -f
10340  vim .github/workflows/main.yaml
10341  git remote rename origin origin_github
10342  git remote show
10343  git remote add origin git@bitbucket.org:pluhin/git_3.git
10344  git push origin --all
10345  git remote rename origin origin_bit
10346  git remote add origin git@gitlab.com:pluhin/git_3.git
10347  git push origin --all
10348  vim .gitlab-ci.yml
10349  git add .gitlab-ci.yml
10350  git commit -m "Add workflow gitlab"
10351  git push
10352  vim .git/config
10353  git push origin 
10354  git push --set-upstream origin main
```
