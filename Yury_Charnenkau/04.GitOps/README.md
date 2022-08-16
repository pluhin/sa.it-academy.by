## 04.GitOps

### Link to action file:

[https://github.com/yurycher/sa.it-academy.by/blob/md-sa2-21-22/Yury_Charnenkau/04.GitOps/changed-files.yml](https://github.com/yurycher/sa.it-academy.by/blob/md-sa2-21-22/Yury_Charnenkau/04.GitOps/changed-files.yml)

```bash
name: Find tabs in code and push reports

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  find:
    runs-on: ubuntu-latest
    name: Find changed-files
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v25
      - name: List all changed files & found tabs
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
            echo "$file was changed"
            echo "Calc tab for $file: `od -c $file | grep -o "\t" | wc -l`" >> files.log 2>&1
          done
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: ./files.log
```

### Link to testing repository:

[https://github.com/yurycher/04.GitOPS](https://github.com/yurycher/04.GitOPS)

### Log of pipeline:

[https://github.com/yurycher/04.GitOPS/runs/7769453358](https://github.com/yurycher/04.GitOPS/runs/7769453358)

### Artifact logfile:

```bash
Calc tab for .github/workflows/changed-files.yml: 28
Calc tab for test9.yml: 39
```
