### 04.GitOps

## Action File (tabs.yml)
```bash
name: tabs in files

on: pull_request

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v34

      - name: tabs in changed files
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
          echo "Quantity tabs in ${file} is `grep -o '\t' $file | wc -l`" >> report.log 2>&1
          done
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: report.log
  ```



## Url Repository

Repository (https://github.com/Pavel167988/Gitopstest);

## Url Action

Action (https://github.com/Pavel167988/Gitopstest/actions/runs/3563843685);




## Log File
```bash
Quantity tabs in .github/workflows/tabs.yml is 30
Quantity tabs in first_file.yml is 4
```
















