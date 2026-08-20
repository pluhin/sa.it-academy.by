# 03. GIT. GitHub

## Homework Assignment 1: Setting up a Basic GitHub Action

.github/workflows/hello.yml
```yaml
name: Hello World

on:
  push:
    branches:
      - main

jobs:
  hello-job:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Run script
        run: python hello.py
```
## Homework Assignment 2: Building and Testing with GitHub Actions

I'm not a programmer, please forgive me. All python code is written by AI :)

