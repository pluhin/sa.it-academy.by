# 04.GitOps

## YAML fot github action

```bash
name: tab
on:
  push:
  pull_request:
jobs:
  TabsCheck:
    runs-on: ubuntu-latest
    steps:
    - name: check
      uses: actions/checkout@v3
      with:
        fetch-depth: 0
    - name: Get changed files
      id: changed-files
      uses: tj-actions/changed-files@v35
    - name: count tabs
      run: |
        for file in ${{ steps.changed-files.outputs.all_changed_files }}; do
          echo "$file was changed" >> action.log
          echo "$file has `grep -o $'\t' $file | wc -l` tab." >> action.log
        done
    - name: tabs artifact
      uses: actions/upload-artifact@v3
      with:
        path: action.log
```
