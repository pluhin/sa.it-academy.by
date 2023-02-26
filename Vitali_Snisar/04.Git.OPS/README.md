# Homework for 04.Git.Action
---
## Create directory
```bash
svv@ubuntu:~/devops/02.GIT$ mkdir -p .github/workflows
svv@ubuntu:~/devops/02.GIT$ git add --all
svv@ubuntu:~/devops/02.GIT$ git commit -m "04.Git.Action"

```
## YAML-file
```bash
name: 04GitOps

on:
  push:
    branches:
      - master
  pull_request:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v35

      - name: Save changed files in logfile
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            echo "$file"
            echo "File $file have `grep '\t' $file | wc -l` tabs." >> files_report.log 2>&1
          done

      - name: Upload report
        uses: actions/upload-artifact@v3
        with:
          path: files_report.log
```
## Report
```bash
File .github/workflows/file1.txt have 0 tabs.
File .github/workflows/file2.txt have 0 tabs.
File .github/workflows/first.yaml have 18 tabs.
```