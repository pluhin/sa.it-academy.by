# Repository link

[My account](https://github.com/AliaksandrDub/GitOpsTest.git)

## GitHab actions 

[Actions](https://github.com/AliaksandrDub/GitOpsTest/actions/runs/3630948449)

### Actions YAML

```YAML
name: GitOpsTest

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

Quantity tabs in .github/workflows/actions.yml is 31