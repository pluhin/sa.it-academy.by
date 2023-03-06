# 04. GitOps

---
## [Action](https://github.com/kurlenka/demo/actions/runs/4341569842)
---

## Workflows yaml for Tabs

```bash
name: Check files and search tabs
on:
        push:
                pull_request:
jobs:
  Checkingfiles:
    runs-on: ubuntu-latest
    steps:
    - name: checkout
      uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - name: Get changed files
      id: changed-files
      uses: tj-actions/changed-files@v35
    - name: Calculate the tabs
      run: |
        for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
          echo "$file was changed" >> report.log 
          echo "`cat $file |tr -cd '\t' | wc -c` Tabs in File." >> report.log
        done
    - name: Upload report
      uses: actions/upload-artifact@v3
      with:
        path: report.log
```
---
## Log File
```bash
first.txt was changed
10 Tabs in File.
second.txt was changed
5 Tabs in File.
```
---
## History Log
```bash
1086  vim first.txt
 1087  vim second.txt
 1088  date >> second.txt
 1089  vim second.txt
 1090  git status
 1091  git add --all
 1092  git commit -m "Modify files whith tabs"
 1093  git push

```

