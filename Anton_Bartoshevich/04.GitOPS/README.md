# Action file
```bash
name: Count tabs in changed files
on:
  pull_request:
    branches: [ "main" ]
jobs:
  my_action:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
          with:
            fetch-depth: 0
        - name: Get changed files
          id: changed-files
          uses: tj-actions/changed-files@v35      
        - name: Found tabs in the files
          run: |
               for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
               echo "The $file has `grep -P '\t' $file | wc -l` tabs" >> report.log
               done        
        - name: Upload report
          uses: actions/upload-artifact@v2
          with:
           path: report.log
```
# History
```bash
 1382  vi file1.txt
 1383  vi file2.txt
 1384  git branch
 * dev
  main
 1386  git status
 1387  git add --all
 1388  git commit -m "Commit changed files"
 1389  git push origin dev
```
# Result (from report.log)
```bash
The file1.txt has 5 tabs
The file2.txt has 7 tabs
```
# Repo with files
https://github.com/anton-bartoshevich/gitOPS_learn