# PIPELINE
## GitOpsAction
```yml
name: count tab

on:
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: get changed files
        id: changed-files
        uses: tj-actions/changed-files@v34

      - name: list all changed files
        run: |
          for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
          echo "$file was changed"
          echo "$file has `cat $file | tr -cd '\t' | wc -m` tabs" >> count.log 2>&1
          done

      - name: report upload
        uses: actions/upload-artifact@v3
        with:
          path: count.log
```

[GitAction](https://github.com/frame0310/git_/actions/runs/3596176574)
[GitRepo](https://github.com/frame0310/git_)
