# Git

## Github action

`.github/workflows/main.yaml`

```yaml
name: CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
#    runs-on: [self-hosted]
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
---
## Gitlab action

`.gitlab-ci.yml`

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

## History

```bash
  581  clear
  582  git pull
  583  cd git_repos/git_01
  584  git status
  585  git add first.txt
  586  git commit -m "Next commit"
  587  git config user.email "pluhin@gmail.com"
  588  git config user.name "Siarhei P"
  589* ssh-keygen -h
  590* ls -l ~/.ssh/
  591  git remote add origin git@github.com:pluhin/git_03.git
  592  git push origin --all
  593  git branch -a
  594  vim first.txt
  595  git add first.txt
  596  git add --all
  597  git commit -m "Test remote"
  598  git push
  599  git push --set-upstream origin master
  600* git checkout md-sa2-18-21
  601* ls -l
  602* ls -l Boris_Volkov
  603* cd /tmp
  604* cd sa.it-academy.by
  605* git checkout md-sa2-18-21
  606* git checkout -b md-sa2-18-21
  607* git remote add up git@github.com:pluhin/sa.it-academy.by.git
  608* git remote --list
  609* git remote list
  610* git remote show
  611* git fetch --all
  612* ls -l
  613* git rebase up/md-sa2-18-21
  614* ls -l
  615* git push origin -f
  616* git push --set-upstream origin md-sa2-18-21
  617  mkdir -p .github/workflows/main.yaml
  618  rm  .github/workflows/main.yaml
  619  rm  .github/workflows/main.yaml -rf
  620  rm  .github/workflows/main.yaml -f
  621  rm -f  .github/workflows/main.yaml
  622  rm -fr  .github/workflows/main.yaml
  623  vim   .github/workflows/main.yaml
  624  git add --all
  625  git commit -m "Test action"
  626  git push
  627  vim   .github/workflows/main.yaml
  628  git commit --amend -a
  629  git push -f
  630  vim   .github/workflows/main.yaml
  631  git commit --amend -a
  632  git push -f
  633  vim   .github/workflows/main.yaml
  634  git commit --amend -a
  635  git push -f
  636  cat ~/.ssh/id_rsa.pub
  637  clear
  638  git remote rename origin origin_github
  639  git remote add origin git@bitbucket.org:pluhin/git_03_bit.git
  640  git push origin --all
  641  git remote rename origin origin_bit
  642  git remote add origin git@gitlab.com:pluhin/git_03.git
  643  git push origin --all
  644  vim .gitlab-ci.yml
  645  git add --all
  646  git commit -m "Add gitlab action"
  647  git push
  648  git remote list
  649  git remote show
  650  git push --set-upstream origin main
  651  git push --set-upstream origin master
```