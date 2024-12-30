# Git.OPS

### Repository link:
https://github.com/Gorilbl4/git-actions

### Homework Assignment 1

### hello.yml
```yaml
  name: Hello GitHub Actions
    on:
    push:
    branches:
    - master
    
    jobs:
    run-script:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout repository
    uses: actions/checkout@v4

      - name: Set up JavaScript
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Run hello script
        run: node hello.js


### Homework Assignment 2: Building and Testing with GitHub Actions

### sum.yml

```yaml
name: Sum

on:
  push:
    branches:
      -  main


jobs:
  test_job:
    runs-on: ubuntu-latest

    steps:
      - name: Checking the repository
        uses: actions/checkout@v4

      - name: Setup node
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Start test
        run: node test_sum.js


![img.png](Actions.png)

![img.png](Test.png)
