## GitOps

```bash
71  cd 02.Git/
   72  ls
   73  git remote
   74  git remote rename origin origin_gitlab
   75  git remote rename origin_github origin
   76  git pull
   77  git checkout master
   78  git pull
   79  git branch --set-upstream-to=origin/mater master
   80  git branch --set-upstream-to=origin/master master
   81  git pull
   82  mkdir .github/workflows/ -p
   83  vim .github/workflows/first.yaml
   84  git add --all
   85  git commit -m "Add action"
   86  git push
   87  vim .github/workflows/first.yaml
   88  sudo apt update
   89  sudo visudo
   90  sudo vim /etc/sudoers.d/99_vagrant
   91  vim .github/workflows/first.yaml
   92  vim .github/workflows/matrix.yaml
   93  git add --all
   94  git commit -m "Add matrix"
   95  git push
   96  vim .github/workflows/matrix.yaml
   97  ls -l
   98  vim Vagrantfile
   99  vim .github/workflows/matrix.yaml
  100  vim Vagrantfile
  101  vim .github/workflows/matrix.yaml
  102  git add --all
  103  git commit -m "Add runner"
  104  git push
  105  vim .github/workflows/matrix.yaml
  106  git commit --amend -a
  107  git push origin -f
  108  vim .github/workflows/slack.yaml
  109  git add --all
  110  git commit -m "Add notification"
  111  git push
  112  history
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