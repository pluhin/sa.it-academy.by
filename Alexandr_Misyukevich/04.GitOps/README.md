# Homework 04. GitOps
[Link to the repository](https://github.com/Misyukevich/04.GitOps/tree/main) 


## Homework Assignment 1: Setting up a Basic GitHub Action

[Link to the action](https://github.com/Misyukevich/04.GitOps/actions/workflows/hello.yaml)

```yaml

name: Python Application

on: [push]

jobs:
  run:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.x'

      - name: Install dependencies
        run: |
          pip install --upgrade pip

      - name: Run Python script
        run: python hello.py

```


## Homework Assignment 2: Building and Testing with GitHub Actions
[Link to the action](https://github.com/Misyukevich/04.GitOps/actions/workflows/calc.yaml)

```yaml

name: Calc

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
        run: node testcalc.js

```

