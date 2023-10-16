# 04. GitOps

Note> I reworked my homework because have troubbles as I didn't create new repository

## Was created a new repository on github  [https://github.com/jankalep/04.GitOps.git] 

## history of execution
```bash 
  680  mkdir 04.GitOps
  681  cd 04.GitOps
  682  git init
  683  git remote add gitops https://github.com/jankalep/04.GitOps.git
  684  git branch
  685  git checkout
  686  git branch -m master
  687  git branch
  688  git checkout -b master
  689  vim README.md
  690  git config --global init.defaultBranch master
  691  vim hello.py
  692  mkdir -p .github/workflows/
  693  vim .github/workflows/hello.yaml
  694  git add --all
  695  git commit -m "04.1 Git.Ops"
  696  git push gitops
  697  git config user.name "Uladzislau Krejzo"
  698  git config user.email "vlad.czech2018@gmail.com"
  699  git push gitops
  700  git remote add gitops git@github.com:jankalep/04.GitOps.git
  701  git remote add 4gitops git@github.com:jankalep/04.GitOps.git
  702  git push 4gitops
  703  vim .github/workflows/pandas-action.yaml
  704  vim script.py
  705  vim .github/workflows/pandas-action.yaml
  706  ls
  707  history >> README.md
  708  vim README.md
  709  ls
  710  cat hello.py >> README.md
  711  vim README.md
  712  cat .github/workflows/hello.yaml >> README.md
  713  vim README.md
  714  cat .github/workflows/pandas-action.yml >> README.md
  715  cd .github/workflows
  716  ls
  717  cat .github/workflows/pandas-action.yaml >> README.md
  718  cat ./.github/workflows/pandas-action.yaml >> README.md
  719  cd ../
  720  cat ./.github/workflows/pandas-action.yaml >> README.md
  721  vim README.md
  722  ls
  723  cat script.py >> README.md
  724  vim README.md
  725  git add --all
  726  git commit -m "04.2 Git.Ops"
  727  git push 4gitops
  728  git reset --HARD HEAD~1
  729  git reset --hard HEAD~1
  730  vim README.md
  731  vim .github/workflows/pandas-action.yml
  732  vim script.py
  733  history >> README.md
```
## Assignment 1

# hello.py 
```python
print("Master branch listened by GitHub Actions! Meow")
```

# hello.yaml
```bash

name: Github actions Listener of repo master branch

on:
  push:
    branches:
    - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:
      - name: Install Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.8'
      - name: Chech
        uses: actions/checkout@v2
      - name: Run python file
        run: python hello.py
name: Run Pandas Script
```

## Assignment 2
I would to made Python example with Pandas lib

# pandas_action.yaml
```bash
name: Run Pandas Script

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.8'

      - name: Install dependencies
        run: pip install pandas

      - name: Run Pandas script
        run: python script.py
```
# Pandas script.py 
```Python
import pandas as pd

data = {
    'Employee_id': ['1', '2', '3', '4', '5'],
    'Employee_name': ['Akshar', 'Jones', 'Kate', 'Mike', 'Tina']
}

df = pd.DataFrame(data)

df['New_column'] = df['Employee_id'].astype(int) * 2

df.to_csv('example.csv', index=False)

print("Save table to example.csv")
```
# Assignment 1 Action

[![Github actions Listener of repo master branch](https://github.com/jankalep/04.GitOps/actions/workflows/hello.yaml/badge.svg)](https://github.com/jankalep/04.GitOps/actions/workflows/hello.yaml)

# Assignment 2 Action

[![Run Pandas Script](https://github.com/jankalep/04.GitOps/actions/workflows/pandas-action.yml/badge.svg)](https://github.com/jankalep/04.GitOps/actions/workflows/pandas-action.yml)
