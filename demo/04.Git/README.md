```bash

113  cd 02.Git/
  114  ls
  115  git remote rename origin origin-gitlab
  116  git remote rename origin-github origin
  117  git push -u origin --all
  118  mkdir -p .github/workflows
  119  vim .github/workflows/1.yaml
  120  git add .github/workflows/1.yaml
  121  git commit -m "Add first github action"
  122  git push
  123  git add .github/workflows/2.yaml
  124  vim  .github/workflows/2.yaml
  125  git add --all
  126  git commit -m "Add matrix"
  127  git push
  128  vim  .github/workflows/3.yaml
  129  git add --all
  130  git commit -m "Add dispatch"
  131  git push
  132  cd ../
  133  ls
  134  vim add_runner.sh
  135  chmod +x add_runner.sh
  136  ls
  137  ./add_runner.sh
  138  cd 02.Git/
  139  vim .github/workflows/1.yaml
  140  vim ../add_runner.sh
  141  vim .github/workflows/1.yaml
  142  git add --all
  143  git commit -m "Add self-hosted runner"
  144  git push
  145  ls -l /tmp/
  146  ps aux | grep runner
  147  ps aux | grep connect
  148  vim ../add_runner.sh
  149  ps aux | grep run.sh
  150  kill 65030
  151  ps aux | grep run.sh
  152  vim .github/workflows/4.yaml
  153  git add --all
  154  git commit -m "Add secret"
  155  git push
  156  history
```

## Gitlab CI

```yaml
image: ubuntu

stages:
  - install
  - test

job:Apache2_install:
  stage: install
  script:
    - apt-get update -yqq
    - apt-get install apache2 curl -yqq
    - apache2ctl configtest
    - service apache2 start

job:test_with_curl:
  stage: test
  before_script:
    - apt-get update -yqq
    - apt-get install apache2 curl -yqq
    - service apache2 start
  script:
    - curl -f http://localhost

job:test_with_nc:
  stage: test
  before_script:
    - apt-get update -yqq
    - apt-get install apache2 netcat-openbsd -yqq
    - service apache2 start
  script:
    - nc -zv localhost 80


```