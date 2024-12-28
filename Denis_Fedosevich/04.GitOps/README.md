# 04.GitOps

[Link to the repository](https://github.com/fedos1993/04.GitOps)

## Homework Assignment 1: Setting up a Basic GitHub Action

[Link to the action 1](https://github.com/fedos1993/04.GitOps/actions/workflows/hello.yaml)

```yaml
name: Hello

on:
  push:
    branches:
      -  main


jobs:
  hello_job:
    runs-on: ubuntu-latest

    steps:
      - name: Checking the repository
        uses: actions/checkout@v4

      - name: Setup node
        uses: actions/setup-node@v4
        with:
          node-version: 18

      - name: Start script
        run: node hello.js
```

## Homework Assignment 2: Building and Testing with GitHub Actions 

[Link to the action 2](https://github.com/fedos1993/04.GitOps/actions/workflows/calculator.yaml)

```yaml
name: Calculator

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
        run: node test_calculator.js
```
