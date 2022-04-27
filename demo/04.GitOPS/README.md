# GitOPS

```bash
   45  clear
   46  ls -l
   47  ls -la
   48  mkdir .github/workflows -p
   49  vim .github/workflows/first.yaml
   50  git branch
   51  git add --all
   52  git commit -m "test github action"
   53  git log --oneline
   54  git checkout main
   55  git cherry-pick 6bb1eb4
   56  git branch
   57  vim .github/workflows/first.yaml
   58  git status
   59  git add --all
   60  git status
   61  git commit -m "First test"
   62  git push
   63  vim .github/workflows/first.yaml
   64  vim .github/workflows/matrix.yaml
   65  git add --all
   66  git commit -m "Matrix test"
   67  git push
   68  vim .git/config
   69  vim .github/workflows/runner.yaml
   70  git add --all
   71  git commit -m "Self-runner test"
   72  git push
   73  vim .github/workflows/runner.yaml
   74  git add --all
   75  git commit -m "Notification test"
   76  git push
   77  history
```
---

## Github action

.github/workflows/first.yaml

```yaml
name: Check remote host and push report

on:
  push:
    branches:
    - main
    - second

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Install netcat
        run: sudo apt update && sudo apt install -y netcat
      - run: echo "netcat has been installed"
      - run: |
          nc -z -v -w2 onliner.by 443 > nc_report.log 2>&1
          ls -la
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: nc_report.log
```

.github/workflows/matrix.yaml

```yaml
name: Check remote hosts and push reports

on:
  push:
    branches:
    - main

jobs:
  prepare:
    runs-on: ubuntu-latest
    strategy:
      matrix:
          check-sites: [onliner.by, google.com, github.com]
    steps:
      - name: Install netcat
        run: sudo apt update && sudo apt install -y netcat
      - run: echo "netcat has been installed"
      - run: |
          nc -z -v -w2 ${{ matrix.check-sites }} 443 > ${{ matrix.check-sites }}.log 2>&1
          ls -la
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: ${{ matrix.check-sites }}.log
```

.github/workflows/runner.yaml

```yaml
name: Test for self-runner

on: [push]

jobs:
  build:
    #runs-on: ubuntu-latest
    runs-on: [my_runner]
    steps:
    - run: echo "The ${{ github.repository }} repository will be cloned to the runner."
    - uses: actions/checkout@v1
    - name: Run a one-line script
      run: ls -lar
    - name: Display hostname
      run: hostname -a
  slack:
    name: Slack Notification
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Slack Notification
      uses: rtCamp/action-slack-notify@v2
      env:
        SLACK_CHANNEL: integration
        SLACK_COLOR: ${{ job.status }}
        SLACK_ICON: https://github.com/rtCamp.png?size=48
        SLACK_MESSAGE: 'Post Content :rocket:'
        SLACK_TITLE: 'Looks like job is done :)'
        SLACK_USERNAME: pluhin
        SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```

## GitLab

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