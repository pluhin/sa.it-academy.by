### Homework 04.Git.Ops by Karabanovich_Pavel

#### Git action task


```bash

name: TAB counter

on:
  push:
    branches:
    - master

  pull_request:
    branches:
    - master

jobs:
  prepare:
    runs-on: ubuntu-latest
    steps:

    - name: action1
      uses: actions/checkout@v3

    - name: action2
      id: changed-files
      uses: tj-actions/changed-files@v35

    - name: count tabs
      run: |
        for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
          echo "File $file has `grep -o $'\t' $file | wc -l` TAB." >> nc_report.log
        done

    - name: Upload report
      uses: actions/upload-artifact@v2
      with:
        path: nc_report.log



```

#### Action result


```bash
nc_report


File .github/workflows/tab.yaml has 0 TAB.
File .github/workflows/text1 has 1 TAB.
File .github/workflows/text2 has 2 TAB.
File .github/workflows/text3 has 3 TAB.
File .github/workflows/text4 has 4 TAB.

https://github.com/streamx1/sa2-23-23-streamx1/actions

```


#### homework history

```bash

1.      git remote rename origin-github origin
2.      git branch
3.      git checkout master
4.      git branch --set-upstream-to=origin/master master
5.      mkdir -p .github/workflows
6.      nano .github/workflows/tab.yaml
7.      nano /home/streamx1/dz2.git/.github/workflows/text1
8.      nano /home/streamx1/dz2.git/.github/workflows/text2
9.      nano /home/streamx1/dz2.git/.github/workflows/text3
10.     nano /home/streamx1/dz2.git/.github/workflows/text4
11.     git add --all
12.     git commit -m "tab action 7 03 12-15"
13.     git push
```

