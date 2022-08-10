## 04.GitOps

### Link to action file:

[https://github.com/yurycher/04.GitOPS/blob/main/.github/workflows/changed-files.yml](changed-files.yml)

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

[raw logs](https://pipelines.actions.githubusercontent.com/serviceHosts/6f52d5a2-eb5b-46ec-9d76-cb74f73d0ab8/_apis/pipelines/1/runs/23/signedlogcontent/2?urlExpires=2022-08-10T15%3A02%3A06.2133755Z&urlSigningMethod=HMACV1&urlSignature=KqQ%2FZPdIAwqhNjpwRwT80jpxhs0GgtOqvQUChg0abYY%3D)

### Artifact logfile:

```bash
Calc tab for .github/workflows/changed-files.yml: 28
Calc tab for test9.yml: 39
```
