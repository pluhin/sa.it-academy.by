# **04.GitOps**

## **YAML** ##

```bash
name: 04.git

on: pull_request

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: pull modified files
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v34

      - name: Count tabs in changed files
        run: |
           for file in ${{ steps.changed-files.outputs.all_changed_and_modified_files }}; do
             echo "found  ${file} is $(grep -c $'\t' ${file})" > report.log
           done
      - name: Upload report
        uses: actions/upload-artifact@v3
        with:
          path: report.log
```
## Jobs build
https://github.com/sorokatyie/04.GitOps/actions/runs/4337304589/jobs/7573209138

## Result
Tab count in text2.txt is 2