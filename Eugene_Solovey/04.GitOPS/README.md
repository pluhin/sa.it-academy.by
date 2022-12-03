# 04.GitOps

## links

[Repository](https://github.com/Eugene-Solovey/local-repository)

[GitHub action](https://github.com/Eugene-Solovey/local-repository/actions/runs/3610202066)

## Github action find_tab file
```bash
name: tabs in files

on: [push,pull_request]



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
## Task report
```bash
Quantity tabs in .github/workflows/find_tab.yaml is 30
```	
