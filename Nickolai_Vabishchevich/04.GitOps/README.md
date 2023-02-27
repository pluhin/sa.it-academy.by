# 04.GitOps

### Action file tab.yaml

```bash
name: Find tabs in code
on: [pull_request]
jobs:
  count:
    runs-on: ubuntu-latest
    steps:
      - name: Fetch all history for all tags and branches
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Get changed files
        id: files
        uses: tj-actions/changed-files@v34
      - name: Count tabs
        run: |
          for file in ${{ steps.files.outputs.all_changed_files }}; do
            echo "The $file has `grep -o -P '\t' $file | wc -l` tabs" >> report.log
          done
      - name: Upload report
        uses: actions/upload-artifact@v2
        with:
          path: report.log
```

### History

```bash
  214  git checkout dev
  215  vi file1.txt 	#was changed and added 3 tabs
  216  vi file4.txt     #was changed and added 3 tabs
  217  git add --all
  218  git commit -m "update 23:15"
  219  git push origin dev
```

### report.log 

```bash
The file1.txt has 3 tabs
The file4.txt has 3 tabs
```
